<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
        <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csStyle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
</head>
<style>

.police{
	margin-left: 300px;
    color: rgb(204, 204, 204);
    font-size: 16px;
    -webkit-box-align: center;
    align-items: center;
    border: none;
    background-color: white;
}
	#tradeOk, #tradeFinish, #payTrade{
	display: inline-block;
	position: relative;
	left: 250px;
	bottom: 70px;
	}
	
	#imageTag{
	position: relative;
	left: 370px;
	bottom: 130px;
	width: 25px;
	height: 25px;
	}
	
</style>
<script type="text/javascript">

function payment() {
	// 채팅방에서 produtct_id 들고오기
	var product_id = "${sellMember.product_id}";
	location.href="Payment?product_id=" + product_id;
}

// 임시로 테스트용 구매확정 버튼 추가(에이젝스)
function confirmPayment() {
	// 채팅방에서 produtct_id 들고오기
// 	location.href="ConfirmPayment?product_id=303";
// 	confir- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "ConfirmPayment",
		data: {
			"product_id": "${sellProduct.product_id}",
		},
		success:  function(data) {
			if(data == "true") {
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: '구매를 확정했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			} else if(data == "none") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '구매 확정 가능한 상품이 없습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});				
			} else if(data == "inconsistency") {
					Swal.fire({
						position: 'center',
						icon: 'error',
						title: '구매자 정보가 일치하지 않습니다.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
				});			
			} else if(data == "unpaid") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '결제를 먼저 진행해주세요.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			} else {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '구매 확정을 실패했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			}
	
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
	
}


//임시로 테스트용 거래수락 버튼 추가
function acceptPayment() {
	
	$("#tradeFinish").prop("disabled", false);
	$("#tradeOk").prop("disabled", true);
	// 채팅방에서 produtct_id 들고오기
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "AcceptPayment",
		data: {
			"product_id": "${sellProduct.product_id}",
			"product_buyer": "leess"
		},
		success:  function(data) {
			if(data == "not-login") {
				Swal.fire({
					icon: 'warning',
					title: '로그인을 해주세요!',
					text: '로그인 페이지로 이동합니다!',
					allowOutsideClick: false
				}).then((result) => {
						location.href="MemberLogin";
				});	
			} else if(data == "true") {
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: '거래를 수락했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			} else if(data == "inconsistency") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '판매자 정보가 일치하지 않습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});				
			} else {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '거래 수락을 실패했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			}
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
}

//임시로 테스트용 구매확정 버튼 추가(에이젝스)
function confirmPayment() {
	// 채팅방에서 produtct_id 들고오기
// 	location.href="ConfirmPayment?product_id=303";
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "ConfirmPayment",
		data: {
			"product_id": "${sellProduct.product_id}",
		},
		success:  function(data) {
			if(data == "not-login") {
				Swal.fire({
					icon: 'warning',
					title: '로그인을 해주세요!',
					text: '로그인 페이지로 이동합니다!',
					allowOutsideClick: false
				}).then((result) => {
						location.href="MemberLogin";
				});	
			} else if(data == "true") {
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: '구매를 확정했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			} else if(data == "none") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '구매 확정 가능한 상품이 없습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});				
			} else if(data == "inconsistency") {
					Swal.fire({
						position: 'center',
						icon: 'error',
						title: '구매자 정보가 일치하지 않습니다.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
				});			
			} else if(data == "unpaid") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '결제를 먼저 진행해주세요.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			} else if(data == "not-access_token") {
				Swal.fire({
					icon: 'warning',
					title: '계좌 인증이 필요합니다',
					text: '계좌 인증 페이지로 이동합니다.',
					allowOutsideClick: false
				}).then((result) => {
						location.href="AccountVerification";
				});	
			} else if(data == "not-payInfo") {
				Swal.fire({
					icon: 'warning',
					title: '계좌 등록이 필요합니다',
					text: '계좌 등록 페이지로 이동합니다.',
					allowOutsideClick: false
				}).then((result) => {
						location.href="AccountRegist";
				});	
			} else {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '구매 확정을 실패했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			}
	
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
	
}




</script>
<body>

	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<jsp:include page="../report/report.jsp"></jsp:include>
	
	
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">1:1채팅</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./">Home</a></li>
                        <li>1:1 채팅</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
				
				
				
				
<div id="container">
	<aside>
		<ul>
			<li>
				<div>
					<h1><a href="Chat">채팅리스트</a></h1>
				</div>
			</li>
      
			<li>
				<img src="${pageContext.request.contextPath}/resources/upload/${sellMember.member_profile}" alt="">
				<div>
					<h2>${sellMember.member_nickname }</h2>
					<h3><span>방금전</span></h3>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt="" >
				<div>
					<h2>닉네임2</h2>
					<h3><span>방금전</span></h3>
				</div>
			</li>
		</ul>
	</aside>
	
	<main>
	<header>
		<img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" alt="">
		<div>
			<h2>${sellMember.member_nickname }</h2>
			<h3>상대방정보</h3>
		</div>
		
		<div>
			<div>
				<input type="button" id="tradeOk" value="거래수락" onclick="acceptPayment()">
			</div>
<!-- 			<div> -->
<!-- 				<input type="button" id="tradeFinish" value="구매확정" onclick="confirmPayment()"> -->
<!-- 			</div> -->
			<div>
				<input type="button" id="tradeFinish" value="구매확정" onclick="confirmPayment()" disabled="disabled">
			</div>
			<div>
				<input type="button" id="payTrade" value="결제하기" onclick="payment()">
			</div>
		</div>
      	<a href=""	data-bs-toggle="modal" data-bs-target="#reportModal">
    		<img src="${pageContext.request.contextPath}/resources/images/product-details/신고하기.png"  id="imageTag"></a>
	</header>
    
	<ul id="chat">
		<li class="you">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" alt="">상대방</h2>
			</div>
			<div class="triangle"></div><!-- 말풍선 색상정하는 클래스  -->
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="me">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt=""></h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="me">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt=""></h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="you">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" alt="">상대방</h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="me">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt=""></h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	</ul>
    
		<footer>
			<textarea placeholder="Type your message"></textarea>
<!-- 				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt=""> -->
<!-- 				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt=""> -->
			<a href="#">Send</a>
		</footer>
	</main>
</div>

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
<body>
</html>