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
	if (performance.navigation.type === 2) { <%-- 0 : 처음 로딩/새로고침, 1 : 페이지가 앞/뒤로 이동, 2 : 페이지가 뒤로 이동  --%>
		location.reload(); // 새로고침
	}	
	
	let input_amount = 0; // 인풋텍스트에 입력한 값을 담을 변수
    let total_amount = 0; // 총 금액을 담을 변수
	// 가격 버튼을 클릭할 때
	$('.btn-check').click(function() {
		if(!$('#pay-amount').val() == "") {
			input_amount = parseInt($('#pay-amount').val().replace(/,/g, '')); // 인풋텍스트에 있는 값 숫자로 변환하여 대입			
		}
		// 클릭한 버튼의 값을 더하기
		
		console.log(total_amount);
		if(total_amount < 999999999) {
			total_amount = input_amount + parseInt($(this).val());
		} else {
			total_amount = input_amount;
		}
		
		if(total_amount >= 999999999) {
			total_amount = 999999999;
		}

		let formattedValue = total_amount.toLocaleString(); // 1000단위마다 ,
        $('#pay-amount').val(formattedValue);
	});
    
	<%-- 비밀번호 입력창에서 엔터 키 이벤트 처리 --%>
	$("#pay-password").keydown(function(event) {
		if (event.keyCode === 13) { // 엔터 키 코드
			event.preventDefault(); // 기본 동작(페이지 새로고침) 방지
	
			// 버튼 클릭 이벤트 실행
			submitBtn();
		}
	});


});


