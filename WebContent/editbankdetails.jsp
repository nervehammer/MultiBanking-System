<%@ page import ="java.sql.*,com.jdbc.*" %>

<%!
	String bname,cid,accno,ahname,mnum,atype;
	public void setvalue(ResultSet rs)throws SQLException{
		//bname=rs.getString(1);
		cid=rs.getString(3);
		accno=rs.getString(4);
		ahname=rs.getString(5);
		mnum=rs.getString(6);
		atype=rs.getString(7);
		
	}
%>

<%  
	try{
		ResultSet rs = null;
		Connection con=DbCon.dbCon();
		
		bname = request.getParameter("bname");
		session.setAttribute("bkname",bname);
		System.out.println(bname);
		
		PreparedStatement st = con.prepareStatement("select * from tempuserbankinfo where ((status in(0,-1) and unqid=?) and bname=?)");
		st.setString(1, session.getAttribute("unqid").toString());
		st.setString(2, bname);
		
		rs = st.executeQuery();
		
		if(rs.next()){
			setvalue(rs);
			}
		} catch(Exception e){
			System.out.println("Error in editbankdetails");
			}
	   
	   
%>

<form action="editbankdetailsprocess.jsp" method=get> <!-- Should be post -->
	<h2><b>Edit Your Account Details</b></h2>
 
		<table align="center">
		
			<tr>
        	<td><h3>Customer ID</h3></td>
        	<td>
        	<input type="text" name="cid" value="<%=cid%>">
        	</td>
        	</tr>

			<tr>
 			<td><h3>Select Bank</h3></td>
 			<td>
 			<select name="bankdes" >
 			<option>- Please select a bank -</option>	<!-- User should see the last submitted value of bank i.e. bname -->
			<%
				Connection con = DbCon.dbCon();
				
				PreparedStatement st = con.prepareStatement("select * from bankinfo");
				
				ResultSet rs1 = st.executeQuery();
				
				while(rs1.next()){

			%>
			<option 
			
				<% if(rs1.getString(3).equals(bname)){
					%> selected=<%=rs1.getString(3) %>
				
				<% } %>
			
			><%=rs1.getString(2)%></option>
				<%}%>
  			</select>
  			</td>
  			</tr>


        	<tr>
        	<td><h3>Account Number</h3></td>
        	<td>
        	<input type="text" name="anum" value=<%=accno%>>
        	</td>
        	</tr>

        	<tr>
        	<td><h3>Account Holder Name</h3></td>
        	<td>
        	<input type="text" name="ahname" value=<%=ahname%>>
        	</td>
        	</tr>
             
       		<tr>
       		<td><h3>Mobile Number</h3></td>
       		<td>
       		<input type="text" name="mnum" value=<%=mnum%>>
       		</td>
       		</tr>
      
       		<tr>
       		<td><h3>Account Type</h3></td>
       		<td>
       		<SELECT name="atype">
            	<option>Current Account</option>
				<option>Savings Account</option>
				<option>Others</option>
			</SELECT>
			</td>
			</tr>
			
		</table>
		
		<input type=submit value ="Confirm Edit">&nbsp;&nbsp;&nbsp;&nbsp;	<!-- To perform the edit you must enter the profile password -->
		<input type=button name=back  value="back" onClick="window.location='userhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=reset value="reset">
</form>