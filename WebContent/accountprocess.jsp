<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
   
   int ind=0;
   Connection con=DbCon.dbCon();
//Class.forName("oracle.jdbc.driver.OracleDriver");
//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");


   String bname=(String)session.getAttribute("bname");
   String anum=request.getParameter("anum");
   String cname=request.getParameter("cname");
      String pname=request.getParameter("ppass");
   String atype=request.getParameter("atype");
   String mnum=request.getParameter("mnum");
      String tpass=request.getParameter("tpass");
	     
			 //  float bal=50000;int status=0;
   PreparedStatement st=con.prepareStatement("insert into tempcustomer values(?,?,?,?,?,?,?)");
     st.setString(1,bname);
	 st.setString(2,anum);    
	 st.setString(3,cname);
     st.setString(4,pname);
     st.setString(5,atype);
     st.setString(6,mnum);
  	 st.setString(7,tpass);
   
    st.executeUpdate();
   con.close();
   response.sendRedirect("userhome.jsp");
   }catch(Exception e){
	  System.out.println("error");
   }
  %>
