<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
     try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   String bdbname= session.getAttribute("bankname").toString();
	   
	   PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where status=0 AND bname=?");
	   st.setString(1, bdbname);
	   
	   rs = st.executeQuery();
	   
	   //if(rs.next()){
%>
		
		<table align="center">
 			
 
        	<tr>
        	<th><h3>Customer ID</h3></th>
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
        	<%
        		String unqid;
        		
        			unqid=rs.getString(1);
        		
        	%>
         	
             	
        	<td><%=rs.getString(2) %></td>
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(6) %></td>
        	<td>
        	<!-- <input type="submit" value="Valitate" submit="validateprocess.jsp"> -->
        	<!-- <button onclick="validateprocess.jsp">Validate</button> -->
        	
        	<a href="validateprocess.jsp?id=<%=unqid %>">Validate</a>
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