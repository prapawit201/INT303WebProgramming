<%-- 
    Document   : Withdraw
    Created on : 26-Oct-2018, 07:10:57
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
         <h1>withdraw</h1><hr>
        ${sessionScope.account.name}<br>
        ${sessionScope.account.balance}<br>
        <form>
            <input type="number" name="withdraw" required><br>
            <input type="submit" value="Withdraw"<br>
        </form>
        <a href="Myaccount">Back</a>
    </body>
</html>
