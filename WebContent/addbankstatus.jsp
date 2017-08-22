<%@ page import ="java.sql.*,com.jdbc.*" %>

<html >
<head>
  <meta charset="UTF-8">
  <title>Added Bank Status</title>
  
  
  
      <link rel="stylesheet" href="css/addbankstatus-style.css">
      <link rel="stylesheet" href="css/button.css">

  
</head>

<body>

<%
	try{
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String unqid = session.getAttribute("unqid").toString();
		
		PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where unqid=? AND STATUS IN(0,-1)");
		st.setString(1, unqid);
		
		rs = st.executeQuery();
		
		if(rs.next())
		{
%>
	
		<!-- <h1><span class="blue">&lt;</span>Table<span class="blue">&gt;</span> <span class="yellow">Responsive</span></h1> -->
		<h1>EDIT OR REMOVE ENTRIES</h1>
		
<table class="container">
	<thead>
		<tr>
			
        	<th><h4>Bank Name</h4></th>
        	<th><h4>Customer ID</h4></th>
        	<th><h4>Account Number</h4></th>
        	<th><h4>Account Holder Name</h4></th>
        	<th><h4>Mobile Number</h4></th>
        	<th><h4>Account Type</h4></th>
        	<th><h4>Remarks</h4></th>
        	<th><h4>Edit Entry</h4></th>
        	<th><h4>Remove Entry</h4></th>
        </tr>
	</thead>
	
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
	
	
	<tbody>
		<tr>
        	<td><%=bankname %></td>
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(4) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(6) %></td>
        	<td><%=rs.getString(7) %></td>
        	<td><%=rs.getString(10) %></td>
        	
        	
        	<% 
        		int status = Integer.parseInt(rs.getString(9));
        	
        		if(status == 1) {
        	
        	%>
        	<td>
        	<a href="usertransactionhome.jsp?bname=<%=rs.getString(2) %>">Transaction Module</a>
        	</td>
        	<td>
        	<a href = "">N.A.</a>
        	</td>
        	<%
        		}
        		else {
        	%>
        	<td>
        	<a class="button" href="editbankdetails.jsp?bname=<%=rs.getString(2) %>">Edit Details</a>
        	</td>
        	<td>
        	
        	<a class="button" href = "deleteuserbankinfo.jsp?bname=<%=rs.getString(2) %>">Delete</a>
        	
        	</td>
        	<% } %>
        	
        	</tr>
        	
        	<% rs1.beforeFirst();
        	} while(rs.next());
        	con.close();
        	%>
	</tbody>
</table>

<%
			} else {
				
%>

			<h1>Whoops!! No user bank info available. Please Click the below link to add one</h1>
			<br/>
			<br/>
        	<a href="adduserbankinfo.jsp">Click here</a>
        	
<%	}   		   
   	}catch(Exception e){
   		System.out.println(e);
	  	System.out.println("error");
   }
%>
  
  
</body>
</html>


    