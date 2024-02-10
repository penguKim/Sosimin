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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csStyle.css" />
   
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<style type="text/css">
	.grid{
		display: grid;
	    place-items: center;
	    height: auto; /* 화면의 세로 길이에 따라 조정 */
	    text-align: center;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	function chat() {
		Swal.fire({
			position: 'center',
			icon: 'info',
			title: '서비스 준비중입니다.',
			showConfirmButton: false,
			timer: 2000,
			toast: true
		});
	}
</script>
</head>

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
                        <h1 class="page-title">고객센터</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li>고객센터</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->


    <!-- Start Faq Area -->
    <section class="faq section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>무엇을 도와드릴까요?</h2>
                    </div>
                </div>
            </div>
            <div class="row rowCenter">
            	<div class="col-sm grid" id="CsNoticeDiv">
            		<a href="CsNotice">
            		 	<img src="${pageContext.request.contextPath}/resources/images/Cs/공지사항.png" width="100px" height="100px">
				        <br><span id="">공지사항</span>
			        </a>
            	</div>
	           	<div class="col-sm grid" id="csFaqDiv">
					    <a href="CsFaq">
					        <img src="${pageContext.request.contextPath}/resources/images/Cs/자주묻는질문.png" width="100px" height="100px">
					        <br><span>자주묻는질문</span>
					    </a>
	        	</div>
	        	<div class="col-sm grid" id="CsOnoOnOneDiv">
					    <a href="javascript:chat()">
					        <img src="${pageContext.request.contextPath}/resources/images/Cs/1대1문의.png" width="100px" height="100px">
					         <br><span>1:1채팅문의</span>
					    </a>
	        	</div>
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