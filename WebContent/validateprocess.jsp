<%@ page import ="java.sql.*,com.jdbc.*" %>
<%
   try{
	   
	   int sendRedirectFlag = 0;
	   ResultSet rs,rs1,rs2 = null;
	   Connection con = DbCon.dbCon();
	   //String unqid = request.getParameter("id");
	   String bname = session.getAttribute("bankname").toString();
	   String bdbname = bname+"INFO";
	  
	   Integer unqid = Integer.parseInt(request.getParameter("id"));
	      
	   PreparedStatement st=con.prepareStatement("select * from " +bdbname+" b ,tempuserbankinfo t where (t.unqid=? AND t.cid=b.cid) AND accno=t.anum");
	   st.setInt(1, unqid);	
	   rs = st.executeQuery();
	  	   
	   if(rs.next()){
		   //TODO: SET SESSION AND REDIRECT TO BANKADMIN HOME PAGE
		   	Statement stmt = con.createStatement();
			stmt.executeUpdate("update tempuserbankinfo set status =1,remarks='User Verified' where bname='"+bname+"' AND unqid='"+unqid+"'");
			System.out.println("update successfull");
			
			PreparedStatement st1=con.prepareStatement("SELECT * FROM USERBANKINFO");
			System.out.println("1");
			rs1=st1.executeQuery();
			System.out.println("2");
			while (rs1.next()) {
				if (rs1.getString(1).equals(unqid.toString())) {
					System.out.println("3");
					break;
				} else {
					System.out.println("4");
					/* PreparedStatement st2=con.prepareStatement("SELECT BANKID FROM BANKINFO WHERE BANKNAME=?");
					st2.setString(1, bname);
					System.out.println("5");
					rs2=st2.executeQuery();
					
					System.out.println("6");
					rs2.next();
					System.out.println("7"); */
					String bankID = session.getAttribute("bankid").toString();
					System.out.println("8");
					PreparedStatement st3=con.prepareStatement("UPDATE USERINFO SET LATESTBANKID=? WHERE UNQID=?");
					st3.setString(1, bankID);
					st3.setInt(2, unqid);
					System.out.println("9");
					st3.executeUpdate();
					System.out.println("10");
					
	
				}
			}
			
			sendRedirectFlag = 1;
			
		   }else{
			   Statement stmt = con.createStatement();
			   stmt.executeUpdate("update tempuserbankinfo set status =-1,remarks='Information Mismatch' where bname='"+bname+"' AND unqid='"+unqid+"'");
			   System.out.println("stmt exec");
			   sendRedirectFlag = -1;
			   }
	   con.close();
	   session.setAttribute("tempuid",unqid);
	   
	   if(sendRedirectFlag == 1) {
		   response.sendRedirect("addverifieduserbankinfo.jsp");
	   }
	   else {
		   response.sendRedirect("pendinguserlist.jsp");
	   }
	   
	   
   }catch(Exception e){
	   System.out.println("error");
	   e.printStackTrace();
   }
  %>