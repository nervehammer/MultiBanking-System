<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
     try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   
	   String unqid = session.getAttribute("unqid").toString();
	   
	   //Class.forName("oracle.jdbc.driver.OracleDriver");
	   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
	   
	   PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where status in(-1,0) and unqid=?");
	   st.setString(1, unqid);
	   
	   rs = st.executeQuery();
	   
	   //if(rs.next()){
%>
		
		<table align="center">
 			
 
        	<tr>
        	<th><h3>Bank Name</h3></th>
        	<th><h3>Account Number</h3></th>
        	<th><h3>Account Holder Name</h3></th>
        	<th><h3>Mobile Number</h3></th>
        	<th><h3>Account Type</h3></th>
        	<th><h3>Remarks</h3></th>
        	<th><h3>Operation</h3></th>
        	
        	

        	<%
        	while(rs.next())
        	{
        	
        	%>

        	<tr>
        	<td><%=rs.getString(1) %></td>
        	<td><%=rs.getString(2) %></td>
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(6) %></td>
        	<td><%=rs.getString(10) %></td>
        	<td>
        	        	
        		<a href="editbankdetails.jsp">Edit Details</a>
        	</td>
        	
        	</tr>
        	
        	<%}
        	con.close();
        	%>
	</table>
	
	
	
			
			<%
	   		   
   	}catch(Exception e){
	  	System.out.println("error");
   }
   	%>