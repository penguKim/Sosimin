<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>소시민</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
<!-- ========================= CSS here ========================= -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
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

// 	let sId = ${sessionScope.sId};
	


	$(function(){
		
		memberExp(${percentage});
		
		// 페이징 처리
		if(${pageInfo.page.pageNum <= 1 }) {
			$("#prevPage").addClass("disabled");
		}
		if(${pageInfo.page.pageNum >= pageInfo.maxPage }) {
			$("#nextPage").addClass("disabled");
		}
		
		// 카테고리 선택
		$("#categoryArea input[type='radio']").on("click", function() {
	//			alert("확인");
			$("#myPageCategory").submit();
		});
	
	
		// 내 정보 수정 클릭 이벤트
		$("#myPageModifyInfoFrom").on("click", function() {
			openModifyMyInfoModal();
		});
		
		// 찜정보 가져오기
		$.ajax({
			type: "POST",
			url: "ShowLikeInfo", <%-- 회원의 찜 정보 가져오기 --%>
				dataType: "json",
				success: function(result) {
					console.log(result);
					if(result.length > 0) {
						for(let i = 0; i < ${fn:length(MyPageList)}; i++) {
							let product_id = $(".list" + i).data("id");
							for(let id of result) {
								if(id.product_id == product_id) {
									$(".list" + i).find(".heart").toggleClass("is-active");
								}
							}
						}
					}
				},
				error: function(xhr, textStatus, errorThrown) {
						alert("찜 불러오기를 실패했습니다.\n새로고침을 해주세요.");
				}
			});
		
		// 찜 버튼 클릭 이벤트
        $(".heart").on("click", function () {
        	let heart = $(this);
    		$.ajax({
    			type: "POST",
    			url: "CheckLike",
    			data: {
    				product_id: $(this).parent().data("id")
    			},
//     			dataType: "json",
    			success: function(result) { <%-- 응답 결과가 문자열로 전송 --%>
    				if(result == 'false') { // 찜을 등록하는 경우
						$(heart).addClass("is-active");
        				Swal.fire({
        					position: 'center',
        					icon: 'success',
        					title: '찜 추가했습니다.',
        					showConfirmButton: false,
        					timer: 2000,
        					toast: true
        				});
    				} else if(result == 'true') { // 찜을 삭제하는 경우
						$(heart).removeClass("is-active");
						$(heart).parent().remove();
        				Swal.fire({
        					position: 'center',
        					icon: 'success',
        					title: '찜 삭제했습니다.',
        					showConfirmButton: false,
        					timer: 2000,
        					toast: true
        				});
    				}
    			}
    		});
        });
		
		// 파일 change 이벤트 처리
	    $("#profilePicFile").on("change", showPreviewImage);
		
		// 필터 선택
		$("#myPageFilter a").on("click", function(event) {
			event.preventDefault();
			$("#myPageFilter").submit();
		});
		
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
		iscorrectNeightborAuth = false; <%-- 동네인증 여부 저장 변수 --%>
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
		
		// 구매확정하기 버튼 클릭 이벤트 처리
		$(".btnConfirmDeal").on("click", function() {
			let product_id = $(this).data("id");
// 			alert(product_id);
			<%-- 서블릿 요청 --%>
			$.ajax({
				type: "GET",
				url: "ConfirmPayment",
				data: {
					"product_id": product_id
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
						$(".btnConfirmDeal").val("거래후기작성");
						$(".btnConfirmDeal").attr("class", "btnWriteReview");
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


	// 받은 후기 클릭 시 모달 띄우는 함수 정의
// 	function openReceivedReviewModal(sId) {
	function openReceivedReviewModal(sId) {
		$("#staticBackdropLabel").text("받은 후기");
 		$(".modal-body input[type='radio']").attr("disabled", false);
 		$(".modal-body input[type='radio']").eq(0).prop("checked", true); // 기본옵션 별로에요 선택
		
 		$("#reviewCheck").empty();
 		$(".modal-footer").html(
	 			'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>'
	 		);

 		$.ajax({
			url: "ShowReviews",
			data: {
				sId: sId
			},
			dataType: "json",
			success: function(data) {
				if(data.CountReviews.length == 0) {
					$("#reviewCheck").html(
							// 별로에요 옵션 표시(디폴트)
				 			'<ul class="list-group">'
				 				+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 					+ '약속 장소에 나타나지 않아요'
				 				+ '</li>'
				 				+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 					+ '상품 상태가 설명과 달라요'
				 				+ '</li>'
				 				+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 					+ '시간 약속을 안 지켜요'
				 				+ '</li>'
				 				+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 					+ '응답이 없어요'
				 				+ '</li>'
				 			+ '</ul>'
				 		);
						// 별로에요 버튼 클릭 이벤트
				 		$("#option1").on("click", function() {
				 			$("#reviewCheck").empty();
				 			$("#reviewCheck").html(
				 					'<ul class="list-group">'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '약속 장소에 나타나지 않아요'
				 					+ '</li>'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '상품 상태가 설명과 달라요'
				 					+ '</li>'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '시간 약속을 안 지켜요'
				 					+ '</li>'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '응답이 없어요'
				 					+ '</li>'
				 				+ '</ul>'
				 			);
				 		});
						
						// 최고에요 버튼 클릭 이벤트
				 		$("#option2").on("click", function() {
				 			$("#reviewCheck").empty();
				 			$("#reviewCheck").html(
				 				'<ul class="list-group">'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '제가 있는곳까지 와서 거래했어요'
				 					+ '</li>'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '친절하고 매너가 좋아요'
				 					+ '</li>'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '시간 약속을 잘 지켜요'
				 					+ '</li>'
				 					+ '<li class="list-group-item">'
				 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
				 					+ '<h6>' + '0개' + '</h6>'
				 						+ '응답이 빨라요'
				 					+ '</li>'
				 				+ '</ul>'
				 			);
							
				 		});
				} else {
					for(let review of data.CountReviews) {
						console.log(review);
						console.log(review.review_status);
						if(review.review_status == "bad") {
					 		$("#reviewCheck").html(
								// 별로에요 옵션 표시(디폴트)
					 			'<ul class="list-group">'
					 				+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check1 + '개' + '</h6>'
					 					+ '약속 장소에 나타나지 않아요'
					 				+ '</li>'
					 				+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check2 + '개' + '</h6>'
					 					+ '상품 상태가 설명과 달라요'
					 				+ '</li>'
					 				+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check3 + '개' + '</h6>'
					 					+ '시간 약속을 안 지켜요'
					 				+ '</li>'
					 				+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check4 + '개' + '</h6>'
					 					+ '응답이 없어요'
					 				+ '</li>'
					 			+ '</ul>'
					 		);
							// 별로에요 버튼 클릭 이벤트
					 		$("#option1").on("click", function() {
					 			$("#reviewCheck").empty();
					 			$("#reviewCheck").html(
					 					'<ul class="list-group">'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check1 + '개' + '</h6>'
					 						+ '약속 장소에 나타나지 않아요'
					 					+ '</li>'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check2 + '개' + '</h6>'
					 						+ '상품 상태가 설명과 달라요'
					 					+ '</li>'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check3 + '개' + '</h6>'
					 						+ '시간 약속을 안 지켜요'
					 					+ '</li>'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					 					+ '<h6>' +  review.review_check4 + '개' + '</h6>'
					 						+ '응답이 없어요'
					 					+ '</li>'
					 				+ '</ul>'
					 			);
					 		});
						
						
						} else if(review.review_status == "good") {
							// 최고에요 버튼 클릭 이벤트
					 		$("#option2").on("click", function() {
					 			$("#reviewCheck").empty();
					 			$("#reviewCheck").html(
					 				'<ul class="list-group">'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					 					+ '<h6>' +  review.review_check1 + '개' + '</h6>'
					 						+ '제가 있는곳까지 와서 거래했어요'
					 					+ '</li>'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					 					+ '<h6>' +  review.review_check2 + '개' + '</h6>'
					 						+ '친절하고 매너가 좋아요'
					 					+ '</li>'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					 					+ '<h6>' +  review.review_check3 + '개' + '</h6>'
					 						+ '시간 약속을 잘 지켜요'
					 					+ '</li>'
					 					+ '<li class="list-group-item">'
					 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					 					+ '<h6>' +  review.review_check4 + '개' + '</h6>'
					 						+ '응답이 빨라요'
					 					+ '</li>'
					 				+ '</ul>'
					 			);
								
					 		});
							
						}
	
					} // for문 끝
					
				}
				
				
			},
			error: function(xhr,textStatus,errorThrown) {
			    // 요청이 실패한 경우 처리할 로직
//				    alert("닉네임 중복 판별 AJAX 요청 실패!");
// 			    Swal.fire({
// 					title: 'AJAX 요청 실패!',         // Alert 제목
// 					text: "후기 불러오기에 실패했습니다!",  // Alert 내용
// 					icon: 'error',
// 				});
				console.log(xhr + ", " + textStatus + ", " + errorThrown);



			}
			
		});
		
		

	}
	
	// 내 정보 수정 클릭 시 모달 띄우는 함수 정의
	function openModifyMyInfoModal() {
	    var memberBirth = "${MyProfileMember.member_birth}"; // EL 표현식에서 값을 가져옴
	    $("#birthdate").val(memberBirth); // 값 설정
		$("#myPageModifyInfoModal").modal("show");
	}
	
	// 파일 선택 시 미리보기 업데이트 처리 함수
	function showPreviewImage() {
		let fileInput = $("#profilePicFile")[0];
		let previewImage = $("#formGroupForProfilePic img");
		
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
	function submitForm(event) {
// 	function submitForm(event) {
		<%-- submit 동작을 수행할 때 값을 올바르게 입력했는지 확인 --%>
// 		$("#MyInfoForm").on("submit", function(event) {
			if(!iscorrectNickname) { // 닉네임 미입력 또는 정규표현식 위배
				$("#checkNicknameResult").text("2~10글자의 한글, 숫자를 입력해주세요").css("color", "red");
				$("#nickname").focus();
			} else if(isDuplicateNickname) { // 닉네임 중복
				$("#checkNicknameResult").text("이미 사용 중인 닉네임입니다").css("color", "red");
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
			} else {
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
						
						$("#MyInfoForm").off("submit");
						$("#MyInfoForm").submit();
						return true;
					} else {
						return false;
					} // else 문 끝
					
				}); // Swal-then 끝
			
// 				return true;
			}
			
			
// 			return true; // submit 동작 수행(생략 가능)
			
			
// 		});
		
		
		
		
		
// 		$("#MyInfoForm").submit();
	}
	
	// 회원 경험치 프로그레스바
	function memberExp(percent) {
		// 스타일 요소를 만들고, @keyframes 규칙을 추가합니다.
		$('<style>')
		.prop('type', 'text/css')
		.html(`
			@keyframes progress-animation {
				0%   {width: 0%;}
				100% {width: percent + '%';}
			}
		`)
		.appendTo('head');
		
		// 프로그레스바 애니메이션을 시작합니다.
		$('.progress-bar').css('width', percent + '%').attr('aria-valuenow', percent + '%').text(percent + '%');
	}
	
	// 프로필 삭제 버튼 클릭 시 이미지 초기화
	function resetProfilePic(src) {
		let fileInput = $("#profilePicFile");
		let previewImage = $("#formGroupForProfilePic img");
		
		// 파일 입력 요소 초기화
		fileInput.val("");
		
		// 이미지 미리보기 초기화
		previewImage.attr("src", src);
		
		$("#profile_name").val("");
	}

	// 커뮤니티 게시글 삭제 버튼
	function deleteCommunity(community_id, btn) {
		Swal.fire({
			title: '정말로 삭제하시겠어요?',
			text: '확인을 누르면 게시글이 삭제됩니다',
			icon: 'warning',
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			reverseButtons: true, // 버튼 순서 거꾸로
		}).then(result => {
			
			// 만약 Promise리턴을 받으면,
			if (result.isConfirmed) { 
				
				$.ajax({
					url: "DeleteCommunity",
					data: {
						community_id: community_id
					},
					success: function(result) {
						console.log(result);
						if(result == "true") {
							$(btn).parent().parent().parent().parent().remove();
						}
					},
					error: function(xhr,textStatus,errorThrown) {
					    // 요청이 실패한 경우 처리할 로직
//						    alert("닉네임 중복 판별 AJAX 요청 실패!");
					    Swal.fire({
							title: 'AJAX 요청 실패!',         // Alert 제목
							text: "커뮤니티 글 삭제에 실패했습니다!",  // Alert 내용
							icon:'error',
						});
						console.log(xhr + ", " + textStatus + ", " + errorThrown);

					}
					
				
				});
			} 
			
		}); // Swal-then 끝
	

		
	}
	
	function deleteCommunityReply(reply_id, btn) {
		Swal.fire({
	        title: '댓글을 삭제하시겠습니까?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#d6C757D',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	        allowOutsideClick: false
	    }).then((result) => {
	        if (result.isConfirmed) {
	    		$.ajax({
	    			type: "GET",
	    			url: "CommunityReplyDelete",
	    			data: {
	    				"reply_id":reply_id
	    			},
	    			dataType: "text",
	    			success: function(result) {
	    				// 댓글 삭제 요청 결과 판별("true"/"false")
	    				if(result == "true") {
							$(btn).parent().parent().parent().remove();
	    				} else if(result == "false") {
	    					alert("댓글 삭제 실패");
	    				} else if(result == "invalidSession") { // 세션아이디 없을 경우
	    					alert("권한이 없습니다!");
	    					return;
	    				}
	    			},
	    			error: function() {
	    				alert("요청 실패!");
	    			}
	    		});
	        } else {
	    		$(this).blur();
	    	}
	    });
	}
	
	
	
</script>
</head>

<body>
	
	<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1 로 저장) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>
	<!-- Preloader -->
	<div class="preloader" style="opacity: 0; display: none;">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
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
                        <h1 class="page-title">마이페이지</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i>홈</a></li>
                        <li>마이페이지</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	<section class="item-details section row" id="myPageProfileSectionArea">
        <div class="container">
            <div class="top-area" id="profileArea">
				<div id="profileLeft">
					<c:choose>
						<c:when test="${empty MyProfileMember.member_profile }">
							<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg">
						</c:when>
						<c:otherwise>
							<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/${MyProfileMember.member_profile}">
						</c:otherwise>
					</c:choose>
				</div>
				<div id="profileRight">
					<div id="profileRightUpperLeft">
						<b id="bold">${MyProfileMember.member_nickname }</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- 인증 완료된 경우 예시 -->
							<p id="sellerAuthArea">
							동네인증
							<c:choose>
								<c:when test="${MyProfileMember.member_neighbor_auth eq 0 }"> <%-- 미인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> 
								</c:when>
								<c:otherwise> <%-- 인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;&nbsp;&nbsp;본인인증
							<c:choose>
								<c:when test="${MyProfileMember.member_phone_auth eq 0 }"> <%-- 미인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> 
								</c:when>
								<c:otherwise> <%-- 인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
								</c:otherwise>
							</c:choose>
							
							</p>
					</div>
					<div id="profileRightUpperRight">
<!-- 						<a href="javascript:reviewViewFrom()" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> -->
						<a href="#staticBackdrop" data-bs-toggle="modal" id="reviewViewFrom" onclick="openReceivedReviewModal('${sessionScope.sId}')">
<!-- 						<a href="javascript:reviewViewFrom()"> -->
							<img src="${pageContext.request.contextPath}/resources/images/member/reviewicon.png">
							받은 후기
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#myPageModifyInfoModal" data-bs-toggle="modal" id="myPageModifyInfoFrom">
							<img src="${pageContext.request.contextPath}/resources/images/member/usericon.png">
							내 정보 수정
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<section id="profileRightMiddle" class="row align-items-center">
						<span class="col auto">Lv. ${MyProfileMember.member_level }</span>
			        	<div class="col-xl-2 col-3">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
			        	</div>						
			        	<span class="col auto">상품 판매 ${MyProfileCountProductSold }회</span>
						<span class="col auto">커뮤니티 글 ${MyProfileCountCommunity }개</span>
						<span class="col auto">커뮤니티 댓글 ${MyProfileCountCommunityReply }개</span>
						<span class="col auto">받은 좋아요 ${MyProfileCountCommunityLike }개</span>
					</section>
					<div id="profileRightBottom">
						<p>
						<c:choose>
							<c:when test="${not empty MyProfileMember.member_intro }">
								${MyProfileMember.member_intro }
							</c:when>
							<c:otherwise>
								등록된 소개글이 없습니다.
							</c:otherwise>
						</c:choose>
						</p>
					</div>
				</div>
            </div>
        </div>
    </section>
    <form action="" id="myPageCategory">
		<div id="categoryArea" class="btn-group col categoryBtn" role="group" aria-label="Basic radio toggle button group">
		  <input type="radio" class="btn-check" name="category" id="soldCategory" value="1" autocomplete="off" <c:if test="${category eq '1' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="soldCategory">판매내역</label>
		  <input type="radio" class="btn-check" name="category" id="boughtCategory" value="2" autocomplete="off" <c:if test="${category eq '2' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="boughtCategory">구매내역</label>
		  <input type="radio" class="btn-check" name="category" id="likeCategory" value="3" autocomplete="off" <c:if test="${category eq '3' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="likeCategory">찜 목록</label>
		  <input type="radio" class="btn-check" name="category" id="communityCategory" value="4" autocomplete="off" <c:if test="${category eq '4' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="communityCategory">커뮤니티 작성 글</label>
		  <input type="radio" class="btn-check" name="category" id="communityReplyCategory" value="5" autocomplete="off" <c:if test="${category eq '5' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="communityReplyCategory">커뮤니티 작성 댓글</label>
		</div>
    </form>
    
    
    
<!--      <div class="meta-information" id="categoryArea"> -->
<!--          <ul class="meta-info"> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-user"></i>판매내역</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-calendar"></i>구매내역</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-tag"></i>관심목록</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-timer"></i>커뮤니티 작성 글</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-timer"></i>커뮤니티 작성 댓글</a></li> -->
<!--          </ul> -->
<!--      </div> -->

	<%-- 페이지 옵션1 : 상품 관련 탭(판매내역, 구매내역, 관심목록) 선택 시 표시 --%>
	<c:if test="${category eq '1' or category eq '3'}">
	   	<div class="filterArea">
	   		<ul class="row allFilter filter-3">
	   			<li class="col-3 eachFilter">
	   				<a href="MyPage?filter=0&category=${category }">
	   					전체
	   				</a>
   				</li>
	   			<li class="col-3 eachFilter">
	   				<a href="MyPage?filter=1&category=${category }">
	   					판매중
	   				</a>
   				</li>
	   			<li class="col-3 eachFilter">
	   				<a href="MyPage?filter=2&category=${category }">
	   					거래완료
	   				</a>
   				</li>
	   		</ul>
		</div>
	</c:if>            
            
	<section class="item-details section wholeProductSection">
	    <div class="product-details-info row" id="wholeProductArea">
	    <c:if test="${empty MyPageList }">
	    	<div class="single-block col">표시할 내역이 없습니다</div>
	    </c:if>
			<c:forEach var="mypage" items="${MyPageList }" varStatus="status">
				<c:choose> <%-- 탭선택 --%>
					<c:when test="${category eq '1' }"> <%-- 판매내역 탭 시작--%>
						<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductArea">
							<c:choose>
								<c:when test="${mypage.trade_status eq '0' or mypage.trade_status eq '1'}"> <%-- 거래(판매) 대기/거래 중 --%>
								<a href="ProductDetail?product_id=${mypage.product_id }">
									<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
								</a>
<!-- 								<span class="heart"></span> -->
								<c:if test="${mypage.trade_status eq '1' }"> <%-- 거래(판매) 중 --%>
									<span id="dealInProcess">거래중</span>
								</c:if>
								<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>
									</b>
								</div>
								<div id="singleProductInfoArea">
									${mypage.product_price }원
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${mypage.product_datetime }
								</div>
								<div id="singleProductContactArea">
									찜 n개
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									채팅 n회
								</div>
								<div id="singleProductButtonArea">
									<c:choose>
										<c:when test="${mypage.trade_status eq '0' }"> <%-- 거래 대기 --%>
											<input type="button" value="수정" onclick="location.href='ProductModify?product_id=${mypage.product_id}'" >
										</c:when>
										<c:when test="${mypage.trade_status eq '1' }"> <%-- 거래 중 --%>
											<input type="button" value="구매확정요청">
										</c:when>
									</c:choose>
								</div>
							</c:when>
							
							<c:when test="${mypage.trade_status eq '2' }"> <%-- 거래(판매) 완료 --%>
								<div class="single-block list${status.index} col-4" data-id="${mypage.product_id }" id="singleProductAreaDealComplete">
									<a href="ProductDetail?product_id=${mypage.product_id }">
										<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
									</a>									
									<span id="dealComplete">
										<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
										<b>판매 완료</b>
									</span>				
<!-- 									<span class="heart"></span> -->
									<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>
									</b>
									</div>
									<div id="singleProductInfoArea">
										${mypage.product_price }원
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										${mypage.product_datetime }
									</div>
									<div id="singleProductContactArea">
										찜 n개
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										채팅 n회
									</div>
									<div id="singleProductButtonArea">
										<c:choose>
											<c:when test="${empty mypage.review_id }">
												<input type="button" value="거래후기작성">
											</c:when>
											<c:otherwise>
												<input type="button" value="거래후기보기">
											</c:otherwise>
										</c:choose>
		<!-- 								거래 후기 작성 이후 판별해서 보이기 -->
									</div>
								</div>	
							</c:when>
						</c:choose>
				        </div> <%--singleProductArea 끝 --%>
					</c:when> <%-- 판매내역탭 끝 --%>
					
					
			       
					<c:when test="${category eq '2' }"> <%-- 구매내역 탭 시작 --%>
						<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductArea">
				        <c:choose>
							<c:when test="${mypage.order_status eq '0'}"> <%-- 거래(구매) 중 --%>
							<a href="ProductDetail?product_id=${mypage.product_id }">
								<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
							</a>										
							<span class="heart"></span>
							<span id="dealInProcess">거래중</span>
							<div id="singleProductTitleArea">
								<b>
								<c:choose>
							        <c:when test="${fn:length(mypage.product_name) gt 9}">
							        	${fn:substring(mypage.product_name, 0, 8)} ...
							        </c:when>
							        <c:otherwise>
							        	${mypage.product_name }
							        </c:otherwise>
								</c:choose>								
								</b>
							</div>
							<div id="singleProductInfoArea">
								${mypage.product_price }원
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${mypage.product_datetime }
							</div>
							<div id="singleProductContactArea">
								찜 n개
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								채팅 n회
							</div>
							<div id="singleProductButtonArea">
								<input type="button" class="btnConfirmDeal num${mypage.product_id }" data-id="${mypage.product_id}" value="구매확정하기">
							</div>
							</c:when>						
							<c:when test="${mypage.order_status eq '1'}"> <%-- 거래(구매)완료 --%>
								<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductAreaDealComplete">
									<a href="ProductDetail?product_id=${mypage.product_id }">
										<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
									</a>											
									<span id="dealComplete">
									<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
									<b>구매 완료</b>
								</span>				
								<span class="heart"></span>
								<div id="singleProductTitleArea">
								<b>
								<c:choose>
							        <c:when test="${fn:length(mypage.product_name) gt 9}">
							        	${fn:substring(mypage.product_name, 0, 8)} ...
							        </c:when>
							        <c:otherwise>
							        	${mypage.product_name }
							        </c:otherwise>
								</c:choose>								
								</b>
								</div>
								<div id="singleProductInfoArea">
									${mypage.product_price }원
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${mypage.product_datetime }
								</div>
								<div id="singleProductContactArea">
									찜 n개
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									채팅 n회
								</div>
								<div id="singleProductButtonArea">
									<c:choose>
										<c:when test="${empty mypage.review_id }">
											<input type="button" value="거래후기작성">
										</c:when>
										<c:otherwise>
											<input type="button" value="거래후기보기">
										</c:otherwise>
									</c:choose>
								</div>
					        </div>
							</c:when>
						</c:choose>
				        </div> <%--singleProductArea 끝 --%>
					</c:when> <%-- 구매내역 탭 끝 --%>
					
					<c:when test="${category eq '3' }"> <%-- 찜목록 탭 시작--%>
						<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductArea">
							<c:choose>
								<c:when test="${mypage.trade_status eq '0' or mypage.trade_status eq '1'}"> <%-- 거래(판매) 대기/거래 중 --%>
								<a href="ProductDetail?product_id=${mypage.product_id }">
									<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
								</a>							
								<span class="heart"></span>
								<c:if test="${mypage.trade_status eq '1' }"> <%-- 거래(판매) 중 --%>
									<span id="dealInProcess">거래중</span>
								</c:if>
								<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>									
									</b>
								</div>
								<div id="singleProductInfoArea">
									${mypage.product_price }원
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${mypage.product_datetime }
								</div>
								<div id="singleProductContactArea">
									찜 n개
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									채팅 n회
								</div>
								<div id="singleProductButtonArea">
									<input type="button" value="상세보기" onclick="ProductDetail?product_id=${mypage.product_id}">
								</div>
							</c:when>
							
							<c:when test="${mypage.trade_status eq '2' }"> <%-- 거래(판매) 완료 --%>
								<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductAreaDealComplete">
									<a href="ProductDetail?product_id=${mypage.product_id }">
										<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
									</a>												
									<span id="dealComplete">
										<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
										<b>판매 완료</b>
									</span>				
									<span class="heart"></span>
									<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>								
									</b>
									</div>
									<div id="singleProductInfoArea">
										${mypage.product_price }원
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										${mypage.product_datetime }
									</div>
									<div id="singleProductContactArea">
										찜 n개
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										채팅 n회
									</div>
									<div id="singleProductButtonArea">
										<c:choose>
											<c:when test="${empty mypage.review_id }">
												<input type="button" value="거래후기작성">
											</c:when>
											<c:otherwise>
												<input type="button" value="거래후기보기">
											</c:otherwise>
										</c:choose>
									</div>
								</div>	
							</c:when>
						</c:choose>
				        </div> <%--singleProductArea 끝 --%>
					</c:when> <%-- 찜목록탭 끝 --%>
					
					
					
					<c:when test="${category eq '4' }"> <%-- 커뮤니티 작성글 탭 시작--%>
					    <div class="single-block col-1" id="singleCommunityArea">
							<div id="communityLeft">
								<div id="communityLeftUpperLeft" class="row">
									<div class="col-10">
										<c:choose>
											<c:when test="${mypage.community_category eq 1}">
												<p>동네소식</p>
											</c:when>
											<c:when test="${mypage.community_category eq 2}">
												<p>동네질문</p>
											</c:when>
											<c:when test="${mypage.community_category eq 3}">
												<p>일상</p>
											</c:when>
										</c:choose>
										<input type="hidden" name="community_id" value="${mypage.community_id }">
										<b id="bold"><a href="CommunityDetail?community_id=${mypage.community_id }">
										<c:choose>
									        <c:when test="${fn:length(mypage.community_subject) gt 15}">
									        	${fn:substring(mypage.community_subject, 0, 14)} ...
									        </c:when>
									        <c:otherwise>
									        	${mypage.community_subject }
									        </c:otherwise>
										</c:choose>
										</a></b><br>
									</div>
									<div class="col d-flex justify-content-end">
										<input type="button" class="btn btn-primary" value="삭제" style="width:60% !important;" onclick="deleteCommunity('${mypage.community_id }', this)">
									</div>
								</div>
								<div id="communityMiddleArea">
									<div id="communityMiddleLeft">${mypage.community_datetime }</div>
									<div id="communityMiddleRight">
										조회수 ${mypage.community_readcount }&nbsp;&nbsp;&nbsp;&nbsp;댓글 ${mypage.reply_count }&nbsp;&nbsp;&nbsp;&nbsp;좋아요 ${mypage.like_count }
									</div>
								</div>
								<div id="communityLeftBottom">
									<p>
										<c:choose>
									        <c:when test="${fn:length(mypage.community_content) gt 30}">
									        	${fn:substring(mypage.community_content, 0, 29)} ...
									        </c:when>
									        <c:otherwise>
									        	${mypage.community_content }
									        </c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
							<div id="communityRight">
								<img src="${pageContext.request.contextPath}/resources/upload/${mypage.community_image1}">
							</div>
				        </div> <%--singleCommunityArea 끝 --%>
					</c:when> <%-- 커뮤니티 작성글 탭 끝 --%>
					
					<c:when test="${category eq '5' }"> <%-- 커뮤니티 작성댓글 탭 시작--%>
					    <div class="single-block col-1" id="singleCommunityReplyArea">
							<div id="communityReplyTitleArea" class="row">
								<div class="col-10">
									<c:choose>
										<c:when test="${mypage.community_category eq 1}">
											<p>동네소식</p>
										</c:when>
										<c:when test="${mypage.community_category eq 2}">
											<p>동네질문</p>
										</c:when>
										<c:when test="${mypage.community_category eq 3}">
											<p>일상</p>
										</c:when>
									</c:choose>
									<b id="bold"><a href="CommunityDetail?community_id=${mypage.community_id }">
									<c:choose>
								        <c:when test="${fn:length(mypage.community_subject) gt 15}">
								        	${fn:substring(mypage.community_subject, 0, 14)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.community_subject }
								        </c:otherwise>
									</c:choose>
									</a></b><br>
								</div>
								<div class="col d-flex justify-content-end">
									<input type="button" class="btn btn-primary" value="삭제" style="width:60% !important;" onclick="deleteCommunityReply('${mypage.reply_id }', this)">
								</div>
							</div>
							<div id="communityReplyMiddleArea">
<%-- 								<div id="communityReplyMiddleLeft">${mypage.reply_datetime }</div> --%>
								<div id="communityReplyMiddleRight">
<!-- 									대댓글 n개 -->
									${mypage.reply_datetime }
								</div>
							</div>
							<div id="communityReplyLeftBottom">
								<p>
								<c:choose>
							        <c:when test="${fn:length(mypage.reply_content) gt 4}">
							        	${fn:substring(mypage.reply_content, 0, 3)} ...
							        </c:when>
							        <c:otherwise>
							        	${mypage.reply_content }
							        </c:otherwise>
								</c:choose>
								</p>
							</div>
						</div> <%--singleCommunityReplyArea 끝 --%>
					</c:when> <%-- 커뮤니티 작성글 탭 끝 --%>
		        </c:choose> <%-- 탭선택 --%>
			</c:forEach>
	    </div>
	    <nav aria-label="Page navigation">
				<ul class="pagination d-flex justify-content-center">
					<li class="page-item" id="prevPage">
<%-- 						<a href="Community?pageNum=${pageNum - 1}" class="page-link">&laquo;</a> --%>
						<a href="MyPage?category=${param.category }&pageNum=${pageNum - 1}" class="page-link">&laquo;</a>
					</li>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageNum eq i }">
						<li class="page-item active"><span class="page-link">${i }</span></li>
						</c:when>
						<c:otherwise>
						<li class="page-item"><a href="MyPage?category=${param.category }&pageNum=${i }" class="page-link" >${i }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<li class="page-item" id="nextPage">
						<a href="MyPage?category=${param.category }&pageNum=${pageNum + 1}" class="page-link">&raquo;</a>
					</li>
				</ul>
			</nav>
	</section>    

    <%-- 후기 모달 설정 --%>
	<div class="modal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">후기 등록</h1>
	<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-center" id="reviewModalButtonArea">
						<input type="radio" class="btn-check" name="options" id="option1" value="bad" autocomplete="off">
						<label class="btn btn-outline-primary mx-4" for="option1">별로예요</label>
						<input type="radio" class="btn-check" name="options" id="option2" value="good" autocomplete="off" checked>
						<label class="btn btn-outline-primary mx-4" for="option2">최고예요</label>
					</div>
					<div id="reviewCheck" class="mx-auto my-5 w-75">
					</div>
				</div>
				<div class="modal-footer">
<!-- 					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button> -->
<!-- 					<button type="submit" class="btn btn-primary" id="reviewRegist">후기 등록</button> -->
				</div>
			</div>
		</div>
	</div>

    <%-- 회원정보 수정 모달 설정 --%>
	<div class="modal" id="myPageModifyInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">내 정보 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="modifyMyInfo" class="mx-auto my-5 w-75">
						<form id="MyInfoForm" action="ModifyMyInfo" class="row" method="post" enctype="multipart/form-data">
							<div class="form-group" id="formGroupForProfilePic">
								<label for="reg-fn" id="mgForFiveMod">프로필사진</label>
								<c:choose>
									<c:when test="${empty MyProfileMember.member_profile }">
										<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg">
									</c:when>
									<c:otherwise>
										<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/${MyProfileMember.member_profile}">
									</c:otherwise>
								</c:choose>
								<input type="hidden" id="profile_name" name="member_profile" value="${MyProfileMember.member_profile}">
								<label for="profilePicFile">
<!-- 										<input type="button" class="btnProfilePicModify" value="사진 변경"> -->
									<div class="btnProfilePicModify" id="btnProfilePicModify">사진 변경</div>
								</label>
								<input type="file" name="file" id="profilePicFile" accept="image/gif, image/png, image/jpeg">
<%-- 								<input type="file" name="file" id="profilePicFile" accept="image/gif, image/png, image/jpeg" onchange="showPreviewImage('${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg')"> --%>
								<div class="btnProfilePicModify" id="btnProfilePicDelete" onclick="resetProfilePic('${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg')">삭제</div>
							</div>
							<div class="form-group">
								<label for="intro" id="mgForThreeMod">소개글</label>
								<input class="form-control" value="${MyProfileMember.member_intro }" maxlength="50" type="text" name="member_intro" id="intro" required>
								<div id="checkIntroResult" class="resultArea"></div><%--8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
							</div>

							<div class="form-group">
								<label for="name" id="mgForTwoMod">이름</label> 
								<input class="form-control" value="${MyProfileMember.member_name }" maxlength="5" type="text" name="member_name" id="name" readonly>
							</div>
							<div class="form-group" >
								<label for="id" id="mgForThreeMod">아이디</label> 
								<input class="form-control" value="${MyProfileMember.member_id }" maxlength="20" type="text"  name="member_id" id="id" readonly>
							</div>
							<div class="form-group">
								<label for="newPassword" id="mgForFiveOneMod">새 비밀번호</label> 
								<input type="hidden" name="member_password" id="member_password" value="${MyProfileMember.member_password }">	
								<input class="form-control" maxlength="16" placeholder="비밀번호를 수정할 경우에만 입력해주세요" type="password"  name="newPassword" id="newPassword" required>
								<div id="checkPasswordResult" class="resultArea"></div><%--8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
							</div>
							<div class="form-group">
								<label for="passwordConfirm" id="mgForSevenTwoMod">새 비밀번호 확인</label> 
								<input class="form-control" maxlength="16" placeholder="비밀번호를 한 번 더 입력해주세요" type="password" id="passwordConfirm" required>
								<div id="checkPasswordConfirmResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="nickname" id="mgForThreeMod">닉네임</label> 
								<input class="form-control" type="text" value="${MyProfileMember.member_nickname }" name="member_nickname" id="nickname" maxlength="10" required>
								<input type="button" value="중복확인" id="checkNicknameDupButton">
<!-- 								<input type="button" value="닉네임만들기" id="generateNicknameButton"> -->
								<%-- 입력값이 비어있을 경우 DB에서 임의로 난수발생해 insert 처리 --%>
								<div id="checkNicknameResult" class="resultArea"></div><%--2~10글자의 한글, 숫자(선택입력) --%>
							</div>

							<div class="form-group">
								<label for="birthdate" id="mgForFourMod">생년월일</label> 
								<input class="form-control" type="date" name="member_birth" id="birthdate" value="${MyProfileMember.member_birth }" readonly>
							</div>
							<div class="form-group">
								<label for="myMap" id="mgForTwoMod">주소</label> 
								<input type="hidden" id="map">
								<input type="hidden" id="member_neighbor_auth" name="member_neighbor_auth" value="${MyProfileMember.member_neighbor_auth }">
								<c:choose>
									<c:when test="${MyProfileMember.member_neighbor_auth eq 1 }">
										<input class="form-control" type="text" value="부산광역시 ${MyProfileMember.gu } ${MyProfileMember.dong}" name="member_address" id="myMap" required readonly>
									</c:when>
									<c:otherwise>
										<input class="form-control" type="text" placeholder="재인증을 해주세요" name="member_address" id="myMap" required readonly>
									</c:otherwise>
								</c:choose>
								<%--회원가입과 동일. 기존 주소 placeholder --%>
								<input type="button" value="동네인증" id="myMapButton" onclick="AddressMap()">
								<div id="checkAddressResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="email" id="mgForThreeMod">이메일</label> 
								<input class="form-control" type="email" value ="${MyProfileMember.member_email }" name="member_email" id="email" required>
								<%--회원가입과 동일하게 정규표현식 검증 및 중복확인. 기존 이메일 placeholder --%>
								<input type="button" value="중복확인" id="checkEmailDupButton">
								<div id="checkEmailResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="phone" id="mgForFiveMod">휴대폰번호</label> 
								<input class="form-control" maxlength="13" value="${MyProfileMember.member_phone }" type="tel" name="member_phone" id="phone" required>
								<%--회원가입과 동일하게 인증, 정규표현식 검증, 중복확인(회원아이디 일치하고 휴대폰 번호 동일한 경우 자바스크립트 처리?). 기존 폰번호 placeholder --%>
								<input type="button" value="인증코드발급" id="requestPhoneAuthCodeButton">
								<div id="checkPhoneResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="phoneAuthCode" id="mgForFourMod">인증코드</label> 
								<input class="form-control" placeholder="코드를 입력한 후 인증 버튼을 눌러주세요" type="text" name="phone_auth_code" id="phoneAuthCode" maxlength="4">
								<input type="button" value="인증" id="completePhoneAuthButton">
								<div id="checkPhoneAuthCodeResult" class="resultArea"></div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modifyInfoClose">창닫기</button>
					<button type="submit" class="btn btn-primary" onclick="submitForm()">수정</button>
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