<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
	String uname = request.getParameter("username"); 
	String lpass = request.getParameter("loginpassword"); 
	String ppass = request.getParameter("profilepassword"); 

	Connection con = DbCon.dbCon();

	PreparedStatement ps = con.prepareStatement("insert into userinfo(username,loginpassword,profilepassword) values(?,?,?)");
	/*Unique ID aka unqid is generated from a sequence (incrementing unqid by 1). The sequence is triggered with each new insertion.   */

	ps.setString(1,uname);
	ps.setString(2,lpass);
	ps.setString(3,ppass);
	ps.executeUpdate();
	con.close();
	response.sendRedirect("index.html");
%>