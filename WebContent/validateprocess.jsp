<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   
	   String bdbname= session.getAttribute("bname")+"bankinfo";
	   System.out.println(bdbname);
	   
	   //Class.forName("oracle.jdbc.driver.OracleDriver");
	   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
	   
	   PreparedStatement st=con.prepareStatement("select accno from " +bdbname+" ,tempuserbankinfo where accno=tempuserbankinfo.anum");
		//st.setString(1, bdbname);	   
	   
	   rs = st.executeQuery();
	   
	   if(rs.next()){
		   //TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE
		   Statement stmt = con.createStatement();
	   		stmt.executeUpdate("update tempuserbankinfo set status =1");
	   		System.out.println("stmt exec");
		   }else{
			   Statement stmt = con.createStatement();
			   stmt.executeUpdate("update tempuserbankinfo set status =-1");
			   System.out.println("stmt exec");
			   }
	   con.close();
	   response.sendRedirect("pendinguserlist.jsp");
	   
   }catch(Exception e){
	   System.out.println("error");
   }
  %>