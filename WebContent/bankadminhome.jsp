<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>




<!-- <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> -->
<title> </title>
<!-- <link href="col_font.css" rel="stylesheet" type="text/css" /> -->
<!-- <style type="text/css"> -->
<!--
.style1 {
	color: "skyblue";
	font-weight: bold;
	font-size: 24px;
}
.style2 {color: "skyblue"}
.style4 {
	color: "skyblue";
	font-size: 16px;
	font-weight: bold;
}
.style8 {font-size: 12px}
.style9 {font-weight: bold}
-->
<!-- </style> -->
<!-- <link href="img.css" rel="stylesheet" type="text/css" /> -->
</head>

<%-- <body bgcolor="#007289">


<%
//String bid=request.getParameter("bid");
//String pwd=request.getParameter("pwd");
String bn=(String)session.getAttribute("bname");
//out.println(bn);
%>


<table width="84%" height="696" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#E4DEDA">
  <tr>
    <td width="11%" height="100" bgcolor="white">&nbsp;&nbsp;<img src="hawaii_national_bank_website_3.jpg" alt="img_3" width="36" height="51" hspace="30" vspace="30" /></td>
	
    <td width="50%"  bordercolor="#D6D3CE" bgcolor="white"><p><span class="style1">UNIVERSAL<br/>
        NATIONAL<br/>
        BANK</span><strong> <br/>
    &nbsp; </strong><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Good People to Grow With.</span></p>   
     </td>
    <td width="39%" height="100">
      <table width="100%" height="150px" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="white">
      <tr>
        <td> &nbsp;
		</td>
      </tr>
      <tr>
        <td height="89">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
          
        </table> 
        </td>
      </tr>
    </table></td>
  </tr>
  
  
  
  <tr>
    <td height="50" colspan="3"><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
      <tr bgcolor="#262626">
        <td height="51" class="col_font"><strong></strong></td>
        <td class="col_font"><strong><a href="lcustomer.jsp?bname=<%=bn%>" style="text-decoration:none"><input type="button" value="List of Customers"/></a></strong></td>
        <td class="col_font"><strong><a href="lacconts.jsp?bname=<%=bn%>" style="text-decoration:none"><input type="button" value="List of A/c"/></a></strong></td>
        <td class="col_font"><strong><a href="transpen.jsp?bname=<%=bn%>" style="text-decoration:none"><input type="button" value="Transfer Pending"/></a></strong></td>
        <td class="col_font"><strong><a href="transdec.jsp?bname=<%=bn%>" style="text-decoration:none"><input type="button" value="Transfer Decline"/></a></strong></td>
        <td class="col_font"><strong><a href="pendingaccountreq.jsp?bname=<%=bn%>" style="text-decoration:none"><input type="button" value="New Pending A/c"/></a></strong></td>
        <td class="col_font"><strong><a href="lout.jsp" style="text-decoration:none"><input type="button" value="SignOut"/></a></strong></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="200" colspan="3"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="indian.jpg">
      <tr bgcolor="white">
      
        <td width="31%" height="375"  bgcolor="grey" background-position:center"><h3><marquee behavior="alternate"><h1>Welcome To <%=bn%> Bank</marquee></h1><BR><BR><BR>&nbsp;</td>
        </tr>
    </table>
  </tr>
  <tr>
    <td height="122" colspan="3" bgcolor="#E4DEDA" align="center" ><marquee direction="right"><img src="indian.jpg" width="310" height="89" />
    <img src="gold.jpg" width="310" height="89"/>
    <img src="currency.jpg" width="310" height="89"/>  </marquee>  </td>
  </tr>
</table>

<map name="Map" id="Map"><area shape="poly" coords="26,32" href="#" />
<area shape="poly" coords="48,69" href="#" />
</map></body> --%>










<body>


<a href="tempuserlist.jsp">List all Users</a>


<br />
<br></br>
<br />



<a href="pendinguserlist.jsp">Pending User Account Request</a>






</body>



















</html>
