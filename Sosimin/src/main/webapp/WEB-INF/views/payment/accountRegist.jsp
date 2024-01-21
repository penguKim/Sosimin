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
                           	<div class="msg">페이에 등록할 계좌를 선택해주세요</div>
                            <!-- Cart Single List list -->
			                <div class="cart-single-list">
			                    <div class="row align-items-center">
			                        <div class="col-lg-2 col-md-2 col-12">
			                           예금주명
			                        </div>
			                        <div class="col-lg-6 col-md-6 col-12">
			                            <h5 class="product-name">은행명</h5>
			                            <p class="product-des">
			                                핀테크 이용번호
			                            </p>
			                        </div>
			                        <div class="col-lg-4 col-md-4 col-12">
			                             <div class="button">
			                                <button class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">등록하기</button>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <!-- End Single List list -->
                            <!-- Cart Single List list -->
			                <div class="cart-single-list">
			                    <div class="row align-items-center">
			                        <div class="col-lg-2 col-md-2 col-12">
			                           예금주명
			                        </div>
			                        <div class="col-lg-6 col-md-6 col-12">
			                            <h5 class="product-name">은행명</h5>
			                            <p class="product-des">
			                                핀테크 이용번호
			                            </p>
			                        </div>
			                        <div class="col-lg-4 col-md-4 col-12">
			                             <div class="button">
			                                <button class="btn" onclick="#">등록하기</button>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <!-- End Single List list -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
    <!-- Review Modal -->
    <div class="modal fade review-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">결제 비밀번호를 설정해주세요</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="review-name">비밀번호</label>
                                <input class="form-control" type="text" id="review-name" required
                                	placeholder="6자리 숫자를 입력해주세요">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="review-email">비밀번호확인</label>
                                <input class="form-control" type="email" id="review-email" required
                               		 placeholder="비밀번호를 다시 입력해주세요">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer button">
                    <button type="button" class="btn">등록하기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Review Modal -->
	
	
	
	
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