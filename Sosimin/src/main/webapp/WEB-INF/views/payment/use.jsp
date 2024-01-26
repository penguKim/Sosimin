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
	
    let value = 0;
	// 가격 버튼을 클릭할 때
	$('.btn-check').click(function() {
		// 클릭한 버튼의 값을 더하기
		value += parseInt($(this).val());

		let formattedValue = value.toLocaleString();
        $('#pay-amount').val(formattedValue);	
	});
	
	// 비밀번호를 입력하고 등록버튼을 눌렀을 때 
	$("form").submit(function() {
		let regPw = /^\d{6}$/; // 6자리의 숫자를 표현한 정규표현식
		
		if(confirm("결제하시겠습니까?")) { // 컨펌창을 띄우고
			if(!regPw.exec($('#pay-password').val())) { // 6자리의 숫자가 아니면
				alert("숫자 6자리를 입력해주세요");
				return false; // 계좌가 등록되지 않음
			}
			return true;
		} 
	});
});

// 모달 창을 열 때
function openModal() {
	event.preventDefault(); 
	
    $('#password-modal').modal('show');
   	$('#pay-password').val(''); // 입력 필드를 초기 값으로 설정
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
                        <h1 class="page-title">결제하기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li>결제하기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	
<!-- ============================================ 메인영역 시작 ================================================================= -->	
	<form action="PayUsePro" method="post">	
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
	                           	<div class="complete-msg-center">거래정보</div>
	                           	<div class="complete-msg-left">판매자 : 닉네임</div>
	                           	<div class="complete-msg-left">상품명 : 게시글</div>
	                           	<div class="complete-msg-left">가격 : 가격</div>
	                           	<div class="complete-msg-left">거래유형 : <input type="radio">직거래 <input type="radio">소심거래</div>
	                        </div>
	                     </div>   
	                </div>
	            </div>
	        </div>
	
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
	                    <div class="card login-form">
	                        <div class="card-body">
	                        	<div class="complete-msg-center">페이정보</div>
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
	                                <label for="reg-fn">충전금액</label>
	                                <input class="form-control" type="text" id="pay-amount" name="pay_amount"
	                                	placeholder="충전을 원하시는 금액을 입력해주세요">
	                            </div>
	                            <div class="btn-group">
							        <input type="button" class="btn-check" id="btn-check1" value="10000" autocomplete="off">
								    <label class="btn btn-outline-primary" for="btn-check1">+1만원</label>
							        <input type="button" class="btn-check" id="btn-check2" value="30000" autocomplete="off">
								    <label class="btn btn-outline-primary" for="btn-check2">+3만원</label>
							        <input type="button" class="btn-check" id="btn-check3" value="50000" autocomplete="off">
								    <label class="btn btn-outline-primary" for="btn-check3">+5만원</label>
							        <input type="button" class="btn-check" id="btn-check4" value="100000" autocomplete="off">
								    <label class="btn btn-outline-primary" for="btn-check4">+10만원</label>
								</div>
								
	                            <div class="msg">출금 계좌 확인</div>
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
					                         <input type="hidden" name="fintech_use_num" value="${payInfo.fintech_use_num}">
				                   		</div>
				                   	</div>
	                            </div>
				                <!-- 계좌리스트 한 줄 끝 -->
	                            <div class="button">
	                                <button class="btn" id="modal-open" onclick="openModal()">결제하기</button>
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
	                                <label for="pay-password">비밀번호</label>
	                              	<input class="form-control" type="password" id="pay-password" name="pay_password"
	                                	placeholder="6자리 숫자를 입력해주세요" maxlength="6">
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer button">
	                    <button type="submit" class="btn" id="passwd-btn">결제하기</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End Review Modal -->
	</form>
	
	
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