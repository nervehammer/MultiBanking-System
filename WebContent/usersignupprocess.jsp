<%@ page import ="java.sql.*,com.jdbc.*" %>
<%

String uname = request.getParameter("username"); 
String upass = request.getParameter("userpassword");
String unqid = request.getParameter("unqid");

Connection con = DbCon.dbCon();

PreparedStatement ps = con.prepareStatement("insert into userinfo(username,userpassword,unqid) values(?,?,?)");

ps.setString(1, uname);
ps.setString(2, upass);
ps.setString(3, unqid);

ps.executeUpdate();
con.close();
response.sendRedirect("index.html");
%>