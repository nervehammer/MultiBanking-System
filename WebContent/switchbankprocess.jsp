<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
	try{
		String bankid=request.getParameter("bankid");
		PreparedStatement pt = null;
		Statement st = null;
		Connection con=DbCon.dbCon();
		ResultSet rs  = null;
		pt = con.prepareStatement("SELECT * FROM userbankinfo WHERE unqid=? AND bankid=?");
		pt.setString(1,session.getAttribute("unqid").toString());
		pt.setString(2,bankid);
		rs = pt.executeQuery();
		rs.next();
		session.setAttribute("bankid",bankid);
		session.setAttribute("cid",rs.getString(3));
		session.setAttribute("anum",rs.getString(4));
		session.setAttribute("ahname",rs.getString(5));
		session.setAttribute("atype",rs.getString(6));
		st = con.createStatement();
		st.executeUpdate("UPDATE userinfo set latestbankid='"+bankid+"' where unqid='"+session.getAttribute("unqid").toString()+"'");
		System.out.println("Set new bank");
		con.close();
		System.out.println("bankid:"+session.getAttribute("bankid"));
		System.out.println("cid:"+session.getAttribute("cid"));
		System.out.println("anum:"+session.getAttribute("anum"));
		System.out.println("ahname:"+session.getAttribute("ahname"));
		System.out.println("atype:"+session.getAttribute("atype"));
		con.close();
		response.sendRedirect("userhome.jsp");
		}
	catch(Exception e){
		e.printStackTrace();
	}
%>

//TODO: Set/Update curreent selected bank.
