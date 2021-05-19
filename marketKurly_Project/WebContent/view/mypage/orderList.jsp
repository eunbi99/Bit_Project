<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spms.vo.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--     <%@ include file="header.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT KURLY</title>
<!--  Bootstrap -->
<link href ="../assets/css/bootstrap.min.css" rel="stylesheet">
<link href ="../assets/css/custom.css" rel="stylesheet">
<link href="../assets/css/mypage.css" rel="stylesheet">
 <link href="../assets/css/shoppingList.css" rel="stylesheet">
 <link rel="stylesheet" href="../assets/css/index.css">
 
 
 
 
     <link rel="stylesheet" href="../assets/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="../assets/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css">
 
     <!--<link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/pd.css"> -->
    <link rel="stylesheet" href="../assets/css/index.css">
 
 
 
 
    <!-- 주문내역 기간별 드롭다운 스크립트 -->
           <script>
              $('.search_data .btn_layer').on('click', function(e){
                 e.preventDefault();
                 $(this).toggleClass('on');
                 $('.search_data .layer_search').slideToggle(100);
              });
           </script>

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
            <a class="fh5co-logo" href="../index.jsp" >
                  <img  style ="display : block; margin : auto; padding-top:50px; height:160px" src="../assets/images/logo.png;" href="../index.jsp">
                  

                    
            </a>
         </div>
         
         <nav id="fh5co-main-nav" role="navigation" style="font-family: sans-serif">
            <!--  <ul class="list_menu">
               <li class="menu lst dropdown"><a href="#" class="active link_menu"><button class="dropbtn">전체 카테고리</button></a>
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
               <li><a href="../mypage/privacyUpdate.jsp">마이페이지</a></li>

            </ul>-->
         </nav>
   </header>

     <div class="container">
        <div id = "content">
        
        <!-- 마이페이지 top -->
           <div id ="myPageTop" class="page_aticle mypage_top" style="margin-top:80px; ">
             <div class="mypagetop_user">   
              <div  class="inner_mypagetop">
                 <div class="user">
                    <div class="userpro">
                       <div class="pro_wrap">
                          <strong class="profil">비트컬리프로필</strong>
                       </div>
                 
                       <div class="name">
						${sessionScope.loginUser.userName}님
                       </div>
                    </div>
                 </div> <!-- user프로필 끝 -->
                 
                 
                 <div class="list_mypage">
                    <div class="list">
                       <a href="#" class="link_wrap">
                          <div class="link_title">
                             적립금
                          <img src="https://res.kurly.com/kurly/ico/2021/arrow_right_gray_56_56.png"
                                    alt class="arrow_right">
                          </div>
                          <div class="spacer"></div>
                          <p class="info">
                             0원
                          </p>
                       </a>
                       
                       <a href ="#" class="link_wrap">
                          <div class="link_title">
                             배송지
                          <img src="https://res.kurly.com/kurly/ico/2021/arrow_right_gray_56_56.png"
                                   alt class="arrow_right">
                          </div>
                          <div class="spacer"></div>
                          <p class="info">
${sessionScope.loginUser.userAddress}
                          </p>
                       </a>
                    </div><!-- list -->
                 </div><!-- list_mypage -->
                </div><!-- inner_mypagetop -->
              </div><!-- mypagetop_user -->
           
           
           </div><!-- mypage top 끝 -->
           
                   <!-- 사이드 바 -->         
           <div class="page_aticle aticle_type2">
              <div id="snb" class="snb_my">
                 <h2 class="tit_snb">마이컬리</h2>
                 <div class="inner_snb">
                    <ul class="list_menu" style="flex-direction: column;">                  <!-- ******** -->
                       <li class="on">
                          <a href="orderList.jsp">주문 내역</a>
                       </li>
                       <li>
                          <a href="../cart/cart">장바구니</a>
                       </li>
                       
                       <li>
                          <a href="../reviewboard/list">상품 후기</a>
                       </li>
                    
                       <li>
                          <a href="privacyUpdate.jsp">개인 정보 수정</a>
                       </li>
                    </ul>
                 </div> <!-- inner snb 끝 -->
                    <a href="../qnaboard/qnaBoard.jsp" class="link_inquire">
                       <span class="emph">도움이 필요하신가요 ?<br></span>
                       "1:1 문의하기"
                    </a>   
              </div> <!-- 사이드바 끝 -->
              
                 <!-- 마이페이지 본문 시작 -->
              <div id="viewOrderList" class="page_section section_orderlist">
                 <div class="head_aticle">
                    <h2 class="tit">주문 내역
                    <span class="tit_sub">지난 1년간의 주문 내역 조회가 가능합니다.</span>
                    </h2>
                 </div>
                 
                 <div class="search_data">
                    <h3 class="screen_out">기간 선택</h3>
                    <a href="#" class="btn_layer">
                       전체기간
                    </a>
                    <ul class="layer_search">
                       <li><a href="#" class="on">전체기간</a></li>
                       <li><a href="#" data-year="2021">2021년</a></li>
                       <li><a href="#" data-year="2020">2020년</a></li>
                    </ul>
                 </div>
                 
                 <!-- 주문 리스트 -->
                 <!-- <ul class="list_order">
                    <li class="no_data">
                    주문내역이 없습니다.
                    </li> -->
