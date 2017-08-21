<%@ page import ="java.sql.*,com.jdbc.*" %>
<%

try{
	Statement st,st2 = null;
	ResultSet rs,rsq = null;
	Connection con = DbCon.dbCon(); 
	String bname=session.getAttribute("bankname").toString();
	String tempuid=session.getAttribute("tempuid").toString();
	
	 st=con.createStatement();
	 String query="SELECT * FROM tempuserbankinfo WHERE status=1 AND unqid='"+tempuid+"' AND bname='"+bname+"'";
	 rsq=st.executeQuery(query);
	 rsq.next();
	 
	 PreparedStatement bankstmt = con.prepareStatement("SELECT BAL FROM " +bname +"INFO WHERE CID=?");
	 bankstmt.setString(1, rsq.getString(3));
	 rs=bankstmt.executeQuery();
	 rs.next();
	 String bal = rs.getString(1);
	 
	 PreparedStatement pst=con.prepareStatement("INSERT INTO USERBANKINFO (UNQID,BANKID,CID,ACCNO,AHNAME,ATYPE,TPASS) VALUES (?,?,?,?,?,?,?)");
	 pst.setString(1,tempuid);
	 pst.setString(2,session.getAttribute("bankID").toString());
	 pst.setString(3,rsq.getString(3));
	 pst.setString(4,rsq.getString(4));
	 pst.setString(5,rsq.getString(5));
	 pst.setString(6,rsq.getString(7));
	 pst.setString(7,rsq.getString(8));
	 rs = pst.executeQuery();
	 System.out.println("Data Inserted successfully");
	 
	 /* st2=con.createStatement();
	 String delquery="DELETE FROM tempuserbankinfo WHERE unqid='"+tempuid+"' AND bname='"+bname+"'";
	 rsq=st.executeQuery(delquery);
	 session.removeAttribute("tempuid");
	 System.out.println("Deleted temp entry"); */ 	//No need to delete here
	 
	 response.sendRedirect("pendinguserlist.jsp");
	 
	
}catch(Exception e){
	 e.printStackTrace();
}

%>