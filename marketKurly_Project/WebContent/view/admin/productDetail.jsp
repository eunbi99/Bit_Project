<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
    *{
        font-family: sans-serif;
    }  
    .com-sm-3{
        width: 500px;
    }
    
   .btn_delete, .btn_update, .btn_list {
    width:80px;
    height:45px;
    color:#fff;
    border-radius: 5px;
    border:none;
    
}
    
</style>
  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

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
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="../assets/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../assets/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="../assets/css/owl.theme.default.min.css">

	<link rel="stylesheet" href="../assets/css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<header style="padding-bottom: 3px">
		<div class="container text-center">
			<div class="fh5co-navbar-brand">
				 <a class="fh5co-logo" href="../index.jsp"><img src="../assets/images/logo.png" style="height: 110px"></a>
			</div>
			<nav id="fh5co-main-nav" role="navigation" style="font-family: sans-serif">
				<ul>
		            <li><a href="../admin/productList.jsp">상품목록</a></li>
					<li><a href="../admin/adminMember.jsp">회원목록</a></li>
					<li><a href="../admin/adminBoard.jsp">게시판목록</a></li>
            	</ul>
			</nav>
		</div>
	</header>
<!--관리자 상품 등록-->
<!-- 액션처리를 위한 값들 -->
 <section style="margin: 0 100px 0 100px ;">
 <!--  -->
<h3 style="font-weight: bold; font-family: sans-serif;">상품 개별보기</h3>
<div class="container">



<form action ="productDetail" method ='get'>
 <table class="table" style="border-top: 2px solid #333;">
	
    <tr>
   	  <td width="70" align="center">상품번호</td>
   	  <td>
   	  	   ${pVo.p_id }
   	  </td> 	

   <tr>
   	<td width="70" align="center">카테고리</td>
   	<td>
   	    ${pVo.p_category }
   	</td>

   <tr>
   	<td width="70" align="center">상품 이름</td>
   	<td>
   	    <c:out value="${pVo.p_name }"></c:out>
   	</td>
  <tr>
   	<td width="70" align="center"> 가격 </td>
   	<td>
	   	${pVo.p_price }
   	</td>
   <tr>
   	 <td width="70" align="center">상품재고</td>
   	 <td>
   	 	${pVo.p_count}
   	 </td>
  </tr>
  
   <tr>
   	<td width="70" align="center" > 상세 내용 </td>
   	<td width="300" align="left">${pVo.p_content }</td>
  </tr>
  <tr>
      <td width="70" align="center" >상품 이미지</td>
      <td><img src="${pageContext.request.contextPath}/upload/${pVo.p_file_upload}" style="height: 200px;"></td>
   <tr>
	<td align="right" colspan="2"> 
   		    <input type="submit" class="btn_update" value="상품수정" style="background-color: #378bb3 ;">
   		    
   		    <input type="button"  class="btn_delete" value="상품삭제" onclick="location.href='${pageContext.request.contextPath}/view/admin/productDelete?p_id=${pVo.p_id }'" style="background-color: #378bb3 ;">
           
            <input type="button"  onclick="location.href='${pageContext.request.contextPath}/view/admin/list'" class="btn_list" value="목록" style="background-color: #378bb3 ;">

   		</td>
  </tr>
 </table>

 </form>
 
</div>

</section>
<!--푸터-->
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



