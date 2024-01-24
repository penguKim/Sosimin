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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

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
									10,000원
								</div>
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
						        <input type="radio" name="options" class="btn-check" id="btn-check1" value="전체" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check1">전체</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check2" value="충전" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check2">충전</label>
						        <input type="radio" name="options"class="btn-check" id="btn-check3" value="환급" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check3">환급</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check4" value="사용" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check4">사용</label>
						        <input type="radio" name="options" class="btn-check" id="btn-check5" value="수익" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check5">수익</label>
							</div>
							<!-- 페이내역 리스트 1줄 시작 -->
			                <div class="cart-single-list">
			                    <div class="row align-items-center">
			                        <div class="col-lg-2 col-md-2 col-12">
			                           <p class="pay-info-sub">날짜</p>
			                        </div>
			                        <div class="col-lg-6 col-md-6 col-12">
			                            <h5 class="product-name">상품명</h5>
			                            <p class="pay-info-sub">
			                                시간 | 유형
			                            </p>
			                        </div>
			                        <div class="col-lg-4 col-md-4 col-12">
			                            <h5 class="pay-amount">사용금액</h5>
			                            <p class="pay-balance-sub">
			                                잔액
			                            </p>
			                        </div>
			                    </div>
			                </div>
							<!-- 페이내역 리스트 1줄 끝 -->
							<!-- 페이내역 리스트 1줄 시작 -->
			                <div class="cart-single-list">
			                    <div class="row align-items-center">
			                        <div class="col-lg-2 col-md-2 col-12">
			                           <p class="pay-info-sub">날짜</p>
			                        </div>
			                        <div class="col-lg-6 col-md-6 col-12">
			                            <h5 class="product-name">상품명</h5>
			                            <p class="pay-info-sub">
			                                시간 | 유형
			                            </p>
			                        </div>
			                        <div class="col-lg-4 col-md-4 col-12">
			                            <h5 class="pay-amount">사용금액</h5>
			                            <p class="pay-balance-sub">
			                                잔액
			                            </p>
			                        </div>
			                    </div>
			                </div>
							<!-- 페이내역 리스트 1줄 끝 -->
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