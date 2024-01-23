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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

<!-- ========================= 자바스크립트 시작 ========================= -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
function authAccount() {
	var width = 600; // 팝업 창의 가로 크기
    var height = 800; // 팝업 창의 세로 크기
    var left = (window.innerWidth / 2) - (width / 2); // 화면 가로 중앙에 위치
    var top = (window.innerHeight / 2) - (height / 2); // 화면 세로 중앙에 위치

    var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top;
	// 새 창을 사용하여 사용자 인증 페이지 요청
	let requestUri = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
			+ "response_type=code"
			+ "&client_id=4066d795-aa6e-4720-9383-931d1f60d1a9"
			+ "&redirect_uri=http://localhost:8081/c5d2308t1_2/callback"
			+ "&scope=login inquiry transfer"
			+ "&state=${sessionScope.state}"
			+ "&auth_type=0";
	window.open(requestUri, "authWindow", options);
	
}
</script>
</head>
<body>
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
<!-- ============================================ 메인영역 시작 ================================================================= -->	
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="card login-form">
                        <div class="card-body">
                            <div class="title paytitle">
                                <h3 class="user-name">00님</h3> <!-- 사용자프로필/sId -->
                                <h3 class="pay-name">00페이</h3> <!-- 페이아이콘/페이 이름 결정되면 변경 -->
                            </div>
                            <c:choose>
                            	<c:when test="${empty sessionScope.access_token}">
		                           	<div class="msg">계좌를 인증해주세요</div>
		                            <div class="button">
		                                <button class="btn" onclick="authAccount()">계좌인증하기</button>
		                            </div>
                            	</c:when>
                            	<c:otherwise>
		                           	<div class="msg">계좌를 등록해주세요</div>
		                            <div class="button">
		                                <button class="btn" onclick="location.href='AccountRegist'">계좌등록하기</button>
		                            </div>                            	
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	
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