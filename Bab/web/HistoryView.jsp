<%-- 
    Document   : HistoryView
    Created on : 26-Oct-2018, 06:55:19
    Author     : Windows10
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
        <h1>History</h1><hr>
        ${sessionScope.account.name}<br>
        ${sessionScope.account.balance}<br>
        <table border="1">
            <tr>
                <th>#</th>
                <th>Time</th>
                <th>method</th>
                <th>amount</th>
                <th>balance</th>
            </tr>
            <c:forEach items="${history}" var="h" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${h.time}</td>
                    <td>${h.method}</td>
                    <td>${h.amount}</td>
                    <td>${h.balance}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="Myaccount">Back</a>
    </body>
</html>
