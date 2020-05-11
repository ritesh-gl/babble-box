<%-- 
    Document   : mechat
    Created on : 21 Jul, 2018, 9:31:25 AM
    Author     : RITS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>mechat Page</title>
    </head>
    <body style="margin:0px">
          
        <%
        String uid1,pic,un;
         uid1=session.getAttribute("uid1")+"";
         pic=session.getAttribute("pic")+"";
        un=session.getAttribute("un")+""; String i= un.toUpperCase();
        out.println("<div style='width:100%;height:150px;background-color:rgb(110,150,200);color:white'>");
        out.println("<table width='100%' ><tr><td>");
        out.println("<img src="+pic+" style='width:125px; height:100px;border-style:solid;border-radius:20;' /><br>"+i+"</td>");
        out.println("<td align=right> <a href=chathome.jsp target=cwork><button>HOME</button></a>");
        out.println("<a href=changepassword.jsp target=cwork><button>CHANGE PASSWORD</button> </a>");
        out.println("<a href=profile.jsp> <button>PROFILE</button> </a>");
        out.println("<a href=signout.jsp target=_parent> <button>SIGNOUT</button> </a></td></tr></table>");
        out.println("</div>");
        out.println("<iframe width=100% height=500px name=cwork src=chathome.jsp></frame>");
        
        
        
        %>
        
        
    </body>
</html>
