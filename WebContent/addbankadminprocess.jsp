<%@ page import ="java.sql.*,com.jdbc.*" %>

<%

   try{
   
   //int ind=0;
   Connection con=DbCon.dbCon();
	
   //Class.forName("oracle.jdbc.driver.OracleDriver");
   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");


   //String bname=(String)session.getAttribute("bname");
   
   
	String bankname=request.getParameter("bankname");
	String username=request.getParameter("username");
	String userpassword=request.getParameter("userpassword");
	     
	//float bal=50000;int status=0;
	PreparedStatement st = con.prepareStatement("insert into bankadmininfo (bankname,username,userpassword) values(?,?,?)");
    st.setString(1,bankname);
	st.setString(2,username);    
	st.setString(3,userpassword);
  	
  	System.out.println("query prepared!");
  	
  	
  	st.executeUpdate();
  	
  	
  	con.close();
  	response.sendRedirect("adminhome.jsp");
  	
	}catch(Exception e){
		out.println("error");
   }
   
   %>
