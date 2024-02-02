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
		let iscorrectName = false; <%-- 이름 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		let iscorrectEmail = false; <%-- 이메일 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		let iscorrectBirthdate = false; <%-- 생년월일 입력 여부 저장할 변수 선언 --%>

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
		
		<%-- 이메일 정규표현식 검증 --%>
		$("#email").blur(function() {
			let member_email = $("#email").val();
			let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(!regEmail.exec(member_email)) {
				$("#checkEmailResult").text("이메일 주소가 올바른지 확인해주세요").css("color", "red");
				iscorrectEmail = false;
			} else {
				$("#checkEmailResult").text("사용 가능한 이메일입니다").css("color", "green");
				iscorrectEmail = true;
			}
		});	// 이메일 blur 이벤트 끝
		
		<%-- 생년월일 선택 범위 제한 --%>
		$("#birthdate").on("click", function() {
			<%-- 만 14세 미만은 회원이 될 수 없으므로 날짜 선택 범위 제한  --%>
			var today = new Date();
			var maxDate = new Date(today.getFullYear() - 14, today.getMonth(), today.getDate() + 1);
			$("#birthdate").attr("max", maxDate.toISOString().split("T")[0]);
		}); // 생년월일 클릭 이벤트 끝
		
		$("#birthdate").blur(function() {
			let member_birth = $("#birthdate").val();
			
			if(member_birth != "") { // 입력값이 비어있지 않은 경우
				iscorrectBirthdate = true;
			}
		}); // 생년월일 blur 이벤트 끝
		
		// 아이디 찾기 버튼 클릭 이벤트 처리
		$("#submit").on("click", function() {
			let member_name = $("#name").val();
			let member_email = $("#email").val();
			let member_birth = $("#birthdate").val();
			
			if(!iscorrectName) { // 이름 미입력 또는 정규표현식 위배
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				$("#name").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectEmail) { // 이메일 미입력 또는 정규표현식 위배 
				$("#checkEmailResult").text("이메일 주소를 확인해주세요").css("color", "red");
				$("#email").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectBirthdate) {  // 생년월일 미입력 
				$("#checkBirthdateResult").text("생년월일을 입력해주세요").css("color", "red");
				$("#birthdate").focus();
				return false; // submit 동작 취소
			} else {
				$.ajax({
					type: "post",
					url: "MemberFindIdPro",
					data: $("#form").serialize(),
					success: function(result) {
						console.log("결과는? : " + result);
						if(result == "") {
							Swal.fire({
								title: '아이디 찾기 실패!',         // Alert 제목
								text: "정보와 일치하는 회원이 없습니다!",  // Alert 내용
								icon:'error',
							});
// 							alert("정보와 일치하는 회원이 없습니다!");
						} else {
							$("#showIdArea").html("<br><br><h6>회원님의 ID는 </h6>"
									+ "<div><h6>" + result.member_id + " 입니다.</h6></div>"
							);
							$(".modal-footer").html(
									"<a href='MemberLogin?member_id=" + result.member_id + "'>"
									+ "<button type='button' class='btn btn-primary'>로그인 하기</button></a>"	
									+ "<a href='./'>"
									+ "<button type='button' class='btn btn-primary'>메인으로 이동</button></a>"
							);
							$("#showIdModal").modal("show");

						}
						
					},
					error: function(xhr, textStatus, errorThrown) {
						Swal.fire({
							title: 'AJAX 요청 실패!',         // Alert 제목
							text: "아이디 조회에 실패했습니다!",  // Alert 내용
							icon:'error',
						});
// 						alert("아이디 조회 ajax 요청 실패");
						console.log(xhr + ", " + textStatus + ", " + errorThrown);
					}
					
				}); // ajax 끝
			}
		}); // 아이디찾기 버튼 클릭 이벤트 끝
		
	}); // document.ready 끝
</script>
</head>
<body>
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
                        <li>아이디 찾기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Account Login Area -->
    <div class="account-login section">
    
		<div class="container">
<!-- 		   	<div class="meta-information" id="findCategoryArea"> -->
<!-- 				<ul class="meta-info"> -->
<!-- 					<li><a href="javascript:void(0)"> <i class="lni lni-user"></i> 아이디찾기</a></li> -->
<!-- 					<li><a href="javascript:void(0)"><i class="lni lni-calendar"></i>비밀번호찾기</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
<!--                     <form class="card login-form" method="post" action="MemberFindIdPro"> -->
                    <form class="card login-form" method="post" id="form">
                        <div class="card-body">
                            <div class="title">
                                <h4>아이디 찾기</h4>
                                <p>회원가입 시 등록한 정보를 입력하세요</p>
                            </div>
                            <div class="form-group">
                                <label for="name" id="mgForTwo">이름</label>
                                <input class="form-control" type="text" name="member_name" id="name" required>
                                <div id="checkNameResult" class="resultArea"></div>
                            </div>
                            <div class="form-group">
                                <label for="email" id="mgForThree">이메일</label>
                                <input class="form-control" type="text" name="member_email" id="email" required>
                                <div id="checkEmailResult" class="resultArea"></div>
                            </div>
                            <div class="form-group">
                                <label for="birthdate" id="mgForFour">생년월일</label>
                                <input class="form-control" type="date" name="member_birth" id="birthdate" required>
                                <div id="checkBirthdateResult" class="resultArea"></div>
                            </div>
                            <div id="singleFindArea">
	                            <a class="lost-pass" href="MemberFindPasswd">비밀번호를 잊으셨나요?</a>
                            </div>
	                        <div class="button" id="findButtonArea">
                                <button class="btn" type="button" onclick='history.back();'>돌아가기</button>
                                <button class="btn" type="button" id="submit">아이디 찾기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Login Area -->

    <%-- 아이디 출력 모달 설정 --%>
	<div class="modal" id="showIdModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-center" id="showIdArea">
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