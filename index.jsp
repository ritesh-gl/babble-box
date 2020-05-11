<html>
    <head>
        <title>Chat</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            input [type=text]{}
            input [type=password]{}
            body{
                margin:opx;
            }
        </style>



        <script>
            function isValid()
            {
                 uid=document.getElementById("uid").value;
               
                ef=/\w+@\w+[.]\w{2,3}$/
                if(!uid.match(ef))
                {
                    alert("Invalid Format Of UserId");
                    return(false);
                }
                pwd=document.getElementById("pwd").value;
                cnp=document.getElementById("cnp").value;
                if(pwd!=cnp)
                {
                    alert("Password does not match");
                    return(false);
                }
                i=document.gtElementById("cont").selectedIndex
                if(i==0)
                {
                    alert("select country")
                    return(false);
                }
                return(true);
            }
            function fun()
            {
               uid=document.getElementById("uid").value;
               
                x=new XMLHttpRequest();
                x.onreadystatechange=function()
                {
                  if(x.readyState==4&&x.status==200)
                        document.getElementById("res").innerHTML=x.responseText;
                }
               x.open("GET","checkuser.jsp?uid="+uid,true);
                x.send(); 
            }
            
            function checkEMail()
            {
            
                uid=document.getElementById("uid").value;
               
                ef=/\w+@\w+[.]\w{2,3}$/
                if(uid.match(ef))
                    alert("Valid Format");
                else
                    alert("Invalid Format");
            }
            
            </script>
        
        
    
    </head>
    <body  style="background-color: lightblue;margin:0px" >
    
        
        <form name="LoginForm" method="post" action="logincheck.jsp" >
                <center>
            <div style="text-align:center ; background-color:rgb(100,100,200); width:100% ; height:150px;">
                <table align="center">
                    <tr><td><br/></td></tr>
                    <tr><td>
                            <h2>  Userid or Phone </h2></td><td><input type="text" id="uid1" name="uid1" required placeholder="User Id or phone" /></td><tr>
                    <tr><td> <h2>Password</h2></td><td><input type="password" id="pwd1" name="pwd1" required placeholder="password"/></td></tr>
                    <tr><td>   <input type="submit" value="LOGIN " /></td></tr></table></div>
            </center>
        </form>
    
               <form name="RegisterForm"  method="post" action="registersave.jsp" onsubmit="return(isValid())" enctype="multipart/form-data" >
                   <table width="100%" border="1" height="600">
                       <tr>
                           <td style="width:75%; background-image:url('h.jpg') ; background-repeat: no-repeatt;background-size:90% ;height:450;" >
                       <marquee><div style="background-color:puple; "><h1> Welcome to Free Chat Service</h1></div></marquee></td>
                          
                   <td align="center"><h1>Create a new account </h1>
                       <h3 align="center">its free and always will be </h3><br>
                           <table width="100%" >
                          
                               <tr> 
                                   <td><h2>  User Id </h2></td>
                               <td> <input type="text"  name="uid" id="uid" placeholder="User Id" required /><br>
                               <input type="button" value="Check For Availability" onclick="fun()"  /><span id="res" ></span>
             
             
                               </td>
               </tr>
               <tr>
                   <td><h2> Password </h2></td>
                   <td><input type="password" name="pwd" id="pwd" placeholder="password" required /><br></td>
               </tr>
               <tr>
                   <td><h2> Confirm Password </h2></td>
                   <td> <input type="password" name="cnp" id="cnp" placeholder="confirm password" required /><br/></td>
               </tr>
               <tr>
                   <td><h2>User Name</h2></td>
                   <td> <input type="text" name="un" required  placeholder="User Name" /><br/></td>
                   </tr>
                   <tr>
                       <td><h2> Gender </h2></td></tr><tr><td><input type="radio"  value=Male name="gen" required  />Male</td>
                   
                       <td> <input type="radio" value="Female" name="gen"  required />Female</td>
                   </tr>
                   <tr>
                       <td>
                           <h2>Country</h2><select name="Cont" id="cont" required >
                       <option>India</option>
                         <option>China</option>
                <option>USA</option>
                       </select>
                       </td>
                   </tr>
                   <tr>
                       <td><h2>Photograph</h2></td>
                       <td><input type="file" name="pic" required/></td>
                   </tr>
                    <tr>
                   <td><h2>Phone No</h2></td>
                   <td> <input type="text" name="pn" required  placeholder="phone no" /><br/></td>
                   </tr>
                   <tr>
                   <tr>
                       <td><h2><input type="submit" value="Sign Up" /></h2></td>
                   </tr>
                           </table></td></tr></table>
                   
        </form>
    </body>
</html>
