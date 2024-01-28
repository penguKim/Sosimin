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
	          
	          var modifiedAddress = address.split(' ')[0] + "광역시 " +  address.split(' ')[1] + ' ' + address.split(' ')[2];
	          
	          $("#address").val(modifiedAddress);
	          
	          
		    } else {
		      alert("주소를 가져오지 못했습니다.");
		    }
		  });
		});
		
	});
	
	// 지도로 찾기 팝업
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
	

	$(function() { // 결과영역 범위 확인
		$("#id").on("keypress", function() {
			let content = $("#id").val();
			$("#checkIdResult").text(content).css("color", "red");
		});

		$("#name").on("keypress", function() {
			let content = $("#name").val();
			$("#checkNameResult").text(content).css("color", "red");
		});
		
		$("#passwd").on("keypress", function() {
			let content = $("#passwd").val();
			$("#checkPasswdResult").text(content).css("color", "red");
		});
		
		$("#passwdConfirm").on("keypress", function() {
			let content = $("#passwdConfirm").val();
			$("#checkPasswd2Result").text(content).css("color", "red");
		});
		
		$("#birthdate").on("blur", function() {
			let content = $("#birthdate").val();
			$("#checkBirthResult").text(content).css("color", "red");
		});

		$("#email").on("keypress", function() {
			let content = $("#email").val();
			$("#checkEmailResult").text(content).css("color", "red");
		});
		
	});
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
						<li><a href="./"><i class="lni lni-home"></i>
								Home</a></li>
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
				<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
					<div class="register-form">
						<h4>회원 정보 입력</h4>
						<br>
						<br>

						<form action="MemberJoinPro" class="row" method="post">
<!-- 							<input type="text" name="test" placeholder="파라미터확인"> -->
							
							<div class="form-group">
								<label for="reg-fn" id="mgForTwo">이름</label> 
								<input class="form-control" placeholder="2~5글자의 한글" type="text" name="member_name" id="name" required>
								<div id="checkNameResult" class="resultArea"></div>
							</div>
							<div class="form-group" >
								<label for="reg-ln" id="mgForThree">아이디</label> 
								<input class="form-control" placeholder="5~20자의 영문 대/소문자, 숫자" type="text"  name="member_id" id="id" required>
								<input type="button" value="중복확인">
								<div id="checkIdResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForThree">닉네임</label> 
								<input class="form-control" type="text"  name="member_nickname" id="nickname" required>
								<input type="button" value="중복확인">
							</div>

							<div class="form-group">
								<label for="reg-pass" id="mgForFour">비밀번호</label> 
								<input class="form-control" placeholder="8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)" type="password"  name="member_password" id="password" required>
								<div id="checkPasswdResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-pass-confirm" id="mgForSix">비밀번호 확인</label> 
								<input class="form-control" placeholder="비밀번호를 다시 입력해주세요" type="password" id="passwordConfirm" required>
								<div id="checkPasswd2Result" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForFour">생년월일</label> 
								<input class="form-control" placeholder="숫자만 입력해주세요" type="date" name="member_birth" id="birth" required>
								<div id="checkBirthResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForTwo">주소</label> 
								<input class="form-control" type="text" name="member_address" id="address" required>
								<input type="button" value="동네인증" id="myMapButton">
								<input type="button" value="지도로찾기" id="myMapButton" onclick="AddressMap()">
							</div>
							<div class="form-group">
								<label for="reg-email" id="mgForThree">이메일</label> 
								<input class="form-control" type="email" name="member_email" id="email" required>
								<input type="button" value="중복확인">
								<div id="checkEmailResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-phone" id="mgForFive">휴대폰번호</label> 
								<input class="form-control" placeholder="숫자만 입력해주세요" type="tel" name="member_phone" id="phone" required>
								<input type="button" value="인증">
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