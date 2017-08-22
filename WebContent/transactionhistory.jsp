<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String unqid = session.getAttribute("unqid").toString();
		
		PreparedStatement st1=con.prepareStatement("SELECT * FROM TRANSACTIONINFO WHERE UNQID=?");
		st1.setString(1, unqid);
		rs = st1.executeQuery();
		
		if(rs.next())
		{
%>
		
		<table align="center" border="2" width="70%">
			<tr>
			
        	<th>TransactionID</th>
        	<th>Status</th>
        	<th>Amount</th>
        	<th>Transaction Date</th>
        	<th>Your Account Number</th>
        	<th>Beneficiary Account Number</th>
        	<th>From Bank</th>							<!-- must find a better word -->
        	<th>To Bank</th>
        	<th>Balance After Transaction</th>
        	
        	</tr>
        	
        	

        	<%
        	
        	PreparedStatement st2 = con.prepareStatement("select * from bankinfo",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        	ResultSet rs1 = st2.executeQuery();
        	String sbankname = "";
        	String dbankname = "";
        	
        	do {
        		
        		while(rs1.next()) {
        			if(rs1.getString(3).equals(rs.getString(7))) {
        				sbankname = rs1.getString(2);
        				System.out.println(sbankname);
        				break;
        			}
        		}
        		rs1.beforeFirst();
        		while(rs1.next()) {
        			if(rs1.getString(3).equals(rs.getString(12))) {
        				dbankname = rs1.getString(2);
        				System.out.println(dbankname);
        				break;
        			}
        		}
        		
        	
        		
        	%>

        	<tr>
        	<td><%=rs.getString(1) %></td>
        	<td><%=rs.getString(3) %></td>
        	<td><%=rs.getString(5) %></td>
        	<td><%=rs.getString(4) %></td>
        	<td><%=rs.getString(8) %></td>
        	<td><%=rs.getString(13) %></td>
        	<td><%=sbankname %></td>
        	<td><%=dbankname %></td>
        	<td><%=rs.getString(10) %></td>
        	</tr>
        	
        	<% rs1.beforeFirst();
        	} while(rs.next());
        	con.close();
        	%>
        	
        </table>
        
<%
			} else {
				out.println("Whoops!! You haven't made any transaction(s) yet.");
				
%>
			<br/>
			<br/>
        	<a href="usertransactionhome.jsp">Go Back</a>
        	
<%	}   		   
   	}catch(Exception e){
   		System.out.println(e);
	  	System.out.println("error");
   }
%>