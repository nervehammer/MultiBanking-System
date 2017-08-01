<%@ page import ="java.sql.*,com.jdbc.*" %>
<%

String uname = request.getParameter("username"); 
String lpass = request.getParameter("loginpassword"); 
String ppass = request.getParameter("profilepassword"); 

Connection con = DbCon.dbCon();

PreparedStatement ps = con.prepareStatement("insert into userinfo(username,loginpassword,profilepassword) values(?,?,?)");

ps.setString(1,uname);
ps.setString(2,lpass);
ps.setString(3,ppass);
ps.executeUpdate();
con.close();
response.sendRedirect("userlogin.jsp");
%>