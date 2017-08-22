<%@ page import ="java.sql.*,com.jdbc.*" %>

	<form action="switchbankprocess.jsp" method=get>
	<table class="table">
	<tr>
 			<td><h3>Select Bank</h3></td>
 			<td>
 			<select name="bankid">
 			<option value="">- Please select a bank -</option>
<%
	try{
		
		PreparedStatement pst = null;
		ResultSet rs,rsbsdk = null;
		Connection con=DbCon.dbCon();
		
		PreparedStatement pt = con.prepareStatement("SELECT bankid from USERBANKINFO where unqid=?");
		pt.setString(1,session.getAttribute("unqid").toString());
		System.out.println(session.getAttribute("unqid").toString());
		rs = pt.executeQuery();
		while(rs.next()){
			
			String sql="SELECT bankdescription,bankid FROM bankinfo WHERE bankid=?";
			System.out.println(sql);
			pst = con.prepareStatement(sql);
			pst.setString(1,rs.getString(1));
			rsbsdk = pst.executeQuery();
			rsbsdk.next();		
		
		%>	
			<option value=<%=rsbsdk.getString(2)%>><%=rsbsdk.getString(1)%></option>
			<%}
			%>
			</select>
  			</td>
  			</tr>
  			<tr><td></td><td><input type="submit" value="Switch Account"></td></tr>

	</table>
	</form>

	<%
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>