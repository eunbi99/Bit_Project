<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
   <head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>BIT KURLY</title>
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
   <meta property="og:title" content=""/>
   <meta property="og:image" content=""/>
   <meta property="og:url" content=""/>
   <meta property="og:site_name" content=""/>
   <meta property="og:description" content=""/>
   <meta name="twitter:title" content="" />
   <meta name="twitter:image" content="" />
   <meta name="twitter:url" content="" />
   <meta name="twitter:card" content="" />

   <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
   <link rel="shortcut icon" href="favicon.ico">

   <!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'> -->
   
   <link rel="stylesheet" href="../assets/css/animate.css">
   <!-- Icomoon Icon Fonts-->
   <link rel="stylesheet" href="../assets/css/icomoon.css">
   <!-- Bootstrap  -->
   <link rel="stylesheet" href="../assets/css/bootstrap.css">
   <link rel="stylesheet" href="../assets/css/index.css">

   <link rel="stylesheet" href="../assets/css/pd.css">


   <!-- Modernizr JS -->
   <script src="js/modernizr-2.6.2.min.js"></script>
   <!-- FOR IE9 below -->
   <!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->

   </head>
   <body style="font-family : sans-serif">
   <div id="header">
      <div id="userMenu">
         <!-- <div></div> 샛별배송 없애는 대신 div태그 가능-->
         <div class="sub_tit" style="font-size: 13px;">샛별배송</div>
         <ul class="list_menu">

            <c:if test="${empty sessionScope.loginUser.userId }">
            <li class="menu none_sub menu_login"><a href="join/logIn.jsp"
               class="link_menu">로그인</a></li>
            <span class="bar"></span>
            <li class="menu none_sub menu_join"><a href="join/signUp.jsp"
               class="link_menu">회원가입</a></li>
            <span class="bar"></span>
            </c:if>

            <c:if test="${'admin' == sessionScope.loginUser.userId }">
            <li class="menu none_sub menu_welcome">
             <a href="#" class="link_menu"><strong>[관리자]</strong></a></li>
            <li class="menu none_sub menu_admin"><a
               href="admin/productList.jsp" class="link_menu">사이트 관리</a></li>
            <span class="bar"></span>
            <li class="menu none_sub menu_logout"><a href="../join/logout"
               class="link_menu">로그아웃</a></li>
            <span class="bar"></span>
            </c:if>

            <c:if test="${'admin' != sessionScope.loginUser.userId && not empty sessionScope.loginUser.userId}">
            <li class="menu none_sub menu_welcome">
            <a href="#" class="link_menu"><strong>${sessionScope.loginUser.userName}님</strong></a></li>
            <span class="bar"></span>
            <li class="menu none_sub menu_cart"><a href="../cart/cart"
               class="link_menu">장바구니</a></li>
            <span class="bar"></span>
            <li class="menu none_sub menu_logout"><a href="join/logout"
               class="link_menu">로그아웃</a></li>
            <span class="bar"></span>
             </c:if>

            <li class="menu lst dropdown"><a href="#" class="link_menu"><button
                     class="dropbtn">고객센터 ▼</button></a>
               <div class="dropdown-content">
                  <a href="../noticeboard/boardList.jsp">공지사항</a> 
                  <a href="../reviewboard/list">상품후기</a>
               </div>
            </li>
         </ul>
      </div>
   </div>

   <header style="padding-bottom: 3px">
      <div class="container text-center">
         <div class="fh5co-navbar-brand">
           <a class="fh5co-logo" href="../index.jsp"><img src="../assets/images/logo.png" style="height: 110px"></a>
         </div>
         
         <nav id="fh5co-main-nav" role="navigation" style="font-family: sans-serif">
            <ul class="list_menu">
         <c:if test="${not empty sessionScope.loginUser.userId }">
               <li class="menu lst dropdown"><a href="#" class="active link_menu"><button class="dropbtn" style="margin-left: 0px; font-size: 18px; padding:5px;font-family:sans-serif">전체 카테고리</button></a>
                  <div class="dropdown-content">
                     <a href="../category/meat_product.jsp">육류</a>
                     <a href="../category/veg_product.jsp">채소</a>
                     <a href="../category/fruit_product.jsp">과일</a>
                     <a href="../category/pet_product.jsp">애견</a>                     
                  </div> 
               </li>

               <li><a href="#new">신상품</a></li>
               <li><a href="#best">베스트</a></li>
               <li><a href="#sale">알뜰쇼핑</a></li>
               <li><a href="../mypage/orderList.jsp">마이페이지</a></li>
               </c:if>
              
                 <c:if test="${empty sessionScope.loginUser.userId }">
                 <li class="menu lst dropdown">
                  <a href="#" class="active link_menu">
                     <button class="dropbtn">전체 카테고리</button>
                  </a>
                  <div class="dropdown-content">
                     <a href="../category/meat_product.jsp">육류</a>
                     <a href="../category/veg_product.jsp">채소</a>
                     <a href="../category/fruit_product.jsp">과일</a>
                     <a href="../category/pet_product.jsp">애견</a>
                  </div>
               </li>

               <li><a href="#new">신상품</a></li>
               <li><a href="#best">베스트</a></li>
               <li><a href="#sale">알뜰쇼핑</a></li>
               </c:if>
            </ul>

         </nav>
   </header>
   <img src="../assets/images/pDetail/back2.png" style="width:100%;">
         <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
               
                  <h1 style="font-family : sans-serif; font-weight : bold;" class="text-center">금주의 세일 항목</h1>
                  <p style="font-family : sans-serif;font-weight : bold;">육 류</p>
               </div>
            </div>
         </div>
      </div>
   </div><!-- end: fh5co-parallax -->
   <div id="fh5co-work-section">
      <div class="container">
         <div class="row text-center">
            <div class="col-md-4 col-sm-6">
               <div class="fh5co-grid-work">
                  <div class="work-holder">
                     <a href="../detail/detail_meat.jsp?p_id=5"><img src="../assets/images/meat1.png" alt="Work"></a>
                  </div>
                  <div class="desc">
                     <h3 ><a style="font-family : sans-serif;" href="detail_ban.jsp">토마호크</a></h3>
                     <span style="font-family : sans-serif;">20%할인<br>44,350원</span>
                
                  </div>
               </div>
            </div>
            <div class="col-md-4 col-sm-6">
               <div class="fh5co-grid-work">
                  <div class="work-holder">
                     <a href="detail_ban.html"><img src="../assets/images/meat2.png" alt="Work"></a>
                  </div>
                  <div class="desc">
                     <h3><a style="font-family : sans-serif;" href="detail_ban.html">목살</a></h3>
                     <span style="font-family : sans-serif;">15% 25,300원</span>
                  </div>
               </div>
            </div>
            <div class="col-md-4 col-sm-6">
               <div class="fh5co-grid-work">
                  <div class="work-holder">
                     <a href="detail_ki.html"><img src="../assets/images/meat3.png" alt="Work"></a>
                  </div>
                  <div class="desc">
                     <h3><a style="font-family : sans-serif;" href="detail.ki.html">삽겹살</a></h3>
                     <span style="font-family : sans-serif;">7% 8,500원</span>
                  </div>
               </div>
            </div>
            
            
   <footer>
      <div id="footer" class="fh5co-border-line">
         <div class="container">
            <div class="row">
               <div class="col-md-8 col-md-offset-2 text-center">
                  <p>Copyright 2016 Free Html5 <a href="#">Neos</a>. All Rights Reserved. <br>Made with <i class="icon-heart3 love"></i> by <a href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> / Demo Images: <a href="https://www.pexels.com/" target="_blank">Pexels</a> &amp; <a href="http://plmd.me/" target="_blank">PLMD</a> </p>
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
   <script src="js/jquery.min.js"></script>
   <!-- jQuery Easing -->
   <script src="js/jquery.easing.1.3.js"></script>
   <!-- Bootstrap -->
   <script src="js/bootstrap.min.js"></script>
   <!-- Waypoints -->
   <script src="js/jquery.waypoints.min.js"></script>
   <!-- Owl carousel -->
   <script src="js/owl.carousel.min.js"></script>
   <!-- Stellar -->
   <script src="js/jquery.stellar.min.js"></script>

   <!-- Main JS (Do not remove) -->
   <script src="js/main.js"></script>
   </body>
</html>
    