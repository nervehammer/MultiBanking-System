<%@ page import ="java.sql.*,com.jdbc.*" %>


<form action="addbankadminprocess.jsp" name="f1" method=get>
	<h2><b>Enter Bank And Admin Details</b></h2>
 
		<table align="center">
 			
        	<tr>
        	<td><h3>Bank Name</h3></td>
        	<td>
        	<input type="text" name="bankname" onblur="checkno()" id="acno">
        	</td>
        	</tr>

        	<tr>
        	<td><h3>Provide an Admin</h3></td>
        	<td>
        	<input type="text" name="username">
        	</td>
        	</tr>

        	<tr>
        	<td><h3>New Password</h3></td>
        	<td>
        	<input type="text" name="userpassword">
        	</td>
        	</tr>

		</table>
		
		<input type=submit value =Submit>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name=back  value="back" onClick="window.location='adminhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset"   value="reset">
</form>