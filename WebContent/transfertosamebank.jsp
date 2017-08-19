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
	
	<form action=transfertosamebanksummary.jsp name="f1" method="get">
	
		<h2>Enter Beneficiary Account Holder Details</h2>
		
		<table cellspacing="3">
		
		<tr>
		<td>
		<h3>Beneficiary Name</h3>
		</td>
		<td>
		<input type="text" name="beneficiaryname">
		</td>
		</tr>
		
		<tr>
		<td>
		<h3>Beneficiary Account Number</h3>
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
		
		<input type="submit" value="Click Next To Continue">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name=back  value="back" onClick="window.location='userhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset"   value="reset">
	</form>
	
	</center>


</body>
</html>