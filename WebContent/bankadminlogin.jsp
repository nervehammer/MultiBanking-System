<%@ page import ="java.sql.*,com.jdbc.*" %>


<%-- <form action="bankadminloginprocess.jsp">   

	<table class="table">

			<!-- <tr><td>Bankname :</td><td><input type="text" name="bankname"></td></tr> -->

			<tr>
 			<td><h3>Select Bank</h3></td>
 			<td>
 			<select name="bankdes">
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





			<tr><td>Username :</td><td><input type="text" name="username"></td></tr>
			<tr><td>Password :</td><td><input type="password" name="userpassword"></td></tr>
			<tr><td></td><td><input type="submit" value="Login"></td></tr>

	</table>
</form> --%>





<html>
<head>
<title>Transparent Login Form Responsive Widget Template | Home :: w3layouts</title>
<link href="css/bankadminlogin-style.css" rel="stylesheet" type="text/css" media="all"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Transparent Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<!--web-fonts-->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css' />
<!--web-fonts-->
</head>

<body>
<!--header-->
	<div class="header-w3l">
		<h1> Bank Admin Login Form</h1>
	</div>
<!--//header-->

<!--main-->
<div class="main-content-agile">
	<div class="sub-main-w3">	
		<form action="bankadminloginprocess.jsp" method="get">
			
			<label class="header">Bank <span>*</span></label>
			<select name="bankdes">
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
  			<br>
			
			<input placeholder="Username" name="username" class="user" type="text" required><br>
			<input  placeholder="Password" name="userpassword" class="pass" type="password" required><br>
  			
  			
			<input type="submit" value="">
		</form>
	</div>
</div>
<!--//main-->

<!--footer-->
<div class="footer">
	<p>&copy; 2017 Bank Admin Login. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
</div>
<!--//footer-->

</body>
</html>