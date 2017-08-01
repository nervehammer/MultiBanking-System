<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   
	   int unqid = Integer.parseInt(request.getParameter("id"));
	   System.out.println(unqid);
	   
	   String bdbname= session.getAttribute("bankname")+"INFO";
	   System.out.println(bdbname);
	   
	  
		   
		   PreparedStatement st=con.prepareStatement("select accno from " +bdbname+" ,tempuserbankinfo where accno=tempuserbankinfo.anum");
		   

			   
	   
	   rs = st.executeQuery();
	   
	   if(rs.next()){
		   //TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE
		   Statement stmt = con.createStatement();
	   		stmt.executeUpdate("update tempuserbankinfo set status =1,remarks='User Verified' where unqid=? AND bname=?");
	   		System.out.println("stmt 1 exec");
		   }else{
			   Statement stmt = con.createStatement();
			   stmt.executeUpdate("update tempuserbankinfo set status =-1,remarks='Information Mismatch' where unqid=? AND bname=?");
			   System.out.println("stmt -1 exec");
			   }
	   con.close();
	   response.sendRedirect("pendinguserlist.jsp");
	   
   }catch(Exception e){
	   System.out.println("error");
   }
  %>