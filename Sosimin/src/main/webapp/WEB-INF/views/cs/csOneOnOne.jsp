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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
</head>
<body>

	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	
	
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">1:1채팅문의</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="CsMain">고객센터</a></li>
                        <li>1:1 채팅문의</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
				
				
				
				
<div id="container">
	<aside>
		<ul>
			<li>
				<div>
					<h1><a href="Chat">채팅리스트</a></h1>
				</div>
			</li>
      
			<li>
				<img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" alt="">
				<div>
					<h2>닉네임</h2>
					<h3><span>방금전</span></h3>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt="" >
				<div>
					<h2>닉네임2</h2>
					<h3><span>방금전</span></h3>
				</div>
			</li>
		</ul>
	</aside>
	
	<main>
	<header>
		<img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" alt="">
		<div>
			<h2>닉네임</h2>
			<h3>상대방정보</h3>
		</div>
		<img src="${pageContext.request.contextPath}/resources/images/product-details/신고하기.png" alt="">
	</header>
    
	<ul id="chat">
		<li class="you">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" alt="">상대방</h2>
			</div>
			<div class="triangle"></div><!-- 말풍선 색상정하는 클래스  -->
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="me">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt=""></h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="me">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt=""></h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="you">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" alt="">상대방</h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="me">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt=""></h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				채팅내용입니다
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	</ul>
    
		<footer>
			<textarea placeholder="Type your message"></textarea>
<!-- 				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt=""> -->
<!-- 				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt=""> -->
			<a href="#">Send</a>
		</footer>
	</main>
</div>

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
<body>
</html>