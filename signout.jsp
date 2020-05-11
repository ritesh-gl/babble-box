<%-- 
    Document   : signout
    Created on : 20 Jul, 2018, 10:00:01 AM
    Author     : RITS
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String uid1=session.getAttribute("uid1")+"";
            Connection con;
            PreparedStatement pstm;
            try{
                 Class.forName("com.mysql.jdbc.Driver");

           con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");

       pstm = (PreparedStatement) con.prepareStatement("delete from currentusers where (USER_ID=? or PHONE_NO=?)");
             pstm.setString(1,uid1); 
             pstm.setString(2,uid1);
             pstm.executeUpdate();
             session.invalidate();
             response.sendRedirect("index.jsp");
            }catch(Exception e)
            {
            out.println(e.toString());
            }
            %>
        
        
    </body>
</html>