// 비밀번호를 입력하고 등록버튼을 눌렀을 때 
function submitBtn() {
	// 비밀번호 일치 여부 확인
	let input_passwd = $('#pay-password').val();
	let is_correct_passwd = false;
	
	console.log("input_passwd = " + input_passwd + ", is_correct_passwd = " + is_correct_passwd)
	
	$.ajax({
		type: "GET",
		url: "PasswdCheck",
		data: {
			"input_passwd": input_passwd
		},
		success:  function(data) {
			if(data == "true") {
				is_correct_passwd = true;
			}
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
	
	let regPw = /^\d{6}$/; // 6자리의 숫자를 표현한 정규표현식
		
	event.preventDefault();
	Swal.fire({
        title: "결제하시겠습니까?",
        text: "확인을 누르시면 결제가 완료됩니다.",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#39d274',
        cancelButtonColor: '#d33',
        confirmButtonText: "결제",
        cancelButtonText: '취소',
        reverseButtons: true,
    }).then((result) => {
        if (result.isConfirmed) {
        	if(!regPw.exec($('#pay-password').val())) { // 6자리의 숫자가 아니면
				event.preventDefault();
				$('#pay-password').val('');
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '숫자 6자리를 입력해주세요.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			} else if(!is_correct_passwd) { // 비밀번호가 일치하지 않으면
        		event.preventDefault();
        		$('#pay-password').val('');
        		Swal.fire({
					position: 'center',
					icon: 'error',
					title: '비밀번호가 일치하지 않습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			} else {
				$("#pay-use").submit();
			}
        } else {
        	$('#password-modal').modal('hide'); // 모달창 닫기
        }
    });
}

// 모달 창을 열 때
function openModal() {
	event.preventDefault(); 
	if($('#pay-amount').val() == null || $('#pay-amount').val() == 0) {
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '금액을 입력해주세요.',
			showConfirmButton: false,
			timer: 2000,
			toast: true
		});
		$('#pay-amount').focus();
	} else {
	    $('#password-modal').modal('show');
    	$('#pay-password').val(''); // 입력 필드를 초기 값으로 설정
	}
} 

//가격이 넘어가지 못하도록 막기
function price(input) {
	  
	var payAmount = $("#pay-amount");

	// 숫자 이외의 값을 입력 못하게한다.
	var value = input.value.replace(/[^0-9]/g, '');
	if (value.length > 9) {
		value = value.substring(0, 9);
	}
	    
	// 금액에 자동으로 , 입력
	var formattedValue = Number(value).toLocaleString();
		input.value = formattedValue;
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
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li>결제하기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	
<!-- ============================================ 메인영역 시작 ================================================================= -->	
	<form action="PaymentPro" method="post" id="pay-use">	
		<div class="account-login section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
	                    <div class="card login-form pay-card">
	                        <div class="card-body">
	                            <div class="title paytitle" id="payment-title">
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
	                           	<div class="msg">상품 정보</div>
	                           	<div class="account-info">    
		                           	<div class="row">
					                	<div class="col-lg-3 col-md-3 col-12 product-img">
					                		<img src="${pageContext.request.contextPath}/resources/upload/${productInfo.product_image1}">
					                	</div>
					                	<div class="col-lg-9 col-md-9 col-12">
					      					<p class="product-info row">
					      						<span class="name_span col-lg-4 col-md-4 col-12">판 매 자</span> 
					      						<span class="value_span col-lg-8 col-md-8 col-12">:&nbsp;&nbsp;${productInfo.member_id}</span>
					      					</p>
				                           	<p class="product-info row">
				                           		<span class="name_span col-lg-4 col-md-4 col-12">상 품 명</span>
												<span class="value_span col-lg-8 col-md-8 col-12">:&nbsp;&nbsp;${productInfo.product_name}</span>
											</p>
				                           	<p class="product-info row">
				                           		<span class="name_span col-lg-4 col-md-4 col-12">가 격</span> 
				                           		<span class="value_span col-lg-8 col-md-8 col-12">:&nbsp;&nbsp;
				                           			<c:set var="product_price" value="${productInfo.product_price}" />
													<fmt:formatNumber value="${product_price}" pattern="#,##0" />원
												</span>
				                           	</p>
				                           	<p class="product-info row">
				                           		<span class="name_span col-lg-4 col-md-4 col-12">거 래 방 법</span> 
				                           		<span class="value_span col-lg-8 col-md-8 col-12">:&nbsp;&nbsp;
				                           			<c:if test="${productInfo.trade_method eq 0}">대면거래</c:if>
				                           			<c:if test="${productInfo.trade_method eq 1}">소심거래</c:if>
				                           		</span>
				                           	</p>
				                           	<input type="hidden" value="${productInfo.product_id}" name="product_id">
				                           	<input type="hidden" value="${productInfo.product_price}" name="product_price">
					                   	</div>
					                 </div>
		                        </div>
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
	                            <div class="row">
		                           	<div class="pay-info col-lg-6 col-md-6 col-12">
										페이잔액
									</div>
		                           	<div class="pay-balance col-lg-6 col-md-6 col-12">
										<c:set var="payBalance" value="${payInfo.pay_balance}" />
										<fmt:formatNumber value="${payBalance}" pattern="#,##0" />원
										<input type="hidden" value="${payInfo.pay_balance}" name="pay_balance">
									</div>
	                            </div>
	                            <br>
	                            <div class="form-group input-group">
	                                <label for="pay-amount">결제금액</label>
	                                <fmt:formatNumber value="${productInfo.product_price}" pattern="###,###" var="formattedPrice" />
									<input class="form-control" type="text" id="pay-amount" name="order_amount" oninput="price(this)" maxlength="11"
										value="${formattedPrice}">
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
								<hr>
								<p class="info-msg">페이 잔액이 부족하면 다음 계좌에서 출금이 진행됩니다.</p>
								<br>
	                            <!-- 계좌리스트 한 줄 시작 -->
	                            <div class="account-info">    
				                    <div class="row">
				                       <div class="col-lg-2 col-md-2 col-12" style="text-align: center;">
				                       		<img src="./resources/images/payment/${payInfo.bank_name}.png" alt="이미지" width="50px"/>
				                        </div>
				                        <div class="col-lg-6 col-md-6 col-12">
					                        <h5 class="bank-name">${payInfo.bank_name}</h5>
					                        <p class="account-no">
					                                ${payInfo.account_num_masked}
					                         </p>
					                         <input type="hidden" name="pay_id" value="${payInfo.pay_id}">
					                         <input type="hidden" name="user_name" value="${payInfo.user_name}">
					                         <input type="hidden" name="fintech_use_num" value="${payInfo.fintech_use_num}">
				                   		</div>
				                   		<div class="button col-lg-4 col-md-4 col-12" id="regist-btn" >
				                   			<input type="button" class="btn" onclick="location.href='AccountRegist'" value="변경하기">
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
	                              	<input class="form-control" type="password" id="pay-password"
	                                	placeholder="6자리 숫자를 입력해주세요" maxlength="6">
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer button">
	                    <button type="button" class="btn" id="passwd-btn" onclick="submitBtn()">결제하기</button>
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