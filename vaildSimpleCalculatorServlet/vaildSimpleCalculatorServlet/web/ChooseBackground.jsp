<%-- 
    Document   : ChooseBackground
    Created on : Aug 24, 2018, 9:52:02 AM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" 
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" 
              href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">

        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="include/Header.jsp?title=Select Your Background::"/>
            <form action="ChooseBackground" method="post">
                <input type="radio" name="bgColor" value="slategray" ${cookie.bgColor.value == "slategray" ? "checked": ""} /> Dark 
                <input type="text" size="3" style="background-color: slategray"/>
                <br>
                <input type="radio" name="bgColor" value="navy" ${cookie.bgColor.value == "navy" ? "checked": ""}/> Navy Blue
                <input type="text" size="3" style="background-color: navy"/>
                <br>
                <input type="radio" name="bgColor" value="silver" ${cookie.bgColor.value == "silver" ? "checked": ""}/> Silver 
                <input type="text" size="3" style="background-color: silver"/>
                <br>
                <input type="submit"/>
            </form>

             <a href="index.html">Back</a>
        </div>
           
    </body>
</html>
