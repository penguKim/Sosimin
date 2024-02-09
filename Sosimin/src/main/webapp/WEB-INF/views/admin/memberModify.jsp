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
	let member_name = "";
	let member_password = "";
	let member_nickname = "";
	let member_email = "";
	let member_phone = "";
	
	// 중복, 정규표현식, 안전도, 일치여부 저장 변수 선언
	//	let isCorrectIntro = false;
	let iscorrectName = false; <%-- 이름 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
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
	let iscorrectBirth = true;	



	
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
		member_name = $("#member_name").val();
		member_password = $("#member_password").val();
		member_nickname = $("#nickname").val();
		member_email = $("#email").val();
		member_phone = $("#phone").val();
		member_birth = $("#birthdate").val();
		
		// 중복, 정규표현식, 안전도, 일치여부 저장 변수 선언
// 		let isCorrectIntro = false;
		iscorrectName = true; <%-- 이름 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
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
		iscorrectBirth = true; <%-- 생년월일 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		
		// 소개글 블러 이벤트 처리
// 		$("#intro").on("blur", function() {
// 			let newIntro = $("#intro").val();
// 			if(member_intro == newIntro) { // 기존 소개글과 동일할 경우
// 				$("#checkIntroResult").text("기존과 동일한 소개글입니다").css("color", "#FFB400");
// 				isCorrectIntro = true;
// 			}
// 		});
		
	navigator.geolocation.getCurrentPosition(function(position) {
		  var latitude = position.coords.latitude; // 현재 위치의 위도
		  var longitude = position.coords.longitude; // 현재 위치의 경도

		  var container = document.getElementById('map'); // 지도를 표시할 위치
		  var options = {
		    center: new kakao.maps.LatLng(latitude, longitude), // 지도 위치 설정(내위치)
		    level: 3 // 지도 확대 레벨(휠로 돌리기전 기본 레벨 설정)
		  };

		  map = new kakao.maps.Map(container, options); // 지도 생성 및 표시

		  var markerPosition = new kakao.maps.LatLng(latitude, longitude); // 마커의 위치 좌표 내위치기준으로 좌표줬음
		  marker = new kakao.maps.Marker({
		    position: markerPosition		// 마커 생성 시 위치 설정
		  });
		  marker.setMap(map); // 마커를 지도에 표시해준다.
		});
		
		// 내위치정보 클릭 시 해당 위치의 주소 가져오기(위도 / 경도를 도로명주소,지번주소로 변경)
		$("#myMapButton").on("click", function() {
		  var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체 생성(카카오api사용)
		  var markerPosition = marker.getPosition(); // 마커의 위치 좌표(위에서 찍힌 마커 위치 좌표를 가져옴)
		  var latitude = markerPosition.getLat(); // 마커의 위도(내가 가져온 현재 위치의 위도)
		  var longitude = markerPosition.getLng(); // 마커의 경도(내가 가져온 현재 위치의 경도)

		  geocoder.coord2Address(longitude, latitude, function(result, status) {
		   if (status === kakao.maps.services.Status.OK) { // 주소-좌표 변환 성공 시
			// 도로명 주소가 있을 경우 도로명 주소를, 없을 경우 지번 주소를 표시
	          var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	          detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	          
	          var address = result[0].address.address_name; // 지번 주소
	          
	          
// 	          var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          
	          if (address.split(' ')[0] == "부산") {
	              var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	            } else {
	              alert("부산광역시에서만 가능합니다.");
	              return;
	            }
	          
	          if(address.split(' ')[0] == "부산" || address.split(' ')[0] == "대구" || address.split(' ')[0] == "인천" || address.split(' ')[0] == "광주" || address.split(' ')[0] == "대전" || address.split(' ')[0] == "울산"  ) {
	        	  var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          } else if(address.split(' ')[0] == "서울" ) {
	        	  var modifiedAddress = address.split(' ')[0] + "특별시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          } else {
	        	  var modifiedAddress = address.split(' ')[0]  + " " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          }
		      
	          
	          $("#myMap").val(modifiedAddress);
	          localStorage.setItem(sId + "_tradePlace", modifiedAddress);
	          
		    } else {
		      alert("주소를 가져오지 못했습니다.");
		    }
		  });
		});
		var sId = "${sId}";

		
		<%-- 이름 확인 --%>
		$("#name").on("blur", function() {	
			if(member_name == $("#name").val()) { // 기존 이름과 동일할 경우
				$("#checkNameResult").text("기존과 동일한 이름입니다").css("color", "#FFB400");
				iscorrectName = true;
			} else { 
				let regName = /^[가-힣]{2,5}$/; <%-- 한글 2~5글자 --%>
				if(!regName.test($("#name").val())){
					$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
					iscorrectName = false;
				} else if(regName.test($("#name").val())){
					$("#checkNameResult").text("사용 가능한 이름입니다").css("color", "green");
					iscorrectName = true;
		        }
			}
		});	
		
		
		
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
								$("#checkPhoneResult").text("사용 가능한 번호입니다. ").css("color", "green");
								iscorrectPhone = true;
								isDuplicatePhone = false;
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
		
		let regBirth = /^(19[0-9][0-9]|20[0-2][0-9]).(0[0-9]|1[0-2]).(0[1-9]|[1-2][0-9]|3[0-1])$/; <%-- 1920년~2029년까지/01월~12월까지/01일~31일까지의 8자리 숫자 --%>
		<%-- 생년월일 확인 --%>
		$("#birthdate").on("blur", function() {	
			let newBirth = $("#birthdate").val();
			if(member_birth == newBirth) {
				$("#checkBirthdateResult").text("기존과 동일한 생년월일입니다").css("color", "#FFB400");
				iscorrectBirth = true;
			} else {
				if(!regBirth.test($("#birthdate").val())) {
					$("#checkBirthdateResult").text("생년월일을 확인해주세요").css("color", "red");
					iscorrectBirth = false;
				} else if(regBirth.test($("#birthdate").val())) {
					$("#checkBirthdateResult").text("사용 가능한 생년월일입니다").css("color", "green");
					iscorrectBirth = true;
		        }
			}
		});	
		
		
		$("#adminModifyForm").on("submit", function(event) {
			if(!iscorrectName) { // 이름 미입력 또는 정규표현식 위배
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				$("#name").focus();
			} else if(!iscorrectNickname) { // 닉네임 미입력 또는 정규표현식 위배
				$("#checkNicknameResult").text("2~10글자의 한글, 숫자를 입력해주세요").css("color", "red");
				$("#nickname").focus();
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
			} else if(!iscorrectBirth) {  <%-- 생년월일 미입력 시 --%>
				$("#checkBirthdateResult").text("생년월일을 확인해주세요").css("color", "red");
				$("#birthdate").focus();
				return false; // submit 동작 취소
			}  else {
// 				confirm("가입 완료 버튼을 누르면 회원가입이 완료됩니다");
	 			event.preventDefault();
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
						
						$("#adminModifyForm").off("submit");
						$("#adminModifyForm").submit();
						return true;
					} else {
						return false;
					} // else 문 끝
					
				}); // Swal-then 끝
			
			}
		});
		
		
		
		
	}); // document.ready 끝
	
	//지도로 찾기 팝업
	function AddressMap() {
		var width = 517; // 팝업 창의 가로 크기
		var height = 485; // 팝업 창의 세로 크기
		var left = window.screenX + (window.outerWidth - width) / 2; // 화면 가로 중앙에 위치
		var top = window.screenY + (window.outerHeight - height) / 2; // 화면 세로 중앙에 위치
		
		var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",resizable=no";
		
		window.open("AddressMap", "지도로 찾기", options);
		$("#member_neighbor_auth").val("1");	

	}

	// 팝업창에서 가져온 값을 뿌려준다.
	function setAddress(address) {
		document.getElementById('myMap').value = address;
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
<!--       <div class="row"> -->
<!--         <div class="col-lg-6"> -->

          <div class="card mx-auto" style="width: 900px !important;">
            <div class="card-body">
              <h5 class="card-title"></h5>

              <!-- General Form Elements -->
              <form action="ModifyMemberInfo" method="post" id="adminModifyForm" enctype="multipart/form-data">
				<div class="form-group row" id="formGroupForMemberProfilePic" style="margin-bottom:5% !important;">
					<div class="col-3 align-self-center">
						<label for="reg-fn" class="me-5">프로필사진</label>
					</div>
					<div class="col-auto">
						<c:choose>
							<c:when test="${empty member.member_profile }">
								<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg" style="width:80px; height:80px;">
							</c:when>
							<c:otherwise>
								<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/${member.member_profile}" style="width:80px; height:80px;"> 
							</c:otherwise>
						</c:choose>
						<input type="hidden" id="profile_name" name="member_profile" value="${member.member_profile}">
					</div>
					<div class="col-auto align-self-center">
						<label for="memberProfilePicFile">
							<div class="btn btn-primary" id="memberProfilePicModifyButtonArea" style="width: 100px !important;">사진 변경</div>
						</label>
						<input type="file" name="file" id="memberProfilePicFile" accept="image/gif, image/png, image/jpeg">
					</div>
					<div class="col-auto align-self-center">
						<div class="btn btn-primary" id="memberProfilePicResetButtonArea" style="width: 100px !important; margin-top: -1px !important;
    					padding: 5px !important;" onclick="resetProfilePic('${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg')">삭제</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="intro" id="">소개글</label>
					</div>
					<div class="col">
						<input class="form-control" value="${member.member_intro }" maxlength="50" type="text" name="member_intro" id="intro">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="name" id="">이름</label> 
					</div>
					<div class="col">
						<div class="row">
							<div class="col">
								<input class="form-control" value="${member.member_name }" maxlength="5" type="text" name="member_name" id="name" required>
							</div>
						</div>						
						<div id="checkNameResult" class="resultAreaForAdmin col"></div>
					</div>
				</div>
				<div class="form-group row" >
					<div class="col-3">
						<label for="id" id="">아이디</label> 
					</div>
					<div class="col">
						<input class="form-control" value="${member.member_id }" maxlength="20" type="text"  name="member_id" id="id" readonly>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="newPassword" id="">새 비밀번호</label> 
						<input type="hidden" name="member_password" id="member_password" value="${member.member_password }">	
					</div>
					<div class="col">
						<input class="form-control" maxlength="16" placeholder="비밀번호를 수정할 경우에만 입력해주세요" type="password"  name="newPassword" id="newPassword">
						<div id="checkPasswordResult" class="resultAreaForAdmin"></div><%--8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="passwordConfirm" id="">새 비밀번호 확인</label> 
					</div>
					<div class="col">
						<input class="form-control" maxlength="16" placeholder="비밀번호를 한 번 더 입력해주세요" type="password" id="passwordConfirm">
						<div id="checkPasswordConfirmResult" class="resultAreaForAdmin"></div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="nickname" id="">닉네임</label> 
					</div>
					<div class="col">
						<div class="row">
							<div class="col-9">
								<input class="form-control" type="text" value="${member.member_nickname }" name="member_nickname" id="nickname" maxlength="10" required>
							</div>
							<div class="col">
								<button type="button" id="checkNicknameDupButton" class="btn btn-primary" style="width: 100px !important">중복확인</button>
							</div>			
						</div>
						<div class="row">
							<div id="checkNicknameResult" class="resultAreaForAdmin"></div><%--2~10글자의 한글, 숫자(선택입력) --%>
						</div>
					</div>
				</div>
		
				<div class="form-group row">
					<div class="col-3">
						<label for="birthdate" id="">생년월일</label> 
					</div>
					<div class="col">
						<input class="form-control" type="date" name="member_birth" id="birthdate" value="${member.member_birth }">
						<%--회원가입과 동일하게 범위제한하고 기존 생년월일 placeholder --%>
						<div id="checkBirthdateResult" class="resultAreaForAdmin"></div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="myMap" id="">주소</label> 
						<input type="hidden" id="map">
						<input type="hidden" id="member_neighbor_auth" name="member_neighbor_auth" value="${member.member_neighbor_auth }">
					</div>
					<div class="col">
						<div class="row">
							<div class="col-9">
								<input class="form-control" type="text" value="부산광역시 ${member.gu } ${member.dong}" name="member_address" id="myMap" required>
							</div>
							<div class="col">
								<button type="button" id="myMapButton" class="btn btn-primary" style="width: 100px !important" onclick="AddressMap()">동네변경</button>
							</div>
						</div>
						<div class="row">
							<%--회원가입과 동일. 기존 주소 placeholder --%>
							<div id="checkAddressResult" class="resultAreaForAdmin"></div>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="email" id="">이메일</label> 
					</div>
					<div class="col">
						<div class="row">
							<div class="col-9">
								<input class="form-control" type="email" value ="${member.member_email }" name="member_email" id="email" required>
							</div>
							<div class="col">
								<button type="button" id="checkEmailDupButton" class="btn btn-primary" style="width: 100px !important">중복확인</button>
							</div>
						</div>
						<div class="row">
							<%--회원가입과 동일하게 정규표현식 검증 및 중복확인. 기존 이메일 placeholder --%>
							<div id="checkEmailResult" class="resultAreaForAdmin"></div>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="phone" id="">휴대폰번호</label> 
					</div>
					<div class="col">
						<input class="form-control" maxlength="13" value="${member.member_phone }" type="tel" name="member_phone" id="phone" required>
						<div id="checkPhoneResult" class="resultAreaForAdmin"></div>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-3">
						<label for="status" id="">회원상태</label> 
					</div>
					<div class="col">
						<select id="status" name="member_status">
							<option disabled value="">상태 선택</option>
							<option <c:if test="${member.member_status eq 1 }">selected</c:if> value="1">활동</option>
							<option <c:if test="${member.member_status eq 2 }">selected</c:if> value="2">탈퇴</option>
						</select>
					</div>
					<div class="col" id="checkReportCountResult" class="resultAreaForAdmin">최종 신고 횟수 : ${member.report_real_count }</div><%--신고 횟수 표시 --%>
				</div>
				<hr>
				<div class="d-flex justify-content-center btnMemberModifyArea">
					<button type="button" class="btn btn-secondary" onclick="history.back()"> 뒤로가기</button>
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
              </form><!-- End General Form Elements -->
            </div>
          </div>
    </section>
  </main>

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