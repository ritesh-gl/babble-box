<%@page import="java.security.MessageDigest"%>
<%@page import="java.math.BigInteger"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registersave Page</title>
    </head>
    <body>
       
    </body>
</html>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
       
    </head>
    <body>
        <%
        try{
             
      
  DiskFileItemFactory fact=new DiskFileItemFactory();
ServletFileUpload upl=new ServletFileUpload(fact);
List items = upl.parseRequest(new ServletRequestContext(request));


FileItem a,b,c,d,e,f,g;
a=(FileItem)items.get(0);
b=(FileItem)items.get(1);
c=(FileItem)items.get(3);
d=(FileItem)items.get(4);
e=(FileItem)items.get(5);
f=(FileItem)items.get(6);
g=(FileItem)items.get(7);
String uid,pwd1,un,gen,cont,pic,pn ;
uid =  a.getString();
pwd1 =  b.getString();
 MessageDigest md = MessageDigest.getInstance("MD5");			     
        byte[] messageDigest = md.digest(pwd1.getBytes());
            // digest() method is called to calculate message digest           
         BigInteger no = new BigInteger(1, messageDigest);
            // Convert byte array into signum representation
 
            String pwd = no.toString(16);
            while(pwd.length() < 32)
            {
                pwd = "0" + pwd;
            }
un =  c.getString();
gen =  d.getString();
cont =  e.getString();
pic = f.getName();
pn =  g.getString();
int i=pic.lastIndexOf("\\");
pic=pic.substring(i+1);
String fname = "C:\\Users\\RITESH\\Documents\\NetBeansProjects\\chat\\web\\"+pic ;
File fl=new File(fname);
f.write(fl);


Connection con;
PreparedStatement pstm;
Class.forName("com.mysql.jdbc.Driver");

             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ChatDB","root","");

             pstm =(PreparedStatement) con.prepareStatement(" insert into users values(?,?,?,?,?,?,?) ");
             pstm.setString(1,uid);
             pstm.setString(2,pwd);
             pstm.setString(3,un);
             pstm.setString(4,gen);
             pstm.setString(5,cont);
             pstm.setString(6,pic);
             pstm.setString(7,pn);
         pstm.executeUpdate();

           out.println("Record saved");
          
                      con.close();
                      response.sendRedirect("index.jsp");
                      }catch(Exception e)
                      {                                      
                           out.print(e);
                       }
            

            %>
        
        
    </body>
</html>
