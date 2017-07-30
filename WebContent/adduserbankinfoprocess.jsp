<%@ page import ="java.sql.*,com.jdbc.*" %>

<%

   try{
   
   //int ind=0;
   Connection con=DbCon.dbCon();
	
   //Class.forName("oracle.jdbc.driver.OracleDriver");
   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");


   //String bname=(String)session.getAttribute("bname");
   
   
	String bname=request.getParameter("bname");
	String anum=request.getParameter("anum");
	String ahname=request.getParameter("ahname");
	String mnum=request.getParameter("mnum");
	String atype=request.getParameter("atype");
	String tpass=request.getParameter("tpass");
	     
	PreparedStatement st = con.prepareStatement("insert into tempuserbankinfo (bname,anum,ahname,mnum,atype,tpass) values(?,?,?,?,?,?)");
    st.setString(1,bname);
	st.setString(2,anum);    
	st.setString(3,ahname);
    st.setString(5,mnum);
    st.setString(6,atype);
  	st.setString(7,tpass);
  	
  	System.out.println("query prepared!");
  	 	
  	st.executeUpdate();
  	
  	
  	con.close();
  	response.sendRedirect("userhome.jsp");
  	
	}catch(Exception e){
		out.println("error");
   }
   
   %>
