<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
     try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   String unqid = session.getAttribute("unqid").toString();
   	   PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where status in(-1,0) and unqid=?");
	   st.setString(1, unqid);
	   
	   rs = st.executeQuery();
	   
	   //if(rs.next()){
%>
		
		<table align="center">
 			
 
        	<tr>
        	<th><h4>Bank Name</h4></th>
        	<th><h4>Customer ID</h4></th>
        	<th><h4>Account Number</h4></th>
        	<th><h4>Account Holder Name</h4></th>
        	<th><h4>Mobile Number</h4></th>
        	<th><h4>Account Type</h4></th>
        	<th><h4>Remarks</h4></th>
        	<th><h4>Operation</h4></th>
        	
        	

        	<%
        	while(rs.next())
        	{
        	
        	%>

        	<tr>
        	<td><%=rs.getString(1) %></td>
        	<td><%=rs.getString(10) %></td>
        	<td><%=rs.getString(2) %></td>
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(4) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(9) %></td>
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