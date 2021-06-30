

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <style>
body {
  background-image: url("img/doc18.jpg");
  background-color: #cccccc;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DOC LOGIN</title>

        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/doc2.png">
                <h1>DOCTOR LOGIN</h1>
                <form  action="DocLog.jsp">
                <table>
                 <tr><td>ID</td><td>
                 <input type="text" placeholder="Your ID" name="id" required></td>
                 </tr> 
                 <tr><td>Password</td><td>
                 <input type="password" placeholder="Password" name="password" required></td></tr>
                </table>
               <p><input type="submit" value="Login"></p>
                    
               <p><a href="DReg.html">Create New Account</a></p>
                <form>    
            </div>
        </div>
    </body>
</html>