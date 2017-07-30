<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
	try{   
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String bname=request.getParameter("bname");
		String anum=request.getParameter("anum");
		String ahname=request.getParameter("ahname");
		String mnum=request.getParameter("mnum");
		String atype=request.getParameter("atype");
		
		PreparedStatement st = con.prepareStatement("UPDATE tempuserbankinfo set bname=?,anum=?,ahname=?,mnum=?,atype=?,status=0,remarks='Verification Pending'");
		st.setString(1,bname);
		st.setString(2,anum);
		st.setString(3,ahname);
		st.setString(4,mnum);
		st.setString(5,atype);
		st.executeQuery();
		con.close();
	}catch(Exception e){
	   e.printStackTrace();
	 }
		
	response.sendRedirect("userhome.jsp");
%>	 