<%@ page import ="java.sql.*,com.jdbc.*" %>

<%

   try{
   
   //int ind=0;
   Connection con=DbCon.dbCon();
	
   //Class.forName("oracle.jdbc.driver.OracleDriver");
   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");


   //String bname=(String)session.getAttribute("bname");
   
   
	String bankdes=request.getParameter("bankdes");
	String anum=request.getParameter("anum");
	String ahname=request.getParameter("ahname");
	String ppass=request.getParameter("ppass");
	String mnum=request.getParameter("mnum");
	String atype=request.getParameter("atype");
	String tpass=request.getParameter("tpass");
	String unqid=session.getAttribute("unqid").toString();
	
	
	PreparedStatement st1 = con.prepareStatement("select * from bankinfo where bankdescription=?");
	st1.setString(1, bankdes);
	
	ResultSet rs = st1.executeQuery();
	
	rs.next();
	String bankname = rs.getString(3);
	
	     
	PreparedStatement st = con.prepareStatement("insert into tempuserbankinfo (bname,anum,ahname,ppass,mnum,atype,tpass,unqid) values(?,?,?,?,?,?,?,?)");
    st.setString(1,bankname);
	st.setString(2,anum);    
	st.setString(3,ahname);
	st.setString(4,ppass);
    st.setString(5,mnum);
    st.setString(6,atype);
  	st.setString(7,tpass);
  	st.setString(8,unqid);
  	
  	System.out.println("query prepared!");
  	 	
  	st.executeUpdate();
  	
  	
  	con.close();
  	response.sendRedirect("userhome.jsp");
  	
	}catch(Exception e){
		out.println("error");
   }
   
   %>
