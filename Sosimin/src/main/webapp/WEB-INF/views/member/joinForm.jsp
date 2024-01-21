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
						<h1 class="page-title">회원가입</h1>
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

	<!-- Start Account Register Area -->
	<div class="account-login section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
					<section id="join_top">
						<span>약관동의</span> <span id="this">정보입력</span> <span>가입완료</span>
					</section>
					<div class="register-form">
						<h6>회원 정보 입력</h6>
						<br>

						<form action="MemberJoinComplete" class="row" method="post">
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-fn">이름</label> 
									<input class="form-control" placeholder="2~5글자의 한글" type="text" id="reg-fn" required="" style="width: 80% !important">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group" >
									<label for="reg-ln">아이디</label> 
									<input class="form-control" placeholder="5~20자의 영문 대/소문자, 숫자" type="text" id="reg-ln" required="" style="width: 50% !important">
									<input type="button" value="중복확인">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-ln">닉네임</label> 
									<input class="form-control" type="text" id="reg-ln" required="">
									<input type="button" value="중복확인">
								</div>
<!-- 							</div> -->

<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-pass">비밀번호</label> 
									<input class="form-control" placeholder="8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*)" type="password" id="reg-pass" required="">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-pass-confirm">비밀번호 확인</label> 
									<input class="form-control" placeholder="비밀번호를 다시 입력해주세요" type="password" id="reg-pass-confirm" required="">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-ln">생년월일</label> 
									<input class="form-control" placeholder="숫자만 입력해주세요" type="date" id="reg-ln" required="">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-ln">주소</label> 
									<input class="form-control" type="text" id="reg-ln" required="">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-email">이메일</label> 
									<input class="form-control" type="email" id="reg-email" required="">
									<input type="button" value="중복확인">
								</div>
<!-- 							</div> -->
<!-- 							<div class="col-sm-6"> -->
								<div class="form-group">
									<label for="reg-phone">휴대폰번호</label> 
									<input class="form-control" placeholder="숫자만 입력해주세요" type="tel" id="reg-phone" required="">
									<input type="button" value="인증">
								</div>
<!-- 							</div> -->

							<div class="button">
								<button class="btn" type="submit">가입완료</button>
								<br>
								<br>
								<button class="btn" type="button">돌아가기</button>
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
	<a href="#" class="scroll-top" style="display: flex;"> <i
		class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/tiny-slider.js"></script>
	<script src="assets/js/glightbox.min.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>