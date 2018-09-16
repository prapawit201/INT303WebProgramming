<%-- 
    Document   : Header
    Created on : Aug 10, 2018, 3:12:10 PM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid" style="background-color:${cookie.bgColor.value} ">
<table class="table">
    <tr>
        <td> <a href="index.html" title="Back to Home"><img src="logo.png" width="120"/>
                 <td><h1>${param.title}</h1></td>
                <td>
                    <c:if test="${cart!=null}">
                        <a href="ShowCart">Your Cart:(${cart.totalQuantity})</a> 
                    </c:if>
                    &nbsp;&nbsp;&nbsp;
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            Hello <a href="Logout"> ${sessionScope.user.contactfirstname},</a>
                        </c:when>
                        <c:otherwise>
                            Hello <a href="Login">Guest</a>
                        </c:otherwise>
                    </c:choose>
                </td>
    </tr>
</table>
</div>
<hr>
Session Id : ${cookie.JSESSIONID.value}
<hr>
