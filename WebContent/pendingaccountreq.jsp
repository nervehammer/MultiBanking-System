<%@ page import ="java.sql.*,com.jdbc.*" %>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY background="backgroun.png"><center><BR><BR><BR><BR><h2><u>List Of Pending Accounts</u></h2><BR><BR><BR> 
 <table align=center cellpadding="0" border=1 width="60%" cellspacing="0">
<colgroup span=4 align=center width="10%">
<tr>
	<td align=center><b>Account Number </td>
		<td align=center><b> Customer Name </td>
			<td align=center ><b>Mobile No.</td>
	<td align=center><b>Account Type</td> <td align=center colspan=2><b>Operation</td> 
				</tr>
<%
 
String bn=request.getParameter("bname");
 
int in=0;
Connection con=DbCon.dbCon();

//Class.forName("oracle.jdbc.driver.OracleDriver");
//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","java");



Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from tempcustomer");
while(rs.next())
{  
	 %>
<tr>
	
	<td align=center><%=rs.getString(2)%> </td>
	<td align=center><%=rs.getString(3)%> </td>
	<td align=center><%=rs.getString(6)%> </td>
	<td align=center><%=rs.getString(7)%> </td>
	 
		
		
		</tr>
		<%
			in++;
}
if(in==0)
//response.sendRedirect("Error.jsp"); TODO: Redirect if no record founnd
//session.setAttribute("id",id);
%>
</table><BR><BR>
 <center><input type="button" value="     back     " onclick="window.location='bmain.jsp'">  
</BODY>
</HTML>
