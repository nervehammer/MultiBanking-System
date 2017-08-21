<%@ page import ="java.sql.*,com.jdbc.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%-- <%
	String bname = request.getParameter("bname");

	System.out.println(bname);
	
	session.setAttribute("bname",bname);

%> --%>

<%
			try {
				
				Connection con = DbCon.dbCon();
				
				String unqid=session.getAttribute("unqid").toString();
				
				PreparedStatement st1 = con.prepareStatement("SELECT LATESTBANKID FROM USERINFO WHERE UNQID=?");
				st1.setString(1, unqid);
				
				ResultSet rs = st1.executeQuery();
				rs.next();
				String latestBankID = rs.getString(1);
				
				PreparedStatement st2 = con.prepareStatement("SELECT * FROM USERBANKINFO WHERE UNQID=? AND BANKID=?");
				st2.setString(1, unqid);
				st2.setString(2, latestBankID);
				
				ResultSet rs1 = st2.executeQuery();
				rs1.next();
				
				session.setAttribute("latestBankID",latestBankID);
				session.setAttribute("cid",rs1.getString(3));
				session.setAttribute("accno",rs1.getString(4));
				session.setAttribute("ahname",rs1.getString(5));
				session.setAttribute("atype",rs1.getString(6));
				con.close();
				System.out.println("latestBankID:"+session.getAttribute("latestBankID"));
				System.out.println("cid:"+session.getAttribute("cid"));
				System.out.println("accno:"+session.getAttribute("accno"));
				System.out.println("ahname:"+session.getAttribute("ahname"));
				System.out.println("atype:"+session.getAttribute("atype"));
				
				
				
				
			} catch(Exception e) {
				System.out.println(e);
			}
		
		
		%>


<h1>Welcome User</h1>
<br>
<br>
<br>

<a href="transferamount.jsp"><h2>Transfer Amount</h2></a>

<br>
<br>
<br>

<a href="transactionhistory.jsp"><h2>Available Balance</h2></a>	<!-- To be implemented -->

<br>
<br>
<br>

<a href="transactionhistory.jsp"><h2>Transaction History</h2></a>

<br />
<br />
<br />
<a href="switchbank.jsp"><h2>Switch Bank Account</h2></a>


</body>
</html>