<%@ page import ="java.sql.*,com.jdbc.*" %>

<%!
	String username,password;
	public void setvalue(ResultSet rs)throws SQLException{
		
		username=rs.getString(3);
		password=rs.getString(4);
		System.out.println(username+password);
				
	}
%>

<%  
	try{
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		String bankid,username,password;
		bankid= request.getParameter("id");
		session.setAttribute("bankid",bankid);
		
		PreparedStatement st = con.prepareStatement("select * from bankadmininfo where bankid=?");
		st.setString(1,bankid);
			
		rs = st.executeQuery();
		
		if(rs.next()){
			setvalue(rs);
			}
		} catch(Exception e){
			System.out.println("Error in editbankdetails");
			e.printStackTrace();
			}
	   
	   
%>

<html lang="en">
<head>
<title>Add Bank Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Classy Job Application Form Widget Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- font files -->
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- /font files -->
<!-- css files -->
<link href="css/adduserbankinfostyle.css" rel='stylesheet' type='text/css' media="all" />
<link rel="stylesheet" href="css/adduserbankinfo-j-forms.css">

<!-- /css files -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

</head>
<body>
<h1 class="header-w3ls">Edit Bank Admin Details</h1>
<div class="content-w3ls">
	<div class="form-w3ls">
		<form action="editbankadminprocess.jsp" method="post">
			<div class="content-wthree1">
				<div class="grid-agileits1">
				
				
					<div class="form-control">
					<div class="main-row">
					<div class="form-control"> 
						<label class="header">Username <span>*</span></label>
						<input type="text" name="uname" placeholder="Name" title="Please enter username" required value="<%=username%>">
					</div>
					<div class="form-control"> 
						<label class="header">User Password <span>*</span></label>
						<input type="text" name="upass" placeholder="Password" title="Please enter Password" required value="<%=password%>">
					</div>
					<div class="clear"></div>		
					<div class="wthreesubmitaits">
						<input type="submit" name="submit" value="Save">
					</div>
				</form>	


<p class="copyright">© 2017 Multibank All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">W3layouts</a></p>


</body>
</html>			