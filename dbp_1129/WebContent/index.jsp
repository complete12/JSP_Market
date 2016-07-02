<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>Landing Zero Free Bootstrap Theme with Video</title>
    <meta name="description" content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link rel="stylesheet" href="css/styles_index.css" />
    <link rel="stylesheet" href="css/style_index.css" />
  </head>
  <body>
   
    <header id="first">
        <div class="header-content">
            <div class="inner">
                <h1 class="cursive wow flipInX"><font color="black">Welcome to Market</font></h1>
                <h4><font color="black">This is a program for managing the market</font></h4>
                <hr>
                <!-- <a href="#video-background" id="toggleVideo" data-toggle="collapse" class="btn btn-primary btn-xl">Toggle Video</a> &nbsp; <a href="#one" class="btn btn-primary btn-xl page-scroll">Get Started</a>-->
            <form name = "form1" method = "post" action="market_control.jsp?action=login">
            <input type="text" placeholder="insert user id" name = "userId"/><Br>
            <input type="password" name = "password"/><br>
            <input type="submit" value="login"/></a>
            </form>
            </div>
        </div>
        <video autoplay="" loop="" class="fillWidth fadeIn wow collapse in" data-wow-delay="0.5s" poster="./images/Carmela.jpg" id="video-background">
            <source src="./Carmela/MP4/Carmela.mp4" type="video/mp4">Your browser does not support the video tag. I suggest you upgrade your browser.
        </video>
    </header>
    <!--scripts loaded here from cdn for performance -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
    <script src="js/scripts.js"></script>
    <script async type="text/javascript">
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-46791600-1', 'auto');
      ga('send', 'pageview');
    </script>
  </body>

</html>