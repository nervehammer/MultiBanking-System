<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   //Class.forName("oracle.jdbc.driver.OracleDriver");
	   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
	   
	   String bankdes=request.getParameter("bankdes");
	   String uname=request.getParameter("username");
	   String upass=request.getParameter("userpassword");
	   
	   
		PreparedStatement st1 = con.prepareStatement("select * from bankinfo where bankdescription=?");
		st1.setString(1, bankdes);
		
		rs = st1.executeQuery();
		rs.next();
		String bankname = rs.getString(3);
	   
	   
	   
	   //Setting a attribute in session to send bankname in pendinguserlist.jsp  
	   session.setAttribute("bankname", bankname);
	   
	   PreparedStatement st=con.prepareStatement("select bankname from bankadmininfo where bankname=? and username=? and userpassword=?");
	   
	   st.setString(1,bankname);
	   st.setString(2,uname);
	   st.setString(3,upass);
	   
	   rs = st.executeQuery();
	   
	   if(rs.next()){
		   //TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE
		   response.sendRedirect("bankadminhome.jsp");
		   }else{
			   System.out.println("invalid details");
			   }
	   con.close();
	   
   }catch(Exception e){
	   System.out.println("error");
   }
  %>
