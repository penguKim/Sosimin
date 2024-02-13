<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sosiminMain.css" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

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
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->
	<header class="header navbar-area">
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>
    <!-- Start Hero Area -->
    <section class="hero-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-12 custom-padding-right">
                    <div class="slider-head">
                        <!-- Start Hero Slider -->
                        <div class="hero-slider">
                            <!-- Start Single Slider -->
                            <div class="single-slider slider0"
                                style="background-image: url(${pageContext.request.contextPath}/resources/images/MainPhoto/메인슬라이더.png);">
                                <div class="content">
                                     <h2><span>중고거래</span>
                                        당신 근처의 지역 생활 커뮤니티
                                    </h2>
                                    <p>동네라서 가능한 모든 것 
                                       <br> 소시민에서 가까운 이웃과 함께해요.</p>
                                    <h3><span>SecondHands by</span>Sosimin</h3>
                                    <div class="button">
                                        <a href="SearchProduct" class="btn">중고거래 바로가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="single-slider slider1"
                                style="background-image: url(${pageContext.request.contextPath}/resources/images/MainPhoto/중고거래4.jpg);">
                                <div class="content">
                                     <h2><span>커뮤니티</span>
                                        믿을만한 이웃 간 중고거래
                                    </h2>
                                    <p>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요. 
                                       <br> 우리 동네의 다양한 정보와 이야기를 공감과 댓글로 나누어요.</p>
                                    <h3><span>Community by</span>Sosimin</h3>
                                    <div class="button">
                                        <a href="Community" class="btn">커뮤니티 바로가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="single-slider"
                                style="background-image: url(${pageContext.request.contextPath}/resources/images/hero/old-nike-jacket-.png);">
                                <div class="content colorWhite">
                                     <h2><span>NIKE CLASSIC OUTER</span>
                                        FIND YOUR FEEL
                                    </h2>
                                    <p>고강도 운동부터 편안한 일상생활까지 언제나 부드럽고 탄탄한 신축성을 
                                       <br> 제공하는 다양한 제품들과 함께 당신만의 느낌을 찾아보세요.</p>
                                    <h3><span>Pay by </span>Sosim Pay</h3>
                                    <div class="button">
                                        <a href="SearchProduct?keyword=나이키" class="btn">구매하기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                            <!-- Start Single Slider -->
                            <div class="single-slider"
                                style="background-image: url(${pageContext.request.contextPath}/resources/images/hero/second-hands-nike-shoes-.png);">
                                <div class="content colorWhite">
                                    <h2><span>NIKE SPORT SHOES</span>
                                       신어보고 느껴 보세요
                                    </h2>
                                    <p>탁월한 쿠셔닝으로 새로운 러닝을 선사하는 나이키 스포츠
                                       <br>신발의 새로군 컬러웨이를 지금 바로 만나 보세요.</p>
                                    <h3><span>Pay by </span>Sosim Pay</h3>
                                    <div class="button">
                                        <a href="SearchProduct?keyword=나이키" class="btn">구매하기</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Slider -->
                        </div>
                        <!-- End Hero Slider -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Hero Area -->

	
		<!-- Start Trending Product Area -->
    <section class="trending-product section" style="margin-top: 12px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>인기 상품 목록</h2>
                        <p>좋아요를 많이 받은 순서대로 인기상품이 정렬되어 표시됩니다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="result" items="${data}">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Product -->
                    <div class="single-product">
                        <div class="product-image">
                            <a href="ProductDetail?product_id=${result.product_id}" >
                            	<img src="${pageContext.request.contextPath}/resources/upload/${result.product_image1}" alt="#" width="287" height="287">
                            </a>
                        </div>
                        <div class="product-info">
                            <span class="category">${result.product_category}</span>
                            <h4 class="title product_name">
                                ${result.product_name}
                            </h4>
                            <ul class="review">
                                <li><span>${result.dong} | ${result.product_datetime}</span></li>
                                <li><span>좋아요 수 ${result.product_like}</span></li>
                            </ul>
                            <div class="price">
                            	<fmt:formatNumber value="${result.product_price}" pattern="###,###" var="formattedPrice" />
                                <span>${formattedPrice}원</span>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Product -->
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- End Trending Product Area -->
	
	
		
    <!-- Start Call Action Area -->
    <section class="call-action section">
        <div class="container">
            <div class="row ">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <div class="inner">
                        <div class="content">
                            <h2 class="wow fadeInUp" data-wow-delay=".4s">이웃만 아는<br>
                                동네 정보와 이야기</h2>
                            <p class="wow fadeInUp" data-wow-delay=".6s">우리동네의 다양한 정보와 이야기를<br> 
                            공감과 댓글로 나누어요.</p>
                            <div class="button wow fadeInUp" data-wow-delay=".8s">
                                <a href="Community" class="btn">커뮤니티 바로가기</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row boogicontainer">
	            <div class="col-lg-4 boogi">
	            	<img src="${pageContext.request.contextPath}/resources/images/MainPhoto/중고거래.jpeg" alt="#">
	            </div>
            </div>
        </div>
    </section>
    <!-- End Call Action Area -->

    <!-- Start Banner Area -->
    <section class="banner section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="single-banner footerbanner1" 
                    	style="background-image:url('${pageContext.request.contextPath}/resources/images/MainPhoto/중고거래2.jpg')" >
                        <div class="content">
                            <h2>안전한 중고거래 문화</h2>
                            <p>간편하고 안전한<br><b>Sosim Pay</b></p>
                            <div class="button">
                                <a href="PayInfo" class="btn">소심페이 바로가기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="single-banner footerbanner2 custom-responsive-margin"
                        style="background-image:url('${pageContext.request.contextPath}/resources/images/MainPhoto/중고거래3.jpeg')">
                        <div class="content">
                            <h2>위치 기반 중고거래</h2>
                            <p>현재 위치를 기반으로<br>가까이 있는 상품을 알려드립니다.</p>
                            <div class="button">
                                <a href="SearchProduct" class="btn">상품 바로가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->
    <!-- Start Shipping Info -->
    <section class="shipping-info">
        <div class="container">
            <ul>
                <!-- Free Shipping -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-delivery"></i>
                    </div>
                    <div class="media-body">
                        <h5>중고거래 쇼핑</h5>
                        <span>저렴한 금액으로 구매가능</span>
                    </div>
                </li>
                <!-- Money Return -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-support"></i>
                    </div>
                    <div class="media-body">
                        <h5>연중무휴</h5>
                        <span>1대1 문의 or 전화상담</span>
                    </div>
                </li>
                <!-- Support 24/7 -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-credit-cards"></i>
                    </div>
                    <div class="media-body">
                        <h5>소심 결제</h5>
                        <span>안전한 결제 서비스</span>
                    </div>
                </li>
                <!-- Safe Payment -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-reload"></i>
                    </div>
                    <div class="media-body">
                        <h5>편리한 구매</h5>
                        <span>검색으로 상품검색가능</span>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- End Shipping Info -->
	<footer class="footer">
		<jsp:include page="inc/bottom.jsp"></jsp:include>
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
    <script type="text/javascript">
        //========= Hero Slider 
        tns({
            container: '.hero-slider',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 0,
            items: 1,
            nav: false,
            controls: true,
            controlsText: ['<', '>'],
        });

        //======== Brand Slider
        tns({
            container: '.brands-logo-carousel',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: false,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 3,
                },
                768: {
                    items: 5,
                },
                992: {
                    items: 6,
                }
            }
        });
    </script>
</body>

</html>