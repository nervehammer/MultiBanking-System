<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   int sendRedirectFlag = 0;
	   ResultSet rs = null;
	   Connection con = DbCon.dbCon();
	   //String unqid = request.getParameter("id");
	   String bname = session.getAttribute("bankname").toString();
	   String bdbname = bname+"INFO";
	  
	   int unqid = Integer.parseInt(request.getParameter("id"));
	      
	   PreparedStatement st=con.prepareStatement("select * from " +bdbname+" b ,tempuserbankinfo t where (t.unqid=? AND t.cid=b.cid) AND accno=t.anum");
	   st.setInt(1, unqid);	
	   rs = st.executeQuery();
	  	   
	   if(rs.next()){
		   //TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE
		   	Statement stmt = con.createStatement();
			stmt.executeUpdate("update tempuserbankinfo set status =1,remarks='User Verified' where bname='"+bname+"' AND unqid='"+unqid+"'");
			System.out.println("update successfull");
			sendRedirectFlag = 1;
			
		   }else{
			   Statement stmt = con.createStatement();
			   stmt.executeUpdate("update tempuserbankinfo set status =-1,remarks='Information Mismatch' where bname='"+bname+"' AND unqid='"+unqid+"'");
			   System.out.println("stmt exec");
			   sendRedirectFlag = -1;
			   }
	   con.close();
	   session.setAttribute("tempuid",unqid);
	   
	   if(sendRedirectFlag == 1) {
		   response.sendRedirect("addverifieduserbankinfo.jsp");   
	   }
	   else {
		   response.sendRedirect("pendinguserlist.jsp");
	   }
	   
	   
   }catch(Exception e){
	   System.out.println("error");
	   e.printStackTrace();
   }
  %>