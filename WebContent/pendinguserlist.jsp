<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
     try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   //Class.forName("oracle.jdbc.driver.OracleDriver");
	   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
	   
	   PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where status=0");
	   
	   rs = st.executeQuery();
	   
	   //if(rs.next()){
%>
		
		<table align="center">
 			
 
        	<tr>
        	<th><h3>Account Number</h3></th>
        	<th><h3>Account Holder Name</h3></th>
        	<th><h3>Mobile Number</h3></th>
        	<th><h3>Account Type</h3></th>
        	<th><h3>Operation</h3></th>
        	

        	<%
        	while(rs.next())
        	{
        	
        	%>

        	<tr>
        	
        	<td><%=rs.getString(2) %></td>
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(6) %></td>
        	<td>
        	<!-- <input type="submit" value="Valitate" submit="validateprocess.jsp"> -->
        	<!-- <button onclick="validateprocess.jsp">Validate</button> -->
        	
        	<a href="validateprocess.jsp">Validate</a>
        	</td>
        	
        	</tr>
        	
        	<%}
        	con.close();
        	%>
	</table>
			
			<%
	   		con.close();
	   
   	}catch(Exception e){
	  	System.out.println("error");
   }
   	%>