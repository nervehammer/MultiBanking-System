<%@ page import ="java.sql.*,com.jdbc.*" %>

<%
	try{
		ResultSet rs,rs1,rs2,rs3 = null;
		Connection con=DbCon.dbCon();
		
		String unqid = session.getAttribute("unqid").toString();
		System.out.println(unqid);
		
		String beneficiarybankdes = request.getParameter("beneficiarybankdes");
		System.out.println(beneficiarybankdes);
		
		String beneficiaryname = request.getParameter("beneficiaryname");
		String beneficiaryaccountnumber = request.getParameter("beneficiaryaccountnumber");
		Double amount = Double.parseDouble(request.getParameter("amount"));
		
		PreparedStatement st1 = con.prepareStatement("SELECT BANKNAME FROM BANKINFO WHERE BANKDESCRIPTION=?");
		st1.setString(1, beneficiarybankdes);
		rs=st1.executeQuery();
		rs.next();
		String beneficiarybankname = rs.getString(1);
		System.out.println(beneficiarybankname);
		
		PreparedStatement st2 = con.prepareStatement("SELECT CID FROM " +beneficiarybankname +"INFO WHERE AHNAME=? AND ACCNO=?");		//executed to check whether beneficiary exists in that bank or not.
		st2.setString(1, beneficiaryname);
		st2.setString(2, beneficiaryaccountnumber);
		rs1=st2.executeQuery();
		
		if (rs1.next()) {		//If exists then print summary
			
			session.setAttribute("beneficiaryname", beneficiaryname);						//Attributes sent via sessoin to the process.
			session.setAttribute("beneficiaryaccountnumber", beneficiaryaccountnumber);
			session.setAttribute("amount", amount);
			session.setAttribute("beneficiarybankname", beneficiarybankname);
			session.setAttribute("beneficiarybankdes", beneficiarybankdes);
			
			PreparedStatement st3 = con.prepareStatement("SELECT * FROM BANKINFO WHERE BANKID=?");
			st3.setString(1, session.getAttribute("latestBankID").toString());
			rs2=st3.executeQuery();
			rs2.next();
			String remitterBankName = rs2.getString(3);
			System.out.println(remitterBankName);
			session.setAttribute("remitterBankName", remitterBankName);
			
			PreparedStatement st4 = con.prepareStatement("SELECT BAL FROM " +remitterBankName +"INFO WHERE ACCNO=?");
			st4.setString(1, session.getAttribute("accno").toString());
			rs3=st4.executeQuery();
			rs3.next();
			
			Double yourBalance = Double.parseDouble(rs3.getString(1));
			
%>

		<center>
		
		<form action="transferamountprocess.jsp" name="f1" method="get">
		
		<h2>Overview</h2>
		
			<table align="center" border="2" width="70%">
		
				<tr>
				<th align="center">Remitter Details</th>
				</tr>
		
				<tr>
				<td>Name</td>
				<td>
				<%=session.getAttribute("ahname") %>
				</td>
				</tr>
				
				<tr>
				<td>Bank</td>
				<td>
				<%=rs2.getString(2) %>
				</td>
				</tr>
		
				<tr>
				<td>Account Number</td>
				<td>
				<%=session.getAttribute("accno") %>
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
				<td>Bank</td>
				<td>
				<%=session.getAttribute("beneficiarybankdes") %>
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