<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
	try{   
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");
		String bankid=session.getAttribute("bankid").toString();
			
				
	
		
		PreparedStatement st = con.prepareStatement("UPDATE bankadmininfo set username=?,userpassword=? where bankid=?");
		st.setString(1,uname); 
		st.setString(2,upass);
		st.setString(3,bankid);
		st.executeUpdate();
		con.close();
		Thread.sleep(5000);
		response.sendRedirect("adminhome.jsp");
	}catch(Exception e){
	   e.printStackTrace();
	 }
%>	 