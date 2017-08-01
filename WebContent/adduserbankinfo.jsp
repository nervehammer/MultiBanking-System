<%@ page import ="java.sql.*,com.jdbc.*" %>


<form action="adduserbankinfoprocess.jsp" method=get>
	<h2><b>Enter Account Details</b></h2>
 
		<table align="center">
 			
        	<tr>
        	<td><h3>Enter Bank</h3></td>
        	<td>
        	<input type="text" name="bname">
        	</td>
        	</tr>
        	
        	<tr>
        	<td><h3>Enter Customer ID</h3></td>
        	<td>
        	<input type="text" name="cid">
        	</td>
        	</tr>

        	<tr>
        	<td><h3>Enter Account Number</h3></td>
        	<td>
        	<input type="text" name="anum">
        	</td>
        	</tr>

        	<tr>
        	<td><h3>Account Holder Name</h3></td>
        	<td>
        	<input type="text" name="ahname">
        	</td>
        	</tr>

              
       		<tr>
       		<td><h3>Mobile Number</h3></td>
       		<td>
       		<input type="text" name="mnum">
       		</td>
       		</tr>
      
       		<tr>
       		<td><h3>Account Type</h3></td>
       		<td>
       		<SELECT name="atype"> 
            	<option  >Current Account</option>
				<option >Savings Account</option>
				<option >Others</option>
				</SELECT>
			</td>
			</tr>
			
			<tr>
			<td><h3>Enter Transaction Password</h3></td>
			<td><input type="password" name="tpass"></td>
			</tr>
		</table>
		
		<input type=submit value =Submit>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name=back  value="back" onClick="window.location='userhome.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset"   value="reset">
</form>