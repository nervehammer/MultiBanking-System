<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{
		ResultSet rs,rs1 = null;
		Connection con=DbCon.dbCon();
		
		String unqid = session.getAttribute("unqid").toString();
		System.out.println(unqid);
		String bname = session.getAttribute("bname").toString();
		System.out.println(bname);
		
		PreparedStatement st1 = con.prepareStatement("SELECT BANKID FROM BANKINFO WHERE BANKNAME=?");		//Executed to fetch the bankid 
		st1.setString(1, bname);
		rs=st1.executeQuery();
		rs.next();
		String bankID = rs.getString(1);
		
		String beneficiaryname = request.getParameter("beneficiaryname");
		String beneficiaryaccountnumber = request.getParameter("beneficiaryaccountnumber");
		Double amount = Double.parseDouble(request.getParameter("amount"));
		
		PreparedStatement st2 = con.prepareStatement("SELECT CID FROM " +bname +"INFO WHERE AHNAME=? AND ACCNO=?");		//executed to check whether beneficiary exists in that bank or not.
		st2.setString(1, beneficiaryname);
		st2.setString(2, beneficiaryaccountnumber);
		rs=st2.executeQuery();
		
		if (rs.next()) {		//If exists then print summary
			
			session.setAttribute("beneficiaryname", beneficiaryname);						//Attributes sent via sessoin to the process.
			session.setAttribute("beneficiaryaccountnumber", beneficiaryaccountnumber);
			session.setAttribute("amount", amount);
			session.setAttribute("bankID", bankID);
			
			PreparedStatement st3 = con.prepareStatement("SELECT * FROM USERBANKINFO WHERE UNQID=? AND BANKID=?");
			st3.setString(1, unqid);
			st3.setString(2, bankID);
			rs=st3.executeQuery();
			rs.next();
			
			PreparedStatement st4 = con.prepareStatement("SELECT BAL FROM "+bname +"INFO WHERE ACCNO=?");
			st4.setString(1, rs.getString(4));
			rs1=st4.executeQuery();
			rs1.next();
			
			Double yourBalance = Double.parseDouble(rs1.getString(1));
			
%>

		<center>
		
		<form action=transfertosamebankprocess.jsp name="f1" method="get">
		
		<h2>Overview</h2>
		
			<table align="center" border="2" width="70%">
		
				<tr>
				<th align="center">Remitter Details</th>
				</tr>
		
				<tr>
				<td>Name</td>
				<td>
				<%=rs.getString(5) %>
				</td>
				</tr>
		
				<tr>
				<td>Account Number</td>
				<td>
				<%=rs.getString(4) %>
				</td>
				</tr>
		
				<tr>
				<td>Current Balance</td>
				<td>
				<%=yourBalance %>
				</td>
				</tr>
				
				<tr>
				<th align="center">Beneficiary Details</th>
				</tr>
		
				<tr>
				<td>Name</td>
				<td>
				<%=beneficiaryname %>
				</td>
				</tr>
				
				<tr>
				<td>Account Number</td>
				<td>
				<%=beneficiaryaccountnumber %>
				</td>
				</tr>
				
				<tr>
				<th align="center">Transaction Details</th>
				</tr>
		
				<tr>
				<td>Amount To Be Wired</td>
				<td>
				<%=amount %>
				</td>
				</tr>
				
				<tr>
				<td>Balance After Transaction</td>
				<td>
				<%=yourBalance-amount %>
				</td>
				</tr>
				
				<tr>
				<th>Confirm Your Transaction</th>
				</tr>
				
				<tr>
				<td>Enter Transaction Password</td>
				<td>
				<input type="password" name="password">
				</td>
				</tr>
				
				<tr>
				<td>Confirm Password</td>
				<td>
				<input type="password" name="password1">
				</td>
				</tr>
				
			</table>
			
			
			<BR>
			<input type="submit" value="Confirm Transaction">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name=back  value="   back   " onClick="window.location='userhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;

			</form>
			</center>

<%
		}
		else {
%>
	
		<h1>Invalid Account Holder Name And Account Number</h1>
		<a href="usertransactionhome.jsp"><h1>Home</h1></a>
		
<%
		}   		   
   	}catch(Exception e){
   		System.out.println(e);
	  	System.out.println("error");
   }
%>