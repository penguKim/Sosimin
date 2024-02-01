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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- sweetalert --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">
	$(function(){
		<%-- 뒤로가기 방지 --%>
		window.addEventListener('pageshow', function(event) { <%-- 페이지가 로드되거나 새로고침 발생 이벤트 --%>
			if (event.persisted) { <%-- 뒤로가기나 앞으로가기로 이동했을 시 true 리턴 --%>
			    location.reload(); <%-- 페이지 새로고침 --%>
			}
		});
		
		// 변수 선언
		let iscorrectName = false; <%-- 이름 정규표현식 적합 여부 --%>
		let iscorrectPhone = false; <%-- 휴대폰번호 정규표현식 적합 여부 --%>
		let isSent = false; <%-- 인증 코드 전송 여부 --%>
		let isChecked = false; <%-- 인증 코드 일치 여부 --%>
		let phone_auth_code = ""; <%-- 인증 코드 --%>
		
		
		
		<%-- 이름 정규표현식 검증 --%>
		$("#name").on("blur", function() {		
			let regName = /^[가-힣]{2,5}$/; <%-- 한글 2~5글자 --%>
			if(!regName.test($("#name").val())){
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				iscorrectName = false;
			} else if(regName.test($("#name").val())){
				$("#checkNameResult").text("사용 가능한 이름입니다").css("color", "green");
				iscorrectName = true;
	        }
		});	// 이름 blur 이벤트 끝	
		
		
		<%-- 전화번호에 자동 "-" 입력 --%>
		$("#phone").keyup(function(){
			var val = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 입력 가능
			if(val.length > 3 && val.length < 6) {
				$(this).val(val.substring(0,3) + "-" + val.substring(3));
			} else if (val.length > 7) {
				$(this).val(val.substring(0,3) + "-" + val.substring(3, 7) + "-" + val.substring(7));
			}
		});
		
		
		<%-- 휴대폰 번호 정규표현식 검증 --%>
		$("#phone").on("blur", function() {		
			var member_phone = $("#phone").val();
			let regPhone = /^010-\d{4}-\d{4}$/; <%-- 010으로 시작하는 11자리 숫자 --%>

			if(!regPhone.test(member_phone)) {
				$("#checkPhoneResult").text("휴대폰 번호를 확인해주세요").css("color", "red");
				iscorrectPhone = false;
			} else {
				$("#checkPhoneResult").text("사용 가능한 번호입니다. 버튼을 눌러 인증코드를 받아주세요.").css("color", "green");
				$("#requestPhoneAuthCodeButton").focus();
				iscorrectPhone = true;
			}
		});	// 휴대폰번호 blur 이벤트 끝
		
		// 인증코드발급 버튼 클릭 시
		$("#requestPhoneAuthCodeButton").on("click", function() {
			let member_phone = $("#phone").val();
			let regPhone = /^010-\d{4}-\d{4}$/; <%-- 010으로 시작하는 11자리 숫자 --%>

			if(!regPhone.test(member_phone)) {
				$("#checkPhoneResult").text("휴대폰 번호를 확인해주세요").css("color", "red");
			} else if($("#id").val() == "") {
				$("#checkIdResult").text("5~20자의 영문 소문자, 숫자를 조합해 입력해주세요").css("color", "red");
				$("#id").focus();				
			} else if($("#name").val() == "") {
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				$("#name").focus();				
			} else {
				let member_id = $("#id").val(); 
				let member_name = $("#name").val(); 
				$.ajax({
					url: "MemberCheck",
					data: {
						"member_id": member_id, 
						"member_name": member_name,
						"member_phone": member_phone
					},
					success: function(result) {
// 						alert(result);
						if(result == false) {
							alert("일치하는 회원이 없습니다. 다시 확인해주세요");
							
						} else {
							$("#checkPhoneResult").text("사용 가능한 휴대폰 번호입니다").css("color", "green");
							alert("인증코드 발송 완료");
							
							// 인증 여부 변수 true로 변경
							isSent = true;
							
							// 인증코드발송 -> 인증코드 재발송
							$("#requestPhoneAuthCodeButton").val("인증코드재발급");
							
							// 인증코드발급 요청
							$.ajax({
								url: "requestPhoneAuthCode",
								data: {
									"member_phone": member_phone
								},
								dataType: "json",
								success: function(result) {
									console.log("result : " + result);
									phone_auth_code = result;
								},
								error: function(xhr,textStatus,errorThrown) {
								    // 요청이 실패한 경우 처리할 로직
								    alert("휴대폰 인증 코드 발급 AJAX 요청 실패!");
									console.log(xhr + ", " + textStatus + ", " + errorThrown);
								}
							});
						}
						
					},
					error: function(xhr,textStatus,errorThrown) {
					    // 요청이 실패한 경우 처리할 로직
					    alert("회원 조회 AJAX 요청 실패!");
						console.log(xhr + ", " + textStatus + ", " + errorThrown);
					}
					
				}); // 회원 조회 ajax 요청 끝
			}
		}); // 인증코드 발급 버튼 클릭 이벤트 끝
		
		// 인증 버튼 클릭 이벤트
		$("#completePhoneAuthButton").on("click", function() {
			if(!isSent) { // 전송여부x
				$("#checkPhoneAuthCodeResult").text("인증코드를 발송해주세요").css("color", "red");
				$("member_phone").focus();
				isChecked = false;
			} else if($("#phoneAuthCode").val() == "") { // 인증번호입력란이 ""인 경우
				$("#checkPhoneAuthCodeResult").text("인증코드를 입력해주세요").css("color", "red");
				$("#phoneAuthCode").focus();
				isChecked = false;
			} else if($("#phoneAuthCode").val() != phone_auth_code) { // 입력한 인증코드가 발급한 인증코드와 맞지않을 경우
				$("#checkPhoneAuthCodeResult").text("인증코드가 일치하지않습니다").css("color", "red");
				isChecked = false;
			} else {
				$("#checkPhoneAuthCodeResult").text("휴대폰 인증이 정상적으로 완료되었습니다").css("color", "green");
				isChecked = true;
			}
		
		});
		

		// 서브밋 이벤트 처리
		$("form").on("submit", function() {
			if(!iscorrectName) {
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				$("#name").focus();
				return false;
			} else if(!iscorrectPhone) {
				$("#checkPhoneResult").text("휴대폰 번호를 확인해주세요").css("color", "red");
				$("#member_phone").focus();
				return false;
			} else if(!isSent) {
				$("#checkPhoneAuthCodeResult").text("인증번호를 발송해주세요").css("color", "red");
				$("member_phone").focus();
				return false;
			} else if($("#phoneAuthCode").val() == "") {
				$("#checkPhoneAuthCodeResult").text("인증코드를 입력해주세요").css("color", "red");
				$("#phoneAuthCode").focus();
				return false;
			} else if(!isChecked) {
				$("#checkPhoneAuthCodeResult").text("인증코드를 확인해주세요").css("color", "red");
				$("#phoneAuthCode").focus();
				return false;
			}
			return true;

		});
		
		
	}); // document.ready 끝	
