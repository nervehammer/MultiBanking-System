<%@ page import ="java.sql.*,com.jdbc.*" %>

<h2>USER VALIDATION CHECK HERE</h2>

<%

String uname = request.getParameter("username"); 
String upass = request.getParameter("userpassword"); 

Connection con = DbCon.dbCon();

PreparedStatement ps = con.prepareStatement("select * from userinfo where username=? and userpassword=?)");

ps.setString(1, uname);
ps.setString(2, upass);

ResultSet rs = ps.executeQuery();

if(rs.next()){
	
	System.out.println("valid");
response.sendRedirect("");        //here redirect user to Register for newbank 
}
else{
	
	System.out.println("notvalid");
	
}
%>