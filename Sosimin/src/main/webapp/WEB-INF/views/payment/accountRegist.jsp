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
// 등록버튼을 눌렀을 때
function openModal(user_name, bank_name, account_num_masked, fintech_use_num) {
	$('#password-modal').modal('show'); // 모달창을 띄움
    $('#pay-password').val(''); // 비밀번호 입력창을 초기 값으로 설정
    $('#pay-password2').val(''); // 비밀번호 입력창을 초기 값으로 설정
    $('#user_name').val(user_name); // hidden 속성에 user_name를 넘김
    $('#bank_name').val(bank_name); // hidden 속성에 fintech_use_num를 넘김
    $('#account_num_masked').val(account_num_masked); // hidden 속성에 fintech_use_num를 넘김
    $('#fintech_use_num').val(fintech_use_num); // hidden 속성에 fintech_use_num를 넘김
};

$(function() {
	<%-- 뒤로가기 방지 --%>
	window.addEventListener('pageshow', function(event) { <%-- 페이지가 로드되거나 새로고침 발생 이벤트 --%>
		if (event.persisted) { <%-- 뒤로가기나 앞으로가기로 이동했을 시 true 리턴 --%>
		    location.reload(); <%-- 페이지 새로고침 --%>
		}
	});

	// 비밀번호를 입력하고 등록버튼을 눌렀을 때 
	$("#passwd-btn").click(function() {
		let regPw = /^\d{6}$/; // 6자리의 숫자를 표현한 정규표현식
		
		event.preventDefault();
		Swal.fire({
	        title: '소심페이에 계좌를<br>등록하시겠습니까?',
	        text: "등록된 계좌는 소심페이 충전과 환급에 사용됩니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '계좌등록',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	if($('#pay-password').val() != $('#pay-password2').val()) { // 비밀번호와 비밀번호 확인이 불일치하면
	        		event.preventDefault();
	        		Swal.fire({
						position: 'center',
						icon: 'error',
						title: '비밀번호가 일치하지 않습니다.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
					});
				} else if(!regPw.exec($('#pay-password').val())) { // 6자리의 숫자가 아니면
					event.preventDefault();
					Swal.fire({
						position: 'center',
						icon: 'error',
						title: '숫자 6자리를 입력해주세요.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
					});
				} else {
					$(".account-regist").submit();
				}
	        } else {
	        	$('#password-modal').modal('hide'); // 모달창 닫기
	        }
	    });
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
                        <h1 class="page-title">계좌등록</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li>계좌등록</li>
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
                           	<div class="msg">소심페이에 등록할 계좌를 선택해주세요</div>
                           
                           	<c:forEach var="account" items="${userInfo.res_list}">
	                            <!-- 계좌리스트 한 줄 시작 -->
				                <div class="cart-single-list">
				                    <div class="row align-items-center">
				                        <div class="col-lg-3 col-md-3 col-12">
				                           <p class="pay-info-sub">${userInfo.user_name}</p>
				                        </div>
				                        <div class="col-lg-5 col-md-5 col-12">
				                            <h5 class="bank-name">${account.bank_name}</h5>
				                            <p class="account-no">
				                               ${account.account_num_masked}
				                            </p>
				                        </div>
				                        <div class="col-lg-4 col-md-4 col-12">
				                             <div class="button" id="regist-btn">
				                                <button class="btn" onclick="openModal('${userInfo.user_name}', '${account.bank_name}', '${account.account_num_masked}', '${account.fintech_use_num}')">등록하기</button>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				                <!-- 계좌리스트 한 줄 끝 -->
                           	</c:forEach> 
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
               	<form action="AccountRegistPro" method="post" class="account-regist">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">결제 비밀번호를 설정해주세요</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                    <div class="row">
	                        <div class="col-sm-12">
	                            <div class="form-group">
	                                <label for="pay-password">비밀번호</label>
	                                <input class="form-control" type="password" id="pay-password" name="pay_password" required
	                                	placeholder="6자리 숫자를 입력해주세요" maxlength="6">
	                            </div>
	                        </div>
	                        <div class="col-sm-12">
	                            <div class="form-group">
	                                <label for="pay-password2">비밀번호확인</label>
	                                <input class="form-control" type="password" id="pay-password2" required
	                               		 placeholder="비밀번호를 다시 입력해주세요" maxlength="6">
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer button">
		                    <button type="submit" class="btn" id="passwd-btn">등록하기</button>
		                    <input type="hidden" id="user_name" name="user_name" value="">
		                    <input type="hidden" id="bank_name" name="bank_name" value="">
		                    <input type="hidden" id="account_num_masked" name="account_num_masked" value="">
		                    <input type="hidden" id="fintech_use_num" name="fintech_use_num" value="">
	                </div>
               	</form>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>