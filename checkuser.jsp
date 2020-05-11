


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        
        <title>checkuser Page</title>
    </head>
    <body>
        <%
             
        String uid=request.getParameter("uid");
       
        Connection con;
        PreparedStatement pstn;
        ResultSet rs;
        
        
        try 
         {
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatDB","root","");
             pstn=con.prepareStatement("select * from users where USER_ID=?");
             pstn.setString(1,uid);
             rs=pstn.executeQuery();
             if(rs.next())
                 out.println("already exist");
             else
                 out.println("available");


              con.close();
            
        }catch(Exception e)
        {
        out.println(e.toString());
        }
        
        
        %>
    </body>
</html>
