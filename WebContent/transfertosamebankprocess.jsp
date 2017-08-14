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
	String id = "";
    for (int i = 0; i < 2; i++) {
        String n = BigInteger.valueOf(Math.abs(random.nextLong())).toString(32).toUpperCase();
        if (n.length() > 8) {
            if (n.length() > 10) {
                n = n.substring(n.length() - 10);
            }
            System.out.println(n);
            id += n;
            System.out.println(id);
        }
    }
    return id;
}

%>

<%


	try {
		
		ResultSet rs,rs1,rs2,rs3,rs4 = null;
		Connection con=DbCon.dbCon();
		String status = "";
		
		String unqid = session.getAttribute("unqid").toString();
		System.out.println(unqid);
		String bname = session.getAttribute("bname").toString();
		System.out.println(bname);
		
		String bankID = session.getAttribute("bankID").toString();
		
		String tpassword = request.getParameter("password");
		System.out.println(tpassword);
		
		PreparedStatement st2 = con.prepareStatement("SELECT * FROM USERBANKINFO WHERE ((UNQID=? AND BANKID=?) AND TPASS=?)");	//Verify Tpass here
		st2.setString(1, unqid);
		st2.setString(2, bankID);
		st2.setString(3, tpassword);
		rs=st2.executeQuery();
		
		if(rs.next()) {
			
			String beneficiaryname = session.getAttribute("beneficiaryname").toString();
			System.out.println(beneficiaryname);
			String beneficiaryaccountnumber = session.getAttribute("beneficiaryaccountnumber").toString();
			System.out.println(beneficiaryaccountnumber);
			Double amount = Double.parseDouble(session.getAttribute("amount").toString());
			System.out.println(amount);
			
			PreparedStatement st3 = con.prepareStatement("SELECT BAL FROM "+bname +"INFO WHERE ACCNO=?");
			st3.setString(1, rs.getString(4));
			rs4=st3.executeQuery();
			rs4.next();
			
			Double yourBalance = Double.parseDouble(rs4.getString(1));			//Retrieving Remitter Current Balance
			
			PreparedStatement st4 = con.prepareStatement("SELECT * FROM " +bname +"INFO WHERE AHNAME=? AND ACCNO=?");
			st4.setString(1, beneficiaryname);
			st4.setString(2, beneficiaryaccountnumber);
			rs1=st4.executeQuery();
			rs1.next();
			
			Double beneficiaryBalance = Double.parseDouble(rs1.getString(6));	//Retrieving Beneficiary Current Balance
			
			
			
			beneficiaryBalance = beneficiaryBalance + amount;
			yourBalance = yourBalance - amount;
			
			PreparedStatement st5 = con.prepareStatement("UPDATE " +bname +"INFO SET BAL=? WHERE AHNAME=? AND ACCNO=?");
			st5.setString(1, beneficiaryBalance.toString());
			st5.setString(2, beneficiaryname);
			st5.setString(3, beneficiaryaccountnumber);
			st5.executeUpdate();
			
			PreparedStatement st6 = con.prepareStatement("UPDATE " +bname +"INFO SET BAL=? WHERE AHNAME=? AND ACCNO=?");
			st6.setString(1, yourBalance.toString());
			st6.setString(2, rs.getString(5));
			st6.setString(3, rs.getString(4));
			st6.executeUpdate();
			
			/* Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		    System.out.println(timestamp);

		    //format timestamp
		    System.out.println(sdf.format(timestamp)); */
			
			PreparedStatement st7 = con.prepareStatement("SELECT MOBILENO,BAL FROM " +bname +"INFO WHERE ACCNO=?");		//Fetching MobileNo. Of User From SAMEINFO
			st7.setString(1, rs.getString(4));
			rs2=st7.executeQuery();
			rs2.next();
			
			PreparedStatement st8 = con.prepareStatement("SELECT MOBILENO,BAL FROM " +bname +"INFO WHERE ACCNO=?");		//Fetching MobileNo. Of beneficiary From SAMEINFO
			st8.setString(1, beneficiaryaccountnumber);
			rs3=st8.executeQuery();
			rs3.next();
			
			String transID = generateTransID();
			
			PreparedStatement st9 = con.prepareStatement("SELECT TRANSACTIONID FROM TRANSACTIONINFO",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet r = st9.executeQuery();
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
			
			PreparedStatement st10 = con.prepareStatement("INSERT INTO TRANSACTIONINFO VALUES(?,?,?,current_timestamp,?,?,?,?,?,?,?,?,?,?,?)");	//I wouldn't bother retrieving the current time in Java, just let the database do the job.
			st10.setString(1, transID);
			System.out.println(transID);
			
			st10.setString(2, unqid);
			System.out.println(unqid);
			
			st10.setString(3, status);
			System.out.println(status);
			
			st10.setString(4, amount.toString());
			System.out.println(amount.toString());
			
			st10.setString(5, rs.getString(5));
			System.out.println(rs.getString(5));
			
			st10.setString(6, bname);
			System.out.println(bname);
			
			st10.setString(7, rs.getString(4));
			System.out.println(rs.getString(4));
			
			st10.setString(8, rs2.getString(1));
			System.out.println(rs2.getString(1));
			
			st10.setString(9, rs2.getString(2));
			System.out.println(rs2.getString(2));
			
			st10.setString(10, beneficiaryname);
			System.out.println(beneficiaryname);
			
			st10.setString(11, bname);
			System.out.println(bname);
			
			st10.setString(12, beneficiaryaccountnumber);
			System.out.println(beneficiaryaccountnumber);
			
			st10.setString(13, rs3.getString(1));
			System.out.println(rs3.getString(1));
			
			st10.setString(14, rs3.getString(2));
			System.out.println(rs3.getString(2));
			
			st10.executeUpdate();
			
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