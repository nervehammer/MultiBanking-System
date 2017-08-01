<%@ page import ="java.sql.*,com.jdbc.*" %>

<%

   try{
   
    Connection con=DbCon.dbCon();
   
    String bankid=request.getParameter("bankid");
	String bankname=request.getParameter("bankname");
	String username=request.getParameter("username");
	String userpassword=request.getParameter("userpassword");
	     
	PreparedStatement st = con.prepareStatement("insert into bankadmininfo (bankid,bankname,username,userpassword) values(?,?,?,?)");
    st.setString(1,bankid);
    st.setString(2,bankname);
	st.setString(3,username);    
	st.setString(4,userpassword);
  	
  	System.out.println("query prepared!");
  	
  	
  	st.executeUpdate();
  	
  	
  	con.close();
  	response.sendRedirect("adminhome.jsp");
  	
	}catch(Exception e){
		out.println("error");
   }
   
   %>
