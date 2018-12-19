<%-- 
    Document   : RegisterView
    Created on : 15-Nov-2018, 17:23:24
    Author     : Windows10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

        <!-- Website CSS style -->
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">

        <!-- Website Font style -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <script src="sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
    </head>
    <style>
        body, html{
          background-color: #ffcccc;
            font-family: 'Oxygen', sans-serif;
        }

        .main{
            margin-top: 70px;
        }

        h1.title { 
            font-size: 50px;
            font-family: 'Passion One', cursive; 
            font-weight: 400; 
        }

        hr{
            width: 10%;
            color: #fff;
        }

        .form-group{
            margin-bottom: 15px;
        }

        label{
            margin-bottom: 15px;
        }

        input,
        input::-webkit-input-placeholder {
            font-size: 11px;
            padding-top: 3px;
        }

        .main-login{
            background-color: #fff;
            /* shadows and rounded borders */
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            border-radius: 2px;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

        }

        .main-center{
            margin-top: 30px;
            margin: 0 auto;
            max-width: 330px;
            padding: 40px 40px;

        }

        .login-button{
            margin-top: 5px;
        }

        .login-register{
            font-size: 11px;
            text-align: center;
        }
    </style>
    <script>
        //Here you can add your own picture for snow. Just change the url
            var snowsrc = "http://i13.servimg.com/u/f13/11/52/70/02/snowba10.png"
//how many snowflakes there will be (currently 12)
            var no = 47;
//How fast will the snow disappear (0 is never)
            var hidesnowtime = 0;
//The height the snow will reach before it disappears ("windowheight" or "pageheight")
            var snowdistance = "pageheight";
///////////////////////////////End of Settings///////////////////////////////////
            var ie4up = (document.all) ? 1 : 0;
            var ns6up = (document.getElementById && !document.all) ? 1 : 0;
            function iecompattest()
            {
                return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body
            }
            var dx, xp, yp;
            var am, stx, sty;
            var i, doc_width = 800, doc_height = 600;
            if (ns6up)
            {
                doc_width = self.innerWidth;
                doc_height = self.innerHeight;
            } else
            if (ie4up)
            {
                doc_width = document.body.clientWidth;
                doc_height = document.body.clientHeight;
            }
            dx = new Array();
            xp = new Array();
            yp = new Array();
            am = new Array();
            stx = new Array();
            sty = new Array();
            for (i = 0; i < no; ++i)
            {
                dx[i] = 0;
                xp[i] = Math.random() * (doc_width - 50);
                yp[i] = Math.random() * doc_height;
                am[i] = Math.random() * 20;
                stx[i] = 0.02 + Math.random() / 10;
                sty[i] = 0.7 + Math.random();
                if (ie4up || ns6up)
                {
                    if (i == 0)
                    {
                        document.write("<div id=\"dot" + i + "\" style=\"POSITION: absolute; Z-INDEX: " + i + "; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><a href=\"http://rftactical.darkbb.com/index.htm\"><img src='" + snowsrc + "' border=\"0\"><\/a><\/div>");
                    } else
                    {
                        document.write("<div id=\"dot" + i + "\" style=\"POSITION: absolute; Z-INDEX: " + i + "; VISIBILITY: visible; TOP: 15px; LEFT: 15px;\"><img src='" + snowsrc + "' border=\"0\"><\/div>");
                    }
                }
            }
            function snowIE_NS6()
            {
                doc_width = ns6up ? window.innerWidth - 10 : iecompattest().clientWidth - 10;
                doc_height = (window.innerHeight && snowdistance == "windowheight") ? window.innerHeight : (ie4up && snowdistance == "windowheight") ? iecompattest().clientHeight : (ie4up && !window.opera && snowdistance == "pageheight") ? iecompattest().scrollHeight : iecompattest().offsetHeight;
                for (i = 0; i < no; ++i)
                {
                    yp[i] += sty[i];
                    if (yp[i] > doc_height - 50)
                    {
                        xp[i] = Math.random() * (doc_width - am[i] - 30);
                        yp[i] = 0;
                        stx[i] = 0.02 + Math.random() / 10;
                        sty[i] = 0.7 + Math.random();
                    }
                    dx[i] += stx[i];
                    document.getElementById("dot" + i).style.top = yp[i] + "px";
                    document.getElementById("dot" + i).style.left = xp[i] + am[i] * Math.sin(dx[i]) + "px";
                }
                snowtimer = setTimeout("snowIE_NS6()", 10);
            }
            function hidesnow()
            {
                if (window.snowtimer)
                    clearTimeout(snowtimer)
                for (i = 0; i < no; i++)
                    document.getElementById("dot" + i).style.visibility = "hidden"
            }

            if (ie4up || ns6up)
            {
                snowIE_NS6();
                if (hidesnowtime > 0)
                    setTimeout("hidesnow()", hidesnowtime * 1000)
            }
    </script>
    <body>

        <div class="container">
            <div class="row main">
                <div class="panel-heading">
                    <div class="panel-title text-center">

                        <h1 class="title" style="color: whitesmoke;text-shadow: black 0.1em 0.1em 0.2em">Register </h1>
                        <hr />
                    </div>
                </div> 
                <div class="main-login main-center">
                    <form class="form-horizontal" action="Register" method="post">



                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Username</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username" required/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Password</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password" required/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="cols-sm-2 control-label">Firstname</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="fname" id="fname"  placeholder="Enter your Firstname" required />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="confirm" class="cols-sm-2 control-label">Lastname</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="lname" placeholder="Enter your Lastname" required />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="confirm" class="cols-sm-2 control-label">Telno</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="number" class="form-control" name="telno" placeholder="Enter your Telno" required />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="confirm" class="cols-sm-2 control-label">Email</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="email" placeholder="Enter your Email" required />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="confirm" class="cols-sm-2 control-label">Address</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="address" placeholder="Enter your Address" required />
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">

                            <input type="submit" value="Register" class="btn btn-primary btn-lg btn-block login-button">
                        </div>
                        <div class="login-register">
                            <a href="LoginView.jsp" class="btn btn-outline-dark btn-lg active" role="button" aria-pressed="true">Login</a>

                            <a href="HomepageView.jsp" class="btn btn-outline-dark btn-lg active" role="button" aria-pressed="true">back</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
                  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        ${EmailnotNull == "1" ? '<script>swal("มีปัญหา", "Username นี้ถูกใช้ไปแล้ว","warning");</script>' : ''}

        <script type="text/javascript" src="assets/js/bootstrap.js"></script>

    </body>
</html>
