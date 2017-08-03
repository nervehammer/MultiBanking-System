<%@ page import ="java.sql.*,com.jdbc.*" %>
<h2>USER VALIDATION CHECK HERE</h2>

<%
	String uname = request.getParameter("username"); 
	String lpass = request.getParameter("loginpassword");
	String unqid;

	Connection con = DbCon.dbCon();

	PreparedStatement ps = con.prepareStatement("select * from userinfo where username=? and loginpassword=?");

	ps.setString(1,uname);
	ps.setString(2,lpass);

	ResultSet rs = ps.executeQuery();

	if(rs.next()){
		unqid=rs.getString(1);
		session.setAttribute("unqid",unqid);
		response.sendRedirect("userhome.jsp");
		} else{
			out.println("not valid");
			}
%>