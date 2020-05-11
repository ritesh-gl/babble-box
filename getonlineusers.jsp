

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>get online users Page</title>
    </head>
    <body>
        <%
         Connection con;

        PreparedStatement pstm,pstm2;

        ResultSet rs,rs2;
String uid=session.getAttribute("uid1")+"";
        try { 
            String uid1=session.getAttribute("uid1")+"";
              Class.forName("com.mysql.jdbc.Driver");

           con =DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");

       pstm = con.prepareStatement("select * from currentusers where USER_ID<>?");
       pstm.setString(1,uid1);
  

        rs = pstm.executeQuery();

      out.println("<select onchange=loadchatuser() id=ulist size=25>");
      while(rs.next())
      {
          String uid2,unm2;
          uid2=rs.getString(1);
          unm2=rs.getString(2);
          pstm2=con.prepareStatement("select count(*) from chatmessages where FROM_USERID=? and TO_USERID=? and READ_STATUS='unread'");
          pstm2.setString(1,uid2);
          pstm2.setString(2,uid);
rs2=pstm2.executeQuery();
int c=0;

if(rs2.next())
    c=rs2.getInt(1);
if(c>0)
          out.println("<option value="+uid2+">"+unm2+"("+c+")</option>");
else
     out.println("<option value="+uid2+">"+unm2+"</option>");

          
      }   

      out.println("</select>"); 
    } catch(Exception e)
        {
        out.println(e.toString());
        }
        
        
        
        %>
        
        
    </body>
</html>
