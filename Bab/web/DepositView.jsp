<%-- 
    Document   : DepositView
    Created on : 26-Oct-2018, 07:02:27
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
        <h1>Deposit</h1><hr>
        ${sessionScope.account.name}<br>
        ${sessionScope.account.balance}<br>
        ${complete}
        <form>
            <input type="number" name="deposit" required><br>
            <input type="submit" value="Deposit"<br>
        </form>
        <a href="Myaccount">Back</a>
    </body>
</html>
