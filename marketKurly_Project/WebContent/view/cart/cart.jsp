<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--     <%@ include file="header.jsp" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT KURLY</title>
<!--  Bootstrap -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/css/custom.css" rel="stylesheet">
<link href="../assets/css/mypage.css" rel="stylesheet">
<link href="../assets/css/cart.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/index.css">

<!-- 주문내역 기간별 드롭다운 스크립트 -->
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
	let $id_price = null;
	let $id_amount = null;
	let $id_total = null;
	
    $('.search_data .btn_layer').on('click', function(e){
       e.preventDefault();
       $(this).toggleClass('on');
       $('.search_data .layer_search').slideToggle(100);
    });
    

	
    $(document).ready(function(){
    	
    	
     	$id_price = $("#id_price");
    	$id_amount = $("#id_amount");
    	$id_total = $("#id_total");
    	
        $(".checkout").click(function(){
        	alert("결제 완료.");
        });  
    	/*
        

        
        console.log("price:" + $id_price.text());
        console.log("amount:" + $id_amount.val());
        console.log("total:" + $id_total.text());
        
     	 let currentVal = Number($id_amount.val());
      	 let price = Number($id_price.text().replace(',',''));
      	 let total = price * currentVal;
      	 $id_total.text(total);
        console.log("========================================");
        
        $id_amount.on("propertychange change keyup paste input", function(){
      	 let currentVal = Number($(this).val());
      	 let price = Number($id_price.text().replace(',',''));
      	 let total = price * currentVal;
      	 $id_total.text(total);
      	 
   
         console.log("========================================");
         
           console.log("price:" + price);
           console.log("amount:" + currentVal);
           console.log("total:" + total);
        });
        
    	*/
    	let priceSum=0;
    	//최초 화면 상품금액 셋팅
    	$('.id_total').each(function (index, item) {
    		priceSum += Number($('.id_total').eq(index).text());		

		});

    	$('#cart-subtotal').text(priceSum+"원")
    	$('#id_total').text(priceSum+Number($('#cart-shipping').text())+"원");
	
		//수량선택 시 가격계산
		var $amount = $('input[name=id_amount]').on("click", function(){
			var idx = $amount.index(this);
			let currentVal = Number($(this).val()); //수량(amount) //1
			let price = $('.id_price').eq(idx).text(); //금액(price)
			
			let total = price * currentVal;
			$('.id_total').eq(idx).text(total);
			
			let totals=0;
			$('.id_total').each(function (index, item) {
				totals += Number($('.id_total').eq(index).text());
			});
			
			$('#cart-subtotal').text(totals);
			$('#id_total').text(totals+Number($('#cart-shipping').text()));
			
    	});
    });
</script>

<style>
.checkbox-container {
   position: absolute;
}
/* 기본 체크박스 없애기 */
.checkbox-container input[type="checkbox"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1%;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0
}
/* 커서에 pointer 설정 */
.checkbox-container input[type="checkbox"]+label {
   display: inline-block;
   position: relative;
   cursor: pointer;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}
/* 새로운 디자인의 체크박스 만들기 */
.checkbox-container input[type="checkbox"]+label:before {
   content: ' ';
   display: inline-block;
   width: 18px;
   height: 18px;
   line-height: 18px;
   margin: 35%;
   /* margin: 35px 0 0 75px; */
   padding: 3px;
   text-align: center;
   vertical-align: middle;
   border: 1px solid #ccc;
   border-radius: 50%;
   /* box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); */
}
/* .checkbox-container input[type="checkbox"] + label:active:before,    
    .checkbox-container input[type="checkbox"]:checked + label:active:before {
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
    
    }     */
