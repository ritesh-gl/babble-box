

<%@page import="java.net.URLDecoder"%>
<%@page import="com.mysql.jdbc.Blob"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body background="s.jpg" width=80%>
      
          
        <%
            try{
           java.sql.ResultSet rs;
        java.sql.Connection con;
           java.sql.PreparedStatement pstm;
           String uid1,pwd1,un,cont,gen,pic,pn,ud;
       
           uid1 = session.getAttribute("uid1")+"";
           pwd1 = session.getAttribute("pwd1")+"";
           Class.forName("com.mysql.jdbc.Driver");
            con=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");
            pstm=con.prepareStatement("Select * from users where (USER_ID=? or PHONE_NO=?) ");
            pstm.setString(1,uid1);
            pstm.setString(2,uid1);
            
            rs = pstm.executeQuery();
              out.print("<center>");
             out.print("<h1 style=background-color:white; ><u>User-Profile</u></h1>");
         out.print("<br/><br/><br/><br/><br/>");
             
                 
                    rs.next();
             
                    ud=rs.getString(1); String i= ud.toUpperCase();
                   un=rs.getString(3); String l= un.toUpperCase();
                   gen=rs.getString(4); String k = gen.toUpperCase();
                  cont= rs.getString(5);  String H= cont.toUpperCase();
                  pic = rs.getString(6); 
                 pn=rs.getString(7);
                 
               out.println("<table width=50% height=30% background=w.jpg >");
                 out.print("<tr>");
               out.println("<td><br/><br/></td></tr><tr><td align=center><img border=1  src='"+pic+"'  width=30% height=200 /></td><tr></table>");  
 
            
              out.println("<table width=50% border=1 bgcolor=white>");
                  
             out.println("<tr><td>USER-NAME</td><td>"+l+"</td>");
              out.print("</tr>");
               out.print("<tr>");
             out.println("<td>GENDER</td><td>"+k+"</td>");
              out.print("</tr>");
               out.print("<tr>");
             out.println("<td>COUNTRY</td><td>"+H+"</td>");
              out.print("</tr>"); 
               out.print("<tr>");
             out.println("<td>E-MAIL</td><td>"+i+"</td>");
              out.print("</tr>"); 
               out.print("<tr>");
             out.println("<td>PHONE_NO</td><td>"+pn+"</td>");
              out.print("</tr>");
                
        out.println("</table><br/>");
       
             
            
            con.close();
            
             
                       
         out.println("<a href=mechat.jsp><button>Back</button></a>");
         out.print("</center>");
            }catch(Exception e)
            {
             out.print(e);   
            }   
  %>
        
        </body>
</html>
