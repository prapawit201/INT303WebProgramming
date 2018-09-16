<%-- 
    Document   : showClass
    Created on : Aug 9, 2018, 4:13:46 PM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Your Cart (${cart.totalQuantity})</h1>
        <table>
            <thead>
            <th>#</th>
            <th>Product</th>
            <th>Unit Price</th>
            <th>Quantity</th>
            <th>Total Price</th>
            </thead>
            <br>
            
            <c:forEach items="${cart.lineItems}" var="cl" varStatus="vs">
                <br>
                <tr>
                    <td>${vs.count}</td>
                    <td>${cl.product.productName}</td>
                    <td>${cl.product.msrp}</td>                    
                    <td>${cl.quantity}</td>      
                    <td>${cl.salePrice}</td>             
                </tr>                
            </c:forEach>

        </table>
    
    <h3>Total Price: ${cart.totalPrice}</h3>
    </center>
    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>
</body>
</html>
