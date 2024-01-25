<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">

<!-- ========================= 자바스크립트 시작 ========================= -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
<%-- 무한스크롤 적용을 위해 페이지번호 부여 --%>
let pageNum = "1";
let maxPage = "";
let pay_history_type = "";

$(function() {
	<%-- 뒤로가기 방지 --%>
	window.addEventListener('pageshow', function(event) { <%-- 페이지가 로드되거나 새로고침 발생 이벤트 --%>
		if (event.persisted) { <%-- 뒤로가기나 앞으로가기로 이동했을 시 true 리턴 --%>
		    location.reload(); <%-- 페이지 새로고침 --%>
		}
	});	
	
	<%-- 무한스크롤 적용 --%>
	load_list(pay_history_type);
	
	$(window).scroll(function() {
		let scrollTop = $(window).scrollTop(); // 스크롤바 현재 위치
		let windowHeight = $(window).height(); // 브라우저 창 높이
		let documentHeight = $(document).height(); // 문서 높이
		console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : "+ documentHeight);
		
		if(scrollTop + windowHeight + 1 >= documentHeight) {
			pageNum++; // 페이지번호 1 층가
			
			// 페이지 번호를 계속 불러오는 현상 막기
			if(maxPage != "" && pageNum <= maxPage) {
				load_list();
			}
		}
	});
	
	$(".btn-check").change(function() {
		pay_history_type = $(this).val();
		load_list(pay_history_type);
		
		
	});
	
});

<%-- 게시물 목록을 AJAX와 JSON으로 처리하는 함수 --%>
function load_list(pay_history_type) {
	<%-- 타입별 모아보기 버튼을 위해 변수에 값 저장 --%>
	<%-- 가입자의 이용내역을 불러오기 위해 pay_id 저장 --%>
	let pay_id = $("#pay_id").val();
	console.log("pay_history_type = " + pay_history_type + ", pay_id = " + pay_id);
	
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "PayHistoryJson",
		data: {
			"pay_id": pay_id,
			"pay_history_type": pay_history_type,
			"pageNum": pageNum
		},
		dataType: "json",
		success:  function(data) {
			console.log(data);
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", error); // 예시: 에러 메시지 출력
		}
	});
	
	
	
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
	
	<!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">페이정보</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li>페이정보</li>
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
                    <div class="card login-form pay-card">
                        <div class="card-body">
                            <div class="title paytitle">
                                <h3 class="user-name">${sessionScope.sId} 님</h3> <!-- 사용자프로필/sId -->
                                <h3 class="pay-name">00페이</h3> <!-- 페이아이콘/페이 이름 결정되면 변경 -->
                            </div>
                            <div class="row">
	                           	<div class="pay-info col-lg-6 col-md-6 col-12">
									페이잔액
								</div>
	                           	<div class="pay-balance col-lg-6 col-md-6 col-12">
									${payInfo.pay_balance} 원
								</div>
								<input type="hidden" value="${payInfo.pay_id}" id="pay_id">
	                            <div class="button col-lg-6 col-md-6 col-12">
	                                <button class="btn" onclick="location.href='PayCharge'">충전하기</button>
	                            </div>
	                            <div class="button col-lg-6 col-md-6 col-12">
	                                <button class="btn" onclick="location.href='PayRefund'">환급하기</button>
	                            </div>
                            </div>
                        </div>
                     </div>   
                     <div class="card login-form">   
                        <div class="card-body">
                           	<div class="btn-group col">
						        <input type="radio" name="options" class="btn-check" id="btn-check1" value="" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check1">전체</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check2" value="1" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check2">충전</label>
						        <input type="radio" name="options"class="btn-check" id="btn-check3" value="2" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check3">환급</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check4" value="3" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check4">사용</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check5" value="4" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check5">수익</label>
							</div>
							
							<c:forEach var="history" items="${payHistory}">
	                        	<fmt:parseDate var="parsedReplyDate" value="${history.pay_history_date}" pattern="yyyy-MM-dd'T'HH:mm" type="both" />
								<!-- 페이내역 리스트 1줄 시작 -->
				                <div class="cart-single-list">
				                    <div class="row align-items-center">
				                        <div class="col-lg-2 col-md-2 col-12">
				                        	<p class="pay-info-sub">
				                        		<fmt:formatDate value="${parsedReplyDate}"  pattern="MM-dd"/>
				                        	</p>
				                        </div>
				                        <div class="col-lg-6 col-md-6 col-12">
				                            <h5 class="product-name">${history.order_id}</h5>
				                            <p class="pay-info-sub">
				                        		<fmt:formatDate value="${parsedReplyDate}"  pattern="HH:mm"/> |
				                                <c:choose>
				                                	<c:when test="${history.pay_history_type eq 1}">충전</c:when>
				                                	<c:when test="${history.pay_history_type eq 2}">환급</c:when>
				                                	<c:when test="${history.pay_history_type eq 3}">사용</c:when>
				                                	<c:when test="${history.pay_history_type eq 4}">수익</c:when>
				                                </c:choose>
				                            </p>
				                        </div>
				                        <div class="col-lg-4 col-md-4 col-12">
				                            <h5 class="pay-amount">${history.pay_amount}</h5>
				                            <p class="pay-balance-sub">
				                                잔액
				                            </p>
				                        </div>
				                    </div>
				                </div>
								<!-- 페이내역 리스트 1줄 끝 -->
							</c:forEach>
							
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