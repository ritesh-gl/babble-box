

<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
<%
        String crp,cnp,np;
        String uid1=session.getAttribute("uid1")+"";
        String pwd1=session.getAttribute("pwd1")+"";
        crp=request.getParameter("crp");
        np=request.getParameter("np");
        cnp=request.getParameter("cnp");
              
        Connection con;
        PreparedStatement pstn;
        
        try  
        {
             Class.forName("com.mysql.jdbc.Driver");

             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");

             pstn =(PreparedStatement) con.prepareStatement("update users set PASSWORD=? where (USER_ID=? or PHONE_NO=?)");
             pstn.setString(1,cnp);
             pstn.setString(2,uid1);
             pstn.setString(3,uid1);
             
             
             

          
            if(crp.equals(pwd1))
            {
                pstn.executeUpdate();
             out.println("password updated");
            }
            else
            {
             out.println("check parameters");   
            } 
            
          con.close();
        } catch(Exception e)
        {
        out.println(e.toString());
        }
        
        

    
%>
    </body>
</html>
