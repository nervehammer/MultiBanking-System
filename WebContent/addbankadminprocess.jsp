<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{
		Connection con=DbCon.dbCon();
		String bankname = "";
		
		String bankdes=request.getParameter("bankdes");
		String username=request.getParameter("username");
		String userpassword=request.getParameter("userpassword");
		PreparedStatement st1 = con.prepareStatement("select * from bankinfo where bankdescription=?");
		st1.setString(1, bankdes);
		
		ResultSet rs = st1.executeQuery();
		rs.next();
		int bankid=rs.getInt(1);
		bankname = rs.getString(3);
		
		
		PreparedStatement st = con.prepareStatement("insert into bankadmininfo (bankid,bankname,username,userpassword) values(?,?,?,?)");
		st.setInt(1,bankid);
		st.setString(2,bankname);
		st.setString(3,username);
		st.setString(4,userpassword);
		
		st.executeUpdate();
		
		con.close();
		response.sendRedirect("adminhome.jsp");
		} catch(Exception e){
			out.println("error");
			}
%>