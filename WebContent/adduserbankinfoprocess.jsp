<%@ page import ="java.sql.*,com.jdbc.*" %>

<%

   try{
	   
		Connection con=DbCon.dbCon();
  		
		String bname=request.getParameter("bname");
		String cid=request.getParameter("cid");
		String anum=request.getParameter("anum");
		String ahname=request.getParameter("ahname");
		String mnum=request.getParameter("mnum");
		String atype=request.getParameter("atype");
		String tpass=request.getParameter("tpass");
		
		String unqid=session.getAttribute("unqid").toString();
		     
		PreparedStatement st = con.prepareStatement("insert into tempuserbankinfo (bname,cid,anum,ahname,unqid,mnum,atype,tpass) values(?,?,?,?,?,?,?,?)");
		
		st.setString(1,bname);
		st.setString(2,cid);
		st.setString(3,anum);    
		st.setString(4,ahname);
		st.setString(5,unqid);
		st.setString(6,mnum);
		st.setString(7,atype);
		st.setString(8,tpass);
		 	
		System.out.println("query prepared!");
		 	 	
		st.executeUpdate();	
	  	
	  	con.close();
	  	response.sendRedirect("userhome.jsp");
  	
	}catch(Exception e){
		out.println("error");
   }
   
   %>
