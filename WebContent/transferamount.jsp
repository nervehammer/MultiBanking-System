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


	<center>
	
	<form action=transferamountsummary.jsp name="f1" method="get">
	
		<h2>Enter Beneficiary Account Holder Details</h2>
		
		<table cellspacing="3">
		
		<tr>
		<td>
		<h3>Bank</h3>
		</td>
		<tr>
		<td>
		<select name="beneficiarybankdes">
			<option value="">- Please select a bank -</option>
				<%
					Connection con = DbCon.dbCon();
					PreparedStatement st = con.prepareStatement("select * from bankinfo");
					ResultSet rs = st.executeQuery();
					while(rs.next()){
				%>
			<option><%=rs.getString(2)%></option>
			<%}%>
		</select>
		</td>
		</tr>
		
		<tr>
		<td>
		<h3>Name</h3>
		</td>
		<td>
		<input type="text" name="beneficiaryname">
		</td>
		</tr>
		
		<tr>
		<td>
		<h3>Account Number</h3>
		</td>
		<td>
		<input type="text" name="beneficiaryaccountnumber">
		</td>
		</tr>
		
		<tr>
		<td>
		<h3>Amount To Be Transferred</h3>
		</td>
		<td>
		<input type="text" name="amount">
		</td>
		</tr>
		
		</table>
		
		<BR>
		
		<input type="submit" value="Next">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name=back  value="back" onClick="window.location='userhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset"   value="reset">
	</form>
	
	</center>


</body>
</html>