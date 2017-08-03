<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
	try{   
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String cid=request.getParameter("cid");
		String bankdes=request.getParameter("bankdes");
		String anum=request.getParameter("anum");
		String ahname=request.getParameter("ahname");
		String mnum=request.getParameter("mnum");
		String atype=request.getParameter("atype");
		
		String bname = request.getParameter("bname");
		System.out.println(bname);
		
		String unqid = session.getAttribute("unqid").toString();
		System.out.println(unqid);
		
		/* 
		PreparedStatement st1 = con.prepareStatement("select * from tempuserbankinfo where unqid=? and bname=?");
		st1.setString(1, unqid);
		st1.setString(2, bname);
		
		rs = st1.executeQuery();
		
		rs.next(); */
		
		PreparedStatement st1 = con.prepareStatement("select bankname from bankinfo where bankdescription=?");
		st1.setString(1, bankdes);
		
		rs = st1.executeQuery();
		rs.next();
		String bankname = rs.getString(3);
		
		
		
		PreparedStatement st = con.prepareStatement("UPDATE tempuserbankinfo set bname=?,anum=?,ahname=?,mnum=?,atype=?,cid=?,status=0,remarks='Verification Pending' where ((unqid=? and bname=?) and status in(-1,0))");
		st.setString(1,bankname);
		st.setString(2,anum);
		st.setString(3,ahname);
		st.setString(4,mnum);
		st.setString(5,atype);
		st.setString(6, cid);
		st.setString(7, unqid);
		st.setString(8, bname);
		st.executeUpdate();
		con.close();
		response.sendRedirect("userhome.jsp");
	}catch(Exception e){
	   e.printStackTrace();
	 }
%>	 