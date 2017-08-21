<html>
<head>

<title>Transaction Progress</title>

</head>

<body>

<%@ page import ="java.sql.*,com.jdbc.*" %>
<%@ page import = "java.util.Random" %>
<%@ page import = "java.math.BigInteger" %>

<%-- <%@ page import ="java.sql.Timestamp" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %> --%>

<%-- <%! 
private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
%> --%>


<%!

Random random = new Random(System.currentTimeMillis());

public String generateTransID() {
	String n1 = "SRD";
    for (int i = 0; i < 2; i++) {
        String n2 = BigInteger.valueOf(Math.abs(random.nextLong())).toString(32).toUpperCase();
        if (n2.length() > 8) {
            if (n2.length() > 10) {
                n2 = n2.substring(n2.length() - 10);
            }
            System.out.println(n2);
            n1+=n2;
        }
    }
    return n1;
}

%>

<%


	try {
		
		ResultSet rs,rs1,rs2,rs3,rs4 = null;
		Connection con=DbCon.dbCon();
		String status = "";
		
		String unqid = session.getAttribute("unqid").toString();
		System.out.println(unqid);
		
		String latestBankID = session.getAttribute("latestBankID").toString();
		
		String tpassword = request.getParameter("password");
		System.out.println(tpassword);
		
		PreparedStatement st1 = con.prepareStatement("SELECT * FROM USERBANKINFO WHERE ((UNQID=? AND BANKID=?) AND TPASS=?)");	//Verify Tpass here
		st1.setString(1, unqid);
		st1.setString(2, latestBankID);
		st1.setString(3, tpassword);
		rs=st1.executeQuery();
		
		if(rs.next()) {
			
			String beneficiaryname = session.getAttribute("beneficiaryname").toString();
			System.out.println(beneficiaryname);
			String beneficiaryaccountnumber = session.getAttribute("beneficiaryaccountnumber").toString();
			System.out.println(beneficiaryaccountnumber);
			Double amount = Double.parseDouble(session.getAttribute("amount").toString());
			System.out.println(amount);
			String beneficiarybankname = session.getAttribute("beneficiarybankname").toString();
			System.out.println(beneficiarybankname);
			String remitterBankName = session.getAttribute("remitterBankName").toString();
			System.out.println(remitterBankName);
			
			PreparedStatement st2 = con.prepareStatement("SELECT BAL FROM " +remitterBankName +"INFO WHERE ACCNO=?");
			st2.setString(1, session.getAttribute("accno").toString());
			rs1=st2.executeQuery();
			rs1.next();
			System.out.println("STMT2 Exec");
			
			Double yourBalance = Double.parseDouble(rs1.getString(1));			//Retrieving Remitter Current Balance
			
			PreparedStatement st3 = con.prepareStatement("SELECT * FROM " +beneficiarybankname +"INFO WHERE AHNAME=? AND ACCNO=?");
			st3.setString(1, beneficiaryname);
			st3.setString(2, beneficiaryaccountnumber);
			rs2=st3.executeQuery();
			rs2.next();
			System.out.println("STMT3 Exec");
			
			Double beneficiaryBalance = Double.parseDouble(rs2.getString(6));	//Retrieving Beneficiary Current Balance
			
			
			
			beneficiaryBalance = beneficiaryBalance + amount;
			yourBalance = yourBalance - amount;
			
			PreparedStatement st4 = con.prepareStatement("UPDATE " +beneficiarybankname +"INFO SET BAL=? WHERE AHNAME=? AND ACCNO=?");
			st4.setString(1, beneficiaryBalance.toString());
			st4.setString(2, beneficiaryname);
			st4.setString(3, beneficiaryaccountnumber);
			st4.executeUpdate();
			
			PreparedStatement st5 = con.prepareStatement("UPDATE " +remitterBankName +"INFO SET BAL=? WHERE AHNAME=? AND ACCNO=?");
			st5.setString(1, yourBalance.toString());
			st5.setString(2, rs.getString(5));
			st5.setString(3, rs.getString(4));
			st5.executeUpdate();
			
			/* Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		    System.out.println(timestamp);

		    //format timestamp
		    System.out.println(sdf.format(timestamp)); */
			
			PreparedStatement st6 = con.prepareStatement("SELECT MOBILENO,BAL FROM " +remitterBankName +"INFO WHERE ACCNO=?");		//Fetching MobileNo. Of User From SAMEINFO
			st6.setString(1, rs.getString(4));
			rs3=st6.executeQuery();
			rs3.next();
			
			PreparedStatement st7 = con.prepareStatement("SELECT MOBILENO,BAL FROM " +beneficiarybankname +"INFO WHERE ACCNO=?");		//Fetching MobileNo. Of beneficiary From SAMEINFO
			st7.setString(1, beneficiaryaccountnumber);
			rs4=st7.executeQuery();
			rs4.next();
			
			String transID = generateTransID();
			
			PreparedStatement st8 = con.prepareStatement("SELECT TRANSACTIONID FROM TRANSACTIONINFO",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet r = st8.executeQuery();
			Comparison:
				while(r.next()) {
					if(transID.equals(r.getString(1))) {
						transID = generateTransID();
						r.beforeFirst();
						continue Comparison;	//The Comparison is initiated from the beginning with new transID.
						}
					}
			System.out.println("Updated Selected and next is insert");
			status = "successful";
			
			PreparedStatement st9 = con.prepareStatement("INSERT INTO TRANSACTIONINFO VALUES(?,?,?,current_timestamp,?,?,?,?,?,?,?,?,?,?,?)");	//I wouldn't bother retrieving the current time in Java, just let the database do the job.
			st9.setString(1, transID);
			System.out.println(transID);
			
			st9.setString(2, unqid);
			System.out.println(unqid);
			
			st9.setString(3, status);
			System.out.println(status);
			
			st9.setString(4, amount.toString());
			System.out.println(amount.toString());
			
			st9.setString(5, session.getAttribute("ahname").toString());
			System.out.println(session.getAttribute("ahname").toString());
			
			st9.setString(6, remitterBankName);
			System.out.println(remitterBankName);
			
			st9.setString(7, session.getAttribute("accno").toString());
			System.out.println(session.getAttribute("accno").toString());
			
			st9.setString(8, rs3.getString(1));
			System.out.println(rs3.getString(1));
			
			st9.setString(9, rs3.getString(2));
			System.out.println(rs3.getString(2));
			
			st9.setString(10, beneficiaryname);
			System.out.println(beneficiaryname);
			
			st9.setString(11, beneficiarybankname);
			System.out.println(beneficiarybankname);
			
			st9.setString(12, beneficiaryaccountnumber);
			System.out.println(beneficiaryaccountnumber);
			
			st9.setString(13, rs4.getString(1));
			System.out.println(rs4.getString(1));
			
			st9.setString(14, rs4.getString(2));
			System.out.println(rs4.getString(2));
			
			st9.executeUpdate();
			
			System.out.println("Inserted");
			
			session.setAttribute("transID", transID);
			
%>

			<h1 align="center">Your Transaction is in Progress</h1>
			
<%
			Thread.sleep(5000);
			response.sendRedirect("transactionreport.jsp");
			
		} else {
			status = "failed";
			
%>

			<h1>Your Transaction Password is Incorrect</h1>
			<br>
			<br>
			<br>
			<a href="userhome.jsp"><h1>Home</h1></a>

<%
			//response.sendRedirect("transactionreport.jsp");	//show fail transaction due to wrong password.
		}
		
	} catch (Exception e) {
		System.err.println(e);
	}


%>

</body>

</html>