<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>로그인</title>
   <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
      charset="utf-8"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
   <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
   <meta name="author" content="FREEHTML5.CO" />

   <!-- 
   //////////////////////////////////////////////////////

   FREE HTML5 TEMPLATE 
   DESIGNED & DEVELOPED by FREEHTML5.CO
      
   Website:       http://freehtml5.co/
   Email:          info@freehtml5.co
   Twitter:       http://twitter.com/fh5co
   Facebook:       https://www.facebook.com/fh5co

   //////////////////////////////////////////////////////
    -->

   <!-- Facebook and Twitter integration -->
   <meta property="og:title" content="" />
   <meta property="og:image" content="" />
   <meta property="og:url" content="" />
   <meta property="og:site_name" content="" />
   <meta property="og:description" content="" />
   <meta name="twitter:title" content="" />
   <meta name="twitter:image" content="" />
   <meta name="twitter:url" content="" />
   <meta name="twitter:card" content="" />

   <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
   <link rel="shortcut icon" href="favicon.ico">

   <!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'> -->

   <!-- Animate.css -->
   <link rel="stylesheet" href="../assets/css/animate.css">
   <!-- Icomoon Icon Fonts-->
   <link rel="stylesheet" href="../assets/css/icomoon.css">
   <!-- Bootstrap  -->
   <link rel="stylesheet" href="../assets/css/bootstrap.css">

   <link rel="stylesheet" href="../assets/css/style.css">


   <!-- Modernizr JS -->
   <script src="../assets/js/modernizr-2.6.2.min.js"></script>
   <!-- FOR IE9 below -->
   <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <!------ Include the above in your HEAD tag ---------->

   <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
   <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
   <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
   <link rel="stylesheet" href="../assets/css/logIn.css">
   <script>
      function showPassword() {

         var key_attr = $('#key').attr('type');

         if (key_attr != 'text') {

            $('.checkbox').addClass('show');
            $('#key').attr('type', 'text');

         } else {

            $('.checkbox').removeClass('show');
            $('#key').attr('type', 'password');

         }

      }
   </script>

</head>

<body>
   <header style="padding-bottom: 3px">
      <div class="container text-center">
         <div class="fh5co-navbar-brand">
            <a class="fh5co-logo" href="../index.jsp"><img src="../assets/images/logo.png" style="height: 110px"></a>
         </div>
         <!-- <nav id="fh5co-main-nav" role="navigation" style="font-family: sans-serif">
            <ul>
               <li><a href="index.html" class="active">신상품</a></li>
               <li><a href="work.html">베스트</a></li>
               <li><a href="services.html">알뜰쇼핑</a></li>
               <li><a href="about.html">금주혜택</a></li>

            </ul>
         </nav> -->
   </header>
   
   <section id="login">
      <div class="container">
         <div class="row">
            <!-- <div class="col-xs-12  col-sm-12  col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3"> -->
            <div class="col-xs-12  col-sm-12  col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
               <!-- <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">                -->

               <h1>로그인</h1>
               <form role="form" action="login" method="post" id="login-form" autocomplete="off">
                  <div class="form-group">
                     <label for="email" class="sr-only">text</label>
                     <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력해주세요">
                  </div>
                  <div class="form-group">
                     <label for="key" class="sr-only">Password</label>
                     <input type="password" name="userPassword" id="userPassword" class="form-control" placeholder="비밀번호를 입력해주세요">
                  </div>
                  <div class="checkbox_save">
                     <div class="checkbox">
                        <span class="character-checkbox" onclick="showPassword()"
                           style="margin-bottom: 0;"></span>
                        <span class="label">비밀번호 보기</span>
                     </div>
                     <div class="login_search">
                        <a href="#" class="link">아이디 찾기</a>
                        <span class="bar"></span>
                        <a href="#" class="link">비밀번호 찾기</a>
                     </div>

                  </div>
                  <div class="submit_btn">
                     <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="로그인">
                     <a href="../join/signUp.jsp" id="btn-signup" class="btn btn-custom">회원가입</a>
                  </div>

                  <span class="d-block text-center my-4 text-muted">&mdash; or &mdash;</span>
   
   <div class="social-login">
      <!-- <a href="#"><img src="../assets/join/images/kakao_login.png" alt=""></a> -->
      <a href="#" class="kakao btn d-flex justify-content-center align-items-center"
         style="background-color: rgb(243, 243, 61); color:black">
         <img src="../assets/images/join/kakao-talk.png" alt="" style="width: 15px; height:15px;"> 카카오톡
         <!-- <span class="icon-twitter mr-3"></span> 카카오톡 -->
      </a>
      <!-- <a href="#"><img src="images/naver_login.png" alt=""></a> -->
      <a href="#" class="twitter btn d-flex justify-content-center align-items-center"
         style="background-color: rgb(25, 212, 25); color:black">
         <img src="../assets/images/join/naver.png" alt="" style="width: 18px; height:18px;">네이버
         <!-- <span class="icon-twitter mr-3"></span> 네이버 -->
      </a>
      <a href="#" class="google btn d-flex justify-content-center align-items-center"
      style="background-color: #ea4335">
      <img src="../assets/images/join/google.png" alt="" style="width: 18px; height:18px;">구글
         <!-- <span class="icon-google mr-3"></span> 구글 -->
      </a>
   </div>
               </form>
               <!-- <a href="javascript:;" class="forget" data-toggle="modal" data-target=".forget-modal">Forgot your password?</a> -->
               <hr />
            </div> <!-- /.col-xs-12 -->
         </div> <!-- /.row -->
      </div> <!-- /.container -->
   </section>

   

   <footer>
      <div id="footer" class="fh5co-border-line">
         <div class="container">
            <div class="row">
               <div class="col-md-8 col-md-offset-2 text-center">
                  <p>Copyright 2016 Free Html5 <a href="#">Neos</a>. All Rights Reserved. <br>Made with <i
                        class="icon-heart3 love"></i> by <a href="http://freehtml5.co/"
                        target="_blank">Freehtml5.co</a> / Demo Images: <a href="https://www.pexels.com/"
                        target="_blank">Pexels</a> &amp; <a href="http://plmd.me/" target="_blank">PLMD</a> </p>
                  <p class="fh5co-social-icons">
                     <a href="#"><i class="icon-twitter-with-circle"></i></a>
                     <a href="#"><i class="icon-facebook-with-circle"></i></a>
                     <a href="#"><i class="icon-instagram-with-circle"></i></a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </footer>

   <!-- jQuery -->
   <script src="../assets/js/jquery.min.js"></script>
   <!-- jQuery Easing -->
   <script src="../assets/js/jquery.easing.1.3.js"></script>
   <!-- Bootstrap -->
   <script src="../assets/js/bootstrap.min.js"></script>
   <!-- Waypoints -->
   <script src="../assets/js/jquery.waypoints.min.js"></script>
   <!-- Owl carousel -->
   <script src="../assets/js/owl.carousel.min.js"></script>
   <!-- Stellar -->
   <script src="../assets/js/jquery.stellar.min.js"></script>

   <!-- Main JS (Do not remove) -->
   <script src="../assets/js/main.js"></script>

</body>

</html>