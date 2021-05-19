<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>바나나</title>
    <style>
        .detail{
            float: left;
            text-align: center;
            margin-left: 150px;
        }
        
       #addCart{
	    width:300px;
	    height:80px;
	    color:#fff;
	    border-radius: 5px;
	    border:none;
	    margin:5px;
	    margin-left:300px;
	    font-size: 20px;
    
	}
        

    </style>
      <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function(){
        $("#addCart").click(function(){
           alert("장바구니에 추가되었습니다.");
           alert("장바구니로 이동합니다.");
        });
    });

    </script>
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
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="../assets/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="../assets/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
 
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/custom.css">
    <link rel="stylesheet" href="../assets/css/pd.css">
    <link rel="stylesheet" href="../assets/css/index.css">
    
    
 
 
    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
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
            <li class="menu none_sub menu_login"><a href="../join/logIn.jsp"
               class="link_menu">로그인</a></li>
            <span class="bar"></span>
            <li class="menu none_sub menu_join"><a href="../join/signUp.jsp"
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
            <li class="menu none_sub menu_logout"><a href="../join/logout"
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

            </ul>
         </nav>
   </header>

<br>
<br>
<body>
   <div id="container">
   <div id="content">
     <section>
	<form action='add' method='post' name="cartAdd">
       <input type="hidden" name="u_id" value="${sessionScope.loginUser.userId}">
    	<input type="hidden" name="p_id" value="${param.p_id}">

    <div class ="detail2">
      <img src="../assets/images/ban1.png" align="left" width="500px" height="650px" alt="Work">
    </div> 
    <div class="product01">
      <strong>농약 걱정 없는 1등 수입 바나나</strong>
      <hr width ="500px;">
        <p>당일 입고 당일배송되는 유기농 바나나(500g내외)
           
        </p>
        <p>회원 할인가</p>
        <strong>3,150원</strong>
        <hr width ="500px;">
        <div class="motive">
        <p>판매단위 &emsp; &emsp;&emsp;1팩</p>
        <p>중량/용량 &emsp; &emsp;&emsp;475g~500g</p>
        <hr width ="500px;">
        <p>배송구분 &emsp; &emsp;&emsp;샛별배송/택배배송</p>
        <hr width ="500px;">
        <p>원산지&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;수입산(페루,멕시코)</p>
        <p>포장타입 &emsp; &emsp;&emsp;상온/종이포장</p>
        <p>유통기한 &emsp; &emsp;&emsp;농산물로 별도의 유동기한은 없으나 가급적 빠르게 <br>&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;드시는게 좋습니다</p>
        <p>안내사항 &emsp; &emsp;&emsp;수분이있는 과일의 특성상 약 5%의 중량차이가 있습니다</p>
       <p>구매수량 &emsp; &emsp;&emsp;
        <select name="amount" style="width: 100px;height: 35px;font-size: 20px;" >
    		<c:forEach begin="1" end="10" varStatus="vs">
    			<option value="${vs.index }">${vs.index }</option>
    		</c:forEach>
    	</select></p>
        
    </div>
    <div>

   	 	<button type="submit" id="addCart" style="background-color: #378bb3;">장바구니 담기</button>
    </form>
    </div>
<hr>
</section>
</div>
<br>
<br><br>
<div class ="z1">
<section id="per">
    <img src="../assets/images/ban4.png"style="margin-left:auto;margin-right:auto; display:block">
    <br>
    <br>
    <h3>농약 걱정 없는 1등 수입과일</h3>
    <h2>유기농 바나나</h2>
    <hr>
    <p>국내 전체 수입량의 10%도 채 되지 않는 유기농 바나나, 아이 어른 할 것 없이 모두가<br>
        자주 즐기는 간식인 만큼 꼭 유기농으로 드리고 싶습니다. </p>
   <br>
   <br>
    <img src="../assets/images/pban2.png" style="margin-left:auto;margin-right:auto; display:block">
    <br>
    <br>
    <br>
    <p>컬리의 유기농 바나나는 약품 처리 대신 전용 선박에서 온도와 습도를 업격하게 조절하여 유기농 수확 상태 그대로 반입합니다<br>
    과연 유기농으로 재배했다고 해서 더 맛있을까요? 하고 의심을 한 것이 사실입니다. 화학 비료없이도 자랐다면 맛도, 영양도 크기도 조금 부족할거 같았거든요<br>
이러한 생각도 잠시, 컬리는 보자마자 첫눈에 반헤버렸습니다. 흠집 없이 단단하고 곧게 뻗는 자태, 도톰한 껍질을 깔 떄 풍겨오는 <br>
자연스럽고 싱그러운 향기, 절정은 과육을 한입 베어 물었을 떄이죠. 칼륨이 풍부한 바나나는 건강에도 좋은 간식거리가 되어줄 거에요. </p>
<br>
<br>
</div>
</section>

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
    </div>
    </div>
    <br>
    <br>
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