<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{   
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String bname = request.getParameter("bname");
		
		String unqid = session.getAttribute("unqid").toString();
		
		
		
		PreparedStatement st = con.prepareStatement("delete from tempuserbankinfo where unqid=? and bname=?");
		st.setString(1, unqid);
		st.setString(2, bname);
		st.executeUpdate();
		con.close();
		Thread.sleep(5000);
		response.sendRedirect("userhome.jsp");
	}catch(Exception e){
	   e.printStackTrace();
	}
%>