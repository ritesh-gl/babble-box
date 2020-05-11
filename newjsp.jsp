<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <script>
            var chatwithuser=""
            function onlineUsers()
            {
                alert(chatwithuser);
    }
            function LoadChatUser()
            {
                i=document.getElementById("ulist").selectedIndex;
                uid=document.getElementById("ulist").options[i].value;
                chatwithuser=uid
                x=new XMLHttpRequest();
                x.open("GET","getuserpic.jsp?uid="+uid,true);
                x.onreadystatechange=function()
                {
                    if(x.readyState==4 && x.status==200)
                        {
                        document.getElementById("pic").innerHTML=x.responseText;
                        document.getElementById("cbunm").innerHTML="<h4>"+chatwithuser+"</h4>"
                        
                        }
                }
                x.send();
            }
            function sendMessage()
            {
                msg=document.getElementById("msg").value;
                tuid=chatwithuser; //document.getElementById("ulist").options[j].value;
                x=new XMLHttpRequest();
                x.open("GET","savechatmessage.jsp?tuid="+tuid+"&msg="+msg,true);
                x.onreadystatechange=function()
                {
                        
                }
                x.send();
            }
        </script>
    </head>
    <body onload="onlineUsers()">
     
    </body>
</html>
