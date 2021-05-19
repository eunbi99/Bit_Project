<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="spms.vo.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT KURLY</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/custom.css" rel="stylesheet">
<link href="../assets/css/mypage.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/index.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
   let $id_delete = null;
   $(document).ready(function(){
      $id_delete = $("#id_delete");
      
      $id_delete.click(function(){
         let data_link = $id_delete.attr('data-link');
         data_link = data_link.replaceAll('\"', '');
         //alert(data_link);
         let pre_link = location.href;
         //alert(pre_link);
         let index = pre_link.indexOf("privacyUpdate.jsp");
         let link = pre_link.substring(0, index);
         link = link + data_link;
         //alert(link);
         location.href = link;
      });
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
   <div id="container">
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
                     <li class="on"><a href="orderList.jsp">주문 내역</a></li>
                     <li><a href="../reviewboard/list">상품 후기</a></li>

                     <li><a href="privacyUpdate.jsp">개인 정보 수정</a></li>
                  </ul>
               </div>
               <!-- inner snb 끝 -->
               <a href="../board/qnaBoard.jsp" class="link_inquire"> <span
                  class="emph">도움이 필요하신가요 ?<br></span> "1:1 문의하기"
               </a>
            </div>
            <!-- 사이드바 끝 -->

            <!-- 개인정보 수정 란 -->
            <div class="page_section section_myinfo">
               <div class="head_aticle">
                  <h2 class="tit">개인 정보 수정</h2>
               </div>
               <div class="type_form member_join member_mod">
                  <form id="form" name="frmMember" method="post" action="update">
                     <!-- 정보수정 레이아웃  -->
                     <table class="tb1_comm">
                        <tbody>
                           <tr class="fst">
                              <th>아이디</th>
                              <td><input type="text" id="currentId"
                                 value="${sessionScope.loginUser.userId}" readonly
                                 class="inp_read"></td>
                           </tr>
                           <!-- 비밀번호 -->
                           <tr>
                              <th>현재 비밀번호</th>
                              <td><input type="password" name="originalPassword"
                                 id="originalPassword" maxlength="16"
                                 placeholder="현재 비밀번호를 입력해주세요"></td>
                           </tr>

                           <tr class="member_pwd">
                              <th>새 비밀번호</th>
                              <td><input type="password" name="newPassword"
                                 id="newPassword" label="새 비밀번호" option="regPass"
                                 maxlength="16" class="reg_pw" placeholder="새 비밀번호를 입력해주세요">

                              </td>
                           </tr>

                           <tr class="member_pwd">
                              <th>새 비밀번호 확인</th>
                              <td><input type="password" name="confirmPassword"
                                 id="confirmPassword" label="새 비밀번호" option="regPass"
                                 maxlength="16" class="confirm_pw"
                                 placeholder="새 비밀번호를 다시 입력해주세요"></td>
                           </tr>

                           <tr>
                              <th>이름</th>
                              <td><input type="text" name="newName"
                                 placeholder="${sessionScope.loginUser.userName}"></td>
                           </tr>

                           <tr class="field_phone">
                              <th>휴대폰</th>
                              <td>
                                 <div class="phone_num">
                                    <input type="text"
                                       pattern="[0-9]*" name="newPhoneNum" placeholder="${sessionScope.loginUser.userPhoneNum}"
                                       class="inp" readonly>
                                 </div>
                              </td>
                           </tr>
                           
                           <tr class="adress">
                              <th>주소</th>
                              <td><input type="text" name="newAddress"
                                 placeholder="${sessionScope.loginUser.userAddress}" 
                                 ></td>
                           </tr>

                        </tbody>
                     </table>
   
                     <!--<button type="submit" class="btn active default">탈퇴하기</button>-->
                      <div id="formSubmit" class="form_footer">
                      <!-- 
                         <a href="delete?u_id=${sessionScope.loginUser.userId}">
                            <button id="id_delete" class="btn default" data-link='"delete?u_id=${sessionScope.loginUser.userId}"'>탈퇴하기</button>
                        </a>
                        -->
                        <a href='delete?u_id=${sessionScope.loginUser.userId}' class="btn default" >탈퇴하기</a>
                        <button type="submit" class="btn active">회원정보수정</button>
                     </div>
                  </form>

               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>