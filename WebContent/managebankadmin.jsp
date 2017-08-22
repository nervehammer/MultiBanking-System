<%@ page import ="java.sql.*,com.jdbc.*" %>

<% 

	try{
		
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		PreparedStatement st1 = con.prepareStatement("select * from bankadmininfo");
		rs = st1.executeQuery();
		 if(rs.next()){
			   %>
			   		
			   		<table align="center">
			    			
			    
			           	<tr>
			           	<th><h3>Bank ID</h3></th>
			           	<th><h3>Bank Name</h3></th>
			           	<th><h3>Username</h3></th>
			           	<th><h3>Operation</h3></th>			           	

			           	<%
			           	
			           	do
			           	{
			           	
			           	%>
			           	

			           	<tr>
			            	
			                	
			           	<td><%=rs.getString(1) %></td>
			           	<td><%=rs.getString(2) %></td>
			           	<td><%=rs.getString(3) %></td>
			           	<td><a href="editbankadmin.jsp?id=<%=rs.getString(1) %>">Edit</a></td>
			           	</tr>
			           	
			           	<%
			           	}while(rs.next());
			           	con.close();
			           	%>
			   	</table>
			   	<%
		   }
		   else {%>
		   
		   <h1>Hello Admin! No Bank Admin Created !</h1>
		   <a href = "adminhome.jsp"><h1>HOME</h1></a>
			   
		   <%}
		   
	   	}catch(Exception e){
		  	System.out.println("error");
	   }




%>