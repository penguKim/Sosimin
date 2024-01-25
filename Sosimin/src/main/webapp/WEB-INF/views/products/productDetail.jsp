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
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
<%-- 1. 신고하기 기능 --%>
<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>


<!--     <meta http-equiv="x-ua-compatible" content="ie=edge" /> -->
<!--     <title>Single Product - ShopGrids Bootstrap 5 eCommerce HTML Template.</title> -->
<!--     <meta name="description" content="" /> -->
<%--     <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script> --%>
<!--     <meta name="viewport" content="width=device-width, initial-scale=1" /> -->
<%--     <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" /> --%>

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
     <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>

</head>
<style>
.product-info{
	position: relative;
	top: 28px;
}
.price2{
	display: inline-block;
}
#payImage{
	margin-bottom: 12px;
}
#Like{
	display: inline-block;
}
.police{
	margin-left: 300px;
    color: rgb(204, 204, 204);
    font-size: 16px;
    -webkit-box-align: center;
    align-items: center;
    border: none;
    background-color: white;
}

#eyeLikeTime{
	display: inline-block;
	padding-top: 15px;
	padding-bottom: 15px;
}
#eye{
	display: inline-block;
}
#time{
	display: inline-block;
}
#productStatus{
	display: inline-block;
	position:relative;
	top:5px;
	left:5px;
	font-size: 18px;
}
#productStatusData{
	display: inline-block;
	position: relative;
	left: 40px;
	top: 5px;
	font-size: 18px;
}
#productStatusDiv{
	display: inline-block;
	padding-bottom: 15px;
}
#priceProposal{
	position: relative;
	padding-top: 20px;
}


#likeButton{
	background-color: rgb(204, 204, 204);
}

#likeText{
	font-size: 20px;
	margin-left: 50px;
}
#likeButtonDiv{
	display: inline-block;
}

#likeButtonSpan{
	display: inline-block;
	position: relative;
	font-size: 20px;
	right:23px;
	bottom:1px;
}
#threeButton{
	position: relative;
	top: 35px;
	padding-bottom: 90px;
}
#chatButton{
	background-color: rgb(255, 164, 37);
	font-size: 20px;
	color:white;
}
#nowPay{
	background-color:rgb(247, 0, 0);
	font-size:20px;
	color:white;
}

#likeImage{
	display:inline-block;
	position:relative;
	right:50px;
	bottom:4px;
	z-index: 2;
}

#relatedProducts{
	font-size: 20px;
}
#productImageName{
	display: inline-block;
}
#productName{
	text-align: center;
}
#productNameContent{
	width: 900px;
	border-width: thin thin thin thin;
	border-style: solid;
	border-color: white rgb(204, 204, 204) white white;
}
#profileImage{
	height:80px;
	width: 80px;
    border-radius: 70%;
    overflow: hidden;
    position: relative;
}

#nickname{
	display: inline-block;
	position: relative;
	bottom: 55px;
	font-size: 17px;
	color:black;
	left:15px;
}
#nicknameA , #aTag{
  color: inherit !important;
  text-decoration: none !important;
}

#info_body{
	padding-left: 20px;
}
#single_block {
  padding: 0 30px 0px 30px;
  margin: 0;
}
#relatedProductsBlock{
	margin-bottom: 30px;
}
#myProductDiv{
	display: inline-block;
	position: relative;
	left: 100px;
	bottom: 50px;
}
#myProducts{
	display: inline-block;
	position: relative;
}
#reviews{
	display: inline-block;
	position: relative;
	left:10px;
}
#after{
    content: "";
    position: absolute;
    right: -8px;
    top: 4px;
    width: 1px;
    height: 17px;
    border-right: 1px solid rgb(204, 204, 204);
}

