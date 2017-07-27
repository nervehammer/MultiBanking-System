<%@ page import ="java.sql.*,com.jdbc.*" %>
<%

String uname = request.getParameter("username"); 
String upass = request.getParameter("userpassword"); 

Connection con = DbCon.dbCon();

PreparedStatement ps = con.prepareStatement("insert into userinfo(username,userpassword) values(?,?)");

ps.setString(1, uname);
ps.setString(2, upass);
ps.executeQuery();
%>