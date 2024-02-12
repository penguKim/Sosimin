<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
$(function() {
	<%-- 뒤로가기 방지 --%>
	window.addEventListener('pageshow', function(event) { <%-- 페이지가 로드되거나 새로고침 발생 이벤트 --%>
		if (event.persisted) { <%-- 뒤로가기나 앞으로가기로 이동했을 시 true 리턴 --%>
		    location.reload(); <%-- 페이지 새로고침 --%>
		}
	});
});
</script>
<style type="text/css">
.effect1{
    color: #39d274;
    animation-name: example1;
    animation-duration: 5s;
}

@keyframes example1 {
    from {color: #f9f9f9;}
    to {color: #39d274;}
}

.effect2{
    color: #ff0000;
    animation-name: example2;
    animation-duration: 5s;
}

@keyframes example2 {
    from {color: #f9f9f9;}
    to {color: #ff0000;}
}
</style>
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
                        <h1 class="page-title">결제하기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="PayUse">결제하기</a></li>
                        <li>결제완료</li>
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
                            <div class="complete">
                            	<c:choose>
                            		<c:when test="${payInfo.result eq 'use_success'}">
		                            	<div class="material-icons effect1" style="font-size:40px;">check_circle</div>
		                            	<div class="complete-msg">
		        	                    	<c:set var="payBalance" value="${order_amount}" />
											<fmt:formatNumber value="${payBalance}" pattern="#,##0" />원 결제 완료
		                            	</div>
                            		</c:when>
                            		<c:when test="${payInfo.result eq 'use_refused'}">
		                            	<div class="material-icons effect2" style="font-size:40px;">check_circle</div>
		                            	<div class="complete-msg">
		                            		<c:set var="payBalance" value="${order_amount}" />
											<fmt:formatNumber value="${payBalance}" pattern="#,##0" />원 결제 실패
		                            	</div>
                            		</c:when>
                            	</c:choose>
                            </div>
                           	<hr id="hr">
                            <div class="row">
	                           <c:if test="${pay_amount ne null && pay_amount ne '' && pay_amount > 0}">
		                           	<div class="complete-msg-left col-lg-4 col-md-4 col-12">
										출금계좌
									</div>
		                           	<div class="complete-msg-right col-lg-8 col-md-8 col-12">
										${payInfo.bank_name} ${payInfo.account_num_masked}
									</div>
		                           	<div class="complete-msg-left col-lg-4 col-md-4 col-12">
										충전금액
									</div>
		                           	<div class="complete-msg-right col-lg-8 col-md-8 col-12">
			                           	<c:set var="payCharge" value="${pay_amount}" />
										<fmt:formatNumber value="${payCharge}" pattern="#,##0" />원
									</div>
	                           	</c:if>
	                           	<div class="complete-msg-left col-lg-4 col-md-4 col-12">
									결제 금액
								</div>
	                           	<div class="complete-msg-right col-lg-8 col-md-8 col-12">
	                           		<c:set var="orderAmount" value="${order_amount}" />
									<fmt:formatNumber value="${orderAmount}" pattern="#,##0" />원
								</div>
	                           	<div class="complete-msg-left col-lg-4 col-md-4 col-12">
									페이 잔액
								</div>
	                           	<div class="complete-msg-right col-lg-8 col-md-8 col-12">
	                        	   	<c:set var="payBalance" value="${payInfo.pay_balance}" />
									<fmt:formatNumber value="${payBalance}" pattern="#,##0" />원
								</div>
							</div>
							<hr id="hr">
							<div class="row">
								<p class="info-msg">- 페이머니는 환급하기 페이지에서 무료로 즉시 인출 가능합니다</p>
	                            <div class="button col-lg-6 col-md-6 col-12">
	                                <button class="btn" onclick="location.href='MyPage?member_id=leess&category=2'">구매 내역보기</button>
	                            </div>
	                            <div class="button col-lg-6 col-md-6 col-12">
	                            	<c:choose>
										<c:when test="${payInfo.result eq 'use_success'}">
			                                <button class="btn" onclick="location.href='PayInfo'">페이 내역 보기</button>
	                            		</c:when>
										<c:when test="${payInfo.result eq 'use_refuse'}">
			                                <button class="btn" onclick="location.href='SearchProduct'">상품 목록 보기</button>
	                            		</c:when>
	                            	</c:choose>
	                            </div>
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