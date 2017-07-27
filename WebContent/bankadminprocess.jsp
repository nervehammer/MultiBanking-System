<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
   
	   ResultSet rs = null;
   Connection con=DbCon.dbCon();
//Class.forName("oracle.jdbc.driver.OracleDriver");
//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");


   String bankname=request.getParameter("bankname");
   String uname=request.getParameter("username");
   String upass=request.getParameter("userpassword");
	     
			
   PreparedStatement st=con.prepareStatement("select bname from bankadmininfo where bankname=? and uname=? and upass=?");
     st.setString(1,bankname);
	 st.setString(2,uname);  
	 st.setString(3,upass);  
   
	 rs = st.executeQuery();
    
	 if(rs.next()){
		 
	//TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE 
		 
	 }else{
		 
		 System.out.println("invalid details");
		 
	 }
    
   con.close();
   response.sendRedirect("bankadminhome.jsp");
   }catch(Exception e){
	  System.out.println("error");
   }
  %>
