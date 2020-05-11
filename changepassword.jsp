<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Page</title>
        <script>
         function isValid()
         {
             np=document.getElementById("np").value;
             cnp=document.getElementById("cnp").value;
             if(np!=cnp)
             {
                 alert("new password and confirm password does not match");
                 return(false);
             }
             else 
                 return(true);
         }
        
        </script>
    </head>
    <body>
        <form method="post" action="changepasswordsave.jsp" onsubmit="return(isValid())">
            <table boder="2" width="100%" height="300">
                <tr>
                    <td>
                        Current Password
                    </td>
                    <td>
                        <input  type="password" name=crp id="crp" required />
                    </td>
                </tr>
                  <tr>
                    <td>
                        New Password
                    </td>
                    <td>
                        <input type="password" name=np id="np" required />
                    </td>
                </tr>
                  <tr>
                    <td>
                        Confirm Password
                    </td>
                    <td>
                        <input type="password" name=cnp id="cnp" required />
                    </td>
                </tr>
                <tr>
                    <td>
                <input type=submit value="Change Password" />
                    </td>
                
                </tr>
            </table>
        </form>
    </body>
</html>