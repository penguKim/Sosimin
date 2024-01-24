<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Sosimin</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
<script type="text/javascript">
	$(function() { // 결과영역 범위 확인
		$("#id").on("keypress", function() {
			let content = $("#id").val();
			$("#checkIdResult").text(content).css("color", "red");
		});

		$("#name").on("keypress", function() {
			let content = $("#name").val();
			$("#checkNameResult").text(content).css("color", "red");
		});
		
		$("#passwd").on("keypress", function() {
			let content = $("#passwd").val();
			$("#checkPasswdResult").text(content).css("color", "red");
		});
		
		$("#passwdConfirm").on("keypress", function() {
			let content = $("#passwdConfirm").val();
			$("#checkPasswd2Result").text(content).css("color", "red");
		});
		
		$("#birthdate").on("blur", function() {
			let content = $("#birthdate").val();
			$("#checkBirthResult").text(content).css("color", "red");
		});

		$("#email").on("keypress", function() {
			let content = $("#email").val();
			$("#checkEmailResult").text(content).css("color", "red");
		});
		
	});
</script>
</head>
<body>
	<!-- Preloader -->
	<div class="preloader" style="opacity: 0; display: none;">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	<!-- Start Header Area -->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- End Header Area -->

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">회원가입</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html"><i class="lni lni-home"></i>
								Home</a></li>
						<li>회원가입</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Account Register Area -->
	<div class="account-login section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
					<div class="register-form">
						<h4>회원 정보 입력</h4>
						<br>
						<br>

						<form action="MemberJoinComplete" class="row" method="post">
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-fn" id="mgForTwo">이름</label> 
									<input class="form-control" placeholder="2~5글자의 한글" type="text" id="name" required>
									<div id="checkNameResult" class="resultArea"></div>
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group" >
									<label for="reg-ln" id="mgForThree">아이디</label> 
									<input class="form-control" placeholder="5~20자의 영문 대/소문자, 숫자" type="text" id="id" required>
									<input type="button" value="중복확인">
									<div id="checkIdResult" class="resultArea"></div>
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-ln" id="mgForThree">닉네임</label> 
									<input class="form-control" type="text" id="nickname" required>
									<input type="button" value="중복확인">
								</div>
<!-- 							</div> -->

<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-pass" id="mgForFour">비밀번호</label> 
									<input class="form-control" placeholder="8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)" type="password" id="passwd" required>
									<div id="checkPasswdResult" class="resultArea"></div>
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-pass-confirm" id="mgForSix">비밀번호 확인</label> 
									<input class="form-control" placeholder="비밀번호를 다시 입력해주세요" type="password" id="passwdConfirm" required>
									<div id="checkPasswd2Result" class="resultArea"></div>
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-ln" id="mgForFour">생년월일</label> 
									<input class="form-control" placeholder="숫자만 입력해주세요" type="date" id="birthdate" required>
									<div id="checkBirthResult" class="resultArea"></div>
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-ln" id="mgForTwo">주소</label> 
									<input class="form-control" type="text" id="address" required>
									<input type="button" value="동네인증">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-email" id="mgForThree">이메일</label> 
									<input class="form-control" type="email" id="email" required>
									<input type="button" value="중복확인">
									<div id="checkEmailResult" class="resultArea"></div>
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-phone" id="mgForFive">휴대폰번호</label> 
									<input class="form-control" placeholder="숫자만 입력해주세요" type="tel" id="phone" required>
									<input type="button" value="인증">
								</div>
<!-- 							</div> -->

							<div class="button">
								<button class="btn" type="button">돌아가기</button>
								<button class="btn" type="submit">가입완료</button>
							</div>
							<p class="outer-link">
								이미 계정이 있나요? <a href="MemberLogin">로그인 하기</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Account Register Area -->

<!-- ============================================ 메인영역 끝 ================================================================= -->	
	<footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
	
</body>
</html>