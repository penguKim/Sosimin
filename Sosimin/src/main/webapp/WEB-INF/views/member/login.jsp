<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<%-- sweetalert --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#joinWithKakao").on("click", function() {
			Swal.fire({
				position: 'center',
				icon: 'warning',
				title: '서비스 준비 중입니다!',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
		});
		
		$("#joinWithNaver").on("click", function() {
			Swal.fire({
				position: 'center',
				icon: 'warning',
				title: '서비스 준비 중입니다!',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
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
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li>로그인</li>
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
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12 d-flex justify-content-center">
                    <form class="card login-form" method="post" action="MemberLoginPro">
                        <div class="card-body">
                            <div class="title">
                                <h4>소시민 로그인</h4>
                                <p>소셜 로그인도, 일반 로그인도 가능!</p>
                            </div>
                            <div class="social-login" id="socialLoginArea">
                                <div class="row d-flex justify-content-center">
                                	<div class="col-lg-4 col-md-4 col-12" id="naver_id_login">
                                		<a class="btn facebook-btn" id="joinWithNaver" href="javascript:void(0)">
                                			<img id="socialIcons" src="${pageContext.request.contextPath}/resources/images/member/naver_circle.png" width="20px" height="20px"/>
	                                		네이버로 로그인
                                		</a>
                                	</div>
                                    <div class="col-lg-4 col-md-4 col-12">
	                                    <a class="btn twitter-btn" id="joinWithKakao" href="javascript:void(0)">
	                                    	<img id="socialIcons" src="${pageContext.request.contextPath}/resources/images/member/kakao_circle.png" width="20px" height="20px">
<!-- 	                                    	<i class="lni lni-facebook-filled"></i>  -->
	                                    	카카오로 로그인
	                                    </a>
                                    </div>
                                </div>
                            </div>
                            <div class="alt-option">
                                <span>또는</span>
                            </div>
                            <div class="form-group">
                                <label for="reg-ln" id="mgForThree">아이디</label>
                                <c:choose>
                                	<c:when test="${not empty param.member_id }">
		                                <input class="form-control" type="text" name="member_id" value="${param.member_id }" required>
                                	</c:when>
                                	<c:otherwise>
		                                <input class="form-control" type="text" name="member_id" value="${cookie.cookieId.value }" required>
                                	</c:otherwise>
                                </c:choose>
                                
                            </div>
                            <div class="form-group">
                                <label for="reg-fn" id="mgForFour">비밀번호</label>
                                <input class="form-control" type="password" name="member_password" required>
                            </div>
                            <div class="d-flex flex-wrap justify-content-between bottom-content">
                                <div class="form-check" id="rememberIdArea">
                                    <input type="checkbox" class="form-check-input width-auto" id="rememberId" name="rememberId"<c:if test="${not empty cookie.cookieId.value}">checked</c:if>>
                                    <label class="form-check-label" for="rememberId">아이디 기억하기</label>
                                </div>
                                <div id="findArea">
	                                <a class="lost-pass d-flex justify-content-end" href="MemberFindId">아이디 찾기</a>
	                                <a class="lost-pass d-flex justify-content-end" href="MemberFindPasswd">비밀번호 찾기</a>
                                </div>
                            </div>
                            <div class="button">
                                <button class="btn" type="submit">로그인</button>
                            </div>
                            <p class="outer-link" id="joinSuggestion">소시민이 아니신가요? <a href="MemberJoin">회원가입 하러가기 </a>
                            </p>
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