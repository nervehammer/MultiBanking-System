<%@ page import ="java.sql.*,com.jdbc.*" %>


<form action="addbankadminprocess.jsp" method=get>
	<h2><b>Enter Bank And Administrator Details</b></h2>
 
		<table align="center">
 			
        	
        	<tr>
 			<td><h3>Select Bank</h3></td>
 			<td>
 			<select name="bankdes">
 			<option value="">- Please select a bank -</option>
			<%
				Connection con = DbCon.dbCon();
				
				PreparedStatement st = con.prepareStatement("select * from bankinfo");
				
				ResultSet rs = st.executeQuery();
				
				while(rs.next()){

			%>
			
			<option><%=rs.getString(2)%></option>
				<%}%>
  			</select>
  			</td>
  			</tr>
					        	        	
        	<tr>
        	<td><h3>Username for Administrator</h3></td>
        	<td>
        	<input type="text" name="username">
        	</td>
        	</tr>

        	<tr>
        	<td><h3>Password</h3></td>
        	<td>
        	<input type="password" name="userpassword">
        	</td>
        	</tr>

		</table>
		
		<input type=submit value =Submit>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name=back  value="back" onClick="window.location='adminhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset"   value="reset">
</form>