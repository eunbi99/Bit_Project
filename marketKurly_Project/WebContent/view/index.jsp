<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="spms.vo.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>BIT KURLY</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
   content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
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
<link rel="stylesheet" href="assets/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="assets/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="assets/css/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/index.css">


<!-- Modernizr JS -->
<script src="assets/js/modernizr-2.6.2.min.js"></script>
<script src="assets/js/index.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->


</head>

<body>
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
            <li class="menu none_sub menu_logout"><a href="join/logout"
               class="link_menu">로그아웃</a></li>
            <span class="bar"></span>
            </c:if>

            <c:if test="${'admin' != sessionScope.loginUser.userId && not empty sessionScope.loginUser.userId}">
            <li class="menu none_sub menu_welcome">
            <a href="#" class="link_menu"><strong>${sessionScope.loginUser.userName}님</strong></a></li>
            <span class="bar"></span>
            <li class="menu none_sub menu_cart"><a href="cart/cart"
               class="link_menu">장바구니</a></li>
            <span class="bar"></span>
            <li class="menu none_sub menu_logout"><a href="join/logout"
               class="link_menu">로그아웃</a></li>
            <span class="bar"></span>
             </c:if>

            <li class="menu lst dropdown"><a href="#" class="link_menu"><button
                     class="dropbtn">고객센터 ▼</button></a>
               <div class="dropdown-content">
                  <a href="noticeboard/boardList.jsp">공지사항</a> 
                  <a href="../view/reviewboard/list">상품후기</a>
               </div>
            </li>
         </ul>
      </div>
   </div>


   <header style="padding-bottom: 3px">
      <div class="container text-center">
         <div class="fh5co-navbar-brand">
            <a class="fh5co-logo" href="index.jsp"><img
               src="assets/images/logo.png" style="height: 110px"></a>
         </div>

         <nav id="fh5co-main-nav" role="navigation"
            style="font-family: sans-serif">
            <ul class="list_menu">

                 <c:if test="${not empty sessionScope.loginUser.userId }">
               <li class="menu lst dropdown"><a href="#"
                  class="active link_menu"><button class="dropbtn">전체
                        카테고리</button></a>
                  <div class="dropdown-content">
                     <a href="category/meat_product.jsp">육류</a> <a
                        href="category/veg_product.jsp">채소</a> <a
                        href="category/fruit_product.jsp">과일</a> <a
                        href="category/pet_product.jsp">애견</a>
                  </div></li>

               <li><a href="#new">신상품</a></li>
               <li><a href="#best">베스트</a></li>
               <li><a href="#sale">알뜰쇼핑</a></li>
               <li><a href="mypage/orderList.jsp">마이페이지</a></li>
               </c:if>
              
                 <c:if test="${empty sessionScope.loginUser.userId }">
               <li class="menu lst dropdown">
                  <a href="#" class="active link_menu">
                     <button class="dropbtn">전체 카테고리</button>
                  </a>
                  <div class="dropdown-content">
                     <a href="category/meat_product.jsp">육류</a> 
                     <a href="category/veg_product.jsp">채소</a> 
                     <a href="category/fruit_product.jsp">과일</a> 
                     <a href="category/pet_product.jsp">애견</a>
                  </div>
               </li>

               <li><a href="#new">신상품</a></li>
               <li><a href="#best">베스트</a></li>
               <li><a href="#sale">알뜰쇼핑</a></li>
               </c:if>
            </ul>
         </nav>
      </div>
   </header>

   <div
      class="owl-carousel owl-carousel1 owl-carousel-fullwidth fh5co-light-arrow animate-box"
      data-animate-effect="fadeIn">
      <div class="item">
         <a href="assets/images/join/main1-big.png" class="image-popup"><img
            src="assets/images/join/main1.png" alt="image"></a>
      </div>
      <div class="item">
         <a href="assets/images/join/main2-big.png" class="image-popup"><img
            src="assets/images/join/main2.png" alt="image"></a>
      </div>
   </div>


   <!--1.이상품 어때요? -->
   <!--상세정보와 연동-->
   <div id="fh5co-featured-work-section">
      <div class="container-fluid" id="new">
         <div class="heading-section text-center">
            <h2 style="font-family: sans-serif; font-size: 30px">이 상품 어때요?</h2>
         </div>

         <div class="owl-carousel owl-carousel2 loop">
            <div class="item">
               <img src="assets/images/join/item1.png" alt="image"> <a
                  href="#" class="pop-up-overlay text-center">
                  <div class="desc">
                     <h3>딸기 바나나 믹스 1kg(냉동)</h3>
                     <span class="price">6900원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/item2.png" alt="image"> <a
                  href="#" class="pop-up-overlay pop-up-overlay-color-2 text-center">
                  <div class="desc">
                     <h3>[혼신마켓]명란 마요네즈</h3>
                     <span class="price">6500원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/item3.png" alt="image"> <a
                  href="detail/detail_veg.jsp"
                  class="pop-up-overlay pop-up-overlay-color-3 text-center">
                  <div class="desc">
                     <h3>[KF365]아보카도 1개</h3>
                     <span class="price">2200원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/item4.png" alt="image"> <a
                  href="#" class="pop-up-overlay pop-up-overlay-color-4 text-center">
                  <div class="desc">
                     <h3>[쌜모네키친]오로라 생연어(냉장)</h3>
                     <span class="price">14000원</span>
                  </div>
               </a>
            </div>
         </div>
      </div>
   </div>

   <!--두번째 (HOT) -->
   <div id="fh5co-featured-work-section">
      <div class="container-fluid" id="best">
         <div class="heading-section text-center">
            <h2 style="font-family: sans-serif; font-size: 30px">지금 가장 핫한
               상품 ></h2>
         </div>
         <div class="owl-carousel owl-carousel2">
            <div class="item">
               <!-- <a href="#" class="image-popup"> -->
               <img src="assets/images/join/hot1.png" alt="image"> <a
                  href="detail/detail_meat.jsp" class="pop-up-overlay text-center">
                  <div class="desc">
                     <h3>[빕스]바베큐 폭립 오리지날</h3>
                     <span class="price">14800원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/hot2.png" alt="image"> <a
                  href="detail/detail_ban.jsp"
                  class="pop-up-overlay pop-up-overlay-color-2 text-center">
                  <div class="desc">
                     <h3>[KF365]DOLE 실속 바나나 1.1KG</h3>
                     <span class="price">2900원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <!-- <a href="#" class="image-popup"> -->
               <img src="assets/images/join/hot3.png" alt="image">
               <!-- </a> -->
               <a href="#"
                  class="pop-up-overlay pop-up-overlay-color-3 text-center">
                  <div class="desc">
                     <h3>[Kurly's]국산콩 두부 300g</h3>
                     <span class="price">1900원</span>

                  </div>
               </a>
            </div>
            <div class="item">
               <!-- <a href="#" class="image-popup"> -->
               <img src="assets/images/join/hot4.png" alt="image">
               <!-- </a> -->
               <a href="#"
                  class="pop-up-overlay pop-up-overlay-color-4 text-center">
                  <div class="desc">
                     <h3>[연세우유x마켓컬리]전용목장우유</h3>
                     <span class="price">1850원</span>

                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/hot5.png" alt="image"> <a
                  href="#" class="pop-up-overlay text-center">
                  <div class="desc">
                     <h3>[청정원]라이틀리 곤약 볶음밥4종</h3>
                     <span class="price">2300원</span>
                  </div>
               </a>
            </div>
            <!-- <div class="item">
               <img src="images/portfolio_pic6.jpg" alt="image">
               <a href="#" class="pop-up-overlay pop-up-overlay-color-2 text-center">
                  <div class="desc">
                     <h3>Shoes</h3>
                     <span>Brand</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="images/portfolio_pic7.jpg" alt="image">
               <a href="#" class="pop-up-overlay text-center">
                  <div class="desc">
                     <h3>Magazine</h3>
                     <span>Web</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="images/portfolio_pic8.jpg" alt="image">
               <a href="#" class="pop-up-overlay pop-up-overlay-color-3 text-center">
                  <div class="desc">
                     <h3>VCard</h3>
                     <span>Card</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="images/portfolio_pic9.jpg" alt="image">
               <a href="#" class="pop-up-overlay pop-up-overlay-color-4 text-center">
                  <div class="desc">
                     <h3>Paper</h3>
                     <span>Illustration</span>
                  </div>
               </a>
            </div> -->
         </div>
      </div>
   </div>

   <div id="fh5co-featured-work-section">
      <div class="container-fluid" id="sale">
         <div class="heading-section text-center">
            <h2 style="font-family: sans-serif; font-size: 30px">알뜰쇼핑</h2>
         </div>

         <div class="owl-carousel owl-carousel2 loop">
            <div class="item">
               <img src="assets/images/join/sale1.png" alt="image"> <a
                  href="#" class="pop-up-overlay text-center">
                  <div class="desc">
                     <h3>
                        [안국건강]<br> 안심 멀티비타민미네랄
                     </h3>
                     <span class="price">55000원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/sale2.png" alt="image"> <a
                  href="detail/detail_pet.jsp"
                  class="pop-up-overlay pop-up-overlay-color-2 text-center">
                  <div class="desc">
                     <h3>[나샘]플로니 닭고기 2종</h3>
                     <span class="price">5500원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/sale3.png" alt="image"> <a
                  href="#" class="pop-up-overlay pop-up-overlay-color-3 text-center">
                  <div class="desc">
                     <h3>[한미양행]한미 숙취환 14포</h3>
                     <span class="price">30000원</span>
                  </div>
               </a>
            </div>
            <div class="item">
               <img src="assets/images/join/sale4.png" alt="image"> <a
                  href="#" class="pop-up-overlay pop-up-overlay-color-4 text-center">
                  <div class="desc">
                     <h3>[한미양행]크릴오일캡슐(30캡슐)</h3>
                     <span class="price">27000원</span>
                  </div>
               </a>
            </div>
         </div>
      </div>
   </div>

   <!-- end fh5co-featured-work-section -->
   <!-- <div id="fh5co-blog-section">
      <div class="container">
         <div class="heading-section text-center">
            <h2>Recent Blog</h2>
         </div>
         <div class="row">
            <div class="col-md-4 blog-section">
               <span>03 <small>July 2016</small></span>
               <h3><a href="#">Mourntains countries Vokalia</a></h3>
               <p>Far far away, behind the word mountains, far from the countries Vokalia, there live the blind
                  texts.</p>
               <a class="btn btn-primary" href="#">Read More</a>
            </div>
            <div class="col-md-4 blog-section">
               <span>02 <small>July 2016</small></span>
               <h3><a href="#">Mourntains countries Vokalia</a></h3>
               <p>Far far away, behind the word mountains, far from the countries Vokalia, there live the blind
                  texts.</p>
               <a class="btn btn-primary" href="#">Read More</a>
            </div>
            <div class="col-md-4 blog-section">
               <span>01 <small>July 2016</small></span>
               <h3><a href="#">Mourntains countries Vokalia</a></h3>
               <p>Far far away, behind the word mountains, far from the countries Vokalia, there live the blind
                  texts.</p>
               <a class="btn btn-primary" href="#">Read More</a>
            </div>
         </div>
      </div>
   </div> -->
   <!-- end: fh5co-blog-section -->

   <div class="heading-section text-center">
      <h2 style="font-family: sans-serif; font-size: 30px">금주혜택 모아보기</h2>
   </div>
   <div class="benefit_img">
      <a href="#"><img src="assets/images/join/benefit.png" alt="image"></a>
   </div>
   <!-- <div class="fh5co-parallax" style="background-image: url(images/hero-2.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div class="row">
            <div
               class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
               <div class="fh5co-intro fh5co-table-cell">
                  <h1 class="text-center">금주혜택</h1>
                  <p>Made with love by the fine folks at <a href="">FreeHTML5.co</a></p>
               </div>
            </div>
         </div>
      </div>
   </div> -->
   <!-- end: fh5co-parallax -->


   <footer>
      <div id="footer" class="fh5co-border-line">
         <div class="container">
            <div class="row">
               <div class="col-md-8 col-md-offset-2 text-center">
                  <p>
                     Copyright 2016 Free Html5 <a href="#">Neos</a>. All Rights
                     Reserved. <br>Made with <i class="icon-heart3 love"></i> by
                     <a href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> /
                     Demo Images: <a href="https://www.pexels.com/" target="_blank">Pexels</a>
                     &amp; <a href="http://plmd.me/" target="_blank">PLMD</a>
                  </p>
                  <p class="fh5co-social-icons">
                     <a href="#"><i class="icon-twitter-with-circle"></i></a> <a
                        href="#"><i class="icon-facebook-with-circle"></i></a> <a
                        href="#"><i class="icon-instagram-with-circle"></i></a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </footer>

   <!-- jQuery -->
   <script src="assets/js/jquery.min.js"></script>
   <!-- jQuery Easing -->
   <script src="assets/js/jquery.easing.1.3.js"></script>
   <!-- Bootstrap -->
   <script src="assets/js/bootstrap.min.js"></script>
   <!-- Waypoints -->
   <script src="assets/js/jquery.waypoints.min.js"></script>
   <!-- Owl carousel -->
   <script src="assets/js/owl.carousel.min.js"></script>
   <!-- Stellar -->
   <script src="assets/js/jquery.stellar.min.js"></script>

   <!-- Main JS (Do not remove) -->
   <script src="assets/js/main.js"></script>

</body>

</html>