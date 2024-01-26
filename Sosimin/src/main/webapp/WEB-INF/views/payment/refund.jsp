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
	
	let input_amount = 0; // 인풋텍스트에 입력한 값을 담을 변수
    let total_amount = 0; // 총 금액을 담을 변수
	// 가격 버튼을 클릭할 때
	$('.btn-check').click(function() {
		if(!$('#pay-amount').val() == "") {
			input_amount = parseInt($('#pay-amount').val().replace(/,/g, '')); // 인풋텍스트에 있는 값 숫자로 변환하여 대입			
		}
// 		console.log(input_amount);
		// 클릭한 버튼의 값을 더하기
		total_amount = input_amount + parseInt($(this).val());

		let formattedValue = total_amount.toLocaleString(); // 1000단위마다 ,
        $('#pay-amount').val(formattedValue);
	});
    
	// 금액에 자동으로 , 입력
	$("#pay-amount").blur(function() {
		if(!$('#pay-amount').val() == "") {
			input_amount = parseInt($('#pay-amount').val().replace(/,/g, '')); // 인풋텍스트에 있는 값 숫자로 변환하여 대입			
		}

		let formattedValue = input_amount.toLocaleString(); // 1000단위마다 ,
        $('#pay-amount').val(formattedValue);
	});
	
	// 비밀번호를 입력하고 등록버튼을 눌렀을 때 
	$("#passwd-btn").click(function() {
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
	        title: '페이머니를 환급하시겠습니까?',
	        text: "등록된 계좌로 환급이 진행됩니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '환급',
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
					$("#pay-refund").submit();
				}
	        } else {
	        	$('#password-modal').modal('hide'); // 모달창 닫기
	        }
	    });
	});

});

//모달 창을 열 때
function openModal() {
	event.preventDefault(); 
	if($('#pay-amount').val() == null || $('#pay-amount').val() == 0) {
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '환급 금액을 입력해주세요.',
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
                        <h1 class="page-title">환급하기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li>환급하기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	
<!-- ============================================ 메인영역 시작 ================================================================= -->	
	<form action="PayRefundPro" method="post" id="pay-refund">
		<div class="account-login section">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
	                    <div class="card login-form">
	                        <div class="card-body">
	                            <div class="title paytitle">
	                                <h3 class="user-name">${sessionScope.sId} 님</h3> <!-- 사용자프로필/sId -->
	                                <h3 class="pay-name">
	                                	<img src="${pageContext.request.contextPath}/resources/images/favicon.svg" height="35px">
	                                	소심페이
	                                </h3>
	                            </div>
	                            <div class="row">
		                           	<div class="pay-info col-lg-6 col-md-6 col-12">
										페이잔액
									</div>
		                           	<div class="pay-balance col-lg-6 col-md-6 col-12">
										${payInfo.pay_balance} 원
									</div>
	                            </div>
	                            <br>
	                           	<div class="form-group input-group">
	                                <label for="reg-fn">환급금액</label>
	                                <input class="form-control" type="text" id="pay-amount" name="pay_amount"
	                                	placeholder="환급을 원하시는 금액을 입력해주세요">
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
	                            <div class="msg">입금 계좌 확인</div>
	                            <!-- 계좌리스트 한 줄 시작 -->
	                            <div class="account-info">    
				                    <div class="row">
				                       <div class="col-lg-2 col-md-2 col-12" style="text-align: center;">
				                       		<img src="./resources/images/payment/${payInfo.bank_name}.png" alt="이미지" width="50px"/>
				                        </div>
				                        <div class="col-lg-10 col-md-10 col-12">
					                        <h5 class="bank-name">${payInfo.bank_name}</h5>
					                        <p class="account-no">
					                                ${payInfo.account_num_masked}
					                         </p>
					                         <input type="hidden" name="pay_id" value="${payInfo.pay_id}">
					                         <input type="hidden" name="user_name" value="${payInfo.user_name}">
					                         <input type="hidden" name="fintech_use_num" value="${payInfo.fintech_use_num}">
				                   		</div>
				                   	</div>
	                            </div>
				                <!-- 계좌리스트 한 줄 끝 -->
	                            <div class="button">
	                                <button class="btn" id="modal-open" onclick="openModal()">환급하기</button>
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
	                    <button type="submit" class="btn" id="passwd-btn">환급하기</button>
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