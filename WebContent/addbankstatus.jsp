<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String unqid = session.getAttribute("unqid").toString();
		
		PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where status in(-1,0) and unqid=?");
		st.setString(1, unqid);
		
		rs = st.executeQuery();
		
		if(rs.next())
		{
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
        	
        	PreparedStatement st1 = con.prepareStatement("select * from bankinfo",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        	ResultSet rs1 = st1.executeQuery();
        	String bankname ="";
        	
        	do {
        		
        		while(rs1.next()) {
        			if(rs1.getString(3).equals(rs.getString(2))) {
        				bankname = rs1.getString(2);
        				System.out.println(bankname);
        				break;
        			}
        		}
        		
        	%>

        	<tr>
        	<td><%=bankname %></td>
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(4) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(6) %></td>
        	<td><%=rs.getString(7) %></td>
        	<td><%=rs.getString(10) %></td>
        	<td>
        	<a href="editbankdetails.jsp?bname=<%=rs.getString(2) %>">Edit Details</a>
        	</td>
        	
        	</tr>
        	
        	<% rs1.beforeFirst();
        	} while(rs.next());
        	con.close();
        	%>
        	
        </table>
        
<%
			} else {
				out.println("Whoops!! No user bank info available. Please Click the below link to add one");
				
%>
			<br/>
			<br/>
        	<a href="adduserbankinfo.jsp">Click here</a>
        	
<%	}   		   
   	}catch(Exception e){
   		System.out.println(e);
	  	System.out.println("error");
   }
%>