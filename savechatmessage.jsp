

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
        String md,mt,csuid,fuid,tuid,msg;
        fuid=session.getAttribute("uid1")+"";
        tuid=request.getParameter("tuid");
        
        msg=request.getParameter("msg");
        java.util.Date dt=new java.util.Date();
        int d,m,y,hh,mm,ss;
        d=dt.getDate();
        m=dt.getMonth()+1;
                y=dt.getYear()+1900;
                hh=dt.getHours();
                mm=dt.getMinutes();
                ss=dt.getSeconds();
                
        md =y+"-"+m+"-"+d;
        mt=hh+":"+mm+":"+ss;       
        Connection con;
        PreparedStatement pstm;
        
        try  
        {
             Class.forName("com.mysql.jdbc.Driver");

             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","");

             pstm = con.prepareStatement("insert into ChatMessages(MESSAGE_DATE,MESSAGE_TIME,CHATSESSION_OF_USERID,FROM_USERID,TO_USERID,MESSAGE,READ_STATUS) values(?,?,?,?,?,?,?)");
             
             pstm.setString(1,md);
             pstm.setString(2,mt);

            pstm.setString(3,fuid);

            pstm.setString(4,fuid);

            pstm.setString(5,tuid);
             pstm.setString(6,msg);
              pstm.setString(7,"unread");
            
             pstm.executeUpdate();
             pstm = con.prepareStatement("insert into ChatMessages(MESSAGE_DATE,MESSAGE_TIME,CHATSESSION_OF_USERID,FROM_USERID,TO_USERID,MESSAGE) values(?,?,?,?,?,?)");
             pstm.setString(1,md);
             pstm.setString(2,mt);

            pstm.setString(3,tuid);

            pstm.setString(4,fuid);

            pstm.setString(5,tuid);
             pstm.setString(6,msg);
              
            
             pstm.executeUpdate();
             
             
             con.close();
        } catch(Exception e)
        {
        out.println(e.toString());
        }
    

    
%>
    </body>
</html>
