<%-- 
    Document   : LoginView
    Created on : Nov 15, 2018, 4:14:21 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <style>
            body, html {
                font-family: 'Oxygen', sans-serif;
                background-color: #ffcccc;
            }

            h1.title { 
                font-size: 50px;
                font-family: 'Passion One', cursive; 
                font-weight: 400; 
            }
            hr{
                width: 20%;
                color: #fff;
            }

            .card-container.card {
                max-width: 350px;
                padding: 40px 40px;
            }

            .btn {
                font-weight: 700;
                height: 36px;
                -moz-user-select: none;
                -webkit-user-select: none;
                user-select: none;
                cursor: default;
            }

            /*
             * Card component
             */
            .card {
                background-color: #F7F7F7;
                /* just in case there no content*/
                padding: 20px 25px 30px;
                margin: 0 auto 25px;
                margin-top: 50px;
                /* shadows and rounded borders */
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
                -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            }

            .profile-img-card {
                width: 96px;
                height: 96px;
                margin: 0 auto 10px;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
            }

            /*
             * Form styles
             */
            .profile-name-card {
                font-size: 16px;
                font-weight: bold;
                text-align: center;
                margin: 10px 0 0;
                min-height: 1em;
            }

            .reauth-email {
                display: block;
                color: #404040;
                line-height: 2;
                margin-bottom: 10px;
                font-size: 14px;
                text-align: center;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .form-signin #inputEmail,
            .form-signin #inputPassword {
                direction: ltr;
                height: 44px;
                font-size: 16px;
            }

            .form-signin input[type=email],
            .form-signin input[type=password],
            .form-signin input[type=text],
            .form-signin button {
                width: 100%;
                display: block;
                margin-bottom: 10px;
                z-index: 1;
                position: relative;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .form-signin .form-control:focus {
                border-color: rgb(104, 145, 162);
                outline: 0;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
            }

            .btn.btn-signin {
                /*background-color: #4d90fe; */
                background-color: rgb(104, 145, 162);
                /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
                padding: 0px;
                font-weight: 700;
                font-size: 14px;
                height: 36px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                -o-transition: all 0.218s;
                -moz-transition: all 0.218s;
                -webkit-transition: all 0.218s;
                transition: all 0.218s;
            }

            .btn.btn-signin:hover,
            .btn.btn-signin:active,
            .btn.btn-signin:focus {
                background-color: rgb(12, 97, 33);
            }

            .forgot-password {
                color: rgb(104, 145, 162);
            }

            .forgot-password:hover,
            .forgot-password:active,
            .forgot-password:focus{
                color: rgb(12, 97, 33);
            }
        </style>
        <script>
            $(document).ready(function () {

                loadProfile();
            });

            function getLocalProfile(callback) {
                var profileImgSrc = localStorage.getItem("PROFILE_IMG_SRC");
                var profileName = localStorage.getItem("PROFILE_NAME");
                var profileReAuthEmail = localStorage.getItem("PROFILE_REAUTH_EMAIL");

                if (profileName !== null
                        && profileReAuthEmail !== null
                        && profileImgSrc !== null) {
                    callback(profileImgSrc, profileName, profileReAuthEmail);
                }
            }

            function loadProfile() {
                if (!supportsHTML5Storage()) {
                    return false;
                }
                // we have to provide to the callback the basic
                // information to set the profile
                getLocalProfile(function (profileImgSrc, profileName, profileReAuthEmail) {
                    //changes in the UI
                    $("#profile-img").attr("src", profileImgSrc);
                    $("#profile-name").html(profileName);
                    $("#reauth-email").html(profileReAuthEmail);
                    $("#inputEmail").hide();
                    $("#remember").hide();
                });
            }


            function supportsHTML5Storage() {
                try {
                    return 'localStorage' in window && window['localStorage'] !== null;
                } catch (e) {
                    return false;
                }
            }

            function testLocalStorageData() {
                if (!supportsHTML5Storage()) {
                    return false;
                }
                localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120");
                localStorage.setItem("PROFILE_NAME", "César Izquierdo Tello");
                localStorage.setItem("PROFILE_REAUTH_EMAIL", "oneaccount@gmail.com");
            }
        </script>
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
            <div class="card card-container">

                <img id="profile-img" class="profile-img-card" src="image/logo5.png" style="width: 150px;height: 150px" />

                <center>   <h1 class="title" style="color: whitesmoke;text-shadow: black 0.1em 0.1em 0.2em">Log In </h1> </center>
                <p id="profile-name" class="profile-name-card"></p>

                <form action="NewLogin" method="post" class="form-signin">
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" id="inputEmail" class="form-control" placeholder="Username" name="Username" required autofocus>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                    <div id="remember" class="checkbox">
                        <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>

                </form><!-- /form -->

                <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                ${msg == "Invalid" ? '<script>swal("มีปัญหา", "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง","warning");</script>' : ''}
                <center>
                    <div class="back">
                        <a href="HomepageView.jsp" class="btn btn-outline-dark btn-lg active" role="button" aria-pressed="true">back</a>
                    </div>
                </center>
            </div><!-- /card-container -->
        </div><!-- /container -->


    </form
</body>
</html>
