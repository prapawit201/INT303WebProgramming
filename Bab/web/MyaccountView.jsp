<%-- 
    Document   : MyaccountView
    Created on : 26-Oct-2018, 06:49:11
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
        <h1>Myaccount</h1><hr>
        ${sessionScope.complete}<br>
        ${sessionScope.account.name}<br>
        ${sessionScope.account.balance}<br>
        <a href="Deposit">Deposit</a><br>
        <a href="Withdraw">Withdraw</a><br>
        <a href="History">History</a><br>
        <a href="Logout">Logout</a><br>
    </body>
</html>
