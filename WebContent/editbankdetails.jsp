<%@ page import ="java.sql.*,com.jdbc.*" %>

<%!
	String bname,accno,ahname,mnum,atype;
	public void setvalue(ResultSet rs)throws SQLException{
		bname=rs.getString(1);
	   	accno=rs.getString(2);
	   	ahname=rs.getString(4);
	   	mnum=rs.getString(5);
	   	atype=rs.getString(6);
	}
%>
   <%  try{
	   
	   ResultSet rs = null;
	   Connection con=DbCon.dbCon();
	   
	   //Class.forName("oracle.jdbc.driver.OracleDriver");
	   //Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");
	   
	   PreparedStatement st=con.prepareStatement("select * from tempuserbankinfo where status=-1 and unqid=?");
	   st.setString(1,session.getAttribute("unqid").toString());
	   rs = st.executeQuery();
	   while(rs.next())
   	{
	   setvalue(rs);
   	}   
     }catch(Exception e){
    	 System.out.println("Error in editbankdetails");
     }
	   
	   
%>

<form action="editbankdetailsprocess.jsp" method=get>
	<h2><b>Enter Account Details</b></h2>
 
		<table align="center">
 	 
        	<tr>
        	<td><h3>Bank</h3></td>
        	<td>
        	<input type="text" name="bname" value="<%=bname%>">
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
		
		<input type=submit value ="Confirm Edit">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=button name=back  value="back" onClick="window.location='userhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=reset value="reset">
</form>