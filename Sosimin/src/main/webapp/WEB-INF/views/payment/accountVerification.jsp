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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">

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
			+ "&redirect_uri=http://c5d2308t1.itwillbs.com/Sosimin/callback"
			+ "&scope=login inquiry transfer"
			+ "&state=${sessionScope.state}"
			+ "&auth_type=0";
	window.open(requestUri, "authWindow", options);
}

$(function() {
	<%-- 뒤로가기 방지 --%>
	window.addEventListener('pageshow', function(event) { <%-- 페이지가 로드되거나 새로고침 발생 이벤트 --%>
		if (event.persisted) { <%-- 뒤로가기나 앞으로가기로 이동했을 시 true 리턴 --%>
		    location.reload(); <%-- 페이지 새로고침 --%>
		}
	});
	
    $("#agreeAll").on("change", function() {
        if ($("#agreeAll").prop("checked")) {
            $(":checkbox").prop("checked", true);
        } else {
            $(":checkbox").prop("checked", false);
        }
    });

    $(":checkbox[name=agree]").on("change", function() {
        var allChecked = true;
        $(":checkbox[name=agree]").each(function() {
            if (!$(this).prop("checked")) {
                allChecked = false;
                return false; // 반복문 종료
            }
        });

        $("#agreeAll").prop("checked", allChecked);
    });

    // 필수 약관에 동의해야 계좌인증 가능
    $(".btn").on("click", function() {
        if (!$("input:checkbox[name=agree]").eq(0).prop("checked")) {
        	Swal.fire({
    			position: 'center',
    			icon: 'error',
    			title: '소심페이 서비스 약관에 동의를 해주세요.',
    			showConfirmButton: false,
    			timer: 2000,
    			toast: true
    		});
        } else if (!$("input:checkbox[name=agree]").eq(1).prop("checked")) {
        	Swal.fire({
    			position: 'center',
    			icon: 'error',
    			title: '고유식별정보처리 동의를 해주세요.',
    			showConfirmButton: false,
    			timer: 2000,
    			toast: true
    		});
        } else if (!$("input:checkbox[name=agree]").eq(2).prop("checked")) {
        	Swal.fire({
    			position: 'center',
    			icon: 'error',
    			title: '개인정보 제3자 동의를 해주세요.',
    			showConfirmButton: false,
    			timer: 2000,
    			toast: true
    		});
        } else {
        	authAccount();
        }
    });
	
	
});


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
	
	<!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">계좌인증</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li>계좌인증</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
<!-- ============================================ 메인영역 시작 ================================================================= -->	
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="card login-form">
                        <div class="card-body">
                            <div class="title paytitle">
	                            <h3 class="user-name">
									<a href="MyPage">
		                                ${sessionScope.sId} 님
									</a>
	                            </h3>
                                <h3 class="pay-name">
                                	<a href="PayInfo">
	                                	<img src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png"
		                            	style="height: 40px;" id="payImage">
                                	</a>
                                </h3>
                            </div>
                           	<div class="msg">소심페이 가입하기</div>
                           	<p>소심페이에 가입하기 위해 계좌를 인증해주세요</p>
                           	<br>
                           	<input type="checkbox" class="form-check-input" id="agreeAll">
                           	<label for="agreeAll"> 약관 모두 동의</label><br>
                           	<hr>
                           	<input type="checkbox" class="form-check-input" name="agree" id="required1">
                           	<label for="required1"> (필수) 소심페이 서비스 약관</label> <a href="">(전문보기)</a> <br>
                           	<input type="checkbox" class="form-check-input" name="agree" id="required2">
                           	<label for="required2"> (필수) 고유식별정보처리 동의</label> <a href="">(전문보기)</a> <br>
                           	<input type="checkbox" class="form-check-input" name="agree" id="required3">
                           	<label for="required3"> (필수) 개인정보 제3자 동의</label> <a href="">(전문보기)</a> <br>
                            <div class="button">
                                <button class="btn">계좌인증하기</button>
                            </div>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>