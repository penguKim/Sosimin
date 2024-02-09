<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<%-- sweetalert --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a75e8ce5f3bdcb17d52cf91eac1f473&libraries=services"></script>
<script type="text/javascript">
	$(function() {
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
		          
		          
//	 	          var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
		          
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
			
	}); // document.ready 끝
	
	//지도로 찾기 팝업
	function AddressMap() {
		var width = 517; // 팝업 창의 가로 크기
		var height = 485; // 팝업 창의 세로 크기
		var left = window.screenX + (window.outerWidth - width) / 2; // 화면 가로 중앙에 위치
		var top = window.screenY + (window.outerHeight - height) / 2; // 화면 세로 중앙에 위치
		
		var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",resizable=no";
		
		window.open("AddressMap", "지도로 찾기", options);
	}

	// 팝업창에서 가져온 값을 뿌려준다.
	function setAddress(address) {
		document.getElementById('myMap').value = address;
	}
	

	$(function() {
		<%-- 뒤로가기 방지 --%>
		if (performance.navigation.type === 2) { <%-- 0 : 처음 로딩/새로고침, 1 : 페이지가 앞/뒤로 이동, 2 : 페이지가 뒤로 이동  --%>
			Swal.fire({
				title: '비정상적인 접근!',         // Alert 제목
				text: "메인페이지로 이동합니다!",  // Alert 내용
				icon:'warning',
			});
// 			alert('비정상적인 접근입니다.\n메인페이지로 이동합니다.');
			location.href = './'; //다른 페이지로 이동
		}
		
		let iscorrectName = false; <%-- 이름 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		let iscorrectId = false; <%-- 아이디 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		let isDuplicateId = false; <%-- 아이디 중복 여부를 저장할 변수 선언 --%>
		let iscorrectNickname = false; <%-- 닉네임 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		let isDuplicateNickname = false; <%-- 닉네임 중복 여부를 저장할 변수 선언 --%>
		let iscorrectPassword = false; <%-- 비밀번호 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		let isSamePassword = false; <%-- 패스워드 일치 여부를 저장할 변수 선언 --%>
		let isSafePassword = false; <%-- 패스워드 안전도를 저장하는 변수 --%>
		let iscorrectBirthdate = false; <%-- 생년월일 입력 여부 저장할 변수 선언 --%>
		let iscorrectEmail = false; <%-- 이메일 입력 및 정규표현식 적합 여부 저장할 변수 선언 --%>
		let isDuplicateEmail = false; <%-- 이메일 중복 여부를 저장할 변수 선언 --%>
		let iscorrectPhone = false; <%-- 휴대폰번호입력 여부 저장할 변수 선언 --%>
		let isDuplicatePhone = false; <%-- 휴대폰번호 중복 여부를 저장할 변수 선언 --%>
		let iscorrectPhoneAuthCode = false; <%-- 휴대폰번호 인증코드 입력 여부 저장할 변수 선언 --%>
		
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
		
		<%-- 아이디 정규표현식 검증 및 중복 확인 --%>
		$("#id").blur(function() {
			let member_id = $("#id").val();
			<%-- 아이디 길이, 문자 종류 확인 --%>
			let regId = /^(?=.*[a-z])(?=.*[0-9])[a-z0-9]{5,20}$/; <%-- 5~20자의 영문(소문자), 숫자 조합 --%>
			if(!regId.exec(member_id)) {
				$("#checkIdResult").text("5~20자의 영문 소문자, 숫자를 조합해 입력해주세요").css("color", "red");
				iscorrectId = false;
			} else {
				$("#checkIdResult").text("오른쪽 버튼을 눌러 중복 확인을 진행해주세요").css("color", "black");
				$("#checkIdDupButton").focus();
				$("#checkIdDupButton").on("click", function() {
					
					<%-- AJAX를 통해 아이디 중복값 확인 --%>
					$.ajax({
						url: "checkDupMemberInfo",
						data: {
							"member_id" : member_id
						},
						dataType: "json",
						success: function(result) {
							if(result) { // 중복
	 							$("#checkIdResult").text("이미 사용 중인 아이디입니다").css("color", "red");
	 							iscorrectId = false;
	 							isDuplicateId = true;
							} else { // 사용가능
								$("#checkIdResult").text("사용 가능한 아이디입니다").css("color", "green");
								$("#checkIdDupButton").blur();
								iscorrectId = true;
	 							isDuplicateId = false;
							}
								
						},
						error: function(xhr,textStatus,errorThrown) {
						    // 요청이 실패한 경우 처리할 로직
						    Swal.fire({
								title: 'AJAX 요청 실패!',         // Alert 제목
								text: "아이디 중복 판별에 실패했습니다!",  // Alert 내용
								icon:'error',
							});
// 						    alert("아이디 중복 판별 AJAX 요청 실패!");
							console.log(xhr + ", " + textStatus + ", " + errorThrown);

						}
					}); // 중복 판별 ajax 요청 끝
				}); // 중복확인 버튼 클릭 이벤트 끝
				
			}
		});	// 아이디 blur 이벤트 끝

		// 아이디 입력 값이 없는데 중복 확인 버튼을 클릭했을 경우
		$("#checkIdDupButton").on("click", function() {
			if($("#id").val() == "") {
// 				alert("아이디를 입력해야 중복 확인이 가능합니다!");
				Swal.fire({
					title: '입력값이 없어요!',         // Alert 제목
					text: "아이디를 입력해야 중복 확인이 가능합니다!",  // Alert 내용
					icon:'warning',
				});
				$("#id").focus();
			}
		});

		
		<%-- 닉네임 정규표현식 검증 및 중복 확인 --%>
		$("#nickname").blur(function() {
			let member_nickname = $("#nickname").val();
			
			if(member_nickname != "") { // 입력값이 비어있지 않은 경우
				<%-- 닉네임 길이, 문자 종류 확인 --%>
				let regNickname = /^[가-힣0-9]{2,10}$/; <%-- 2~10자의 한글, 숫자 --%>
				if(!regNickname.exec(member_nickname)) {
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
								"member_nickname" : member_nickname
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
			//else { // 닉네임 입력값이 빈 경우의 처리를 어떻게하지..?
				// 1. 이 자리에서 바로 난수발생해 닉네임 생성
				// 2. 얼럿창 띄워서 안내하고 일단 서브밋 되게 처리, 널스트링 넘어가니까 인서트시 자동 생성?
				// 아무튼 처리 후에 iscorrectNickname = true; isDuplicateNickname = false; 설정해줘야함 
			//}
		});	// 닉네임 blur 이벤트 끝
		
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
			}
		});
		
		
		
		<%-- 비밀번호 정규표현식 검증 --%>
		$("#password").blur(function() {	
			let member_password = $("#password").val();
			
			<%-- 비밀번호 길이, 문자종류 검증 --%>
			let regPassword = /^[A-Za-z0-9!@#%^&*]{8,16}$/; <%-- 8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
			if(!regPassword.exec(member_password)) { <%-- 비밀번호 길이, 문자종류 위반 --%>
				$("#checkPasswordResult").text("8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)만 사용 가능합니다").css("color", "red");
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
			
		}); // 비밀번호 blur 이벤트 끝
		
		<%-- 비밀번호와 비밀번호 확인 입력값 일치 여부 검사 --%>
		$("#password").on("keyup", function() {	
		    if(iscorrectPassword && $("#password").val() == $("#passwordConfirm").val()) { // 일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치합니다").css("color", "green");
		    	isSamePassword = true;
		    } else if(!iscorrectPassword && $("#password").val() == $("#passwordConfirm").val()) { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 올바른지 확인해주세요").css("color", "red");
		    	isSamePassword = false;
		    } else { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치하지 않습니다").css("color", "red");
		    	isSamePassword = false;
		    }
			
		}); // 비밀번호 keyup 이벤트 끝
		
		$("#passwordConfirm").on("keyup", function() {	
		    if(iscorrectPassword && $("#password").val() == $("#passwordConfirm").val()) { // 일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치합니다").css("color", "green");
		    	isSamePassword = true;
		    } else if(!iscorrectPassword && $("#password").val() == $("#passwordConfirm").val()) { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 올바른지 확인해주세요").css("color", "red");	
		    	isSamePassword = false;
		    }  else { // 불일치
		    	$("#checkPasswordConfirmResult").text("비밀번호가 일치하지 않습니다").css("color", "red");		     	
		    	isSamePassword = false;
		    }
			
		}); // 비밀번호 확인 keyup 이벤트 끝
		
		<%-- 생년월일 선택 범위 제한 --%>
		$("#birthdate").on("click", function(event) {
			// 모달창 가림	
			// 모달창 가림	
			// 모달창 가림	
			// 모달창 가림	
			// 모달창 가림	
// 			event.preventDefault();
			if(!$(this).hasClass("clicked")) {
				Swal.fire({
					title: '만 14세 이상인가요?',
					text: '만 14세 이상만 가입할 수 있습니다. 동의하십니까?',
					icon: 'warning',
					showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
					confirmButtonText: '확인', // confirm 버튼 텍스트 지정
					cancelButtonText: '취소', // cancel 버튼 텍스트 지정
					reverseButtons: true, // 버튼 순서 거꾸로
				}).then(result => {
					// 만약 Promise리턴을 받으면,
					if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						$(this).addClass("clicked");
						// 만 14세 미만은 가입하지 못하도록 날짜 선택 범위 제한 
						
						// 현재 날짜를 가져옵니다.
						var today = new Date();
												  
						// 14세 전의 날짜를 계산합니다.
						var maxDate = new Date(today.getFullYear() - 14, today.getMonth(), today.getDate() + 1);
															  
						// input 태그의 최소 날짜(max 속성)를 설정합니다.
						$("#birthdate").attr("max", maxDate.toISOString().split("T")[0]);   
					} else {
						Swal.fire({
							title: '만 14세 미만은 가입이 불가능해요!',
							text: "메인으로 이동합니다",
							icon: 'error',
							
							showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
							confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
							confirmButtonText: '확인', // confirm 버튼 텍스트 지정
							cancelButtonText: '취소', // cancel 버튼 텍스트 지정
							reverseButtons: true, // 버튼 순서 거꾸로
						}).then(result => {
							// 만약 Promise리턴을 받으면,
							if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								location.href="./";
							} 
						}); // Swal-then 끝
					
					} // else 문 끝
					
				}); // Swal-then 끝
			
			
			
			} // 첫 클릭 이벤트 끝
		}); // 생년월일 클릭 이벤트 끝

		
		$("#birthdate").blur(function() {
			let member_birth = $("#birthdate").val();
			
			if(member_birth != "") { // 입력값이 비어있지 않은 경우
				iscorrectBirthdate = true;
			}
		}); // 생년월일 blur 이벤트 끝
		
		// 값을 받아오는거라 이벤트 안먹음 
		// 변수 사용하지말고 마지막 서브밋에서 판별해야함
// 		$("#myMap").blur(function() { // blur 안먹음
// 		$("#myMap").change(function() { // change도 안먹음
// 			let member_address = $("#myMap").val();
// 			alert("myMap val 확인 : " + member_address);
// 			if(member_address != "") { // 입력값이 비어있지 않은 경우
// 				iscorrectAddress = true;
// 			}
// 		}); // 주소 blur 이벤트 끝
		
		
		<%-- 이메일 정규표현식 검증 및 중복 확인 --%>
		$("#email").blur(function() {
			let member_email = $("#email").val();

			let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(!regEmail.exec(member_email)) {
				$("#checkEmailResult").text("이메일 주소가 올바른지 확인해주세요").css("color", "red");
				iscorrectEmail = false;
			} else {
				$("#checkEmailResult").text("오른쪽 버튼을 눌러 중복 확인을 진행해주세요").css("color", "black");
				$("#checkEmailDupButton").focus();
				$("#checkEmailDupButton").on("click", function() {
					
					<%-- AJAX를 통해 이메일 중복값 확인 --%>
					$.ajax({
						url: "checkDupMemberInfo",
						data: {
							"member_email" : member_email
						},
						dataType: "json",
						success: function(result) {
							if(result) { // 중복
	 							$("#checkEmailResult").text("이미 사용 중인 이메일입니다").css("color", "red");
	 							iscorrectEmail = false;
	 							isDuplicateEmail = true;
							} else { // 사용가능
								$("#checkEmailResult").text("사용 가능한 이메일입니다").css("color", "green");
								$("#checkEmailDupButton").blur();
								iscorrectEmail = true;
	 							isDuplicateEmail = false;
							}
								
						},
						error: function(xhr,textStatus,errorThrown) {
						    // 요청이 실패한 경우 처리할 로직
// 						    alert("이메일 중복 판별 AJAX 요청 실패!");
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
		});	// 이메일 blur 이벤트 끝
		
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
		
		<%-- 휴대폰 번호 정규표현식 검증, 중복 확인 및 인증 처리 --%>
		$("#phone").on("blur", function() {		
			var member_phone = $("#phone").val();
			let regPhone = /^010-\d{4}-\d{4}$/; <%-- 010으로 시작하는 11자리 숫자 --%>

			if(!regPhone.test(member_phone)) {
				$("#checkPhoneResult").text("휴대폰 번호를 확인해주세요").css("color", "red");
				iscorrectPhone = false;
			} else {
				iscorrectPhone = true;
				<%-- 인증 코드 발송 전 AJAX를 통해 휴대폰번호 중복 여부 확인 --%>
				$.ajax({
					url: "checkDupMemberInfo",
					data: {
						"member_phone" : member_phone
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
// 								alert("인증코드 발송 완료");
								Swal.fire({
									title: '인증코드 발송 완료!',         // Alert 제목
									text: "인증 코드를 확인해주세요!",  // Alert 내용
									icon:'success',
								});
// 								$("#requestPhoneAuthCodeButton").blur();
								$.ajax({
									url: "requestPhoneAuthCode",
									data: {
										"member_phone": member_phone
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
// 													alert("휴대폰 인증이 정상적으로 완료되었습니다!");
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
// 													alert("인증 코드가 올바르지 않습니다. 다시 인증해주세요!");
												}
											}
										});
										
										
									},
									error: function(xhr,textStatus,errorThrown) {
									    // 요청이 실패한 경우 처리할 로직
// 									    alert("휴대폰 인증 코드 발급 AJAX 요청 실패!");
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
// 					    alert("휴대폰 번호 중복 판별 AJAX 요청 실패!");
					    Swal.fire({
							title: 'AJAX 요청 실패!',         // Alert 제목
							text: "휴대폰 번호 중복 판별에 실패했습니다!",  // Alert 내용
							icon:'error',
						});
					    console.log(xhr + ", " + textStatus + ", " + errorThrown);
					}
				});// 중복 체크 ajax 끝
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
		
		

		<%-- submit 동작을 수행할 때 값을 올바르게 입력했는지 확인 --%>
		$("form").on("submit", function(event) {
			if(!iscorrectName) { // 이름 미입력 또는 정규표현식 위배
				$("#checkNameResult").text("2~5글자의 한글만 사용 가능합니다").css("color", "red");
				$("#name").focus();
				return false; // submit 동작 취소				
			} else if(!iscorrectId) { // 아이디 미입력 또는 정규표현식 위배
				$("#checkIdResult").text("5~20자의 영문 소문자, 숫자를 입력해주세요").css("color", "red");
				$("#id").focus();
				return false; // submit 동작 취소
			} else if(isDuplicateId) { // 아이디 중복
				$("#checkIdResult").text("이미 사용 중인 아이디입니다").css("color", "red");
				$("#id").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectNickname) { // 닉네임 미입력 또는 정규표현식 위배
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
				$("#password").focus();
				return false; // submit 동작 취소
			} else if(!isSamePassword) { // 비밀번호 불일치
				$("#passwordConfirm").focus();
				return false; // submit 동작 취소
			} else if(!iscorrectBirthdate) {  // 생년월일 미입력 
				$("#checkBirthdateResult").text("생년월일을 입력해주세요").css("color", "red");
				$("#birthdate").focus();
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
	 			event.preventDefault();
				Swal.fire({
					title: '가입 완료하시겠어요?',
					text: '확인을 누르면 회원가입이 완료됩니다',
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
						
						$("form").off("submit");
						$("form").submit();
						return true;
					} else {
						return false;
					} // else 문 끝
					
				}); // Swal-then 끝
			
// 				return true;
			}
			
			
// 			return true; // submit 동작 수행(생략 가능)
			
			
		});
		
		
		
		
	}); // document.ready 끝


</script>
</head>
<body>
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
						<h1 class="page-title">회원가입</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
						<li>회원가입</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Account Register Area -->
	<div class="account-login section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12 d-flex justify-content-center">
					<div class="register-form">
						<h4>회원 정보 입력</h4>
						<br>
						<br>

						<form action="MemberJoinPro" class="row" method="post">
<!-- 							<input type="text" name="test" placeholder="파라미터확인"> -->
							
							<div class="form-group">
								<label for="name" id="mgForTwo">이름</label> 
								<input class="form-control" placeholder="2~5글자의 한글" maxlength="5" type="text" name="member_name" id="name" required>
								<div id="checkNameResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group" >
								<label for="reg-ln" id="mgForThree">아이디</label> 
								<input class="form-control" placeholder="5~20자의 영문 소문자, 숫자 조합" maxlength="20" type="text"  name="member_id" id="id" required>
								<input type="button" value="중복확인" id="checkIdDupButton">
								<div id="checkIdResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForThree">닉네임</label> 
								<input class="form-control" maxlength="10" type="text" placeholder="2~10글자의 한글, 숫자" name="member_nickname" id="nickname" required>
								<input type="button" value="중복확인" id="checkNicknameDupButton">
<!-- 								<input type="button" value="닉네임만들기" id="generateNicknameButton"> -->
								<%-- 입력값이 비어있을 경우 DB에서 임의로 난수발생해 insert 처리 --%>
								<div id="checkNicknameResult" class="resultAreaForJoin"></div>
							</div>

							<div class="form-group">
								<label for="reg-pass" id="mgForFour">비밀번호</label> 
								<input class="form-control" maxlength="16" placeholder="8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)" type="password"  name="member_password" id="password" required>
								<div id="checkPasswordResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group">
								<label for="reg-pass-confirm" id="mgForSix">비밀번호 확인</label> 
								<input class="form-control" maxlength="16" placeholder="비밀번호를 다시 입력해주세요" type="password" id="passwordConfirm" required>
								<div id="checkPasswordConfirmResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForFour">생년월일</label> 
								<input class="form-control" type="date" name="member_birth" id="birthdate" required>
								<div id="checkBirthdateResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForTwo">주소</label> 
								<input type="hidden" id="map">
								<input class="form-control" type="text" placeholder="버튼을 눌러 동네를 인증해주세요" name="member_address" id="myMap" required readonly>
<!-- 								<input type="button" value="동네인증" id="myMapButton"> -->
<!-- 								<input type="button" value="지도로찾기" id="myMapButton" onclick="AddressMap()"> -->
								<input type="button" value="동네인증" id="myMapButton" onclick="AddressMap()">
								<div id="checkAddressResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group">
								<label for="email" id="mgForThree">이메일</label> 
								<input class="form-control" type="email" name="member_email" id="email" required>
								<input type="button" value="중복확인" id="checkEmailDupButton">
								<div id="checkEmailResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group">
								<label for="phone" id="mgForFive">휴대폰번호</label> 
								<input class="form-control" placeholder="숫자만 입력해주세요" type="tel" name="member_phone" id="phone" required>
								<input type="button" value="인증코드발급" id="requestPhoneAuthCodeButton">
								<div id="checkPhoneResult" class="resultAreaForJoin"></div>
							</div>
							<div class="form-group">
								<label for="phoneAuthCode" id="mgForFour">인증코드</label> 
								<input class="form-control" placeholder="코드를 입력한 후 인증 버튼을 눌러주세요" type="text" name="phone_auth_code" id="phoneAuthCode" maxlength="4" required>
								<input type="button" value="인증" id="completePhoneAuthButton">
								<div id="checkPhoneAuthCodeResult" class="resultAreaForJoin"></div>
							</div>
								
							<div class="button">
								<button class="btn" type="button" onclick="history.back()">돌아가기</button>
								<button class="btn" type="submit">가입완료</button>
							</div>
							<p class="outer-link">
								이미 계정이 있나요? <a href="MemberLogin">로그인 하기</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Account Register Area -->

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