#myProductImage{
	display: inline-block;
}
#imgPrice{
	position:relative;
    bottom: 35px;
    left: 0px;
    width: 100%;
    height: 34px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    color: rgb(255, 255, 255);
    font-size: 14px;
    background: rgba(0, 0, 0, 0.25);
}
#productCount {
  font-size: 15px;
  font-weight: inherit; 
  color: red;
  font-style: inherit; !important;
}
#productPlus{
  color: inherit; !important;
  text-decoration: none; !important;
  font-size: 15px;
}
#tradeImage{
	position: relative;
}

#tradeAddressSpan{
	position:relative;
	top:22%;
}
#sectionWidth{
/* 	width: 2400px; */
/* 	max-width: 2400px; */
}
#containerDiv{
/* 	display: inline-block;	 */
	position: relative;
	width:1400px;
	max-width: 1350px;
}

#tradeAddress{
	border-width: thin thin thin thin;
	border-style: solid;
	border-color: white rgb(204, 204, 204) white white;
	height: 120px;
	display: inline-block;
	position: relative;
	width: 193px;
}

#tradeAddressTag{
	padding-top: 10px;
}
#addressDetail{
	position: relative;
	top:27px;
	text-align: center;
	display: inline;
}

#tradeAddressName{
	position: relative;
	left:53px;
	top:10px;
}
#addressDetailA{
  color: inherit; !important;
  text-decoration: none; !important;
  display: inline-block;
}
#categoryDiv{
	text-align:center;
	position: relative;
	top:27px;
}
#tagDiv{
	text-align:center;
	position: absolute;
	top:52px;
}
#productTag{
	height: 120px;
	display: inline-block;
	position: relative;
	width: 193px;
	bottom: 27px;
}
</style>
<script>

// 메인사진 클릭시 전체 사진 다 띄우기 <사용할지 안할지 모름> 

// function openPopup() {
//     var images = document.querySelectorAll('.images img');
//     var imageSrcs = [];
    
//     images.forEach(function(image) {
//         imageSrcs.push(image.src);
//     });
    
//     var popupWindow = window.open('', '_blank', 'width=900,height=620');
    
//     popupWindow.document.write('<div style="display:flex; flex-direction: row;">');
    
//     imageSrcs.forEach(function(src) {
//         popupWindow.document.write('<img src="' + src + '" style="width: 540px; height: 540px; margin-right: 10px; margin-top : 20px;">');
//     });
    
//     popupWindow.document.write('</div>');
//     popupWindow.document.close();
// }

