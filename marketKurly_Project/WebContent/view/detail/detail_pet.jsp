<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>애견사료</title>
     <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function(){
        $("#addCart").click(function(){
           alert("장바구니에 추가되었습니다.");
           alert("장바구니로 이동합니다.");
        });
    });

    </script>


    
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
      <img src="../assets/images/pet3.png" align="left" width="500px" height="650px" alt="Work">
    </div> 
    <div class="product01">
      <strong>[복슬강아지]수제 냉동간식 6종</strong>
      <hr width ="500px;">
        <p>수분을 머금은 원물 간식(생후3개월 이상)
           
        </p>
        <p>회원 할인가</p>
        <strong>5,000원</strong>
        <hr width ="500px;">
        <div class="motive">
        <p>판매단위 &emsp; &emsp;&emsp;1봉</p>
        <p>중량/용량 &emsp; &emsp;&emsp;옵션별 상이</p>
        <hr width ="500px;">
        <p>배송구분 &emsp; &emsp;&emsp;샛별배송/택배배송</p>
        <hr width ="500px;">
        <p>원산지&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;수입산(일본)</p>
        <p>포장타입 &emsp; &emsp;&emsp;상온/종이포장</p>
        <p>유통기한 &emsp; &emsp;&emsp;별도의 유동기한은 없으나 가급적 빠르게 <br>&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;드시는게 좋습니다</p>
        <p>안내사항 &emsp; &emsp;&emsp;반려동물의 취향이나 상태에 따라 기호성의 차이가 있을 수 있으니 구매에 참고바랍니다.</p>
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
    <img src="../assets/images/pe8.png"style="margin-left:auto;margin-right:auto; display:block">
    <br>
    <br>
    <h3>수제 냉동 간식6종</h3>
    <h2>수분을 머금은 원물 간식</h2>
    <hr>
    <p>원재료 본연의 모양과 질감, 맛을 고스란히 드러내는 원물 간식은 트릿이나 쿠키에 비해 기호성이 더 높은 편이지요.<br>
        그 중에서도 컬리는 많은 반려견의 사랑을 받고 있는 복슬강아지의 제품을 준비했습니다. </p>
   <br>
   <br>
    <img src="../assets/images/pe9.png" style="margin-left:auto;margin-right:auto; display:block">
    <br>
    <br>
    <br>
    <p>보통 원물 간식은 바싹 건조해서 중형견도 부담스러울 만큼 단단한 것들이 많아요.<br>
    그에 비해 이번에 선보이는 간식은 수분감이 있도록 반건조해 식감을 약간 연하게 만든 것이 특징이랍니다. 저온 건조라는 쿠킹 방식을<br>
보완할 수 있도록 원재료를 -20도 에서 급속 살균하고 식초로 한번 더 정성껏 소독해 더욱 안심인 제품입니다 <br>
</p>
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