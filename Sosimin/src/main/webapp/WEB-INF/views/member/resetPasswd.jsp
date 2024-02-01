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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<script type="text/javascript">
	$(function() {
		<%-- 뒤로가기 방지 --%>
		if (performance.navigation.type === 2) { <%-- 0 : 처음 로딩/새로고침, 1 : 페이지가 앞/뒤로 이동, 2 : 페이지가 뒤로 이동  --%>
			alert('비정상적인 접근입니다.\n메인페이지로 이동합니다.');
			location.href = './'; //다른 페이지로 이동
		}	
		
		// 변수 선언
		isSafePassword = false;
		iscorrectPassword = false;
		isSamePassword = false;
		
		<%-- 패스워드 확인 --%>
		$("#newPassword").blur(function() {	
			let member_password = $("#newPassword").val();
			
			<%-- 비밀번호 길이, 문자종류 검증 --%>
			let regPw = /^[A-Za-z0-9!@#%^&*]{8,16}$/; <%-- 8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
			if(!regPw.exec(member_password)) { <%-- 비밀번호 길이, 문자종류 위반 --%>
				$("#checkNewPasswordResult").text("8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)만 사용 가능").css("color", "red");
				iscorrectPassword = false;
			} else { <%-- 통과했을 때 복잡도 검증 실행 --%>
				let count = 0; <%-- 복잡도 점수를 저장할 변수 선언 --%>
				
				let regEngUpper = /[A-Z]/; <%-- 대문자 --%>
				let regEngLower = /[a-z]/; <%-- 소문자 --%>
				let regNum = /[0-9]/; <%-- 숫자 --%>
				let regSpec = /[!@#%^&*]/; <%-- 특수문자(!@#%^&*) --%>
			
				if(regEngUpper.exec(member_password)) count++; <%-- 대문자가 있으면 +1점 --%>
				if(regEngLower.exec(member_password)) count++; <%-- 소문자가 있으면 +1점 --%>
				if(regNum.exec(member_password)) count++; <%-- 숫자가 있으면 +1점 --%>
				if(regSpec.exec(member_password)) count++; <%-- 특수문자가 있으면 +1점 --%>
				
				switch (count) {
					case 4: 
						$("#checkNewPasswordResult").text("안전").css("color", "green");
						isSafePassword = true;
						iscorrectPassword = true;
						break;
					case 3: 
						$("#checkNewPasswordResult").text("보통").css("color", "#FFB400");
						isSafePassword = true;
						iscorrectPassword = true;
						break;
					case 2: 
						$("#checkNewPasswordResult").text("주의").css("color", "#E56D29");
						isSafePassword = false;
						iscorrectPassword = false;
						break;
					case 1: 
					case 0: 
						$("#checkNewPasswordResult").text("위험").css("color", "red");
						isSafePassword = false;
						iscorrectPassword = false;
						break;
				}
			
			}
			
		});

		<%-- 비밀번호와 비밀번호 확인이 같은지 체크하기 --%>
		$("#newPassword").on("keyup", function() {	
		    if($("#newPassword").val() == $("#newPasswordConfirm").val()) { // 일치
		    	$("#checkNewPasswordConfirmResult").text("비밀번호가 일치합니다").css("color", "green");
		    	isSamePassword = true;
		    } else { // 불일치
		    	$("#checkNewPasswordConfirmResult").text("비밀번호가 일치하지 않습니다").css("color", "red");		     	
		    	isSamePassword = false;
		    }
			
		});
		
		$("#newPasswordConfirm").on("keyup", function() {	
		    if($("#newPassword").val() == $("#newPasswordConfirm").val()) { // 일치
		    	$("#checkNewPasswordConfirmResult").text("비밀번호가 일치합니다").css("color", "green");
		    	isSamePassword = true;
		    } else { // 불일치
		    	$("#checkNewPasswordConfirmResult").text("비밀번호가 일치하지 않습니다").css("color", "red");		     	
		    	isSamePassword = false;
		    }
			
		});
		
		$("#resetPassword").on("click", function() {
			if(!isSafePassword) {
				$("#checkNewPasswordResult").text("8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)만 사용 가능").css("color", "red");
				$("#newPassword").focus;
			} else if(!iscorrectPassword) {
				$("#checkNewPasswordResult").text("8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)만 사용 가능").css("color", "red");
				$("#newPassword").focus;
			} else if(!isSamePassword) {
				$("#newPasswordConfirm").focus();
			} else {
				let member_id = $("#showId").val();
				let newPassword = $("#newPassword").val();
				$.ajax({
					type: "POST",
					url: "MemberResetPasswdPro",
					data: {
						"member_id": member_id,
						"newPassword": newPassword
					},
					success: function(result) {
						if(!result) {
							alert("비밀번호 수정 실패");
						} else {
							$("#resetPasswordArea").html("<div><br><br><h6>비밀번호 수정 완료</h6></div>"
							);
							$(".modal-footer").html(
									"<a href='MemberLogin'>"
									+ "<button type='button' class='btn btn-primary'>로그인 하기</button></a>"	
									+ "<a href='./'>"
									+ "<button type='button' class='btn btn-primary'>메인으로 이동</button></a>"
							);
							$("#resetPasswordModal").modal("show");
						}
					},
					error: function(xhr, textStatus, errorThrown) {
						alert("비밀번호 수정에 실패했습니다.");
						console.log(xhr + ", " + textStatus + ", " + errorThrown);
					}
					
				});
			}
		});
	});
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
                        <li>비밀번호 재설정</li>
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
                    <form class="card login-form" method="post" action="MemberResetPasswdPro">
                        <div class="card-body">
                            <div class="title">
                                <h4>비밀번호 재설정</h4>
                                <p>새로 사용하실 비밀번호를 설정해주세요</p>
                            </div>
                            <div class="form-group">
                                <label for="showId" id="mgForThreeReset">아이디</label>
                                <input class="form-control" type="text" id="showId" name="member_id" value="${param.member_id }" readonly>
                            </div>
                            <div class="form-group">
								<label for="newPassword" id="mgForFiveOneReset">새 비밀번호</label> 
								<input class="form-control" maxlength="16" placeholder="8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)" type="password"  name="newPassword" id="newPassword" required>
								<div id="checkNewPasswordResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="newPasswordConfirm" id="mgForSevenTwoReset">새 비밀번호 확인</label> 
								<input class="form-control" maxlength="16" placeholder="비밀번호를 다시 입력해주세요" type="password" id="newPasswordConfirm" required>
								<div id="checkNewPasswordConfirmResult" class="resultArea"></div>
							</div>
	                        <div class="button" id="resetButtonArea">
                                <button class="btn" type="button" onclick='history.back();'>돌아가기</button>
                                <button class="btn" type="button" id="resetPassword">비밀번호 수정</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Login Area -->
    
    <%-- 비밀번호 수정 모달 설정 --%>
	<div class="modal" id="resetPasswordModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-center" id="resetPasswordArea">
<!-- 						<h6>모달확인!!!</h6> -->
					</div>
					<div class="mx-auto my-5 w-75">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
					<button type="submit" class="btn btn-primary" onclick="location.reload()">수정</button>
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