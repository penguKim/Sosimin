<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csStyle.css" />
<script type="text/javascript">
//----------------------자바스크립트로 문자열 10개가 넘어가면 ... 표시---------------------

//   var titleElement = document.querySelector(".title");
//   var text = titleElement.textContent;
//   var maxLength = 10;

//   if (text.length > maxLength) {
//     var shortenedText = text.substring(0, maxLength) + "...";
//     titleElement.textContent = shortenedText;
//   }

//----------------------------------------------------------------------------------------


</script>
</head>
<style>


</style>
<body>
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
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">공지사항</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./">Home</a></li>
                        <li><a href="CsMain">고객센터</a></li>
                        <li>공지사항</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

			    <!-- Start Faq Area -->
    <section class="faqsection" id="sectionWidth">
        <div class="container" id="containerWidth">
            <div class="row">
                <div class="col-12">
	                <!-- Start Main Menu Search -->
	                <div class="cs-search">
	                    <!-- navbar search start -->
	                    <div class="navbar-search search-style-5">
	                        <div class="search-btn">
	                            <input type="text" id="searchKeyword" placeholder="Search" >
	                            <button onclick="location.href='CsNotice'">
	                            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
									</svg>
	                            </button>
	                        </div>
	                    </div>
	                    <!-- navbar search Ends -->
	                </div>
                </div>
            </div>
	            <hr>
		            <div>
						<ul class="useful-links">
							<li><input type="button" id="menu1" value="일반"><input type="button" id="menu1" value="정책변경"><input type="button" id="menu1" value="사기예방"></li>
						</ul>
		            </div>
		        <hr>
            <div class="row">
                <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                    <div class="accordion" id="accordionExample">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button" type="button" data-bs-toggle="collapse"
										data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" id="buttonWidth">
									<span id="num">1</span>
									<span id="noticeSubject"><b>공지제목란입니다</b></span>
									<span id="type"><b>일반유형</b></span>
									<span id="noticeDate"><b>2024.01.24</b></span>
								</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
								 data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
								</div>
							</div>
						</div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<span id="num">1</span>
									<span id="noticeSubject"><b>공지제목란입니다</b></span>
									<span id="type"><b>일반유형</b></span>
									<span id="noticeDate"><b>2024.01.24</b></span>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>내용1</p>
                                    <p>내용2</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<span id="num">1</span>
									<span id="noticeSubject"><b>공지제목란입니다</b></span>
									<span id="type"><b>일반유형</b></span>
									<span id="noticeDate"><b>2024.01.24</b></span>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>내용1</p>
                                    <p>내용2</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingfour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
									<span id="num">1</span>
									<span id="noticeSubject"><b>공지제목란입니다</b></span>
									<span id="type"><b>일반유형</b></span>
									<span id="noticeDate"><b>2024.01.24</b></span>
                                </button>
                            </h2>
                            <div id="collapsefour" class="accordion-collapse collapse" aria-labelledby="headingfour"

                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <p>내용1</p>
                                    <p>내용2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
					<!-- Pagination -->
					<div class="pagination left">
						<ul class="pagination-list">
							<li><a href="javascript:void(0)"><</a></li>
							<li><a href="javascript:void(0)">1</a></li>
							<li class="active"><a href="javascript:void(0)">2</a></li>
							<li><a href="javascript:void(0)">3</a></li>
							<li><a href="javascript:void(0)">4</a></li>
							<li><a href="javascript:void(0)">5</a></li>
							<li><a href="javascript:void(0)">></a></li>
						</ul>
					</div>
				<!--/ End Pagination -->
            </div>
        </div>
    </section>
    <!--/ End Faq Area -->


<!-- ========================================================================== -->
	<!-- Start Footer Bottom -->
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