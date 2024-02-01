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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<script type="text/javascript">
	$(function() { // 결과영역 범위 확인
		$("#passwd").on("keypress", function() {
			let content = $("#passwd").val();
			$("#checkPasswdResult").text(content).css("color", "red");
		});
		
		$("#passwdConfirm").on("keypress", function() {
			let content = $("#passwdConfirm").val();
			$("#checkPasswd2Result").text(content).css("color", "red");
		});
		
	});
</script>
</head>
<body>
    <!-- Preloader -->
    <div class="preloader" style="opacity: 0; display: none;">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
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
                        <h1 class="page-title">로그인</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="MemberLogin"><i class="lni lni-home"></i> 로그인</a></li>
                        <li>비밀번호 재설정</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Account Login Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" method="post" action="MemberResetPasswdPro">
                        <div class="card-body">
                            <div class="title">
                                <h4>비밀번호 재설정</h4>
                                <p>새로 사용하실 비밀번호를 설정해주세요</p>
                            </div>
                            <div class="form-group">
                                <label for="reg-ln" id="mgForThreeReset">아이디</label>
                                <input class="form-control" type="text" id="reg-ln" value="${param.member_id }" readonly>
                            </div>
                            <div class="form-group">
								<label for="reg-pass" id="mgForFiveOneReset">새 비밀번호</label> 
								<input class="form-control" maxlength="16" placeholder="8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)" type="password"  name="member_password" id="password" required>
								<div id="checkPasswordResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-pass-confirm" id="mgForSevenTwoReset">새 비밀번호 확인</label> 
								<input class="form-control" maxlength="16" placeholder="비밀번호를 다시 입력해주세요" type="password" id="passwordConfirm" required>
								<div id="checkPasswordConfirmResult" class="resultArea"></div>
							</div>
	                        <div class="button" id="resetButtonArea">
                                <button class="btn" type="button" onclick='history.back();'>돌아가기</button>
                                <button class="btn" type="submit">비밀번호 수정</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Login Area -->

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