function imagePopup(src) {
  var newWindow = window.open('', '_blank', 'width=800,height=600');
  newWindow.document.write('<html><head><title>Image</title></head><body style="background-color: black; margin: 0; display: flex; justify-content: center; align-items: center;"><img src="' + src + '" style="max-width: 100%; max-height: 100%;"></body></html>');
}
</script>
<body>

    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<%-- 2. 신고하기 기능 --%>
	<jsp:include page="../report/report.jsp"></jsp:include>
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center" id="maxWidth">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">상품상세</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="index.html">Shop</a></li>
                        <li>Single Product</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Item Details -->
    <section class="item-details section" id="sectionWidth">
        <div class="container" id="containerDiv">
            <div class="top-area" id="topWidth">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-images">
                            <main id="gallery">
                                <div class="main-img">
                                    <img src="${pageContext.request.contextPath}/resources/images/product-details/iu6.png" id="current" alt="#" height="620px" style="display:block; width:100%;" class="mx-auto" onclick="imagePopup(this.src)">
                                </div>
                                <div class="images">
                                    <img src="${pageContext.request.contextPath}/resources/images/product-details/iu6.png" class="img" alt="# " height="100px">
                                    <img src="${pageContext.request.contextPath}/resources/images/product-details/iu2.jpg" class="img" alt="#" height="100px">
                                    <img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" class="img" alt="#" height="100px">
                                    <img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" class="img" alt="#" height="100px">
                                    <img src="${pageContext.request.contextPath}/resources/images/product-details/karina2.jpg" class="img" alt="#" height="100px">
                                </div>
                            </main>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-info" id="maxWidth">
                        	<div>
                        		<div>
                            		<h2 class="title">이 곳엔 상품제목을 뿌릴것이다.</h2><br>
                            	</div>
	                            <div>
	                            <h3 class="price2" style="font-size: 40px">500,000<span style="font-size: 20px">원</span></h3>&nbsp;&nbsp;&nbsp;
	                            	<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzIiIGhlaWdodD0iNjAiIHZpZXdCb3g9IjAgMCAxMzIgNjAiIGZpbGw9Im5vbmUiPgogICAgPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzE5MjhfMzQzNTUpIj4KICAgICAgICA8cmVjdCB3aWR0aD0iMTMyIiBoZWlnaHQ9IjYwIiBmaWxsPSJ3aGl0ZSIgLz4KICAgICAgICA8cGF0aAogICAgICAgICAgICBkPSJNMTMyIDU0LjQ4MTZWNS41MjY1MkMxMzIgMi40NzQzMSAxMjkuNDY0IDAgMTI2LjMzNSAwSDUuNjY0ODdDMi41MzYyNSAwIDAgMi40NzQzMSAwIDUuNTI2NTJWNTQuNDgxNkMtMS42Nzc1OGUtMDYgNTUuOTQ2NSAwLjU5NzEwMSA1Ny4zNTE0IDEuNjU5NzEgNTguMzg2NUMyLjcyMjMzIDU5LjQyMTYgNC4xNjMyMyA2MC4wMDIgNS42NjQ4NyA1OS45OTk4SDEyNi4zMDFDMTI3LjgwOSA2MC4wMTA4IDEyOS4yNTggNTkuNDM0MyAxMzAuMzI4IDU4LjM5ODJDMTMxLjM5OCA1Ny4zNjIyIDEzMiA1NS45NTIzIDEzMiA1NC40ODE2WiIKICAgICAgICAgICAgZmlsbD0iI0Q4MEMxOCIgLz4KICAgICAgICA8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIKICAgICAgICAgICAgZD0iTTMyLjkzMyAyNy44ODU0SDQzLjYzODdWMjcuODg4N0M0My44NCAyNy44ODg3IDQzLjk0MDcgMjguMTQ2IDQzLjc5NDQgMjguMjkxOUwyNC4xNTA3IDQ4LjA4NDdDMjMuOTk5NyA0OC4yMzU1IDIzLjc0OTYgNDguMTEwOSAyMy43NzAxIDQ3Ljg5M0wyNS4yNjU4IDMxLjc1MTNMMTQuODI3NCAzMS44Njc2QzE0LjYyNDUgMzEuODY5MiAxNC41MjIzIDMxLjYxMDMgMTQuNjcwMSAzMS40NjI4TDM0LjI5MDIgMTEuOTE1OEMzNC40NDI4IDExLjc2NSAzNC42OTI5IDExLjg5NDUgMzQuNjY5MyAxMi4xMTI0TDMyLjkzMyAyNy44ODU0Wk03Ni4xOTM5IDEzLjkwOTFIODEuMTExM1Y0Ni4xMTk2SDc2LjE5MzlWMTMuOTA5MVpNNzQuMjY1NiAxNC4wODgyVjQ1LjUxNTFINjkuNDIyN1YzMC41MTkzSDY2LjUwMDRWMjUuNzg0Nkg2OS40MjI3VjE0LjA4ODJINzQuMjY1NlpNNTEuMzUwMiAzOC43MzZWNDMuMTkwMkw2OC4xODAyIDQyLjQ3MjZWMzguMDkyNkw2NS44NjIzIDM4LjE4MzRMNjUuOTI4NSAxOS4xNTRINjcuOTIzNlYxNC42OTk4SDUxLjYzOTlWMTkuMTU0SDUzLjY0MzNMNTMuNzAxMiAzOC42NDUzTDUxLjM1MDIgMzguNzM2Wk01OC40NTMgMTkuMTU0NUg2MS4xMTg3TDYxLjA1MjUgMzguMzY1NEw1OC41MTEgMzguNDY0M0w1OC40NTMgMTkuMTU0NVpNMTEyLjkwMSAxMy45MDkxSDEwNy44NDNWNDYuMTE5NkgxMTIuOTAxVjEzLjkwOTFaTTg4LjA2NTQgNDEuNDk5M0M4Ni4zOTg3IDM5Ljk5MjYgODUuNDgyNiAzNy42OTY3IDg1LjMxNyAzNC42MTE4Qzg1LjMwNTggMzQuMzM0IDg1LjI5NTEgMzQuMDU4NiA4NS4yODQ2IDMzLjc4NjJDODUuMjU2NCAzMy4wNTU2IDg1LjIyOSAzMi4zNDYgODUuMTkyOCAzMS42NjdDODUuMTQzMSAzMC43MzUgODUuMTQzMSAyOS44MDI5IDg1LjE0MzEgMjguODg3M0M4NS4xNDMxIDI3Ljk3MTcgODUuMTUxNCAyNy4wMzk2IDg1LjE5MjggMjYuMTA3NUM4NS4yMzQyIDI1LjE3NTQgODUuMjc1NiAyNC4xOTM5IDg1LjMxNyAyMy4xNzExQzg1LjQ4MjYgMjAuMDg2MSA4Ni40MDk4IDE3Ljc4NDggODguMDY1NCAxNi4yODM1Qzg5Ljg2NzEgMTQuNzIxMiA5Mi4yMDI4IDEzLjkwOTEgOTQuNTg4OSAxNC4wMTUyQzk1LjgyODMgMTQuMDAyNyA5Ny4wNjE1IDE0LjE5MjIgOTguMjM5NiAxNC41NzYxQzk5LjMxMTEgMTQuOTI4OCAxMDAuMjkyIDE1LjUxMTcgMTAxLjExMiAxNi4yODM1QzEwMS45NTIgMTcuMDkyMiAxMDIuNjA2IDE4LjA3MTEgMTAzLjAzMyAxOS4xNTRDMTAzLjUzNiAyMC40MzYzIDEwMy44MTYgMjEuNzk0OCAxMDMuODYxIDIzLjE3MTFDMTAzLjg2OCAyMy4zMjE4IDEwMy44NzYgMjMuNDcxOSAxMDMuODgzIDIzLjYyMTRDMTAzLjkyNiAyNC40ODY3IDEwMy45NjggMjUuMzMwNSAxMDMuOTY4IDI2LjEzMjNWMjguOTI4NUMxMDMuOTY4IDI5LjIzMTggMTAzLjk3MSAyOS41MzY4IDEwMy45NzQgMjkuODQzMVYyOS44NDQyVjI5Ljg0NTNDMTAzLjk3OSAzMC40NjMgMTAzLjk4NSAzMS4wODU3IDEwMy45NjggMzEuNzA4M0MxMDMuOTQzIDMyLjY0MDQgMTAzLjkxIDMzLjYwNTQgMTAzLjg2MSAzNC42MTE4QzEwMy44MiAzNS45OTM3IDEwMy41NCAzNy4zNTgyIDEwMy4wMzMgMzguNjQ1M0MxMDIuNjAxIDM5LjcyMDQgMTAxLjk0NiA0MC42OTI5IDEwMS4xMTIgNDEuNDk5M0MxMDAuMjkyIDQyLjI3MTEgOTkuMzExMSA0Mi44NTQgOTguMjM5NiA0My4yMDY3Qzk3LjA2MSA0My41ODc5IDk1LjgyNzkgNDMuNzc0NSA5NC41ODg5IDQzLjc1OTRDOTIuMjAzOSA0My44Njc4IDg5Ljg2ODQgNDMuMDU4NiA4OC4wNjU0IDQxLjQ5OTNaTTkwLjgwNTggMjEuNjIwMkM5MC41Njg1IDIyLjU2MzIgOTAuNDI3IDIzLjUyNzYgOTAuMzgzNiAyNC40OTg5QzkwLjI4NDMgMjUuOTA5NCA5MC4yMzQ2IDI3LjM2OTQgOTAuMjM0NiAyOC44ODcxQzkwLjIzNDYgMzAuNDA0OCA5MC4yODQzIDMxLjg3MzEgOTAuMzgzNiAzMy4yODM2QzkwLjQyNyAzNC4yNTIxIDkwLjU2ODQgMzUuMjEzOSA5MC44MDU4IDM2LjE1NDFDOTAuOTY0NyAzNi44MTU3IDkxLjI0NTQgMzcuNDQyMSA5MS42MzM3IDM4LjAwMTdDOTEuOTU3OSAzOC40NDQxIDkyLjM5NTMgMzguNzkxNiA5Mi45MDAzIDM5LjAwODFDOTMuNDI1MyAzOS4yMjE4IDkzLjk4ODkgMzkuMzI1NiA5NC41NTYgMzkuMzEzM0M5NS4xMjI4IDM5LjMyMzYgOTUuNjg2IDM5LjIxOTcgOTYuMjExNiAzOS4wMDgxQzk2LjcxNjYgMzguNzkxNiA5Ny4xNTQgMzguNDQ0MSA5Ny40NzgyIDM4LjAwMTdDOTcuODY2NiAzNy40NDIyIDk4LjE0NzMgMzYuODE1NyA5OC4zMDYxIDM2LjE1NDFDOTguNTQ2NyAzNS4yMTQyIDk4LjY5MDkgMzQuMjUyNSA5OC43MzY2IDMzLjI4MzZDOTguODI3NiAzMS44NzMxIDk4Ljg3NzMgMzAuNDIxMyA5OC44NzczIDI4LjkxMTlDOTguODc3MyAyNy40MDI0IDk4LjgyNzYgMjUuOTI1OSA5OC43MzY2IDI0LjQ5ODlDOTguNjkwOCAyMy41MjczIDk4LjU0NjYgMjIuNTYyOCA5OC4zMDYxIDIxLjYyMDJDOTguMTQ3MyAyMC45NjExIDk3Ljg2NjUgMjAuMzM3MyA5Ny40NzgyIDE5Ljc4MDdDOTcuMTU2NSAxOS4zMzYxIDk2LjcxODMgMTguOTg4IDk2LjIxMTYgMTguNzc0NEM5NS42ODYgMTguNTYyNyA5NS4xMjI4IDE4LjQ1ODkgOTQuNTU2IDE4LjQ2OTJDOTMuOTg4OSAxOC40NTY4IDkzLjQyNTMgMTguNTYwNyA5Mi45MDAzIDE4Ljc3NDRDOTIuMzkzNiAxOC45ODggOTEuOTU1NCAxOS4zMzYxIDkxLjYzMzcgMTkuNzgwN0M5MS4yNDU0IDIwLjMzNzMgOTAuOTY0NiAyMC45NjExIDkwLjgwNTggMjEuNjIwMloiCiAgICAgICAgICAgIGZpbGw9IndoaXRlIiAvPgogICAgPC9nPgogICAgPGRlZnM+CiAgICAgICAgPGNsaXBQYXRoIGlkPSJjbGlwMF8xOTI4XzM0MzU1Ij4KICAgICAgICAgICAgPHJlY3Qgd2lkdGg9IjEzMiIgaGVpZ2h0PSI2MCIgZmlsbD0id2hpdGUiIC8+CiAgICAgICAgPC9jbGlwUGF0aD4KICAgIDwvZGVmcz4KPC9zdmc+"
	                            	style="height: 28px;" id="payImage">
	                            </div>
                            </div>
                        <hr>
                        <div id="eyeLikeTime">
                        	<div>
	                        	<div id="Like">
	                        		<img src="${pageContext.request.contextPath}/resources/images/products/하트모양.png" width="25" height="25">
	                        		<div id="Like">516</div>
	                        	</div>
	                        	<div id="eye">
	                        		<img src="${pageContext.request.contextPath}/resources/images/products/눈깔.png" width="25" height="25">
	                        		516
                       			</div>
	                        	<div id="time">
	                        		<img src="${pageContext.request.contextPath}/resources/images/products/시간.png" width="25" height="25">
	                        		몇일전
	                        	</div>
	                        	<button class="police" id="reviewCheckForm" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
	                        		<img src="${pageContext.request.contextPath}/resources/images/product-details/신고하기.png" width="25" height="25">
	                        		신고하기
	                        	</button>
	                        </div>
                        </div>
                        <br><br>
                        <div>
                        	<div id="productStatusDiv">
                        		<span style="font-size: 6px;">●</span>
                        		<div id="productStatus">상품상태</div>
                        	 </div>
                        	 <div id="productStatusData">
                        	 	찢어지기직전
                        	 </div>
                        	 <div>
                        	 <div id="productStatusDiv">
                        		<span style="font-size: 6px;">●</span>
                        		<div id="productStatus">거래지역</div>
                        	 </div>
                        	 <div id="productStatusData">
                        	 	너네집과 우리집중간 어디쯤..
                        	 </div>
                        	 </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-12">
	                         <div class="wish-button" id="priceProposal">
	                             <button class="btn" style="width:174px; height: 60px; font-size: 20px;">가격제안</button>
	                         </div>
                         </div>
                         <div class="bottom-content" id="threeButton">
                             <div class="row align-items-end">
                                 <div class="col-lg-4 col-md-4 col-12">
                                     <div class="button cart-button" id="likeButtonDiv">
                                        <button class="btn" style="width: 100%; height: 60px;" id="likeButton">
                                        <span id="likeText">찜</span>
                                     	<img src="${pageContext.request.contextPath}/resources/images/product-details/찜하트모양.png" width="25" height="25" id="likeImage">
                                        <span id="likeButtonSpan">516</span>
                                        </button>
                                     </div>
                                 </div>
                                 <div class="col-lg-4 col-md-4 col-12">
                                     <div class="wish-button">
                                         <button class="btn" style="height: 60px;" id="chatButton"> 1:1채팅</button>
                                     </div>
                                 </div>
                                 <div class="col-lg-4 col-md-4 col-12">
                                     <div class="wish-button">
                                         <button class="btn" style="height: 60px;" id="nowPay"> 즉시구매</button>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <hr>
                         <div id="tradeAddressTag">
                         	<div id="tradeAddress">
                         		<div id="tradeAddressName">
	                         		<span id="tradeAddressSpan">거래지역</span>
	                         		<img src="${pageContext.request.contextPath}/resources/images/product-details/거래지역.png" width="25" height="25" id="tradeImage">
                         		</div>
                         		<div id="addressDetail">부산광역시 부산진구 부전동</div>
                         	</div>
                         	<div id="tradeAddress">
                         		<div id="tradeAddressName">
	                         		<span id="tradeAddressSpan">카테고리</span>
	                         		<img src="${pageContext.request.contextPath}/resources/images/product-details/카테고리이미지.png" width="25" height="25" id="tradeImage">
                         		</div>
                         		<div id="categoryDiv">
                         			<a href="" id="addressDetailA" style="text-align: center;">
	                         			<div id="categoryDetail">아이유</div>
	                         		</a>
                         		</div>
                         	</div>
                         	<div id="productTag">
                         		<div id="tradeAddressName">
	                         		<span id="tradeAddressSpan">상품태그</span>
	                         		<img src="${pageContext.request.contextPath}/resources/images/product-details/상품태그이미지.png" width="25" height="25" id="tradeImage">
                         		</div>
                         		<div id="tagDiv">
                         			<a href="" id="addressDetailA" style="text-align: center;">
	                         			<div id="tagDetail">#아이유dddd</div></a>
                         			<a href="" id="addressDetailA" style="text-align: center;">
	                         			<div id="tagDetail">#아이유</div></a>
                         			<a href="" id="addressDetailA" style="text-align: center;">
	                         			<div id="tagDetail">#아이유</div></a>
                         			<a href="" id="addressDetailA" style="text-align: center;">
	                         			<div id="tagDetail">#아이유</div></a>
                         		</div>
                         	</div>
                         </div>
                       </div>
                    	<hr style="width:590px; margin-left: 30px; margin-bottom: 25px;">
                    </div>
                </div>
            </div>
            <div class="product-details-info">
            	<div class="single-block" id="relatedProductsBlock">
            		<span id="relatedProducts"><b>연관상품</b></span>
	            	<div id="relatedProductsImage">
	            		<div id="productImageName">
	            			<a href="">
		            	 	<img src="${pageContext.request.contextPath}/resources/images/product-details/iu6.png" id="current" alt="#" height="250px" width=250px;" >
		            	 	</a>
		            	 	<div id="productName">상품 이름 뿌릴곳</div>
	            	 	</div>
	            		<div id="productImageName">
	            			<a href="">
		            	 	<img src="${pageContext.request.contextPath}/resources/images/product-details/iu2.jpg" id="current" alt="#" height="250px" width=250px;">
		            	 	</a>
		            	 	<div id="productName">상품 이름 뿌릴곳</div>
	            	 	</div>
	            		<div id="productImageName">
     	 	    			<a href="">
		            	 	<img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" id="current" alt="#" height="250px" width=250px;">
		            	 	</a>
		            	 	<div id="productName">상품 이름 뿌릴곳</div>
	            	 	</div>
	            		<div id="productImageName">
	            			<a href="">
		            	 	<img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" id="current" alt="#" height="250px" width=250px;">
		            	 	</a>
		            	 	<div id="productName">상품 이름 뿌릴곳</div>
	            	 	</div>
	            		<div id="productImageName">
		            	 	<a href="">
		            	 	<img src="${pageContext.request.contextPath}/resources/images/product-details/karina2.jpg" id="current" alt="#" height="250px" width=250px;">
		            	 	</a>
		            	 	<div id="productName">상품 이름 뿌릴곳</div>
	            	 	</div>
	            	</div>
            	</div>
            </div>
            <div class="product-details-info">
                <div class="single-block" id="single_block">
                	<div></div>
                    <div class="row">
                        <div id="productNameContent">
                            <div class="info-body custom-responsive-margin">
                                <b><span style="font-size: 20px; padding-top: 30px;">상품정보</span></b><hr>
                                <p style="font-size: 15px;">존나좋은 상품 훌륭함</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12" style="width: 350px;">
                            <div class="info-body" id="info_body">
                                <b><span style="font-size: 20px; padding-top: 30px;">판매자정보</span></b>
                                <hr>
                                <div>
                                	<a href=""  id="profileImage">
                                		<img src="${pageContext.request.contextPath}/resources/images/product-details/iu2.jpg" class="img" alt="#">
                                	</a>
                                	<div id="nickname">
                                		<a href="" id="nicknameA">닉네임자리</a>
                                	</div>
                                </div>
                                <div id="myProductDiv">
                                	<div id="myProducts">
                                		<a href="" id="aTag">
                                			<span style="font-size: 17px;">상품 30</span>
                                		</a>
                                		<span id="after"></span>
                                	</div>
                                	<div id="reviews">
                                		<a href="" id="aTag">
                                			<span style="font-size: 17px;">후기 13</span>
                                		</a>
                                	</div>
                                </div>
                                <div style="height: 150px">
                                	<div id="myProductImage">
	                                	<a href="" style="height: 150px;">
	                                		<img src="${pageContext.request.contextPath}/resources/images/product-details/winter1.jpg" class="img" alt="#" height="150px" width="150px">
	                                		<div id="imgPrice">
	                                			<span>40,000</span>원
	                                		</div>
	                                	</a>
                                	</div>
                                	<div id="myProductImage">
	                                	<a href="" style="height: 150px;">
	                                		<img src="${pageContext.request.contextPath}/resources/images/product-details/iu2.jpg" class="img" alt="#" height="150px" width="150px">
                    						<div id="imgPrice">
	                                			<span>160,000</span>원
	                                		</div>
	                                	</a>
                                	</div>
                                </div>
                                <div style="text-align: center; margin-top: 20px;">
                                	<a href="" id="productPlus">
                                		<span id="productCount">30개</span>
	                                	<span style="color: black;">상품 더보기 ></span>
                                	</a>
                                </div>
                                <hr>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
                                <!-- End Single Review -->
                            </div>
                        </div>
    </section>
    <!-- End Item Details -->

    <!-- Review Modal -->
    <div class="modal fade review-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Leave a Review</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-name">Your Name</label>
                                <input class="form-control" type="text" id="review-name" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-email">Your Email</label>
                                <input class="form-control" type="email" id="review-email" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-subject">Subject</label>
                                <input class="form-control" type="text" id="review-subject" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-rating">Rating</label>
                                <select class="form-control" id="review-rating">
                                    <option>5 Stars</option>
                                    <option>4 Stars</option>
                                    <option>3 Stars</option>
                                    <option>2 Stars</option>
                                    <option>1 Star</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="review-message">Review</label>
                        <textarea class="form-control" id="review-message" rows="8" required></textarea>
                    </div>
                </div>
                <div class="modal-footer button">
                    <button type="button" class="btn">Submit Review</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Review Modal -->

    <!-- Start Footer Area -->
    <footer class="footer">
        <!-- Start Footer Top -->
        <div class="footer-top">
            <div class="container">
                <div class="inner-content">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-12">
                            <div class="footer-logo">
                                <a href="index.html">
                                    <img src="${pageContext.request.contextPath}/resources/images/logo/white-logo.svg" alt="#">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="footer-newsletter">
                                <h4 class="title">
                                    Subscribe to our Newsletter
                                    <span>Get all the latest information, Sales and Offers.</span>
                                </h4>
                                <div class="newsletter-form-head">
                                    <form action="#" method="get" target="_blank" class="newsletter-form">
                                        <input name="EMAIL" placeholder="Email address here..." type="email">
                                        <div class="button">
                                            <button class="btn">Subscribe<span class="dir-part"></span></button>
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
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-apple"></i>
                                            <span class="small-title">Download on the</span>
                                            <span class="big-title">App Store</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-play-store"></i>
                                            <span class="small-title">Download on the</span>
                                            <span class="big-title">Google Play</span>
                                        </a>
                                    </li>
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
                                    <li><a href="javascript:void(0)">Computers & Accessories</a></li>
                                    <li><a href="javascript:void(0)">Smartphones & Tablets</a></li>
                                    <li><a href="javascript:void(0)">TV, Video & Audio</a></li>
                                    <li><a href="javascript:void(0)">Cameras, Photo & Video</a></li>
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
                                <span>We Accept:</span>
                                <img src="${pageContext.request.contextPath}/resources/images/footer/credit-cards-footer.png" alt="#">
                            </div>
                        </div>
                        <div class="col-lg-4 col-12">
                            <div class="copyright">
                                <p>Designed and Developed by<a href="https://graygrids.com/" rel="nofollow"
                                        target="_blank">GrayGrids</a></p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-12">
                            <ul class="socila">
                                <li>
                                    <span>Follow Us On:</span>
                                </li>
                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
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
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
 	<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
    <script type="text/javascript">
        const current = document.getElementById("current");
        const opacity = 0.6;
        const imgs = document.querySelectorAll(".img");
        imgs.forEach(img => {
            img.addEventListener("click", (e) => {
                //reset opacity
                imgs.forEach(img => {
                    img.style.opacity = 1;
                });
                current.src = e.target.src;
                //adding class 
                //current.classList.add("fade-in");
                //opacity
                e.target.style.opacity = opacity;
            });
        });
    </script>
</body>

</html>