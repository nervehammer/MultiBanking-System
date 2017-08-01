<%@ page import ="java.sql.*,com.jdbc.*" %>


<form action="bankadminloginprocess.jsp">   

	<table class="table">

			<!-- <tr><td>Bankname :</td><td><input type="text" name="bankname"></td></tr> -->

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





			<tr><td>Username :</td><td><input type="text" name="username"></td></tr>
			<tr><td>Password :</td><td><input type="password" name="userpassword"></td></tr>
			<tr><td></td><td><input type="submit" value="Login"></td></tr>

	</table>
</form>