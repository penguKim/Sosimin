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

<title>소시민</title>
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

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/admin/style.css" rel="stylesheet">
<!-- bootstrap-icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%-- sweetalert --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />

<script type="text/javascript">
	// 기존 회원 정보 저장
	//	let member_intro = $("#intro").val();
	let member_password = "";
	let member_nickname = "";
	let member_email = "";
	let member_phone = "";
	
	// 중복, 정규표현식, 안전도, 일치여부 저장 변수 선언
	//	let isCorrectIntro = false;
	let iscorrectPassword = false; <%-- 비밀번호 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
	let isSamePassword = false; <%-- 패스워드 일치 여부를 저장할 변수 선언 --%>
	let isSafePassword = false; <%-- 패스워드 안전도를 저장하는 변수 --%>
	let iscorrectNickname = false; <%-- 닉네임 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
	let isDuplicateNickname = false; <%-- 닉네임 중복 여부를 저장할 변수 선언 --%>
	let iscorrectEmail = false; <%-- 이메일 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
	let isDuplicateEmail = false; <%-- 이메일 중복 여부를 저장할 변수 선언 --%>
	let iscorrectPhone = false; <%-- 휴대폰번호입력 여부 저장할 변수 선언 --%>
	let isDuplicatePhone = false; <%-- 휴대폰번호 중복 여부를 저장할 변수 선언 --%>
	let iscorrectPhoneAuthCode = false; <%-- 휴대폰번호 인증코드 입력 여부 저장할 변수 선언 --%>




	
	$(function(){
			
		// 찜 버튼 클릭 이벤트
        $(".heart").on("click", function () {
            $(this).toggleClass("is-active");
    	    Swal.fire({
    			title: '찜했습니다!',         // Alert 제목
    			text: "감사합니다!",  // Alert 내용
    			icon:'success',                         // Alert 타입
    		});
        });
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		
		// 파일 change 이벤트 처리
        $("#memberProfilePicFile").on("change", showPreviewImage);
	
		
		// 기존 회원 정보 저장
// 		let member_intro = $("#intro").val();
		member_password = $("#member_password").val();
		member_nickname = $("#nickname").val();
		member_email = $("#email").val();
		member_phone = $("#phone").val();
		
		// 중복, 정규표현식, 안전도, 일치여부 저장 변수 선언
// 		let isCorrectIntro = false;
		iscorrectPassword = true; <%-- 비밀번호 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		isSamePassword = true; <%-- 패스워드 일치 여부를 저장할 변수 선언 --%>
		isSafePassword = true; <%-- 패스워드 안전도를 저장하는 변수 --%>
		iscorrectNickname = true; <%-- 닉네임 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		isDuplicateNickname = false; <%-- 닉네임 중복 여부를 저장할 변수 선언 --%>
		iscorrectEmail = true; <%-- 이메일 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		isDuplicateEmail = false; <%-- 이메일 중복 여부를 저장할 변수 선언 --%>
		iscorrectPhone = true; <%-- 휴대폰번호입력 여부 저장할 변수 선언 --%>
		isDuplicatePhone = false; <%-- 휴대폰번호 중복 여부를 저장할 변수 선언 --%>
		iscorrectPhoneAuthCode = true; <%-- 휴대폰번호 인증코드 입력 여부 저장할 변수 선언 --%>
		
		// 소개글 블러 이벤트 처리
// 		$("#intro").on("blur", function() {
// 			let newIntro = $("#intro").val();
// 			if(member_intro == newIntro) { // 기존 소개글과 동일할 경우
// 				$("#checkIntroResult").text("기존과 동일한 소개글입니다").css("color", "#FFB400");
// 				isCorrectIntro = true;
// 			}
// 		});
		
		// 새 비밀번호 블러 이벤트처리
		<%-- 비밀번호 정규표현식 검증 --%>
		$("#newPassword").blur(function() {	
			let newPassword = $("#newPassword").val();
			
			$.ajax({
				url: "PasswordCheck",
				data: {
					member_password: member_password,
					newPassword: newPassword
				},
				success: function(isExistingPassword) {
					console.log(isExistingPassword);
					if(isExistingPassword == "true") {
						$("#checkPasswordResult").text("기존과 동일한 비밀번호입니다").css("color", "#FFB400");
						isSafePassword = true;
						iscorrectPassword = true;
					} else {
						<%-- 비밀번호 길이, 문자종류 검증 --%>
						let regPassword = /^[A-Za-z0-9!@#%^&*]{8,16}$/; <%-- 8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
						if(!regPassword.exec(newPassword)) { <%-- 비밀번호 길이, 문자종류 위반 --%>
							$("#checkPasswordResult").text("8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)만 사용 가능합니다").css("color", "red");
							iscorrectPassword = false;
						} else { <%-- 통과했을 때 복잡도 검증 실행 --%>
							let count = 0; <%-- 복잡도 점수를 저장할 변수 선언 --%>
							
							let regEngUpper = /[A-Z]/; <%-- 대문자 --%>
							let regEngLower = /[a-z]/; <%-- 소문자 --%>
							let regNum = /[0-9]/; <%-- 숫자 --%>
							let regSpec = /[!@#%^&*]/; <%-- 특수문자(!@#%^&*) --%>
						
							if(regEngUpper.exec(newPassword)) count++; <%-- 대문자가 있으면 +1점 --%>
							if(regEngLower.exec(newPassword)) count++; <%-- 소문자가 있으면 +1점 --%>
							if(regNum.exec(newPassword)) count++; <%-- 숫자가 있으면 +1점 --%>
							if(regSpec.exec(newPassword)) count++; <%-- 특수문자가 있으면 +1점 --%>
							
							switch (count) {
								case 4: 
									$("#checkPasswordResult").text("사용할 수 있는 비밀번호입니다!(안전)").css("color", "green");
									isSafePassword = true;
									iscorrectPassword = true;
									break;
								case 3: 
									$("#checkPasswordResult").text("사용할 수 있는 비밀번호입니다!(보통)").css("color", "#FFB400");
									isSafePassword = true;
									iscorrectPassword = true;
									break;
								case 2: 
									$("#checkPasswordResult").text("사용할 수 없는 비밀번호입니다!(주의)").css("color", "#E56D29");
									isSafePassword = false;
									iscorrectPassword = false;
									break;
								case 1: 
								case 0: 
									$("#checkPasswordResult").text("사용할 수 없는 비밀번호입니다!(위험)").css("color", "red");
									isSafePassword = false;
									iscorrectPassword = false;
									break;
							}
						
						}
						
					}
				}
			});
		}); // 비밀번호 blur 이벤트 끝
		
		<%-- 비밀번호와 비밀번호 확인 입력값 일치 여부 검사 --%>
		$("#newPassword").on("keyup", function() {	
		    if(iscorrectPassword && $("#newPassword").val() == $("#passwordConfirm").val()) { // 일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치합니다").css("color", "green");
		    	isSamePassword = true;
		    } else if(!iscorrectPassword && $("#newPassword").val() == $("#passwordConfirm").val()) { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 올바른지 확인해주세요").css("color", "red");
		    	isSamePassword = false;
		    } else { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치하지 않습니다").css("color", "red");
		    	isSamePassword = false;
		    }
			
		}); // 비밀번호 keyup 이벤트 끝
		
		$("#passwordConfirm").on("keyup", function() {	
		    if(iscorrectPassword && $("#newPassword").val() == $("#passwordConfirm").val()) { // 일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치합니다").css("color", "green");
		    	isSamePassword = true;
		    } else if(!iscorrectPassword && $("#newPassword").val() == $("#passwordConfirm").val()) { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 올바른지 확인해주세요").css("color", "red");	
		    	isSamePassword = false;
		    }  else { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치하지 않습니다").css("color", "red");		     	
		    	isSamePassword = false;
		    }
			
		}); // 비밀번호 확인 keyup 이벤트 끝
		
		
		// 닉네임 블러 이벤트 처리
		$("#nickname").on("blur", function() {
			let newNickname = $("#nickname").val();
			let regNickname = /^[가-힣0-9]{2,10}$/; <%-- 2~10자의 한글, 숫자 --%>
			if(member_nickname == newNickname) {
				$("#checkNicknameResult").text("기존과 동일한 닉네임입니다").css("color", "#FFB400");
				iscorrectNickname = true;
				isDuplicateNickname = false;
			} else {
				if(!regNickname.exec(newNickname)) {
					$("#checkNicknameResult").text("2~10자의 한글, 숫자를 입력해주세요").css("color", "red");
					iscorrectNickname = false;
				} else {
					$("#checkNicknameResult").text("오른쪽 버튼을 눌러 중복확인을 진행해주세요").css("color", "black");
					$("#checkNicknameDupButton").focus();
					$("#checkNicknameDupButton").on("click", function() {
						
						<%-- AJAX를 통해 아이디 중복값 확인 --%>
						$.ajax({
							url: "checkDupMemberInfo",
							data: {
								"member_nickname" : newNickname
							},
							dataType: "json",
							success: function(result) {
								if(result) { // 중복
		 							$("#checkNicknameResult").text("이미 사용 중인 닉네임입니다").css("color", "red");
		 							iscorrectNickname = false;
		 							isDuplicateNickname = true;
								} else { // 사용가능
									$("#checkNicknameResult").text("사용 가능한 닉네임입니다").css("color", "green");
									$("#checkNicknameDupButton").blur();
									iscorrectNickname = true;
									isDuplicateNickname = false;
								}
									
							},
							error: function(xhr,textStatus,errorThrown) {
							    // 요청이 실패한 경우 처리할 로직
// 							    alert("닉네임 중복 판별 AJAX 요청 실패!");
							    Swal.fire({
									title: 'AJAX 요청 실패!',         // Alert 제목
									text: "닉네임 중복 판별에 실패했습니다!",  // Alert 내용
									icon:'error',
								});
								console.log(xhr + ", " + textStatus + ", " + errorThrown);
	
							}
						}); // 중복 판별 ajax 요청 끝
					}); // 중복확인 버튼 클릭 이벤트 끝
				}
			}
			
		});
		
		// 닉네임 입력 값이 없는데 중복 확인 버튼을 클릭했을 경우
		$("#checkNicknameDupButton").on("click", function() {
			if($("#nickname").val() == "") {
// 				alert("닉네임을 입력해야 중복 확인이 가능합니다!");
				Swal.fire({
					title: '입력값이 없어요!',         // Alert 제목
					text: "닉네임 입력해야 중복 확인이 가능합니다!",  // Alert 내용
					icon:'warning',
				});
				$("#nickname").focus();
			} else if(!iscorrectNickname) {
				$("#checkNicknameResult").text("2~10자의 한글, 숫자를 입력해주세요").css("color", "red");
				$("#nickname").focus();
			}
		});
		
		
		// 이메일 블러 이벤트 처리
		$("#email").on("blur", function() {
			let newEmail = $("#email").val();
			let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(member_email == newEmail) {
				$("#checkEmailResult").text("기존과 동일한 이메일 주소입니다").css("color", "#FFB400");
				iscorrectEmail = true;
				isDuplicateEmail = false;
			} else {
				if(!regEmail.exec(newEmail)) {
					$("#checkEmailResult").text("이메일 주소가 올바른지 확인해주세요").css("color", "red");
					iscorrectEmail = false;
				} else {
					$("#checkEmailResult").text("오른쪽 버튼을 눌러 중복확인을 진행해주세요").css("color", "black");
					$("#checkEmailDupButton").focus();
					$("#checkEmailDupButton").on("click", function() {
						
						<%-- AJAX를 통해 아이디 중복값 확인 --%>
						$.ajax({
							url: "checkDupMemberInfo",
							data: {
								"member_email" : newEmail
							},
							dataType: "json",
							success: function(result) {
								if(result) { // 중복
		 							$("#checkEmailResult").text("이미 사용 중인 이메일입니다").css("color", "red");
		 							iscorrectEmail = false;
		 							isDuplicateEmail = true;
								} else { // 사용가능
									$("#checkEmailResult").text("사용 가능한 이메일입니다").css("color", "green");
									$("#checkNicknameDupButton").blur();
									iscorrectEmail = true;
									isDuplicateEmail = false;
								}
									
							},
							error: function(xhr,textStatus,errorThrown) {
							    // 요청이 실패한 경우 처리할 로직
							    Swal.fire({
									title: 'AJAX 요청 실패!',         // Alert 제목
									text: "이메일 중복 판별에 실패했습니다!",  // Alert 내용
									icon:'error',
								});
								console.log(xhr + ", " + textStatus + ", " + errorThrown);
	
							}
						}); // 중복 판별 ajax 요청 끝
					}); // 중복확인 버튼 클릭 이벤트 끝
				}
			}
			
		});
		
		// 이메일 입력 값이 없는데 중복 확인 버튼을 클릭했을 경우
		$("#checkEmailDupButton").on("click", function() {
			if($("#email").val() == "") {
// 				alert("이메일을 입력해야 중복 확인이 가능합니다!");
				Swal.fire({
					title: '입력값이 없어요!',         // Alert 제목
					text: "이메일을 입력해야 중복 확인이 가능합니다!",  // Alert 내용
					icon:'warning',
				});
				$("#email").focus();
			} else if(!iscorrectEmail) {
				$("#checkEmailResult").text("이메일 주소가 올바른지 확인해주세요").css("color", "red");
				$("#email").focus();
			}
		});
		
		<%-- 전화번호에 자동 "-" 입력 --%>
		$("#phone").keyup(function(){
			var val = $(this).val().replace(/[^0-9]/g, ''); // 숫자만 입력 가능
			if(val.length > 3 && val.length < 6) {
				$(this).val(val.substring(0,3) + "-" + val.substring(3));
			} else if (val.length > 7) {
				$(this).val(val.substring(0,3) + "-" + val.substring(3, 7) + "-" + val.substring(7));
			}
		});
		
		// 휴대폰번호 블러 이벤트 처리
		<%-- 휴대폰 번호 정규표현식 검증, 중복 확인 및 인증 처리 --%>
		$("#phone").on("blur", function() {		
			let newPhone = $("#phone").val();
			let regPhone = /^010-\d{4}-\d{4}$/; <%-- 010으로 시작하는 11자리 숫자 --%>
				
			if(member_phone == newPhone) {
				$("#checkPhoneResult").text("기존과 동일한 번호입니다").css("color", "#FFB400");
				iscorrectPhone = true;
				isDuplicatePhone = false;
			} else {
				if(!regPhone.test(newPhone)) {
					$("#checkPhoneResult").text("휴대폰 번호를 확인해주세요").css("color", "red");
					iscorrectPhone = false;
				} else {
					iscorrectPhone = true;
					<%-- 인증 코드 발송 전 AJAX를 통해 휴대폰번호 중복 여부 확인 --%>
					$.ajax({
						url: "checkDupMemberInfo",
						data: {
							"member_phone" : newPhone
						},
						dataType: "json",
						success: function(result) {
							if(result) { // 중복
	 							$("#checkPhoneResult").text("이미 사용 중인 휴대폰 번호입니다").css("color", "red");
	 							iscorrectPhone = false;
	 							isDuplicatePhone = true;
							} else { // 사용가능
								$("#checkPhoneResult").text("사용 가능한 번호입니다. 버튼을 눌러 인증코드를 받아주세요.").css("color", "green");
								$("#requestPhoneAuthCodeButton").focus();
								iscorrectPhone = true;
								isDuplicatePhone = false;
								
								// 인증코드발급 버튼 클릭 시 이벤트 처리
								$("#requestPhoneAuthCodeButton").on("click", function() {
//	 								alert("인증코드 발송 완료");
									Swal.fire({
										title: '인증코드 발송 완료!',         // Alert 제목
										text: "인증 코드를 확인해주세요!",  // Alert 내용
										icon:'success',
									});
//	 								$("#requestPhoneAuthCodeButton").blur();
									$.ajax({
										url: "requestPhoneAuthCode",
										data: {
											"member_phone": newPhone
										},
										dataType: "json",
										success: function(result) {
											console.log("result : " + result);
											
											// 인증 버튼 클릭 시 코드값 비교해 인증 완료 처리해야함
											$("#completePhoneAuthButton").on("click", function() {
												let phone_auth_code = $("#phoneAuthCode").val(); 	
											
												if(phone_auth_code == "") {
													$("#checkPhoneAuthCodeResult").text("인증코드를 입력해주세요").css("color", "red");
													iscorrectPhoneAuthCode = false;
												} else {
													if($.trim(result) == phone_auth_code) {
//	 													alert("휴대폰 인증이 정상적으로 완료되었습니다!");
														Swal.fire({
															title: '인증 완료!',         // Alert 제목
															text: "휴대폰 인증이 정상적으로 완료되었습니다!",  // Alert 내용
															icon:'success',
														});
														iscorrectPhoneAuthCode = true;
													} else {
														Swal.fire({
															title: '인증 코드 불일치!',         // Alert 제목
															text: "인증 코드가 올바르지 않습니다. 다시 인증해주세요!",  // Alert 내용
															icon:'error',
														});
//	 													alert("인증 코드가 올바르지 않습니다. 다시 인증해주세요!");
													}
												}
											});
											
											
										},
										error: function(xhr,textStatus,errorThrown) {
										    // 요청이 실패한 경우 처리할 로직
//	 									    alert("휴대폰 인증 코드 발급 AJAX 요청 실패!");
										    Swal.fire({
												title: 'AJAX 요청 실패!',         // Alert 제목
												text: "휴대폰 인증 코드 발급에 실패했습니다!",  // Alert 내용
												icon:'error',
											});
										    console.log(xhr + ", " + textStatus + ", " + errorThrown);
										}
									}); // 인증코드 발급 ajax 끝			
									
								
								
								});
								
							}
								
						}, // 중복 체크 ajax success 끝
						error: function(xhr,textStatus,errorThrown) {
						    // 요청이 실패한 경우 처리할 로직
//	 					    alert("휴대폰 번호 중복 판별 AJAX 요청 실패!");
						    Swal.fire({
								title: 'AJAX 요청 실패!',         // Alert 제목
								text: "휴대폰 번호 중복 판별에 실패했습니다!",  // Alert 내용
								icon:'error',
							});
						    console.log(xhr + ", " + textStatus + ", " + errorThrown);
						}
					});// 중복 체크 ajax 끝
		        }
				
			}
			
			
			
			

		});	// 휴대폰번호 blur 이벤트 끝
		
		// 휴대폰번호 입력 값이 없는데 인증코드발급 버튼을 클릭했을 경우
		$("#requestPhoneAuthCodeButton").on("click", function() {
			if($("#phone").val() == "") {
				Swal.fire({
					title: '입력값이 없어요!',         // Alert 제목
					text: "휴대폰번호를 입력해야 인증코드 발급이 가능합니다!",  // Alert 내용
					icon:'warning',
				});
// 				alert("휴대폰번호를 입력해야 인증코드 발급이 가능합니다!");
				$("#phone").focus();
			} 
// 			else if() {
				
// 			}
		});
		
		// 인증코드 입력 값이 없는데 인증 버튼을 클릭했을 경우
		$("#completePhoneAuthButton").on("click", function() {
			if($("#phoneAuthCode").val() == "") {
				Swal.fire({
					title: '입력값이 없어요!',         // Alert 제목
					text: "인증코드를 입력해야 인증 확인이 가능합니다!",  // Alert 내용
					icon:'warning',
				});
// 				alert("인증코드를 입력해야 인증 확인이 가능합니다!");
				$("#phoneAuthCode").focus();
			}
		});
		
		
		
		
		
		
	}); // document.ready 끝
	
	// 회원 정보 수정 클릭 시 모달 띄우는 함수 정의
	function openModifyMyInfoModal(birth, index) {
	    $("#birthdate_").val(birth); // 값 설정
		$("#memberModifyInfoModal_" + index).modal("show");
	}
	
	// 파일 선택 시 미리보기 업데이트 처리 함수
	function showPreviewImage() {
		let fileInput = $("#memberProfilePicFile")[0];
		let previewImage = $("#formGroupForMemberProfilePic img");
		
		// 파일 미선택 시 미리보기 초기화
		if(!fileInput.files || !fileInput.files[0]) {
// 			previewImage.attr("src", src);
			return;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			// 선택한 파일 미리보기 설정
			previewImage.attr("src", e.target.result);
		};
		reader.readAsDataURL(fileInput.files[0]);
	}
	
	// 내정보수정 모달 수정버튼 클릭 시 호출되는 함수
	function submitForm(index) {
// 	function submitForm(index, event) {
		
		<%-- submit 동작을 수행할 때 값을 올바르게 입력했는지 확인 --%>
// 		$("#MyInfoForm").on("submit", function(event) {
			if(!iscorrectNickname) { // 닉네임 미입력 또는 정규표현식 위배
				$("#checkNicknameResult_" + index).text("2~10글자의 한글, 숫자를 입력해주세요").css("color", "red");
				$("#nickname_" + index).focus();
			} else if(isDuplicateNickname) { // 닉네임 중복
				$("#checkNicknameResult_").text("이미 사용 중인 닉네임입니다").css("color", "red");
				$("#nickname").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectPassword) { // 비밀번호 미입력 또는 정규표현식 위배 
				$("#checkPasswordResult").text("8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)만 사용 가능합니다").css("color", "red");
				$("#password").focus();
				return false; // submit 동작 취소
			} else if(!isSafePassword) { // 비밀번호 안전도 검사 위배
				$("#checkPasswordResult").text("더 안전한 비밀번호를 설정해주세요").css("color", "red");
				$("#newPassword").focus();
				return false; // submit 동작 취소
			} else if(!isSamePassword) { // 비밀번호 불일치
				$("#passwordConfirm").focus();
				return false; // submit 동작 취소
			} else if($("#myMap").val() == "") { // 주소 미 입력(동네 미인증)
				$("#checkAddressResult").text("동네 인증을 완료해주세요").css("color", "red");
				$("#myMap").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectEmail) { // 이메일 미입력 또는 정규표현식 위배 
				$("#checkEmailResult").text("이메일 주소를 확인해주세요").css("color", "red");
				$("#email").focus();
				return false; // submit 동작 취소
			} else if(isDuplicateEmail) { // 이메일 중복
				$("#checkEmailResult").text("이미 사용 중인 이메일입니다").css("color", "red");
				$("#email").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectPhone) { // 휴대폰번호 미입력 또는 정규표현식 위배
				$("#checkPhoneResult").text("휴대폰번호를 확인해주세요").css("color", "red");
				$("#phone").focus();
				return false; // submit 동작 취소
			} else if(isDuplicatePhone) { // 휴대폰번호 중복
				$("#checkPhoneResult").text("이미 사용 중인 휴대폰번호입니다").css("color", "red");
				$("#phone").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectPhoneAuthCode) { // 휴대폰 인증코드 미입력
				$("#checkPhoneAuthCodeResult").text("인증 코드를 확인해주세요").css("color", "red");
				$("#phoneAuthCode").focus();
				return false; // submit 동작 취소
			}  else {
// 				confirm("가입 완료 버튼을 누르면 회원가입이 완료됩니다");
// 	 			event.preventDefault();
				Swal.fire({
					title: '정말로 수정하시겠어요?',
					text: '확인을 누르면 정보가 수정됩니다',
					icon: 'info',
					showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
					confirmButtonText: '확인', // confirm 버튼 텍스트 지정
					cancelButtonText: '취소', // cancel 버튼 텍스트 지정
					reverseButtons: true, // 버튼 순서 거꾸로
				}).then(result => {
					
					// true 리턴을 안받아도 바로 넘어감
					// true 리턴을 안받아도 바로 넘어감
					// true 리턴을 안받아도 바로 넘어감
					// true 리턴을 안받아도 바로 넘어감
					// true 리턴을 안받아도 바로 넘어감
					// 만약 Promise리턴을 받으면,
					if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						
						$("#MemberInfoForm_" + index).off("submit");
						$("#MemberInfoForm_" + index).submit();
						return true;
					} else {
						return false;
					} // else 문 끝
					
				}); // Swal-then 끝
			
			}
		
	}
	
	// 프로필 삭제 버튼 클릭 시 이미지 초기화
	function resetProfilePic(src) {
		let fileInput = $("#memberProfilePicFile");
		let previewImage = $("#formGroupForMemberProfilePic img");
		
		// 파일 입력 요소 초기화
		fileInput.val("");
		
		// 이미지 미리보기 초기화
		previewImage.attr("src", src);
		
		$("#profile_name").val("");
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
			<h1>회원관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">홈</a></li>
					<li class="breadcrumb-item active">회원관리</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card" id="adminMemberTableArea">
						<div class="card-body">
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th>프로필사진</th>
										<th>이름</th>
										<th>아이디</th>
										<th>닉네임</th>
										<th width="7.5%">생년월일</th>
										<th width="11%">동네</th>
										<th>이메일</th>
										<th width="11%">휴대폰번호</th>
										<th width="8%">회원레벨</th>
										<th width="8%">회원상태</th>
										<th width="5%">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="member" items="${allMemberList}">
										<tr>
											<td>
											<c:choose>
												<c:when test="${empty member.member_profile }">
													<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg" width="80px" height="80px">
												</c:when>
												<c:otherwise>
													<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/${member.member_profile}" width="80px" height="80px">
												</c:otherwise>
											</c:choose>
											</td>
											<td>${member.member_name}</td>
											<td>${member.member_id}</td>
											<td>${member.member_nickname}</td>
											<td>${member.member_birth}</td>
											<td>
											${member.gu} ${member.dong }
											<c:choose>
												<c:when test="${member.member_neighbor_auth eq 0 }"> <%-- 미인증 --%>
													<img class="auth" src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> 
												</c:when>
												<c:otherwise> <%-- 인증 --%>
													<img class="auth" src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
												</c:otherwise>
											</c:choose>
											</td>
											<td>${member.member_email}</td>
											<td>
											${member.member_phone}
											<c:choose>
												<c:when test="${member.member_phone_auth eq 0 }"> <%-- 미인증 --%>
													<img class="auth" src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> 
												</c:when>
												<c:otherwise> <%-- 인증 --%>
													<img class="auth" src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
												</c:otherwise>
											</c:choose>
											</td>
											<td>Lv. ${member.member_level}</td>
											<td>
											<c:choose>
												<c:when test="${member.member_status eq 0}">관리자</c:when>
												<c:when test="${member.member_status eq 1}">활동</c:when>
												<c:when test="${member.member_status eq 2}">탈퇴</c:when>
											</c:choose>
												
											</td>
											<td class="green" id="adminMemberTdArea">
												<button type="button" class="btn btn-primary" id="myPageModifyInfoFrom" onclick="location.href='ModifyMember?member_id=${member.member_id}'">
													수정
												</button>
<%-- 												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#memberModifyInfoModal_${status.index }" id="myPageModifyInfoFrom" onclick="openModifyMyInfoModal('${member.member_birth}', '${status.index }')"> --%>
<!-- 													수정 -->
<!-- 												</button> -->
												<%-- 회원정보 수정 모달 설정 --%>
												<div class="modal memberModifyInfoModal" id="memberModifyInfoModal_${status.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-header">
																<h1 class="modal-title fs-5" id="staticBackdropLabel">회원 정보 수정</h1>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div id="modifyMemberInfo" class="mx-auto my-5 w-75">
																	<form id="MemberInfoForm_${status.index }" action="ModifyMemberInfo" class="row" method="post" enctype="multipart/form-data">
																		<div class="form-group" id="formGroupForMemberProfilePic">
																			<label for="reg-fn" id="mgForFiveMemberMod">프로필사진</label>
																			<c:choose>
																				<c:when test="${empty member.member_profile }">
																					<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg">
																				</c:when>
																				<c:otherwise>
																					<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/${member.member_profile}">
																				</c:otherwise>
																			</c:choose>
																			<input type="hidden" id="profile_name" name="member_profile" value="${member.member_profile}">
																			<label for="memberProfilePicFile">
																				<div class="btn btn-primary" id="memberProfilePicModifyButtonArea">사진 변경</div>
<!-- 																				<div class="btnProfilePicModify" id="btnProfilePicModify">사진 변경</div> -->
																			</label>
																			<input type="file" name="file" id="memberProfilePicFile" accept="image/gif, image/png, image/jpeg">
																			<div class="btn btn-primary" id="memberProfilePicResetButtonArea" onclick="resetProfilePic('${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg')">삭제</div>
<%-- 																			<div class="btnProfilePicModify" id="btnProfilePicDelete" onclick="resetProfilePic('${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg')">삭제</div> --%>
																		</div>
																		<div class="form-group">
																			<label for="intro" id="mgForThreeMemberMod">소개글</label>
																			<input class="form-control" value="${member.member_intro }" maxlength="50" type="text" name="member_intro" id="intro" required>
																		</div>
																		<div class="form-group">
																			<label for="name" id="mgForTwoMemberMod">이름</label> 
																			<input class="form-control" value="${member.member_name }" maxlength="5" type="text" name="member_name" id="name" required>
																		</div>
																		<div class="form-group" >
																			<label for="id" id="mgForThreeMemberMod">아이디</label> 
																			<input class="form-control" value="${member.member_id }" maxlength="20" type="text"  name="member_id" id="id" readonly>
																		</div>
																		<div class="form-group">
																			<label for="newPassword" id="mgForFiveOneMemberMod">새 비밀번호</label> 
																			<input type="hidden" name="member_password" id="member_password" value="${member.member_password }">	
																			<input class="form-control" maxlength="16" placeholder="비밀번호를 수정할 경우에만 입력해주세요" type="password"  name="newPassword" id="newPassword" required>
																			<div id="checkPasswordResult" class="resultArea"></div><%--8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
																		</div>
																		<div class="form-group">
																			<label for="passwordConfirm" id="mgForSevenTwoMemberMod">새 비밀번호 확인</label> 
																			<input class="form-control" maxlength="16" placeholder="비밀번호를 한 번 더 입력해주세요" type="password" id="passwordConfirm" required>
																			<div id="checkPasswordConfirmResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="nickname" id="mgForThreeMemberMod">닉네임</label> 
																			<input class="form-control" type="text" value="${member.member_nickname }" name="member_nickname" id="nickname" maxlength="10" required>
																			<button type="button" id="checkNicknameDupButton" class="btn btn-primary">중복확인</button>
											<!-- 								<input type="button" value="닉네임만들기" id="generateNicknameButton"> -->
																			<%-- 입력값이 비어있을 경우 DB에서 임의로 난수발생해 insert 처리 --%>
																			<div id="checkNicknameResult" class="resultArea"></div><%--2~10글자의 한글, 숫자(선택입력) --%>
																		</div>
											
																		<div class="form-group">
																			<label for="birthdate" id="mgForFourMemberMod">생년월일</label> 
																			<input class="form-control" type="date" name="member_birth" id="birthdate" value="${member.member_birth }">
																			<%--회원가입과 동일하게 범위제한하고 기존 생년월일 placeholder --%>
																			<div id="checkBirthdateResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="myMap" id="mgForTwoMemberMod">주소</label> 
																			<input type="hidden" id="map">
																			<input class="form-control" type="text" value="부산광역시 ${member.gu } ${member.dong}" name="member_address" id="myMap" required>
																			<%--회원가입과 동일. 기존 주소 placeholder --%>
																			<button type="button" id="myMapButton" class="btn btn-primary" onclick="AddressMap()">동네인증</button>
																			<div id="checkAddressResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="email" id="mgForThreeMemberMod">이메일</label> 
																			<input class="form-control" type="email" value ="${member.member_email }" name="member_email" id="email" required>
																			<%--회원가입과 동일하게 정규표현식 검증 및 중복확인. 기존 이메일 placeholder --%>
																			<button type="button" id="checkEmailDupButton" class="btn btn-primary">중복확인</button>
																			<div id="checkEmailResult" class="resultArea"></div>
																		</div>
																		<div class="form-group">
																			<label for="phone" id="mgForFiveMemberMod">휴대폰번호</label> 
																			<input class="form-control" maxlength="13" value="${member.member_phone }" type="tel" name="member_phone" id="phone" required>
																			<%--회원가입과 동일하게 인증, 정규표현식 검증, 중복확인(회원아이디 일치하고 휴대폰 번호 동일한 경우 자바스크립트 처리?). 기존 폰번호 placeholder --%>
																			<div id="checkPhoneResult" class="resultArea"></div>
																		</div>
<!-- 																		<div class="form-group"> -->
<!-- 																			<label for="reg-fn" id="mgForFourMemberMod">회원레벨</label>  -->
<!-- 																			<select> -->
<!-- 																				<option>레벨 선택</option> -->
<!-- 																				<option>1</option> -->
<!-- 																				<option>2</option> -->
<!-- 																				<option>3</option> -->
<!-- 																			</select> -->
<!-- 																		</div> -->
																		<div class="form-group">
																			<label for="status" id="mgForFourMemberMod">회원상태</label> 
																			<select id="status" name="member_status">
																				<option disabled value="">상태 선택</option>
<!-- 																				<option>관리자</option> -->
																				<option <c:if test="${member.member_status eq 1 }">selected</c:if> value="1">활동</option>
<!-- 																				<option>정지</option> -->
																				<option <c:if test="${member.member_status eq 2 }">selected</c:if> value="2">탈퇴</option>
																			</select>
																			<div id="checkReportCountResult" class="resultArea">${member.report_real_count }</div><%--신고 횟수 표시 --%>
																		</div>
																	</form>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modifyInfoClose">창닫기</button>
																<button type="submit" class="btn btn-primary" onclick="submitForm('${status.index}')">수정</button>
															</div>
														</div>
													</div>
												</div>		
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