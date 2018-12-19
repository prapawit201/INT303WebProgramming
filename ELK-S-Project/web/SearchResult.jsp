<%-- 
    Document   : SearchResult
    Created on : 16-Nov-2018, 12:28:21
    Author     : Windows10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" 
              type="image/png" 
              href="image/logo3.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elk-S-Autopart</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
        <link href="https://fonts.googleapis.com/css?family=Rye" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet">

    </head>


    <style>
        body, html {

            background-repeat: no-repeat;
            background-color:#00223E;
            font-family: 'Rye', cursive;

        }
        .navbabe{
            font-family: 'Concert One', cursive;
        }
        .sidenav {
            font-family: 'Lobster Two', cursive;
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            font-family: 'Lobster Two', cursive;
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            font-family: 'Lobster Two', cursive;
            color: #f1f1f1;
        }

        .sidenav .closebtn {
            font-family: 'Lobster Two', cursive;
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }
        .text-center{
            font-family: 'Lobster Two', cursive;

        }
        /* Center the loader */
        #loader {
            bottom: 0;
            height: 175px;
            left: 0;
            margin: auto;
            position: absolute;
            right: 0;
            top: 0;
            width: 175px;
        }
        #loader {
            bottom: 0;
            height: 175px;
            left: 0;
            margin: auto;
            position: absolute;
            right: 0;
            top: 0;
            width: 175px;
        }
        #loader .dot {
            bottom: 0;
            height: 100%;
            left: 0;
            margin: auto;
            position: absolute;
            right: 0;
            top: 0;
            width: 87.5px;
        }
        #loader .dot::before {
            border-radius: 100%;
            content: "";
            height: 87.5px;
            left: 0;
            position: absolute;
            right: 0;
            top: 0;
            transform: scale(0);
            width: 87.5px;
        }
        #loader .dot:nth-child(7n+1) {
            transform: rotate(45deg);
        }
        #loader .dot:nth-child(7n+1)::before {
            animation: 0.8s linear 0.1s normal none infinite running load;
            background: #00ff80 none repeat scroll 0 0;
        }
        #loader .dot:nth-child(7n+2) {
            transform: rotate(90deg);
        }
        #loader .dot:nth-child(7n+2)::before {
            animation: 0.8s linear 0.2s normal none infinite running load;
            background: #00ffea none repeat scroll 0 0;
        }
        #loader .dot:nth-child(7n+3) {
            transform: rotate(135deg);
        }
        #loader .dot:nth-child(7n+3)::before {
            animation: 0.8s linear 0.3s normal none infinite running load;
            background: #00aaff none repeat scroll 0 0;
        }
        #loader .dot:nth-child(7n+4) {
            transform: rotate(180deg);
        }
        #loader .dot:nth-child(7n+4)::before {
            animation: 0.8s linear 0.4s normal none infinite running load;
            background: #0040ff none repeat scroll 0 0;
        }
        #loader .dot:nth-child(7n+5) {
            transform: rotate(225deg);
        }
        #loader .dot:nth-child(7n+5)::before {
            animation: 0.8s linear 0.5s normal none infinite running load;
            background: #2a00ff none repeat scroll 0 0;
        }
        #loader .dot:nth-child(7n+6) {
            transform: rotate(270deg);
        }
        #loader .dot:nth-child(7n+6)::before {
            animation: 0.8s linear 0.6s normal none infinite running load;
            background: #9500ff none repeat scroll 0 0;
        }
        #loader .dot:nth-child(7n+7) {
            transform: rotate(315deg);
        }
        #loader .dot:nth-child(7n+7)::before {
            animation: 0.8s linear 0.7s normal none infinite running load;
            background: magenta none repeat scroll 0 0;
        }
        #loader .dot:nth-child(7n+8) {
            transform: rotate(360deg);
        }
        #loader .dot:nth-child(7n+8)::before {
            animation: 0.8s linear 0.8s normal none infinite running load;
            background: #ff0095 none repeat scroll 0 0;
        }
        #loader .lading {
            background-image: url("../images/loading.gif");
            background-position: 50% 50%;
            background-repeat: no-repeat;
            bottom: -40px;
            height: 20px;
            left: 0;
            position: absolute;
            right: 0;
            width: 180px;
        }
        @keyframes load {
            100% {
                opacity: 0;
                transform: scale(1);
            }
        }
        @keyframes load {
            100% {
                opacity: 0;
                transform: scale(1);
            }
        }
    </style>
    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
        var myVar;

        function myFunction() {
            myVar = setTimeout(showPage, 1100);
        }

        function showPage() {
            document.getElementById("loader").style.display = "none";
            document.getElementById("myDiv").style.display = "block";
        }
    </script>


    <body onload="myFunction()" style="margin:0;">

        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="HomepageView.jsp">Home</a>
            <a href="RegisterView.jsp">Register</a>
            <a href="LoginView.jsp">Login</a>
            <a href="ProductView.jsp">Product</a>
            <a href="ContactView.jsp">Contact</a>
            <a href="AboutUs.jsp">About Us</a>
        </div>

        <div class="navbabe">
            <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark justify-content-between">
                <a class="navbar-brand" href="#">
                    <span style="font-size:30px;cursor:pointer" onclick="openNav()"> <img src="image/logo3.png " style="height: 70px"></span>
                    <a class="navbar-brand" href="HomepageView.jsp" style="padding-left: 5px;font-size: 25px">ELK-S-Autopart</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavDropdown" style="padding-left: 20px">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="HomepageView.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle " href="ProductView.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Product
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="NewProduct">All Products</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="Category?catid=cat001">Brake Pads</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="Category?catid=cat002">Engine Oil</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="Category?catid=cat003">Battery</a>
                                </div>
                            </li>




                            <li class="nav-item">
                                <a href="ShoppingCart.jsp" class='fas fa-shopping-cart' style="font-size:24px;color: white;padding-top: 10px;padding-left:600px ">${sessionScope.cart.totalQuantity}</a>
                            </li>
                            <form action="Search" class="form-inline" style="margin-left: 20px">
                                <input name="search" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><img src="image/search.png" style="height: 30px"></button>
                            </form>
                            <li>
                                <div class="dropdown" style="padding-left: 20px">
                                    <button class="btn btn-secondary " type="button" id="dropdownMenuButton" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"> 
                                        <img src="image/icon.png" style="height: 30px">&nbsp; ${sessionScope.LoggedIn == null ? "" : sessionScope.LoggedIn.fname}
                                    </button>
                                    <c:if test="${sessionScope.LoggedIn==null}">

                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                            <a class="dropdown-item" href="NewLogin">Login</a>
                                            <a class="dropdown-item" href="Register">Register</a>


                                        </div>


                                        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
                                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                                        ${msg == "Invalid" ? '<script>swal("มีปัญหา", "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง","warning");</script>' : ''}
                                        ${param.success == "1" ? '<script>swal("finish", "ลงทะเบียนสำเร็จ","success");</script>' : ''}
                                    </c:if>





                                    <c:if test="${sessionScope.LoggedIn!=null}">
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="History">History</a>
                                            <a class="dropdown-item" href="NewHomepage?logout=1">Logout</a>


                                        </div>

                                    </c:if>

                                </div>
                            </li>

                        </ul>

                    </div>


            </nav>


        </div>
        <div class="container">
            <div class="row">
                <div id="loader">
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="lading"></div>
                </div>
            </div>
        </div>
        <div style="display:none;" id="myDiv" class="animate-bottom"><br><br>
            <span style="padding-top:30px;"> <h2 style="margin-left: 35% ;color: white;"> ${message} </h2></span>
            <div class="container">
                <div class="row">
                    <c:forEach items="${result}" var="p">
                        <div class="col-sm-4" >
                            <div class="card" style="margin-bottom: 15px;border: solid black; background-image: linear-gradient(to bottom,#654ea3,#ffdde1,#eaafc8);"  >
                                <center><img class="card-img-top" src="elkproduct/${p.model}.png" alt="Card image cap" style="height: 250px; width: 270px; display: block; border: 2px solid black; margin-top: 15px; background-image: linear-gradient(to left,#FFA17F,#F8FFAE);  "   ></center>
                                <div class="card-body " >
                                    <center><h5 class="card-title">${p.productname}</h5></center>
                                    <p class="card-text">${p.description}</p>
                                    <p class="card-text">${p.price} ฿</p>
                                    <form action="Addtocart">
                                        <center><select style=" background-color:#7575a3 ;padding: 5px; padding-left: 20px; padding-right: 20px" class="btn-secondary" name="quantity">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select ><br><br>
                                            <input name="CartId" value="${p.productid}" hidden>
                                            <button type="submit" class="btn btn-info btn-lg" style="background-color: #DC143C;">Add Cart</button>
                                        </center>
                                    </form> 

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
