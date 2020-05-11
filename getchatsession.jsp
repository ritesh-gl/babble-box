

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
        String uid,chatwithuser;
        uid=session.getAttribute("uid1")+"";
        chatwithuser=request.getParameter("chatwithuser");
         Connection con;

        PreparedStatement pstm,pstm2,pstm3;

        ResultSet rs,rs2;
        String rds;
        
try{
    
    
              Class.forName("com.mysql.jdbc.Driver");

           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");

       pstm =  con.prepareStatement("select * from chatmessages where ((FROM_USERID=? and TO_USERID=?) or(FROM_USERID=? and TO_USERID=?)) and chatsession_of_userid=? ");

     pstm.setString(1,uid);
      pstm.setString(2,chatwithuser);
       pstm.setString(3,chatwithuser);
        pstm.setString(4,uid);
        pstm.setString(5, uid);
       
        rs=pstm.executeQuery();
    String reply="";
    
    while(rs.next())
    {
         String md,mt,fuid,tuid,msg,unm;
         md = rs.getString(2);
         mt = rs.getString(3);
         fuid = rs.getString(5);
       /*   pstm3=con.prepareStatement("select * from users where USER_ID=?");
    pstm3.setString(1,fuid);
    rs2=pstm3.executeQuery();
    
    unm=rs2.getString(3);
        */
         tuid = rs.getString(6);
        msg = rs.getString(7);
        rds=rs.getString(8);
        if(fuid.equals(uid))
            reply=reply+"<div align=right><p style='margin:0px;font-size:medium;color:green; width:70%; text-align:right'>You: "+md+" , "+mt+" , "+rds+"</p><p style='margin:0px;' >"+msg+"</p></div>";
        else
            reply=reply+"<div align=left><p style='margin:0px;font-size:medium;color:blue; width:70%; text-align:left'>"+fuid+":"+md+" , "+mt+"</p><p style='margin:0px;'>"+msg+"</p></div>";
        
    
    }
    
    out.println(reply);
    
    
    String q="update chatmessages set READ_STATUS='READ' where CHATSESSION_OF_USERID=? and TO_USERID=?";
    pstm2=con.prepareStatement(q);
    pstm2.setString(1,chatwithuser);
    pstm2.setString(2,uid);
    
    pstm2.executeUpdate();
    
    con.close();
}catch(Exception e)
    
{
out.println(e.toString());
}


        %>
  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        