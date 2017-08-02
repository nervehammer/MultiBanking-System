<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   ResultSet rs = null;
	   Connection con = DbCon.dbCon();
	  // String unqid = request.getParameter("unqid");
	   String bname = session.getAttribute("bname").toString();
	   String bdbname = bname+"info";
	   System.out.println(bdbname);
	   
	   
	  int unqid = Integer.parseInt(request.getParameter("id"));
	     
	   PreparedStatement st=con.prepareStatement("select accno from " +bdbname+" ,tempuserbankinfo where accno=tempuserbankinfo.anum AND unqid=?");
	   st.setInt(1, unqid);	 	   
	   rs = st.executeQuery();
	   
	   if(rs.next()){
		   //TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE
		   Statement stmt = con.createStatement();
	   		stmt.executeUpdate("update tempuserbankinfo set status =1,remarks='User Verified' where bname='"+bname+"' AND unqid='"+unqid+"'");
	   		System.out.println("stmt exec");
		   }else{
			   Statement stmt = con.createStatement();
			   stmt.executeUpdate("update tempuserbankinfo set status =-1,remarks='Information Mismatch' where bname='"+bname+"' AND unqid'"+unqid+"'");
			   System.out.println("stmt exec");
			   }
	   con.close();
	   response.sendRedirect("pendinguserlist.jsp");
	   
   }catch(Exception e){
	   System.out.println("error");
   }
  %>