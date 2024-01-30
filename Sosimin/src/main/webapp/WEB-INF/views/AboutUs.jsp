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
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
    
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sosimham/sosimham.css" />
    
    <!--  icon  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
    
<!--     <link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css"> -->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!--     <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet"> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #39d274;
  background-image: linear-gradient(to left, #39d274, #9effba, #e5ffd3);
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #39d274;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.articleWidth{
	max-width: 1300px;
	
}
</style>	
</head>

<body>
    <!-- /End Preloader -->
	<header class="header navbar-area">
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>
	
	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">About Us</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li>About Us</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
   	
	<article class="articleWidth menu">
		<div class="about-section">
		  <h1>About Us Page</h1>
		  <p>소심한 시민들을 위한 중고거래 프로젝트</p>
		  <p>제작기간 2024.01.15~ 02.14</p>
		</div>
		
		<h2 style="text-align:center">Our Team</h2>
		<div class="row">
		  <div class="column">
		    <div class="card">
		      <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
		      <div class="container">
		        <h2>박가영</h2>
		        <p class="title">CEO & Founder</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>jane@example.com</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div>
		
		  <div class="column">
		    <div class="card">
		      <img src="/w3images/team2.jpg" alt="Mike" style="width:100%">
		      <div class="container">
		        <h2>이민석</h2>
		        <p class="title">Art Director</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>mike@example.com</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div>
		  
		  <div class="column">
		    <div class="card">
		      <img src="/w3images/team3.jpg" alt="John" style="width:100%">
		      <div class="container">
		        <h2>김희수</h2>
		        <p class="title">Designer</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>john@example.com</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="row">
		  <div class="column">
		    <div class="card">
		      <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
		      <div class="container">
		        <h2>임은령</h2>
		        <p class="title">CEO & Founder</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>jane@example.com</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div>
		
		  <div class="column">
		    <div class="card">
		      <img src="/w3images/team2.jpg" alt="Mike" style="width:100%">
		      <div class="container">
		        <h2>우하민</h2>
		        <p class="title">Art Director</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>mike@example.com</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div>
		  
		  <div class="column">
		    <div class="card">
		      <img src="/w3images/team3.jpg" alt="John" style="width:100%">
		      <div class="container">
		        <h2>강주형</h2>
		        <p class="title">Designer</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>john@example.com</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div>
		</div>
		<div class="row">
		  <div class="column">
		    <div class="card">
		      <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
		      <div class="container">
		        <h2>박재원</h2>
		        <p class="title">CEO & Founder</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>jane@example.com</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div>
		

		</div>
	</article>
	
	<footer class="footer">
		<jsp:include page="inc/bottom.jsp"></jsp:include>
	</footer>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

</body>

</html>