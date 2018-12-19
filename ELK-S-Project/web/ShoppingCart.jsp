<%-- 
    Document   : ProductVieww
    Created on : 16-Nov-2018, 02:10:01
    Author     : Windows10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elk-S-Autopart</title>
        <link rel="icon" 
              type="image/png" 
              href="image/logo3.png" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>


        <script src="https://use.fontawesome.com/c560c025cf.js"></script>

        <link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet">

    </head>
    <style>
        body, html {
            font-family: 'Concert One', cursive;
            background-image: linear-gradient(to top,#00223E,#00223E);
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

    </style>

    <body >
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
                                 
            <div class="container"></div>
            <div class="card">

                <div class="card-body">

                    <div class="row">

                        <c:forEach items="${sessionScope.cart.lineItems}" var="p" varStatus="vs">
                            <div class="col-xs-2 col-md-2">
                                <img class="img-responsive" src="elkproduct/${p.product.model}.png" style="width: 120px;height: 120px" alt="preview">
                            </div>
                            <div class="col-xs-4 col-md-6">
                                <h4 class="product-name"><strong>${p.product.productname}</strong></h4><h4><small>${p.product.description}</small></h4>
                            </div>
                            <div class="col-xs-6 col-md-4 row">
                                <div class="col-xs-6 col-md-6 text-right" style="padding-top: 5px">
                                    <h6><strong>${p.product.price} <span class="text-muted">x</span></strong></h6>
                                </div>
                                <div class="col-xs-4 col-md-4">
                                    <input type="text" class="form-control input-sm" value="${p.quantity}">
                                </div>
                                <div class="col-xs-2 col-md-2">
                                    <button onclick="window.location = 'Remove?page=cart&remove=${p.product.productid}'" type="button" class="btn btn-outline-danger btn-xs">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>

                        </c:forEach>
                    </div>


                    <hr>

                </div>
                <div class="card-footer">

                    <a href="PaymentView.jsp" class="btn btn-outline-dark active pull-right" role="button" aria-pressed="true">Pay now</a>
                    <div class="pull-right" style="margin: 5px">
                        Total Price: <b>${sessionScope.totalprice}</b>
                    </div>
                </div>
            </div>
       
    </body>
</html>
