<%@ page import ="java.sql.*,com.jdbc.*" %>

<%

   try{
   
   //int ind=0;
   Connection con=DbCon.dbCon();
   String bankname = "";
	
   //Class.forName("oracle.jdbc.driver.OracleDriver");
   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");


   //String bname=(String)session.getAttribute("bname");
   
   
	String bankdes=request.getParameter("bankdes");
	String bankid=request.getParameter("bankid");
	String username=request.getParameter("username");
	String userpassword=request.getParameter("userpassword");
	
	System.out.println(bankdes);
	
	PreparedStatement st1 = con.prepareStatement("select * from bankinfo where bankdescription=?");
	st1.setString(1, bankdes);
	
	ResultSet rs = st1.executeQuery();
	
	System.out.println("Query 1 executed");
	
	rs.next();
	bankname = rs.getString(3);
	System.out.println(rs.getString(3));
	
	     
	PreparedStatement st = con.prepareStatement("insert into bankadmininfo (bankid,bankname,username,userpassword) values(?,?,?,?)");
    st.setString(1,bankid);
    st.setString(2,bankname);
	st.setString(3,username);    
	st.setString(4,userpassword);
  	
  	
  	st.executeUpdate();
  	
  	System.out.println("Query 2 executed");
  	
  	
  	con.close();
  	response.sendRedirect("adminhome.jsp");
  	
	}catch(Exception e){
		out.println("error");
   }
   
   %>
