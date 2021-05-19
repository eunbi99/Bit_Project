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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원가입</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

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
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
	
	<!-- 
	 -->
<style>
body.modal-open {
    overflow: visible;
}
</style>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../assets/css/signUp.css">
<script type="text/javascript">
	function registerCheck(){
		var userId = $('#userId').val();
		$.ajax({
			type:'POST',
			url: './UserRegisterCheckServlet',
			data:{userId : userId},
			success:function(result){
				if(result == 1){
					alert('사용할 수 있는 아이디입니다.');
					//$('#checkMessage').html('사용할 수 있는 아이디입니다');
					//$('#checkType').attr('class', 'modal-content panel-success');
				}
				else if(result== -2){
					alert('사용할 수 없는 아이디입니다.')
					
				}
				else {
					alert('이미 사용 중인 아이디입니다.')
					//$('#checkMessage').html('사용할 수 없는 아이디입니다');
					//$('#checkType').attr('class', 'modal-content panel-warning');
				}
				//$('#checkModal').modal('show');
			}
			
		})
	}
	
	function passwordCheck(){
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
			if(userPassword1 != userPassword2){
				$('#passwordCheckMessage').html('비밀번호를 확인해주세요');
			} else {
				$('#passwordCheckMessage').html('');
			}
	}
	
</script>

</head>

<body>
	<header style="padding-bottom: 3px">
		<div class="container text-center">
			<div class="fh5co-navbar-brand">
				<a class="fh5co-logo" href="../index.jsp"><img
					src="../assets/images/logo.png" style="height: 110px"></a>
			</div>
		</div>
	</header>
	
	

	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-2"></div>

				<div class="col-sm-8 type_form member_join">
					<div class="field_head">
						<h2 class="tit" style="font-weight: bold;">회원가입</h2>
						<!--추가-->
						<p class="sub">
							<span class="ico" style="font-family: sans-serif">*</span>필수입력사항
						</p>
					</div>
					<form action="signUp" method="post">
						<table class="table table-borderless tbl_comm">
							<tbody>
								<tr class="fst">
									<th>아이디<span class="ico">*<span class="screen_out">필수항목</span></span></th>

									<td><input type="text" maxlength="12" class="form-control"
										id="userId" name="userId" placeholder="아이디를 입력해주세요"></td>
									<td><button class="btn default" type="button" onclick="registerCheck();">
											중복확인</button></td>
								</tr>
								<tr>
									<th>비밀번호<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td><input type="password" maxlength="12" onkeyup="passwordCheck()"
										class="form-control" id="userPassword1" name="userPassword1"
										placeholder="비밀번호를 입력해주세요"></td>
								</tr>

								<tr class="member_pwd">
									<th>비밀번호확인<span class="ico">*<span
											class="screen_out">필수항목</span></span></th>
									<td>
										<input type="password" maxlength="12" onkeyup="passwordCheck()"
										class="form-control" id="userPassword2" name="userPassword2"
										placeholder="비밀번호를 한번 더 입력해주세요">
										<h5 style="color:red;" id="passwordCheckMessage"></h5>	
									</td>
										
								</tr>

								<tr>
									<th>이름<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td><input type="text" class="form-control" id="userName"
										name="userName" placeholder="이름을 입력해주세요"></td>
								</tr>

								<tr>
									<th>휴대폰<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td><input type="text" class="form-control"
										id="userPhoneNum" name="userPhoneNum" maxlength="13"
										placeholder="ex) 010-1234-1234"></td>
									<td>
										<button id="btn_cert" class="btn default" type="button"
											onclick="signUpCheck();">인증번호 받기</button>

									</td>
								</tr>



								<tr>
									<th>주소<span class="ico">*<span class="screen_out">필수항목</span></span></th>
									<td class="field_address"><input type="text"
										class="form-control" id="userAddress" name="userAddress"
										placeholder="주소를 입력해주세요"> <!-- <input type="hidden" name="zonecode" id="zonecode" size="5" value="">
										<input type="hidden" name="zipcode[]" id="zipcode0" size="3" value="">
										<input type="hidden" name="zipcode[]" id="zipcode1" size="3" value="">
										<input type="hidden" name="deliPoli" id="deliPoli" size="1" value="">
										<input type="hidden" id="baseAddressType" name="base_address_type" value="">
										<div id="selectAddress">
											<input type="text" class="form-control" name="addr" id="addr" value="" label="주소">
											<input type="hidden" name="address" id="address" value="" required="" readonly="readonly" label="주소">
											<input type="hidden" name="road_address" id="road_address" required="" value="" label="주소">
										</div> --> <!-- <a href="#none" id="addressSearch" class="search" onclick="popup('../proc/popup_address.php',530,500)">
											<span id="addressNo" class="address_no" data-text="재검색">주소 검색</span>
										</a> --> <!-- <div id="selectAddressSub">
											<input type="text" name="address_sub" id="address_sub" value="" class="byteTotext"
												placeholder="나머지 주소를 입력해주세요">
											<p id="delivery"></p>
								
										</div>
										<p class="txt_guide">
											<span class="txt txt_case1">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
										</p> --></td>
									<!--기존 textarea박스-->
									<!-- <td>
										<textarea rows="5" cols="40" name="info" class="form-control" placeholder="주소를 직접 입력해주세요ㅎ"></textarea>
									</td> -->
									<td>
										<button id="btn_cert" class="btn default" type="button"
											onclick="addressSearch();">주소 검색</button>

									</td>
								</tr>



							</tbody>
						</table>
						<input type="submit" class="btn_signup" value="가입하기" style="background-color: #378bb3;" data-bs-toggle="modal" data-bs-target="#messageModal">
					</form>
					
				</div>

			</div>
			
		</div>
		

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
	
	
	<!-- %
		String messageType = null;
		if(session.getAttribute("messageType") != null) {
			messageType = (String) session.getAttribute("messageType");
		}
		
		String messageContent = null;
		if(session.getAttribute("messageContent") != null) {
			messageContent = (String) session.getAttribute("messageContent");
		}
		
		if(messageContent != null){
			// null이 아니면 modal창에 띄워주기
	%>

		<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true" >
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div class="modal-content %if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								%= messageType %>
							</h4>
						</div>
						<div class="modal-body">
							%=messageContent %>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		 
		<script>
			$('#messageModal').appendTo("body").modal("show");
		</script>
	<!-- 
	%
		session.removeAttribute("messageType");
		session.removeAttribute("messageContent");
		}
	%>
	 -->
	<!-- 
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div id= "checkType"class="modal-content panel-info">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">
								확인 메시지
							</h4>
						</div>
						<div class="modal-body" id="checkMessage">
							%=messageContent %>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	 -->
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