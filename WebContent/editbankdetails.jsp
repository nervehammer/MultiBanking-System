<%@ page import ="java.sql.*,com.jdbc.*" %>

<%!
	String bname,cid,accno,ahname,mnum,atype;
	public void setvalue(ResultSet rs)throws SQLException{
		//bname=rs.getString(1);
		cid=rs.getString(3);
		accno=rs.getString(4);
		ahname=rs.getString(5);
		mnum=rs.getString(6);
		atype=rs.getString(7);
		
	}
%>

<%  
	try{
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		bname = request.getParameter("bname");
		session.setAttribute("bkname",bname);
		System.out.println(bname);
		
		PreparedStatement st = con.prepareStatement("select * from tempuserbankinfo where ((status in(0,-1) and unqid=?) and bname=?)");
		st.setString(1, session.getAttribute("unqid").toString());
		st.setString(2, bname);
		
		rs = st.executeQuery();
		
		if(rs.next()){
			setvalue(rs);
			ahname=rs.getString(5);
			System.out.println(ahname);
			}
		} catch(Exception e){
			System.out.println("Error in editbankdetails");
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
<h1 class="header-w3ls">Edit Bank Details</h1>
<div class="content-w3ls">
	<div class="form-w3ls">
		<form action="editbankdetailsprocess.jsp" method="post">
			<div class="content-wthree1">
				<div class="grid-agileits1">
				
				
					<div class="form-control">
					<div class="main-row">
						<label class="header">Bank <span>*</span></label>
							<select name="bankdes" >
			<%
				Connection con = DbCon.dbCon();
				
				PreparedStatement st = con.prepareStatement("select * from bankinfo");
				
				ResultSet rs1 = st.executeQuery();
				
				while(rs1.next()){

			%>
			<option 
			
				<% if(rs1.getString(3).equals(bname)){
					%> selected=<%=rs1.getString(3) %>
				
				<% } %>
			
			><%=rs1.getString(2)%></option>
				<%}%>
  			</select>
							<i></i>
					</div>
					</div>
					
					<div class="form-control"> 
						<label class="header">Customer ID <span>*</span></label>
						<input type="text" name="cid" placeholder="Name" title="Please enter your Customer ID" required value="<%=cid%>">
					</div>
		
					<div class="form-control">	
						<label class="header">Account Number <span>*</span></label>
						<input type="text" name="anum" placeholder="Account Number" title="Please enter a Valid Account Number" required value=<%=accno%>>
					</div>
					<div class="form-control">	
						<label class="header">Account Holder Name <span>*</span></label>
						<input type="text" name="ahname" placeholder="Account Holder" title="Please enter Account Holder Name" required value='<%=ahname%>'>
					</div>
					<div class="form-control"> 
						<label class="header">Phone <span>*</span></label>
						<input type="text" name="mnum" placeholder="Phone" title="Please enter your Phone No" required value=<%=mnum%>>
					</div>
				</div>			
			</div>
			
			<div class="content-wthree2">
				<div class="grid-w3layouts1">
					<div class="w3-agile1">
						<label class="rating">Change Account Type <span>*</span></label>
						<ul>
							<li>
								<input type="radio" id="a-option" name="atype" value="Current Account">
								<label for="a-option">Current Account </label>
								<div class="check"></div>
							</li>
							<li>
								<input type="radio" id="b-option" name="atype" value="Savings Account">
								<label for="b-option">Savings Account</label>
								<div class="check"><div class="inside"></div></div>
							</li>
							<li>
								<input type="radio" id="c-option" name="atype" value="Others">
								<label for="c-option">Others</label>
								<div class="check"><div class="inside"></div></div>
							</li>
							<div class="clear"></div>
						</ul>
					</div>
					
				</div>
				
				<div class="clear"></div>
			</div>
			
				<div class="wthreesubmitaits">
					<input type="submit" name="submit" value="Save">
				</div>
				</form>	
	</div>
	
</div>

<p class="copyright">© 2017 Multibank All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">W3layouts</a></p>


</body>
</html>