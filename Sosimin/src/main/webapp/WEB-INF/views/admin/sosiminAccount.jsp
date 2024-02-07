<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Sosimin</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/quill.snow.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/quill.bubble.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/remixicon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/style2.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/admin/style.css" rel="stylesheet">
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- bootstrap-icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- =======================================================
* Template Name: NiceAdmin
* Updated: Jan 09 2024 with Bootstrap v5.3.2
* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
======================================================== -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
$(function() {
	// 금액에 자동으로 , 입력
	$("#new-balance").keyup(function() {
	    var inputText = $(this).val();
	    var formattedText = formatNumber(inputText);
	    $(this).val(formattedText);
	});
	
	$("#refund-balance").keyup(function() {
	    var inputText = $(this).val();
	    var formattedText = formatNumber(inputText);
	    $(this).val(formattedText);
	});
	
	function formatNumber(number) {
	    // 숫자에서 쉼표 제거
	    var plainNumber = number.replace(/,/g, '');
	    // 숫자를 1000단위로 쉼표로 구분하여 포맷팅
	    var formattedNumber = plainNumber.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    return formattedNumber;
	}

	
	// 모달창을 열 때 값을 초기화
	$("#modify").click(function() {
		let balance = ${payList.pay_balance};
		let formattedBalance = balance.toLocaleString(); // 1000 단위로 쉼표가 찍히는 형식으로 변환
		$("#new-balance").val(formattedBalance); // 변환된 값을 원하는 요소에 설정
		$("#new-status").val("${payList.pay_status}");		
		$("#new-passwd1").val("");		
		$("#new-passwd2").val("");		
		
	});
	
	
});

	// 정보 변경을 눌렀을 때 에이젝스 요청
	function CheckPayInfo(pay_id) {
		
		event.preventDefault(); 
		
		Swal.fire({
	        title: '해당 고객의 페이정보를 수정하시겠습니까?',
	        text: "확인을 누르시면 수정이 진행됩니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#0d6efd',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '수정',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	    	if (result.isConfirmed) {
				let pay_balance = $("#new-balance").val();
				let pay_status = $("#new-status").val();
				let pay_password = $("#new-passwd1").val();
				let pay_password2 = $("#new-passwd2").val();
				let existing_balance = ${payList.pay_balance};
				
		// 		console.log("pay_balance = " + pay_balance + ", pay_status = " + pay_status + ", pay_password = " + pay_password);				
				
				// 입력값이 있다면 입력값을 검증
				let isCorrect = true; // 입력값 검증에 사용할 변수 선언
				
				input_amount = parseInt(pay_balance.replace(/,/g, ''));
				existing_balance = parseInt(existing_balance);
				
				let regex = /^[^-]*$/;
				if(pay_balance != null && pay_balance != "") {
					event.preventDefault(); 
					if(!regex.test(pay_balance)) {
						event.preventDefault();
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '0 이상의 값만 입력 가능합니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
						isCorrect = false;
						$("#new-balance").focus();
					}
				}
				
				let regPw = /^\d{6}$/;
				if(pay_password != null && pay_password != "") {
					if(!regPw.test(pay_password)) {
						event.preventDefault();
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '숫자 6자리를 입력해주세요.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
						isCorrect = false;
						$("#new-passwd1").focus();
					} else if(pay_password != pay_password2) {
						event.preventDefault();
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '비밀번호가 일치하지 않습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
						isCorrect = false;
						$("#new-passwd2").focus();
					}
				
				}
		
				// 패스워드 확인 에이젝스 재사용
				let is_correct_passwd = false; // 불일치(=변경가능)
				
				if(isCorrect) { // 검증이 잘 된 경우에만 에이젝스 실행
					$.ajax({
						type: "GET",
						url: "PasswdCheck",
						data: {
							"input_passwd": pay_password
						},
						success:  function(data) {
							if(data == "true") {
								is_correct_passwd = true; // 일치(=변경할 필요 없음)
							}
							
							if(pay_balance == ${payList.pay_balance} && pay_status == ${payList.pay_status} && is_correct_passwd) { // 변경값이 없으면
								event.preventDefault();
								Swal.fire({
									position: 'center',
									icon: 'error',
									title: '변경된 정보가 없습니다.',
									showConfirmButton: false,
									timer: 2000,
									toast: true
								});
							} else {
								if(input_amount == existing_balance) { // 금액이 같으면
									pay_balance = null; // null값 세팅
								}
								
								if(pay_status == ${payList.pay_status}) { // 상태 변경이 없으면
									pay_status = null; // null값 세팅
								}
								
								if(is_correct_passwd) { // 비밀번호 변경이 없으면
									pay_password = null; // null값 세팅
								}
								
								if(pay_balance == null && pay_status == null && pay_password == null) { // 변경할 값이 없으면
									Swal.fire({
										icon: 'error',
										title: '정보 변경에 실패했습니다.',
										confirmButtonColor: '#0d6efd',
										confirmButtonText: '확인',
										allowOutsideClick: false
									});
									console.log(pay_balance + pay_status + is_correct_passwd);									
								} else {
									ChangePayInfo(pay_id, pay_balance, pay_status, pay_password); // 변경 요청 진행
								}
								
							}
							
						},
						error: function(request, status, error) {
					      // 요청이 실패한 경우 처리할 로직
					      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
						}
					});
				}
	    	} else {
	        	$('#modal-${pay_list.pay_history_id}').modal('hide'); // 모달창 닫기
	        }
	    	
	    });
	}
	
	// 잔액, 상태, 비밀번호 중 변경값이 있을 때에만 변경 진행
	function ChangePayInfo(pay_id, pay_balance, pay_status, pay_password) {
		console.log("ChangePayInfo 실행됨" + pay_id);

		// 변경을 위해 ajax 요청
		$.ajax({
			type: "GET",
			url: "ChangePayInfo",
			data: {
				"pay_id": pay_id,
				"pay_balance": pay_balance,
				"pay_status": pay_status,
				"pay_password": pay_password
			},
			success:  function(data) {
				console.log("인서트 결과 : " + data);
				
				if(data = "true") {
					Swal.fire({
						icon: 'success',
						title: '정보 변경에 성공했습니다.',
						confirmButtonColor: '#0d6efd',
						confirmButtonText: '확인',
						allowOutsideClick: false
					}).then((result) => {
						location.reload();
					});
				} else {
					Swal.fire({
						icon: 'error',
						title: '정보 변경에 실패했습니다.',
						confirmButtonColor: '#0d6efd',
						confirmButtonText: '확인',
						allowOutsideClick: false
					});
				}
				
				$('#modal-${pay_list.pay_history_id}').modal('hide'); // 모달창 닫기
				
			},
			error: function(request, status, error) {
		      // 요청이 실패한 경우 처리할 로직
		      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
			}
		});
		
	}
	
	function refundPay(pay_id) {
		event.preventDefault(); 
		
		let refund_balance = $("#refund-balance").val();
		let pay_balance = "${payList.pay_balance}";
		let fintech_use_num = "${payList.fintech_use_num}";
		let user_name = "${payList.user_name}";
		let member_id = "${payList.member_id}";
		
		Swal.fire({
	        title: '해당 고객의 페이를 환급하시겠습니까?',
	        text: "확인을 누르시면 환급이 진행됩니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#0d6efd',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '환급',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	    	if (result.isConfirmed) {
	    		// 환급을 위해 ajax 요청
	    		$.ajax({
	    			type: "GET",
	    			url: "RefundPay",
	    			data: {
	    				"pay_id": pay_id,
	    				"refund_balance": refund_balance,
	    				"pay_balance": pay_balance,
	    				"fintech_use_num": fintech_use_num,
	    				"user_name": user_name,
	    				"member_id": member_id
	    			},
	    			success:  function(data) {
	    				console.log("결과 : " + data);
	    				
	    				if(data = "true") {
	    					Swal.fire({
	    						icon: 'success',
	    						title: '페이 환급에 성공했습니다.',
	    						confirmButtonColor: '#0d6efd',
	    						confirmButtonText: '확인',
	    						allowOutsideClick: false
	    					}).then((result) => {
	    						location.reload();
	    					});
	    				} else {
	    					Swal.fire({
	    						icon: 'error',
	    						title: '페이 환급에 실패했습니다.',
	    						confirmButtonColor: '#0d6efd',
	    						confirmButtonText: '확인',
	    						allowOutsideClick: false
	    					});
	    				}
	    				
	    				$('#modal2-${pay_list.pay_history_id}').modal('hide'); // 모달창 닫기
	    				
	    			},
	    			error: function(request, status, error) {
	    		      // 요청이 실패한 경우 처리할 로직
	    		      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
	    			}
	    		});
	    		
	    		
	    		
	    	} else {
	        	$('#modal2-${pay_list.pay_history_id}').modal('hide'); // 모달창 닫기
	        }
	    	
	    });
	}
	
	
	
