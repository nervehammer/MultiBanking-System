<%@ page import ="java.sql.*,com.jdbc.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<%
		
			try {
				
				ResultSet rs,rs1 = null;
				Connection con=DbCon.dbCon();
				
				String unqid = session.getAttribute("unqid").toString();
				System.out.println(unqid);
				
				String latestBankID = session.getAttribute("latestBankID").toString();
				String cid = session.getAttribute("cid").toString();
				String accno = session.getAttribute("accno").toString();
				String ahname = session.getAttribute("ahname").toString();
				
				PreparedStatement st1 = con.prepareStatement("SELECT BANKNAME FROM BANKINFO WHERE BANKID=?");	//Verify Tpass here
				st1.setString(1, latestBankID);
				rs=st1.executeQuery();
				rs.next();
				
				String BankName = rs.getString(1);
				
				PreparedStatement st2 = con.prepareStatement("SELECT BAL FROM " +BankName +"INFO WHERE CID=? AND ACCNO=?");	//Verify Tpass here
				st2.setString(1, cid);
				st2.setString(2, accno);
				rs1=st2.executeQuery();
				
				rs1.next();
		%>
		
			<h1>Your Balance : <%=rs1.getString(1) %></h1>
		
		<%
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		%>

</body>
</html>