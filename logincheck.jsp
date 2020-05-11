<%-- 
    Document   : logincheck
    Created on : 18 Jul, 2018, 11:16:35 AM
    Author     : RITS
--%>

<%@page import="java.security.MessageDigest"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<a href="logincheck.jsp"></a>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login check Page</title>
    </head>
    <body>
        <%  
            Connection con;

        PreparedStatement pstm,pstm2;

        String uid1 = request.getParameter("uid1");

        String pwd = request.getParameter("pwd1");
         MessageDigest md = MessageDigest.getInstance("MD5");			     
        byte[] messageDigest = md.digest(pwd.getBytes());
            // digest() method is called to calculate message digest           
         BigInteger no = new BigInteger(1, messageDigest);
            // Convert byte array into signum representation
 
            String pwd1 = no.toString(16);
            while(pwd1.length() < 32)
            {
                pwd1 = "0" + pwd1;
            }

        try { 

              Class.forName("com.mysql.jdbc.Driver");

           con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");

       pstm = (PreparedStatement) con.prepareStatement("select * from users where (USER_ID=? or PHONE_NO=?) and PASSWORD=?");

       pstm.setString(1,uid1);
pstm.setString(2, uid1);
       
       pstm.setString(3,pwd1);

       ResultSet rs = pstm.executeQuery();

      

         if(rs.next())

         {
             String un,pic,pn;
             un=rs.getString(3);
             pic=rs.getString(6);
             pn=rs.getString(7);
             pstm2=con.prepareStatement("delete from currentusers where USER_ID=?");
             pstm2.setString(1,rs.getString(1));
             pstm2.executeUpdate();
         
             pstm2=(PreparedStatement) con.prepareStatement("insert into currentusers values(?,?,?,?)");
             pstm2.setString(1,rs.getString(1));
             pstm2.setString(2,un);
             pstm2.setString(3,pic);
             pstm2.setString(4,pn);
             pstm2.executeUpdate();
             
             String uid=rs.getString(1);
              session=request.getSession();
             session.setAttribute("uid1",uid);
             session.setAttribute("pwd1",pwd1);
              session.setAttribute("pic",pic);
              session.setAttribute("un",un);
             
             
             
             response.sendRedirect("mechat.jsp");
con.close();
    } 

    else{ 

        out.print("Sorry username or password error"); 
         }
    } catch(Exception e)
        {
        out.println(e.toString());
        }
        %>
    </body>
</html>