<div class="shopping-cart"style="border-top:40px solid color:black">

  <div class="column-labels" style="color: #378BB3; ">
    <label class="product-image">이미지</label>
    <label class="product-details">제품</label>
    <!-- <label class="product-price">가격</label>
    <label class="product-quantity">수량</label>
    <label class="product-removal">삭제</label>
    <label class="product-line-price">총 금액</label> -->
  </div>
  <h3 style="color:rgb(122, 118, 118);">2021.03.23</h3><br>
  <div class="product">
    

    
    <div class="product-image" style="float: left;">
      <img src="https://s.cdpn.io/3/dingo-dog-bones.jpg">
    </div>
    <div class="product-details" >
      <div class="product-title" style="font-weight: bold; font-size: 20px;margin-bottom: 10px;"> 딩고 강아지 간식 외 3건</div>
      <p class="productn-orderNumber">주문번호 &nbsp;&nbsp;&nbsp;&nbsp;1960496928594859</p><br>
      <p class="product-orderPrice">결제금액 &nbsp;&nbsp;&nbsp;&nbsp;88,000원</p><br>
      <p class="product-orderStatus">주문상태 &nbsp;&nbsp;&nbsp;&nbsp;배송완료</p>
    </div>
    <div class="product-order" style="float:left; width:10%;">
      <button class="product-tracking" style="border: 0;
      padding: 4px 8px;
      background-color: #378BB3;
      color: #fff;
      
      font-size: 12px;
      border-radius: 3px;">
        배송조회
      </button>
    </div>
    <div class="product-order" style="float:left; width:13.5%;">
      <button class="remove-product"style="background-color: #378BB3;">
        교환,반품 신청
      </button>
    </div>
    <div class="product-removal" style="float:left; width:9%;">
      <button class="remove-product"style="background-color: #378BB3;">
        리뷰작성
      </button>
    </div>
  </div>

  <h3 style="color: rgb(122, 118, 118);" >2021.03.02</h3><br>
  <div class="product">
    <div class="product-image">
      <img src="https://s.cdpn.io/3/large-NutroNaturalChoiceAdultLambMealandRiceDryDogFood.png">
    </div>
    <div class="product-details">
      <div class="product-title" style="font-weight: bold;font-size: 20px;">뉴트로 강아지 간식 외 2건</div><br>
      <p class="product-description">주문번호 &nbsp;&nbsp;&nbsp;&nbsp;1960496928594859</p><br>
      <p class="product-orderPrice">결제금액 &nbsp;&nbsp;&nbsp;&nbsp;88,000원</p><br>
      <p class="product-orderStatus">주문상태 &nbsp;&nbsp;&nbsp;&nbsp;배송완료</p>
    </div>
    
    <div class="product-removal" style="float:left; width:10%;">
      <button class="remove-product"style="background-color: #378BB3;">
        배송조회
      </button>
    </div>
    <div class="product-removal" style="float:left; width:13.5%;">
      <button class="remove-product" style="background-color: #378BB3;">
        교환,반품 신청
      </button>
    </div>
    <div class="product-removal" style="float:left; width:%;">
      <button class="remove-product"style="background-color: #378BB3;">
        리뷰작성
      </button>
    </div>
  </div>

  <div style="text-align: center;padding:100px;">
    <button style="background-color: white; color: black;border: 1px solid black;text-align: center; border-radius: 3px;padding:5px;">이전</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button style="background-color: white; color: black; border: 1px solid black;text-align: center;border-radius: 3px;padding:5px">다음</button>

  </div>
                 </ul>
              </div>
              
           </div> <!-- 마이페이지 전체적인 레이아웃 (사이드바, 본문 포함 -->
         
         
      </div> <!— content —>
    </div> <!— container —>
   
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
    
    <br>
    <br>
</footer>
</body>
</html>