.checkbox-container input[type="checkbox"]:checked+label:before {
   content: '\2713';
   font-weight: bold;
   color: #378bb3;
   /* text-shadow: 1px 1px white;     */
   border-color: #378bb3;
   /* box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); */
}
</style>
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
            <li class="menu none_sub menu_cart"><a href="cart"
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
                  <a href="../../view/reviewboard/list">상품후기</a>
               </div>
            </li>
         </ul>
      </div>
   </div>

   <header style="padding-bottom: 3px">
      <div class="container text-center">
         <div class="fh5co-navbar-brand">
            <a class="fh5co-logo" href="../index.jsp"> <img
               style="display: block; margin: auto; padding-top: 50px; height: 160px"
               src="../assets/images/logo.png;" href="../index.jsp">



            </a>
         </div>

         <nav id="fh5co-main-nav" role="navigation"
            style="font-family: sans-serif">
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
      <div id="content">

         <!-- 마이페이지 top -->
         <div id="myPageTop" class="page_aticle mypage_top"
            style="margin-top: 80px;">
            <div class="mypagetop_user">
               <div class="inner_mypagetop">
                  <div class="user">
                     <div class="userpro">
                        <div class="pro_wrap">
                           <strong class="profil">비트컬리프로필</strong>
                        </div>

                        <div class="name">${sessionScope.loginUser.userName}님</div>
                     </div>
                  </div>
                  <!-- user프로필 끝 -->


                  <div class="list_mypage">
                     <div class="list">
                        <a href="#" class="link_wrap">
                           <div class="link_title">
                              적립금 <img
                                 src="https://res.kurly.com/kurly/ico/2021/arrow_right_gray_56_56.png"
                                 alt class="arrow_right">
                           </div>
                           <div class="spacer"></div>
                           <p class="info">0원</p>
                        </a> <a href="#" class="link_wrap">
                           <div class="link_title">
                              배송지 <img
                                 src="https://res.kurly.com/kurly/ico/2021/arrow_right_gray_56_56.png"
                                 alt class="arrow_right">
                           </div>
                           <div class="spacer"></div>
                           <p class="info">${sessionScope.loginUser.userAddress}</p>
                        </a>
                     </div>
                     <!-- list -->
                  </div>
                  <!-- list_mypage -->
               </div>
               <!-- inner_mypagetop -->
            </div>
            <!-- mypagetop_user -->


         </div>
         <!-- mypage top 끝 -->

         <!-- 사이드 바 -->
         <div class="page_aticle aticle_type2">
            <div id="snb" class="snb_my">
               <h2 class="tit_snb">마이컬리</h2>
               <div class="inner_snb">
                  <ul class="list_menu" style="flex-direction: column;">
                     <!-- ******** -->
                     <li class="on"><a href="../mypage/orderList.jsp">주문 내역</a></li>
                     <li><a href="../cart/cart">장바구니</a></li>
                     <li><a href="../reviewboard/list">상품 후기</a></li>

                     <li><a href="../mypage/privacyUpdate.jsp">개인 정보 수정</a></li>
                  </ul>
               </div>
               <!-- inner snb 끝 -->
               <a href="../board/qnaBoard.jsp" class="link_inquire"> <span
                  class="emph">도움이 필요하신가요 ?<br></span> "1:1 문의하기"
               </a>
            </div>
            <!-- 사이드바 끝 -->

            <!-- 마이페이지 본문 시작 -->
            <div id="viewOrderList" class="page_section section_orderlist">
               <!-- <div class="head_aticle">
                  <h2 class="tit">
                     주문 내역 <span class="tit_sub">지난 1년간의 주문 내역 조회가 가능합니다.</span>
                  </h2>
               </div> 

               <div class="search_data">
                  <h3 class="screen_out">기간 선택</h3>
                  <a href="#" class="btn_layer"> 전체기간 </a>
                  <ul class="layer_search">
                     <li><a href="#" class="on">전체기간</a></li>
                     <li><a href="#" data-year="2021">2021년</a></li>
                     <li><a href="#" data-year="2020">2020년</a></li>
                  </ul>
               </div> -->

               <!-- 주문 리스트 -->
               <!-- <ul class="list_order">
                    <li class="no_data">
                    주문내역이 없습니다.
                    </li>
                 </ul> -->
               <!-- partial:index.partial.html -->
               <h1 style="font-size: 30px; padding-bottom: 15px;">장바구니</h1>
               <div class="shopping-cart" style="margin-bottom:100px;">
                  <div class="column-labels">
                    <!--  <label class="product-image" 전체선택&nbsp&nbsp|&nbsp&nbsp선택삭제</label>  -->
                     <label class="product-details" style="text-align:center";>상품명</label> 
                     <label class="product-price">가격</label> 
                     <label class="product-quantity">수량</label>
                     <label class="product-removal">삭제</label> 
                     <label class="product-line-price">&nbsp;&nbsp;총 금액&nbsp;&nbsp;</label>
                     
                  </div>
<!-- 상품 목록 보기 -->
<c:choose>
	<c:when test="${fn:length(carts) == 0}">
		<div class="slider-wrap1" style="text-align:center; margin:100px;">
			<p align="center" style="font-size: 20px;">장바구니가 비어있습니다.<br> <p style="font-size: 15px; margin : 10px;">장바구니에 물건을 담아보세요!</p> </p>
		</div>		
	</c:when>
	<c:otherwise>
		
		<c:forEach var="cart" items="${carts}" varStatus="vs">
				
		       <div class="product">
                     <div class="product-details">
                        <div class="product-title" style="font-weight: bold;">${cart.p_name}</div>
                        <div><p class="product-description">${cart.p_content}</p></div>
                     </div>
                     <div class="id_price" id="id_price${vs.count}" name="id_price" value="${cart.p_price}" class="product-price">${cart.p_price}
                     </div>
                    
               
                     <div class="product-quantity">
                        <input id="id_amount${vs.count}" name="id_amount" type="number" value="${cart.amount}" min="1">
                     </div>
   				   
                     <!-- <div id="id_total" style="text-align:center;"></div> -->
	                      <div class="product-update">
	                        <button type="submit" class="update-product">수정</button>
	                     </div>	         
                    <!-- </form> --> 
                     
                   <!--   -->

                       <div class="product-remove">
                        <button class="remove" onclick='location.href="delete?p_id=${cart.p_id}&u_id=${sessionScope.loginUser.userId}"'>삭제</button>
                     </div>
                     <div class="id_total" id="id_total${vs.count}" name="id_total" vlaue="${cart.p_price*cart.amount}" style="text-align:center;">
                     	${cart.p_price*cart.amount}
                     </div>
                  </div>

           </c:forEach>
          </c:otherwise>
</c:choose>

           

                  <div class="totals">
                     <div class="totals-item">
                        <label>상품금액</label>
                        <div class="totals-value" id="cart-subtotal">원</div>
                     </div>

                     <div class="totals-item">
                        <label>배송비</label>
                        <div class="totals-value" id="cart-shipping">2000</div>
                     </div>
                     <div class="totals-item totals-item-total">
                        <label>결제 예상 금액</label>
                         <div id="id_total">${totalSum +2000}원</div>
                     </div>
                  </div>

                  <button class="checkout">결제하기</button>

               </div>


            </div>

         </div>
         <!-- 마이페이지 전체적인 레이아웃 (사이드바, 본문 포함 -->


      </div>
   </div>
   <!-- partial -->
   <script
      src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   <script src="../assets/js/script.js"></script>


</body>
</html>