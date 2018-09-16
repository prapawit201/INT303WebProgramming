<%-- 
    Document   : Register
    Created on : Sep 14, 2018, 10:54:06 AM
    Author     : INT303
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register Form</h1>
        <form action="Register" method="post">
        Email:
        <input type="email" name="email" required> <br><br>
        password:
        <input type="text" name="password" required><br><br>
       
        <a href="index.html">Back</a>
        <input type="submit" value="ok">
        </form>
    </body>
</html>
