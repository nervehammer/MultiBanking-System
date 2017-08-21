<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   //Class.forName("oracle.jdbc.driver.OracleDriver");
	   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
	   
	   PreparedStatement st=con.prepareStatement("SELECT * FROM USERBANKINFO WHERE BANKID=?");
	   st.setString(1, session.getAttribute("bankid").toString());
	   System.out.println(session.getAttribute("bankid").toString());
	   rs = st.executeQuery();
	   
	   if(rs.next()){
		   %>
		   		
		   		<table align="center">
		    			
		    
		           	<tr>
		           	<th><h3>Customer ID</h3></th>
		           	<th><h3>Account Number</h3></th>
		           	<th><h3>Account Holder Name</h3></th>
		           	<th><h3>Account Type</h3></th>
		           	

		           	<%
		           	
		           	do
		           	{
		           	
		           	%>
		           	

		           	<tr>
		            	
		                	
		           	<td><%=rs.getString(3) %></td>
		           	<td><%=rs.getString(4) %></td>
		           	<td><%=rs.getString(5) %></td>
		           	<td><%=rs.getString(6) %></td>
		           	
		           	</tr>
		           	
		           	<%
		           	}while(rs.next());
		           	con.close();
		           	%>
		   	</table>
		   	<%
	   }
	   else {%>
	   
	   <h1>Hello Bank Admin! No Temporary Users Available</h1>
	   <a href = "bankadminhome.jsp"><h1>HOME</h1></a>
		   
	   <%}
	   
   	}catch(Exception e){
	  	System.out.println("error");
   }
   	%>