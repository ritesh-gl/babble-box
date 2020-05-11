
<%@page import="com.sun.corba.se.spi.presentation.rmi.StubAdapter.request(Object, String, boolean)"%>
<%@page import="org.apache.tomcat.jni.User.uid(String, long)"%>
<%@page import="org.apache.tomcat.jni.User.uid(String, long)"%>
<%@page import="com.sun.corba.se.spi.presentation.rmi.StubAdapter.request(Object, String, boolean)"%>
<%@page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a href="logincheck.jsp"></a>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login check Page</title>
    </head>
    <body>
        <%  
            Connection con;
        PreparedStatement pstm;
        String uid1 = request.getParameter("uid1");
        String pwd = request.getParameter("pwd");
 

	
			public static String getMd5(String input)
    {
			 // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
			

            // digest() method is called to calculate message digest
            //  of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
			
	}

		String pwd1=getMd5(pwd);
              Class.forName("com.mysql.jdbc.Driver");
           con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/helpdeskDB","root","");
       pstm = (PreparedStatement) con.prepareStatement("select * from users where userid=? and password=?");
       pstm.setString(1,uid1);
		pstm.setString(2, pwd1);
       
       ResultSet rs = pstm.executeQuery();

         if(rs.next())

         {
             
              session=request.getSession();
             session.setAttribute("uid1",uid);
             session.setAttribute("pwd1",pwd1);           
             response.sendRedirect("next.jsp");
con.close();
    } 

    else{ 

        out.print("Sorry username or password error"); 
         }
   
        %>
    </body>
</html>
