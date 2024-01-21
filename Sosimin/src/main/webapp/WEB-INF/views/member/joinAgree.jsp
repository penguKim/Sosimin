<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소시민:: 소심한 시민들의 거래</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main.css" />
</head>
<body>
	<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

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
						<h5 class="page-title">회원가입</h5>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html"><i class="lni lni-home"></i>
								Home</a></li>
						<li>회원가입</li>
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
									<section id="join_top">
										<span id="this">약관동의</span> <span>정보입력</span>
										<span>가입완료</span>
									</section>
					<form class="card login-form" action="MemberJoinForm" method="post" name="joinAgree">
						<div class="card-body">
							<div class="social-login">


										<h6 id="join_top">약관 및 정보활용 동의</h6><br>
										<label><input type="checkbox" id="agreeAll">전체동의</label>
										<br>
										<hr>
										<section id="agree" name="agree">
											<label id="required"><input type="checkbox"
												name="agree" value="서비스 이용 약관 동의(필수)"> 서비스 이용 약관
												동의(필수)</label> <br>
											<%-- 들여쓰기 하시면 안됩니다! --%>
											<textarea readonly>제 1 장 총칙
											제 1조 (목적)
											
											본 약관은 서비스(이하 "회사"라 한다)는 홈페이지에서 제공하는 서비스(이하 "서비스"
											라 한다)를 제공함에 있어 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로
											합니다.
											
											제 2조 (용어의 정의)
											
											1. 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
											   '서비스'란 회사가 이용자에게 서비스를 제공하기 위하여 컴퓨터 등 정보통신설비를 이용
											   하여 구성한 가상의 공간을 의미하며, 서비스 자체를 의미하기도 합니다.
											   '회원(이하 "회원"이라 한다)'이란 개인정보를 제공하여 회원등록을 한 자로서 홈페이지의 
											   정보를 지속적으로 제공받으며 홈페이지가 제공하는 서비스를 계속적으로 이용할 수 있는 
											   자를 말합니다.
											   '아이디(이하 "ID"라 한다)'란 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정
											   하고 회사가 승인하는 회원 고유의 계정 정보를 의미합니다.
											   '비밀번호'란 회원이 부여 받은 ID와 일치된 회원임을 확인하고, 회원의 개인정보를 보호
											   하기 위하여 회원이 정한 문자와 숫자의 조합을 의미합니다.
											   '회원탈퇴(이하 "탈퇴"라 한다)'란 회원이 이용계약을 해지하는 것을 의미합니다.
											
											2. 본 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및 
											   서비스 별 안내에서 정하는 바에 의합니다.
											
											제 3조 (이용약관의 효력 및 변경)
											
											1. 회사는 본 약관의 내용을 회원이 쉽게 알 수 있도록 각 서비스 사이트의 초기 서비스
											   화면에 게시합니다.
											2. 회사는 약관의 규제에 관한 법률, 전자거래기본법, 전자 서명법, 정보통신망 이용촉진 및
											   정보보호 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 
											   있습니다.
											3. 회사는 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 
											   회사가 제공하는 서비스 사이트의 초기 화면에 그 적용일자 7일 이전부터 적용일자 
											   전일까지 공지합니다.
											   다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예
											   기간을 두고 공지합니다. 이 경우 회사는 개정 전 내용과 개정 후 내용을 명확하게 비교
											   하여 회원이 알기 쉽도록 표시합니다.
											4. 회원은 개정된 약관에 대해 거부할 권리가 있습니다. 회원은 개정된 약관에 동의하지 않을
											   경우 서비스 이용을 중단하고 회원등록을 해지할 수 있습니다.
											   단, 개정된 약관의 효력 발생일 이후에도 서비스를 계속 이용할 경우에는 약관의 변경
											   사항에 동의한 것으로 간주합니다.
											5. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원 피해는 회사가 책임지지 않습니다.</textarea>
											<br> <br> <label id="required"><input
												type="checkbox" name="agree" value="개인정보 수집 및 이용 동의(필수)">
												개인정보 수집 및 이용 동의(필수)</label> <br>
											<textarea readonly>개인정보보호법에 따라 영화관에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 
											개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 
											불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
											영화관은 개인정보를 안전하게 취급하는데 최선을 다합니다.
											
											아래에 동의하시면 영화관이 제공하는 서비스를 편리하게 이용하실 수 있습니다.
											이용자 식별 및 본인여부 확인(아이디, 이름, 생년월일, 비밀번호) : 회원 탈퇴 시까지
											고객서비스 이용에 관한 통지, CS대응을 위한 이용자 식별(이메일, 휴대폰번호)
											 : 회원 탈퇴 시까지
											
											개인정보 수집 및 이용에 대해서는 거부할 수 있으며, 거부 시에는 회원가입이 불가합니다.
											서비스 제공을 위해서 반드시 필요한 최소한의 개인정보이므로 동의를 하셔야 서비스 이용이 
											가능합니다.
											이 외 서비스 이용과정에서 별도 동의를 통해 추가정보 수집이 있을 수 있습니다.
											</textarea>
											<br> <br> <label><input type="checkbox"
												name="agree" value="마케팅 활용을 위한 개인정보 수집 및 이용 안내(선택)">
												마케팅 활용을 위한 개인정보 수집 및 이용 안내(선택)</label> <br>
											<textarea readonly>영화관의 이벤트・혜택 등의 정보 발송을 위해 아이디, 휴대전화번호(문자), 이메일주소를 
											수집합니다. 
											아이디, 휴대전화번호 및 이메일주소는 서비스 제공을 위한 필수 수집항목으로서 영화관 회원 
											가입 기간 동안 보관하나, 이벤트 혜택 정보 수신 동의를 철회하시면 본 목적으로의 개인정보 
											처리는 중지됩니다. 
											정보주체는 개인정보 수집 및 이용 동의를 거부하실 수 있으며, 미동의 시에도 서비스 이용은
											가능합니다.
											※ 일부 서비스의 경우, 수신에 대해 별도로 안내 드리며, 동의를 구합니다.</textarea>
											<br> <br>
										</section>
										<div class="joinbtn">
											<input type="button" value="이전" onclick="history.back()">
											<input type="submit" value="다음">
										</div>
										<hr>
										<p id="notice">선택약관에 동의하지 않으셔도 가입이 가능합니다.</p>
										<input type="hidden" name="email" value="${param.email}">
										<br>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Account Login Area -->

	<!-- Start Footer Area -->
	<footer class="footer">
		<!-- Start Footer Top -->
		<div class="footer-top">
			<div class="container">
				<div class="inner-content">
					<div class="row">
						<div class="col-lg-3 col-md-4 col-12">
							<div class="footer-logo">
								<a href="index.html"> <img
									src="assets/images/logo/white-logo.svg" alt="#">
								</a>
							</div>
						</div>
						<div class="col-lg-9 col-md-8 col-12">
							<div class="footer-newsletter">
								<h4 class="title">
									Subscribe to our Newsletter <span>Get all the latest
										information, Sales and Offers.</span>
								</h4>
								<div class="newsletter-form-head">
									<form action="#" method="get" target="_blank"
										class="newsletter-form">
										<input name="EMAIL" placeholder="Email address here..."
											type="email">
										<div class="button">
											<button class="btn">
												Subscribe<span class="dir-part"></span>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Top -->
		<!-- Start Footer Middle -->
		<div class="footer-middle">
			<div class="container">
				<div class="bottom-inner">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-12">
							<!-- Single Widget -->
							<div class="single-footer f-contact">
								<h3>Get In Touch With Us</h3>
								<p class="phone">Phone: +1 (900) 33 169 7720</p>
								<ul>
									<li><span>Monday-Friday: </span> 9.00 am - 8.00 pm</li>
									<li><span>Saturday: </span> 10.00 am - 6.00 pm</li>
								</ul>
								<p class="mail">
									<a href="mailto:support@shopgrids.com">support@shopgrids.com</a>
								</p>
							</div>
							<!-- End Single Widget -->
						</div>
						<div class="col-lg-3 col-md-6 col-12">
							<!-- Single Widget -->
							<div class="single-footer our-app">
								<h3>Our Mobile App</h3>
								<ul class="app-btn">
									<li><a href="javascript:void(0)"> <i
											class="lni lni-apple"></i> <span class="small-title">Download
												on the</span> <span class="big-title">App Store</span>
									</a></li>
									<li><a href="javascript:void(0)"> <i
											class="lni lni-play-store"></i> <span class="small-title">Download
												on the</span> <span class="big-title">Google Play</span>
									</a></li>
								</ul>
							</div>
							<!-- End Single Widget -->
						</div>
						<div class="col-lg-3 col-md-6 col-12">
							<!-- Single Widget -->
							<div class="single-footer f-link">
								<h3>Information</h3>
								<ul>
									<li><a href="javascript:void(0)">About Us</a></li>
									<li><a href="javascript:void(0)">Contact Us</a></li>
									<li><a href="javascript:void(0)">Downloads</a></li>
									<li><a href="javascript:void(0)">Sitemap</a></li>
									<li><a href="javascript:void(0)">FAQs Page</a></li>
								</ul>
							</div>
							<!-- End Single Widget -->
						</div>
						<div class="col-lg-3 col-md-6 col-12">
							<!-- Single Widget -->
							<div class="single-footer f-link">
								<h3>Shop Departments</h3>
								<ul>
									<li><a href="javascript:void(0)">Computers &amp;
											Accessories</a></li>
									<li><a href="javascript:void(0)">Smartphones &amp;
											Tablets</a></li>
									<li><a href="javascript:void(0)">TV, Video &amp; Audio</a></li>
									<li><a href="javascript:void(0)">Cameras, Photo &amp;
											Video</a></li>
									<li><a href="javascript:void(0)">Headphones</a></li>
								</ul>
							</div>
							<!-- End Single Widget -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Middle -->
		<!-- Start Footer Bottom -->
		<div class="footer-bottom">
			<div class="container">
				<div class="inner-content">
					<div class="row align-items-center">
						<div class="col-lg-4 col-12">
							<div class="payment-gateway">
								<span>We Accept:</span> <img
									src="assets/images/footer/credit-cards-footer.png" alt="#">
							</div>
						</div>
						<div class="col-lg-4 col-12">
							<div class="copyright">
								<p>
									Designed and Developed by<a href="https://graygrids.com/"
										rel="nofollow" target="_blank">GrayGrids</a>
								</p>
							</div>
						</div>
						<div class="col-lg-4 col-12">
							<ul class="socila">
								<li><span>Follow Us On:</span></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-facebook-filled"></i></a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-twitter-original"></i></a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-instagram"></i></a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Footer Bottom -->
	</footer>
	<!--/ End Footer Area -->

	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top" style="display: none;"> <i
		class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/tiny-slider.js"></script>
	<script src="assets/js/glightbox.min.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>