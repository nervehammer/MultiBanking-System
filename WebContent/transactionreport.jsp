<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		String transID = session.getAttribute("transID").toString();
		
		PreparedStatement ps = con.prepareStatement("SELECT * FROM TRANSACTIONINFO WHERE TRANSACTIONID=?");
		ps.setString(1, transID);
		rs = ps.executeQuery();
		rs.next();
			
%>

		<center>
		
		<form action=printreport.jsp name="f1" method="get">
		
		<h2>Transaction Receipt</h2>
		
			<table align="center" border="2" width="70%">
			
				<tr>
				<th align="center">Transaction Details</th>
				</tr>
		
				<tr>
				<td>Transaction ID</td>
				<td>
				<%=rs.getString(1) %>
				</td>
				</tr>
				
				<tr>
				<td>Status</td>
				<td>
				<%=rs.getString(3) %>
				</td>
				</tr>
				
				<tr>
				<td>Date and Time</td>
				<td>
				<%=rs.getString(4) %>
				</td>
				</tr>
				
				<tr>
				<td>Amount Transferred</td>
				<td>
				<%=rs.getString(5) %>
				</td>
				</tr>
				
				<tr>
				<td>Available Balance</td>
				<td>
				<%=rs.getString(10) %>
				</td>
				</tr>
		
				<tr>
				<th align="center">Remitter Details</th>
				</tr>
		
				<tr>
				<td>Name</td>
				<td>
				<%=rs.getString(6) %>
				</td>
				</tr>
				
				<tr>
				<td>Bank</td>
				<td>
				<%=rs.getString(7) %>
				</td>
				</tr>
		
				<tr>
				<td>Account Number</td>
				<td>
				<%=rs.getString(8) %>
				</td>
				</tr>
		
				<tr>
				<td>Contact Number</td>
				<td>
				<%=rs.getString(9) %>
				</td>
				</tr>
				
				<tr>
				<th align="center">Beneficiary Details</th>
				</tr>
		
				<tr>
				<td>Name</td>
				<td>
				<%=rs.getString(11) %>
				</td>
				</tr>
				
				<tr>
				<td>Bank</td>
				<td>
				<%=rs.getString(12) %>
				</td>
				</tr>
				
				<tr>
				<td>Account Number</td>
				<td>
				<%=rs.getString(13) %>
				</td>
				</tr>
				
				<tr>
				<td>Contact Number</td>
				<td>
				<%=rs.getString(14) %>
				</td>
				</tr>
				
			</table>
			
			
			<BR>
			<input type="submit" value="Print Receipt">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name=back  value="Home" onClick="window.location='usertransactionhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		
		</form>
		
		</center>
		
<%   		   
   	}catch(Exception e){
   		System.out.println(e);
	  	System.out.println("error");
   }
%>