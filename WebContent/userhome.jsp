<%@ page import ="java.sql.*,com.jdbc.*" %>
<html>
	<body>

		<a href="adduserbankinfo.jsp">Add bank</a>

		<br>
		<br>
		<br>
		<br>

		<a href="addbankstatus.jsp">Check Add Bank Status</a>
		
		<!--TODO: If a user has atleast one verified account details, then make a link Payments/Transfer  -->
		<%
			try {
				
				Connection con = DbCon.dbCon();
				
				String unqid=session.getAttribute("unqid").toString();
				
				PreparedStatement st1 = con.prepareStatement("SELECT * FROM USERBANKINFO WHERE UNQID=?");
				st1.setString(1, unqid);
				
				ResultSet rs = st1.executeQuery();
				
				if (rs.next()) {
		%>
					
					<br />
					<br />
					<br />
					<br />
					<a href="usertransactionhome.jsp">Payments/Transfer</a>
					
		<%		}
				
			} catch(Exception e) {
				System.out.println(e);
			}
		
		
		%>


		<br />
		<br />
		<br />
		<br />
		

		<a href="index.html"><strong>HOME</strong></a>

	</body>
</html>