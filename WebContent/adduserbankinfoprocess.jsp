<%@ page import ="java.sql.*,com.jdbc.*" %>

<%

   try{
   
   //int ind=0;
   Connection con=DbCon.dbCon();
	
   //Class.forName("oracle.jdbc.driver.OracleDriver");
   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");


   //String bname=(String)session.getAttribute("bname");
   
   
	String bankdes=request.getParameter("bankdes");
	String cid=request.getParameter("cid");
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
 	    st.setString(1,bankdes);
		st.setString(2,cid);
		st.setString(3,anum);    
		st.setString(4,ahname);
		st.setString(5,unqid);
		st.setString(6,mnum);
		st.setString(7,atype);
		st.setString(8,tpass);
		
  	System.out.println("query prepared!");
  	 	
  	st.executeUpdate();
  	
  	
  	con.close();
  	response.sendRedirect("userhome.jsp");
  	
	}catch(Exception e){
		out.println("error");
   }
   
   %>
