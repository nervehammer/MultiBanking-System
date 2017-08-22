<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{
		Connection con=DbCon.dbCon();
		
		String bankdes=request.getParameter("bankdes");
		String cid=request.getParameter("cid");
		String anum=request.getParameter("anum");
		String ahname=request.getParameter("ahname");
		String mnum=request.getParameter("mnum");
		String atype=request.getParameter("atype");
		String tpass=request.getParameter("tpass");
		
		String unqid=session.getAttribute("unqid").toString();
		
		PreparedStatement st1 = con.prepareStatement("select * from bankinfo where bankdescription=?");
		st1.setString(1, bankdes);
		
		ResultSet rs = st1.executeQuery();
		rs.next();
		String bankname = rs.getString(3);
		
		PreparedStatement st = con.prepareStatement("insert into tempuserbankinfo (bname,cid,anum,ahname,mnum,atype,tpass,unqid) values(?,?,?,?,?,?,?,?)");
 	    st.setString(1,bankname);
		st.setString(2,cid);
		st.setString(3,anum);    
		st.setString(4,ahname);
		st.setString(5,mnum);
		st.setString(6,atype);
		st.setString(7,tpass);
		st.setString(8,unqid);
		
		st.executeUpdate();
		con.close();
		response.sendRedirect("userhome.jsp");
		} catch(Exception e){
			out.println("error");
			}
%>