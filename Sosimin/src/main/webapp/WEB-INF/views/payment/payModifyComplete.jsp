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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

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
                        <h1 class="page-title">충전하기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="PayCharge">충전하기</a></li>
                        <li>충전완료</li>
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
                                <h3 class="pay-name">
                                	<img src="${pageContext.request.contextPath}/resources/images/favicon.svg" height="35px">
                                	소심페이
                                </h3>
                            </div>
                            <div class="complete">
                            	<c:choose>
                            		<c:when test="${payInfo.result eq 'charge_success'}">
			                            <div class="material-icons effect1" style="font-size:40px;">check_circle</div>
		    	                        <div class="complete-msg">${payInfo.pay_amount} 원 충전 완료</div>
                            		</c:when>
                            		<c:when test="${payInfo.result eq 'charge_refused'}">
			                            <div class="material-icons effect2" style="font-size:40px;">check_circle</div>
    	                    		    <div class="complete-msg">${payInfo.pay_amount} 원 충전 실패</div>
                            		</c:when>
                            		<c:when test="${payInfo.result eq 'refund_success'}">
			                            <div class="material-icons effect1" style="font-size:40px;">check_circle</div>
		    	                        <div class="complete-msg">${payInfo.pay_amount} 원 환급 완료</div>
                            		</c:when>
                            		<c:when test="${payInfo.result eq 'refund_refused'}">
			                            <div class="material-icons effect2" style="font-size:40px;">check_circle</div>
    	                    		    <div class="complete-msg">${payInfo.pay_amount} 원 환급 실패</div>
                            		</c:when>
                            		<c:otherwise></c:otherwise>
                            	</c:choose>
                            </div>
                            <hr>
                            <div class="row">
	                           	<div class="complete-msg-left col-lg-6 col-md-6 col-12">
									페이잔액
								</div>
	                           	<div class="complete-msg-right col-lg-6 col-md-6 col-12">
									${payInfo.pay_balance} 원
								</div>
	                           	<div class="complete-msg-left col-lg-6 col-md-6 col-12">
									<c:choose>
										<c:when test="${payInfo.result eq 'charge_success' or payInfo.result eq 'refund_refused'}">
				                            출금계좌
	                            		</c:when>
	                            		<c:when test="${payInfo.result eq 'charge_refused' or payInfo.result eq 'refund_success'}">
				                           	입금계좌
	                            		</c:when>
	                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
								</div>
	                           	<div class="complete-msg-right col-lg-6 col-md-6 col-12">
									${payInfo.bank_name} ${payInfo.account_num_masked}
								</div>
								<hr id="hr">
								<p class="info-msg">- 페이머니는 환급하기 페이지에서 무료로 즉시 인출 가능합니다</p>
			                    <div class="button col-lg-6 col-md-6 col-12">
	                            	<c:choose>
										<c:when test="${payInfo.result eq 'charge_success'}">
				                        	<button class="btn" onclick="location.href='PayCharge'">추가 충전하기</button>
	                            		</c:when>
	                            		<c:when test="${payInfo.result eq 'charge_refused'}">
				                        	<button class="btn" onclick="location.href='PayCharge'">다시 충전하기</button>
	                            		</c:when>
										<c:when test="${payInfo.result eq 'refund_success'}">
				                        	<button class="btn" onclick="location.href='PayRefund'">추가 환급하기</button>
	                            		</c:when>
	                            		<c:when test="${payInfo.result eq 'refund_refused'}">
				                        	<button class="btn" onclick="location.href='PayRefund'">다시 환급하기</button>
	                            		</c:when>
	                            		<c:otherwise></c:otherwise>
	                            	</c:choose>
								</div>
	                            <div class="button col-lg-6 col-md-6 col-12">
	                                <button class="btn" onclick="location.href='PayInfo'">내역보기</button>
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