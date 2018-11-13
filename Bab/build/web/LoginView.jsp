<%-- 
    Document   : LoginView
    Created on : 26-Oct-2018, 06:40:30
    Author     : Windows10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1><hr>
        <form action="Login" method="post">
            Accountid : <input type="number" name="accountid" required ><br>
            Pin : <input type="number" name="pin" required><br>
            <input type="submit" value="Login"><br>
        </form>
            ${message}
    </body>
</html>
