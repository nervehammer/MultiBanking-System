<%@ page import ="java.sql.*,com.jdbc.*" %>
 <form action="accountprocess.jsp" name="f1" method=get>
 <h2><b>Enter Account Details</b></h2>
 
 <table align="center">
 <tr><td><h3>Select Bank</td><td><select name="bname"> 
<%
Connection con = DbCon.dbCon();

PreparedStatement st=con.prepareStatement("select * from bank ");
	
	ResultSet rs=st.executeQuery();
	while(rs.next()){

%>


                  <option  ><%=rs.getString(2)%></option>
				  
<%}%>
  </select></td></tr>
 
        <h3>Enter Bank </h3>  </td><td>   <input type="text" name="bname" onblur="checkno()" id="acno"></td></tr>

        <h3>Enter Account Number </h3></td><td> <input type="text" name="anum"></td></tr>

        <h3> Account Holder Name  </h3> </td><td> <input type="text" name="cname"></td></tr>

        <h3>Profile Password </h3> </td><td> <input type="password" name="ppass"></td></tr>
        
       <h3>Mobile Number</h3> </td><td> <input type="text" name="mnum"></td></tr>
      
       <h3>Account Type </h3></td><td><SELECT NAME="atype"> 
                  <option  >Current Account</option>
				  <option >Savings Account</option>
				  <option >Others</option>

  </SELECT></td></tr><tr><td>
        <h3>Enter Transaction Password	</h3> </td><td><input type="password" name="tpass"></td></tr>
      
     </table>
     <input type=submit value =Submit>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name=back  value="   back   " onClick="window.location='accountpending.jsp'">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset"   value="   reset   " >

 </form>