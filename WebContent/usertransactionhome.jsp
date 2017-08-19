<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String bname = request.getParameter("bname");

	System.out.println(bname);
	
	session.setAttribute("bname",bname);

%>


<h1> Welcome User</h1>
<br>
<br>
<br>

<a href = "transferamounthome.jsp"><h2>Transfer Amount</h2></a>

<br>
<br>
<br>

<a href = "transactionhistory.jsp"><h2>Transaction History</h2></a>


</body>
</html>