</script>
</head>
<body>
    <!-- Preloader -->
    <div class="preloader" style="opacity: 0; display: none;">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">로그인</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="MemberLogin"><i class="lni lni-home"></i> 로그인</a></li>
                        <li>비밀번호 찾기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Account Login Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" method="post" action="MemberResetPasswd">
                        <div class="card-body">
                            <div class="title">
                                <h4>비밀번호 찾기</h4>
                                <p>회원가입 시 등록한 정보를 입력하세요</p>
                            </div>
                            <div class="form-group">
                                <label for="id" id="mgForThree">아이디</label>
                                <input class="form-control" placeholder="아이디를 입력해주세요" type="text" id="id" name="member_id" required>
                                <div id="checkIdResult" class="resultArea"></div>
                            </div>
                            <div class="form-group">
                                <label for="name" id="mgForTwo">이름</label>
                                <input class="form-control" placeholder="이름을 입력해주세요" type="text" id="name" name="member_name" required>
                                <div id="checkNameResult" class="resultArea"></div>
                            </div>
                           <div class="form-group">
								<label for="phone" id="mgForFive">휴대폰번호</label> 
								<input class="form-control" placeholder="숫자만 입력해주세요" type="tel" name="member_phone" id="phone" required>
								<input type="button" value="인증코드발급" id="requestPhoneAuthCodeButton">
								<div id="checkPhoneResult" class="resultArea"></div>
							</div>
                           <div class="form-group">
								<label for="phoneAuthCode" id="mgForFour">인증코드</label> 
								<input class="form-control" placeholder="코드를 입력한 후 인증 버튼을 눌러주세요" type="text" id="phoneAuthCode" maxlength="4" required>
								<input type="button" value="인증" id="completePhoneAuthButton">
								<div id="checkPhoneAuthCodeResult" class="resultArea"></div>
							</div>
                            <div id="singleFindArea">
	                            <a class="lost-pass" href="MemberFindId">아이디를 잊으셨나요?</a>
                            </div>
	                        <div class="button" id="findButtonArea">
                                <button class="btn" type="button" onclick='history.back();'>돌아가기</button>
                                <button class="btn" type="submit">비밀번호 찾기</button>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Login Area -->

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