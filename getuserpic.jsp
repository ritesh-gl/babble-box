<%-- 
    Document   : getonlineusers
    Created on : 23 Jul, 2018, 9:52:29 AM
    Author     : RITS
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Connection"%>
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

        PreparedStatement pstm;

        ResultSet rs;
        String uid,pic,unm;
        uid=request.getParameter("uid");

        try { 

              Class.forName("com.mysql.jdbc.Driver");

           con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");

       pstm = (PreparedStatement) con.prepareStatement("select * from users where USER_ID=?");

  pstm.setString(1,uid);

        rs = pstm.executeQuery();
rs.next();
pic=rs.getString(6);
unm=rs.getString(3);
      out.println("<h3 >"+unm+"</h3><img src='"+pic+"' width=300 height=400 />");
       
    } catch(Exception e)
        {
        out.println(e.toString());
        }
        
        
        
        %>
        
        
    </body>
</html>
