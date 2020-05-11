<%-- 
    Document   : delchatsession
    Created on : 28 Jul, 2018, 3:42:05 PM
    Author     : RITS
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String chatwithuser=request.getParameter("chatwithuser");
        String uid=session.getAttribute("uid1")+"";
        
        
        String q=" delete from chatmessages  where CHATSESSION_OF_USERID=? and (FROM_USERID=? or TO_USERID=?) ";
         Connection con;
        PreparedStatement pstm;
        
        try  
        {
             Class.forName("com.mysql.jdbc.Driver");

             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","");

             pstm = con.prepareStatement(q);
             
             pstm.setString(1,uid);
             pstm.setString(2,chatwithuser);

            pstm.setString(3,chatwithuser);
          pstm.executeUpdate();
           
        }catch(Exception e)
        {
        out.println(e.toString());
        }
        
         
        %>
    </body>
</html>
