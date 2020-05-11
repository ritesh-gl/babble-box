 
<%-- 
    Document   : userhome
    Created on : 18 Jul, 2018, 12:37:58 PM
    Author     : RITS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>chathome Page</title>
        <script>
            var chatwithuser="";
             function onlineUsers()
            {
              
               
                x=new XMLHttpRequest();
        x.open("GET","getonlineusers.jsp",true);       
        x.onreadystatechange=function()
                {
                    
                  if(x.readyState==4 && x.status==200)
                  {
                        document.getElementById("ulist1").innerHTML=x.responseText;
                }
                
            }
               
                x.send(); 
                
    if(chatwithuser!="")
                {
                y=new XMLHttpRequest();
                y.onreadystatechange=function()
                {
                    if(y.readyState===4 && y.status===200)
                        {
                            document.getElementById("cb").innerHTML=y.responseText;
                        }
                }
                y.open("GET","getchatsession.jsp?chatwithuser="+chatwithuser,true);
                y.send();
                
                }
      
                
                setTimeout(onlineUsers,1000);
            
        }
            
            
            
               function loadchatuser()
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
                        document.getElementById("cbunm").innerHTML="<h4 align=center>"+chatwithuser+"</h4>";
                }
                
            }
               
                x.send(); 
                
        
            
        }
        
        
        
        function sendMessage()
            {
                
             
            msg=document.getElementById("msg").value;
            
             tuid=chatwithuser;
                          
                          
                x=new XMLHttpRequest();
            
               x.open("GET","savechatmessage.jsp?tuid="+tuid+"&msg="+msg,true);
                //x.onreadystatechange=function()
                //{
                    
                //}
                
                x.send(); 
                
            
        }
            
            function delChatSession()
{
      x = new XMLHttpRequest()
   x.open("GET","delchatsession.jsp?chatwithuser="+chatwithuser,true);
   alert(chatwithuser);
    x.onreadystatechange=function()
   {
  if(x.readyState===4 && x.status===200)
      document.getElementById("cb").innerHTML=" ";
 
   }
x.send();
}
            </script>
        
        
        
    </head>
    <body onload="onlineUsers()">
        <table width="100%">
            <tr>
                <td>
                    <h2>ONLINE USERS </h2><br><div id="ulist1" > <select id="ulist" width="100%" size="25" onchange="loadchatuser()"></select></div>
                </td>
                <td>
                    <h2 id="cbunm"> CHAT BOX</h2>
                    <div id="cb" style="height:300px;width:600px; border-style: solid; background-color: lightblue; overflow:scroll" ></div><br/>
                    <input type="text" id="msg" size="90" placeholder="Write Message" /> <input type=button value=Send onclick="sendMessage()" /><br>
                    <input type="button" value="Clear Chat Session" onclick="delChatSession()"/>
                </td>            
                <td id="pic"> <img src="black.jpg"/></td>
</tr>
            
        </table>
    </body>
</html>
