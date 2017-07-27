<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   //Class.forName("oracle.jdbc.driver.OracleDriver");
	   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
	   
	   String adminname=request.getParameter("adminname");
	   String adminpass=request.getParameter("adminpass");
	   
	   PreparedStatement st=con.prepareStatement("select adminname from admininfo where adminname=? and adminpass=?");
	   
	   st.setString(1,adminname);
	   st.setString(2,adminpass);
	   
	   rs = st.executeQuery();
	   
	   if(rs.next()){
		   //TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE
		   response.sendRedirect("adminhome.jsp");
		   }else{
			   System.out.println("invalid details");
			   }
	   con.close();
	   
   }catch(Exception e){
	   System.out.println("error");
   }
  %>