</script>
</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="../inc/adminTop.jsp"></jsp:include>	
	</header><!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<jsp:include page="../inc/adminSidebar.jsp"></jsp:include>	
	</aside><!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>약정계좌관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">Home</a></li>
					<li class="breadcrumb-item">페이관리</li>
					<li class="breadcrumb-item active">약정계좌관리</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<table class="top_table">
								<tr>
									<th>약정계좌잔액</th>
									<td>
										<c:set var="formattedBalance" value="${sosiminAccount[0]['account_balance']}" />
										<fmt:formatNumber value="${formattedBalance}" pattern="#,##0" var="formattedBalanceWithComma" />
										
										<c:out value="${formattedBalanceWithComma}" />원
									</td>
								</tr>
							</table>
						
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th>페이내역번호</th>
										<th>회원아이디</th>
										<th>거래유형</th>
										<th>거래금액</th>
										<th>약정계좌잔액</th>
										<th>거래일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="account" items="${sosiminAccount}">
										<tr>
											<td>${account.account_history_id}</td>
											<td>${account.member_id}</td>
											<td>
												<c:choose>
													<c:when test="${account.pay_history_type eq '1'}">충전</c:when>
													<c:when test="${account.pay_history_type eq '2'}">환급</c:when>
												</c:choose>
											</td>
											<td>
												<c:set var="amount" value="${account.pay_amount}" />
												<fmt:formatNumber value="${amount}" pattern="#,##0" />원
											</td>
											<td>
												<c:set var="balance" value="${account.account_balance}" />
												<fmt:formatNumber value="${balance}" pattern="#,##0" />원
											</td>
											<td>
												<c:set var="datetime" value="${fn:split(account.pay_history_date, 'T')}" />
												<c:set var="date" value="${datetime[0]}" />
												${date}
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->
						</div>
	 				</div>
				</div>
			</div>
		</section>
	</main><!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<jsp:include page="../inc/adminBottom.jsp"></jsp:include>	
	</footer><!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart.umd.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin//quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/simple-datatables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>