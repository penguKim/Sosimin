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
                            <div class="row">
	                           	<div class="pay-info col-lg-6 col-md-6 col-12">
									페이잔액
								</div>
	                           	<div class="pay-balance col-lg-6 col-md-6 col-12">
									10,000원
								</div>
                            </div>
                            <br>
                           	<div class="form-group input-group">
                                <label for="reg-fn">환급금액</label>
                                <input class="form-control" type="email" id="reg-email" required
                                	placeholder="충전을 원하시는 금액을 입력해주세요">
                            </div>
                           	<div class="btn-group">
						        <input type="checkbox" name="options" class="btn-check" id="btn-check1" value="10000" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check1">1만원</label>
						        <input type="checkbox" name="options" class="btn-check" id="btn-check2" value="30000" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check2">3만원</label>
						        <input type="checkbox" name="options"class="btn-check" id="btn-check3" value="50000" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check3">5만원</label>
						        <input type="checkbox" name="options" class="btn-check" id="btn-check4" value="100000" autocomplete="off">
							    <label class="btn btn-outline-primary" for="btn-check4">10만원</label>
							</div>
                            
                            <div class="msg">입금 계좌 확인</div>
                             <!-- 계좌리스트 한 줄 시작 -->
                            <div class="account-info">    
			                    <div class="row">
			                        <div class="col-lg-3 col-md-3 col-12">
			                           은행마크
			                        </div>
			                        <div class="col-lg-9 col-md-9 col-12">
				                        <h5 class="bank-name">은행명</h5>
				                        <p class="account-no">
				                                계좌번호
				                         </p>
			                   		</div>
			                   	</div>
                            </div>
			                <!-- 계좌리스트 한 줄 끝 -->
                            <div class="button">
                                <button class="btn" data-bs-toggle="modal" data-bs-target="#password-modal">환급하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	
    <!-- Review Modal -->
    <div class="modal review-modal" id="password-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">결제 비밀번호를 입력해주세요</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="review-name">비밀번호</label>
                                <input class="form-control" type="password" id="review-name" required
                                	placeholder="6자리 숫자를 입력해주세요">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer button">
                    <button type="button" class="btn" onclick="location.href='PayRefundComplete'">환급하기</button>
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