<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
     try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   String bankname= session.getAttribute("bankname").toString();
	   
	   PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where status=0 AND bname=?");
	   st.setString(1, bankname);
	   
	   rs = st.executeQuery();
	   
	   if(rs.next()){
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
        	
        	do
        	{
        	
        	%>
        	

        	<tr>
        	<%
        		String unqid;
        		
        			unqid=rs.getString(1);
        		
        	%>
         	
             	
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(4) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(6) %></td>
        	<td><%=rs.getString(7) %></td>
        	<td>
        
        	<a href="validateprocess.jsp?id=<%=unqid %>">Validate</a>
        	</td>
        	
        	</tr>
        	
        	<%}while(rs.next());
        	con.close();
        	%>
	</table>
			
			<%
	   }
	   else {%>
	   
	   <h1>Hello Bank Admin! No user to verify</h1>
	   <a href = "bankadminhome.jsp"><h1>HOME</h1></a>
		   
	   <%}
	   
   	}catch(Exception e){
	  	System.out.println("error");
   }
   	%>