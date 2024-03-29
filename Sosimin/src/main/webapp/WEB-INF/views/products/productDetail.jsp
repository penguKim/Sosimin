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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<!--     <meta http-equiv="x-ua-compatible" content="ie=edge" /> -->
<!--     <title>Single Product - ShopGrids Bootstrap 5 eCommerce HTML Template.</title> -->
<!--     <meta name="description" content="" /> -->
<%--     <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script> --%>
<!--     <meta name="viewport" content="width=device-width, initial-scale=1" /> -->
<%--     <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" /> --%>

    <!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
    
     <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    
    
    <%--  --%>
</head>
<style>

#policeText{
	position: relative;
	bottom:48px;
	left:128px;
}
.reportBtn2 {
	display:inline-block;
	position:relative;
	color: #888;
	cursor: pointer;
	transition: 0.5s;
	left: 350px;
	width:10px;
}

.reportBtn2:hover{
	color: #f00;
	transform: scale(1.2);
	transition: 0.5s;
}

.reportBtn2:hover .reportBtn,
.reportBtn2:hover #policeText{
	color: #f00;
}

/* 판매 완료 */
#singleProductAreaDealComplete {
	border: none;
	width: 290px;
	height: 400px;
	display: inline-block;
	margin-right: 2px !important;
	margin-top: 0px;
	box-sizing: content-box !important;
	padding: 0 !important;
	position: relative;
/* 	background-color: rgba(0, 0, 0, 0.5); */
/* 	opacity: 0.4; */
}

#singleProductArea::before {
    content: " " ;
	width: 620px;
	height: 620px;
	position: absolute;
    top: 0px;
    left: 0px;
    right: 0px;
    bottom: 0px;
	opacity: 0.7;
	transform: scale(1.0);
	display: inline-block;
	margin-bottom: 10px !important;
	margin-left: 2px !important;
	margin-right: 2px !important;
	box-sizing: content-box !important;
	padding: 0 !important;
	background-color: white;
	z-index: 999;
}

#checkmark{
	border: none;
}
#dealComplete {
	position: absolute;
	z-index: 1000;
/* 	width: 250px; */
/* 	height: 250px; */
	left: 177px;
	bottom:160px;
	border: none;
/*     display: none; */
}
#tradeEnd {
	color: #27B24A;
	font-weight: bold;
	position: relative;
	font-size: 30px;
	left: 83px;
}

#dealComplete img {
	width: 300px !important;
	height: 300px !important;
}
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
#Like , #LikeImage{
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
	top: 80px;
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
	right:88px;
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
	width: 250px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;
	text-align: center;
	color:black;
	font-size: 15px;
	font-weight: bold;
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
  font-weight: bolder;
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
	text-align: center;
}
#tradeMethodDiv{
	display:inline-block;
	position: relative;
}

.idqEnN {
    width: 100%;
    height: 100%;
    font-weight: 600;
    color: rgb(255, 255, 255);
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    line-height: 1;
    background: rgb(51, 51, 51);
}

#productModify{
	width: 600px;
	background-color: #39d274;
	font-size: 20px;
	color:white;
}
#productTradeIng{
	width: 600px;
	background-color: #f9f9f9;
	font-size: 20px;
	color: blue;
}
#productTradeEnd{
	width: 600px;
	background-color: #f9f9f9;
	font-size: 20px;
	color: red;
}
.main-img{
	position: relative;
}

.progress{
	display:inline-block;
	position: relative;
	top:3px;
	left:15px;
}

.progress-bar {
  animation-name: progress-animation;
  animation-duration: 2s; 
  /* 애니메이션 지속 시간을 설정합니다. */
  animation-timing-function: ease-out; 
  /* 애니메이션 속도 곡선을 설정합니다. */
}
/* The Modal (background) */
#myModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 100; /* Sit on top */
  padding-top: 200px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (Image) */
#myModal .modal-content {
  margin: auto;
  display: block;
  width: 70%;
  max-width: 600px;
}

/* Add Animation - Zoom in the Modal */
#myModal .modal-content {
  animation-name: zoom;
  animation-duration: 0.6s;
}
@keyframes zoom {
  from {transform:scale(0)}
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}
</style>
<script>



$(function() {
	console.log(${percentage});
	memberExp(${percentage});
	console.log("세션에 저장된 아이디 ; " + '${sessionScope.sId}');
	// 찜정보 가져오기
	$.ajax({
		type: "POST",
		url: "interestShow", <%-- 회원의 관심 정보 가져오기 --%>
			data: {
				product_id: ${param.product_id}
			},
			dataType: "json",
			success: function(result) {
				console.log(result);
// 				if(Object.keys(result) == 0) {
					if(result.product_id == ${param.product_id}) {
						$("#Like").text(result.intersetCount);
						$("#likeButtonSpan").text(result.intersetCount);
						$("#likeImage").attr("src","data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGNzJGMzMiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K");
						$("#likeButton").css("background-color", "rgb(51, 51, 51)");
					}
// 				}
			},
			error: function(xhr, textStatus, errorThrown) {
					alert("관심 불러오기를 실패했습니다.\n새로고침을 해주세요.");
			}
		});
 
	// 모달 닫기 버튼 클릭 이벤트
	$(".close").on("click", function() {
	  $("#myModal").hide(); <%-- div 영역 숨김 --%>
	});
	// 모달 외부 영역 클릭 시 모달 닫기
	$(window).on("click", function(event) {
		if ($(event.target).is("#myModal")) { <%-- 클릭한 곳이 모달창 바깥 영역일 경우 --%>
			$("#myModal").hide(); <%-- div 영역 숨김 --%>
		}
	});
	
$("#likeButton").on("click", function () {
	$.ajax({
		type: "POST",
		url: "interestCheck", 
		data: {
//			community_like_status: 0,
			product_id: ${param.product_id}
		},
		dataType: "json",
		success: function(result) { <%-- 응답 결과가 문자열로 전송 --%>
			if(result.isChecked == 'false') { <%-- 찜을 등록하는 경우 --%>
				const Toast = Swal.mixin({
				    toast: true,
				    position: 'center-center',
				    showConfirmButton: false,
				    timer: 2000,
				    timerProgressBar: false,
				})
				Toast.fire({
				    icon: 'success',
				    title: '좋아요가 등록되었습니다!'
				})		
			$("#likeText").addClass("is-active");
				$("#likeButtonSpan").text(result.intersetCount);
				$("#Like").text(result.intersetCount);
				$("#likeButton").css("background-color", "rgb(51, 51, 51)");
				$("#likeImage").attr("src","data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGNzJGMzMiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K");
			} else if(result.isChecked == 'true') { <%-- 찜을 삭제하는 경우 --%>
				const Toast = Swal.mixin({
				    toast: true,
				    position: 'center-center',
				    showConfirmButton: false,
				    timer: 2000,
				    timerProgressBar: false,
				})
				Toast.fire({
				    icon: 'error',
				    title: '좋아요가 삭제되었습니다!'
				})	
			$("#likeText").removeClass("is-active");
				$("#likeButtonSpan").text(result.intersetCount);
				$("#Like").text(result.intersetCount);
				$("#likeButton").css("background-color", "rgb(204, 204, 204)");
				$("#likeImage").attr("src","data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K");
			}
		},
		error: function(xhr, textStatus, errorThrown) {
			Swal.fire({
 	        title: '회원만 사용가능합니다.',
 	        text: '로그인 페이지로 이동하시겠습니까?',
 	        icon: 'error',
 	        showCancelButton: true,
 	        confirmButtonColor: '#39d274',
 	        cancelButtonColor: '#d33',
 	        confirmButtonText: '이동',
 	        cancelButtonText: '취소',
 	        reverseButtons: true,
 	        allowOutsideClick: false
 	    }).then((result) => {
 	        if (result.isConfirmed) {
 	        	location.href="MemberLogin";
 	        }
 	    });
		}
	});
});
});






function imageModal(image) {
	console.log($(image).attr("src"));
	let modal = $("#myModal");
	$(".modal-content").attr("src", $(image).attr("src"));
	modal.show();
}		

//메인사진 클릭 시 등록한 전체 사진 다 띄우기 <사용할지 안할지 모름> 
function openPopup() {
var images = document.querySelectorAll('.images img');
var imageSrcs = [];

images.forEach(function(image) {
imageSrcs.push(image.src);
});

var popupWindow = window.open('', '_blank', 'width=900,height=620');

popupWindow.document.write('<div style="display:flex; flex-direction: row;">');

imageSrcs.forEach(function(src) {
popupWindow.document.write('<img src="' + src + '" style="width: 540px; height: 540px; margin-right: 10px; margin-top : 20px;">');
});

popupWindow.document.write('</div>');
popupWindow.document.close();
}

// 메인 사진 클릭 시 한장만 뜸
function imagePopup(src) {
var newWindow = window.open('', '_blank', 'width=800,height=600');
newWindow.document.write('<html><head><title>Image</title></head><body style="background-color: black; margin: 0; display: flex; justify-content: center; align-items: center;"><img src="' + src + '" style="max-width: 100%; max-height: 100%;"></body></html>');
}


// function Proposal() {
// var sId = "${sId}";
// var product_id = ${Product.product_id};

// if(sId) {

// var width = 640; // 팝업 창의 가로 크기
// var height = 480; // 팝업 창의 세로 크기
// var left = window.screenX + (window.outerWidth - width) / 2; // 화면 가로 중앙에 위치
// var top = window.screenY + (window.outerHeight - height) / 2; // 화면 세로 중앙에 위치

// var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",resizable=no";

// window.open("Proposal?product_id=" + product_id, "상품이미지", options);
// } else{
// 	Swal.fire({
// 	        title: '회원만 사용가능합니다.',
// 	        text: '로그인 페이지로 이동하시겠습니까?',
// 	        icon: 'error',
// 	        showCancelButton: true,
// 	        confirmButtonColor: '#39d274',
// 	        cancelButtonColor: '#d33',
// 	        confirmButtonText: '이동',
// 	        cancelButtonText: '취소',
// 	        reverseButtons: true,
// 	        allowOutsideClick: false
// 	    }).then((result) => {
// 	        if (result.isConfirmed) {
// 	        	location.href="MemberLogin";
// 	        }
// 	    });
// 	}
// }

function chat() {
	var sId = "${sId}";
	var product_id = ${Product.product_id};
	
	if(sId) {
		Swal.fire({
	        title: '채팅방으로 이동하시겠습니까?',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '이동',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	        allowOutsideClick: false
	    }).then((result) => {
	        if (result.isConfirmed) {
// 	        	location.href="ChatMain2?product_id=" + product_id;
// 	        	window.open("ChatMain2?product_id=" + product_id, "", "width=800, height=700");
// 	        	window.open("ChatMain3?product_id=" + product_id, "", "width=800, height=700");
// 	        	location.href="ChatMain3?product_id=" + product_id;
	        	location.href="ChatMain3?product_id=" + product_id + "&product_buyer=" + sId;
	        }
	    });
	} else{
		Swal.fire({
		        title: '회원만 사용가능합니다.',
		        text: '로그인 페이지로 이동하시겠습니까?',
		        icon: 'error',
		        showCancelButton: true,
		        confirmButtonColor: '#39d274',
		        cancelButtonColor: '#d33',
		        confirmButtonText: '이동',
		        cancelButtonText: '취소',
		        reverseButtons: true,
		        allowOutsideClick: false
		    }).then((result) => {
		        if (result.isConfirmed) {
		        	location.href="MemberLogin";
		        }
		    });
		}
};

//function Proposal() {

//$.ajax({
// type: "GET",
// url: "Proposal", // 로그인 상태를 확인하는 서버의 URL
// data:{
// 	product_id: ${param.product_id}
// },
// success: function(result) {
// 	alert(result)
//     // 로그인이 되어 있는 경우
//     if(result.isLoggedIn) {
//         var product_id = ${Product.product_id};
//         var width = 640; // 팝업 창의 가로 크기
//         var height = 480; // 팝업 창의 세로 크기
//         var left = window.screenX + (window.outerWidth - width) / 2; // 화면 가로 중앙에 위치
//         var top = window.screenY + (window.outerHeight - height) / 2; // 화면 세로 중앙에 위치

//         var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",resizable=no";

//         window.open("Proposal?product_id=" + product_id, "상품이미지", options);
//     } 
//     // 로그인이 안 되어 있는 경우
//     else {
//     	Swal.fire({
//  	        title: '회원만 사용가능합니다.',
//  	        text: '로그인 페이지로 이동하시겠습니까?',
//  	        icon: 'error',
//  	        showCancelButton: true,
//  	        confirmButtonColor: '#39d274',
//  	        cancelButtonColor: '#d33',
//  	        confirmButtonText: '이동',
//  	        cancelButtonText: '취소',
//  	        reverseButtons: true,
//  	        allowOutsideClick: false
//  	    }).then((result) => {
//  	        if (result.isConfirmed) {
//  	        	location.href="MemberLogin";
//  	        }
//  	    });
//     }
// },
// error: function(xhr, textStatus, errorThrown) {
//     // 에러 처리 코드를 여기에 작성하세요.
// }
//});
//}

    window.onload = function() {
        var product_txt = document.getElementById("product_txt");
        product_txt.innerHTML = product_txt.innerHTML.replace(/\n/g, "<br />");
    };

	function memberExp(percent) {
	// 스타일 요소를 만들고, @keyframes 규칙을 추가합니다.
	$('<style>')
	.prop('type', 'text/css')
	.html(`
		@keyframes progress-animation {
			0%   {width: 0%;}
			100% {width: percent + '%';}
		}
	`)
	.appendTo('head');
	
	// 프로그레스바 애니메이션을 시작합니다.
	$('.progress-bar').css('width', percent + '%').attr('aria-valuenow', percent + '%').text(percent + '%');
}
	
	
// 바로 구매 시
function buy() {
	let product_id = ${param.product_id};
	let sId = "${sId}";	
// 	console.log(product_id);
	
	if(sId == "") {
		Swal.fire({
	        title: '회원만 사용가능합니다.',
	        text: '로그인 페이지로 이동하시겠습니까?',
	        icon: 'error',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '이동',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	        allowOutsideClick: false
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	location.href="MemberLogin";
	        }
	    });
		} else if(${payStatus.member_id ne Product.member_id}) {
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '판매자가 페이 가입자가 아닙니다!',
			showConfirmButton: false,
			timer: 2000,
			toast: true
		});	
		} else {
			location.href="DirectPayment?product_id=" + product_id;		
		}	

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
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="SearchProduct">상품</a></li>
                        <li>상품상세</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Item Details -->
 
    <section class="item-details section" id="sectionWidth">
<!--       <form> -->
        <div class="container" id="containerDiv">
            <div class="top-area" id="topWidth">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-images">
                            <main id="gallery">
                            <c:choose>
                            	<c:when test="${Product.trade_status eq 0}">
                                <div class="main-img">
                                    <img src="${pageContext.request.contextPath}/resources/upload/${Product.product_image1 }" id="current" alt="#" height="620px" style="display:block; width:100%;" class="mx-auto" onclick="imageModal(this)">
<%--                                     <img src="${pageContext.request.contextPath}/resources/upload/${Product.product_image1 }" id="current" alt="#" height="620px" style="display:block; width:100%;" class="mx-auto" onclick="openPopup(this.src)"> --%>
                                </div>
                            	</c:when>
                            	<c:when test="${Product.trade_status eq 1}">
                                <div class="main-img">
                                    <img src="${pageContext.request.contextPath}/resources/upload/${Product.product_image1 }" id="current" alt="#" height="620px" style="display:block; width:100%;" class="mx-auto" onclick="imageModal(this)">
                                </div>
                            	</c:when>
                            	<c:when test="${Product.trade_status eq 2}">
                                <div class="main-img" id="singleProductArea">
                                    <img src="${pageContext.request.contextPath}/resources/upload/${Product.product_image1 }" id="current" alt="#" height="620px" style="display:block; width:100%;" class="mx-auto" onclick="imageModal(this)">
                           			<span id="dealComplete">
										<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png" id="checkmark"><br>
										<span id="tradeEnd">판매 완료</span>
									</span>		
                                </div>
                            	</c:when>
                            </c:choose>
<!--                                 </div> -->
	<div id="myModal" class="modal">
		<!-- The Close Button -->
		<span class="close">&times;</span>
		<!-- Modal Content (The Image) -->
		<img class="modal-content" id="img01">
	</div>
                                <div class="images">
					             <c:forEach var="i" begin="1" end="5">
									 <c:set var="i" value="product_image${i}" />
									 <c:if test="${not empty Product[i]}">
									    <img src="${pageContext.request.contextPath}/resources/upload/${Product[i]}" class="img" alt="# " height="100px">
									 </c:if>
								</c:forEach>
                                </div>
                            </main>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-info" id="maxWidth">
                        	<div>
                        		<div>
                            		<h2 class="title">${Product.product_name}</h2><br>
                            	</div>
	                            <div>
	                            <h3 class="price2" style="font-size: 40px"><fmt:formatNumber value="${Product.product_price}" pattern="###,###"/><span style="font-size: 20px">원</span></h3>&nbsp;&nbsp;&nbsp;
	                            	<c:if test="${payStatus.member_id eq Product.member_id}">
			                            	<img src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png"
		                            	style="height: 40px;" id="payImage">
	                            	</c:if>
	                            </div>
                            </div>
                        <hr>
                        <div id="eyeLikeTime">
                        	<div>
	                        	<div id="LikeImage">
	                        		<img src="${pageContext.request.contextPath}/resources/images/products/하트모양.png" width="25" height="25">
	                        		<div id="Like">${intersetCount}</div>
	                        	</div>
	                        	<div id="eye">
	                        		<img src="${pageContext.request.contextPath}/resources/images/products/눈깔.png" width="25" height="25">
	                        		${count.product_readcount}
                       			</div>
	                        	<div id="time">
	                        		<img src="${pageContext.request.contextPath}/resources/images/products/시간.png" width="25" height="25">
	                        		<c:forEach var="Product" items="${Product2}">
	                        			${Product.product_datetime }
	                        		</c:forEach>
	                        	</div>
	                        	<%-- 신고하기 --%>
	                        </div>
                        </div>
                        	<c:if test="${Product.member_id ne sessionScope.sId}">
                        	<div class="reportBtn2">
                        		<input type="hidden"  id="report_type" value="2">
                        		<input type="hidden"  id="report_name" value="${Product.product_name }">
                        		<input type="hidden"  id="report_type_id" value="${Product.product_id }">
                        		<input type="hidden"  id="reportee_id" value="${Product.member_id }">
								<span class="reportBtn fa fa-warning d-flex justify-content-end" data-bs-toggle="modal" data-bs-target="#reportModal" style="font-size:20px; white-space: nowrap">신고하기</span>
							</div>
							</c:if>
                        <br><br>
                        <div>
                        	<div id="productStatusDiv">
                        		<span style="font-size: 6px;">●</span>
                        			<div id="productStatus">상품상태</div>
                        	 </div>
                        	 <div id="productStatusData">
                        	 	<c:choose>
                        	 		<c:when test="${Product.product_status eq 0}">
                        	 			보통
                        	 		</c:when>
                        	 		<c:when test="${Product.product_status eq 1}">
                        	 			좋은상태
                        	 		</c:when>
                        	 		<c:otherwise>
                        	 			새상품
                        	 		</c:otherwise>
                        	 	</c:choose>
                        	 </div>
                        	 <div>
	                        	 <div id="productStatusDiv">
	                        		<span style="font-size: 6px;">●</span>
                        				<div id="productStatus">거래지역</div>
	                        	 </div>
	                        	 <div id="productStatusData">
									${guDong.gu}  ${guDong.dong }                        	 
	                        	 </div>
                        	 </div>
                        	 <div>
	                        	 <div id="tradeMethodDiv">
	                        		<span style="font-size: 6px;">●</span>
	                        			<div id="productStatus">거래방법</div>
	                        	 </div>
									<div id="productStatusData">
									  <c:if test="${Product.trade_method eq 0 }">
									    대면거래
									  </c:if>
									  <c:if test="${Product.trade_method eq 1 }">
									    소심거래
									  </c:if>
									</div>
                        	 </div>
                        </div>
                         <div class="bottom-content" id="threeButton">
                             <div class="row align-items-end">
                             <c:choose>
<%--                             	 <c:if test="${Product.trade_status eq 0 }"> --%>
	                             	<c:when test="${Product.member_id eq sessionScope.sId and Product.trade_status eq 0}">
		                                 <div class="col-lg-4 col-md-4 col-12">
		                                     <div class="wish-button">
		                                     	<a href="ProductModify?product_id=${Product.product_id }">
		                                         <button class="btn" style="height: 60px;" id="productModify"> 상품수정 </button>
		                                         </a>
		                                     </div>
		                                 </div>
                                 	</c:when>
                                 	<c:when test="${Product.member_id ne sessionScope.sId and Product.trade_status eq 0 }">
	                                 <div class="col-lg-4 col-md-4 col-12">
	<%--                                  <c:if test="${Product.member_id != sId }"> --%>
	                                     <div class="button cart-button" id="likeButtonDiv">
	                                     	<button class="btn" style="width: 100%; height: 60px;" id="likeButton" >
	<!--                                         <button class="btn" style="width: 100%; height: 60px;" id="likeButton"  > -->
	                                        <span id="likeText">좋아요</span>
	                                     		<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTcuMDA1IDEuMDQ1aC4yMzNjLjI4LjIyOC41MzcuNDkuNzYyLjc3Ny4yMjUtLjI4OC40ODEtLjU0OS43NjItLjc3N2guMjMzYTYuMTYgNi4xNiAwIDAgMC0uMDktLjExM0M5LjY4NC4zNDQgMTAuNjI4IDAgMTEuNiAwIDE0LjA2NCAwIDE2IDIuMTEgMTYgNC43OTZjMCAzLjI5Ni0yLjcyIDUuOTgxLTYuODQgMTAuMDYyTDggMTZsLTEuMTYtMS4xNTFDMi43MiAxMC43NzcgMCA4LjA5MiAwIDQuNzk2IDAgMi4xMSAxLjkzNiAwIDQuNCAwYy45NzIgMCAxLjkxNi4zNDQgMi42OTUuOTMyYTYuMTYgNi4xNiAwIDAgMC0uMDkuMTEzeiIvPgo8L3N2Zz4K" width="20" height="20" id="likeImage">
	<%--                                      		<img src="${pageContext.request.contextPath}/resources/images/product-details/찜하트모양.png" width="25" height="25" id="likeImage"> --%>
	                                        <span id="likeButtonSpan">${intersetCount}</span>
	                                        </button>
	                                     </div>
	<%--                                 </c:if> --%>
	                                 </div>
	                                 <div class="col-lg-4 col-md-4 col-12">
	                                     <div class="wish-button">
<%-- 	                                         <button class="btn" style="height: 60px;" id="chatButton" onclick="location.href='ChatMain?product_id=${Product.product_id}'"> 1:1채팅</button> --%>
	                                         <button class="btn" style="height: 60px;" id="chatButton" onclick="chat()"> 1:1채팅</button>
	                                     </div>
	                                 </div>
		     						 <div class="col-lg-4 col-md-4 col-12">
			                         <div class="wish-button" id="priceProposal">
<!-- 			                             <button class="btn" style="width:174px; height: 60px; font-size: 20px; color:white; background-color: #39d274"  onclick="Proposal()">가격제안</button> -->
<%-- 			                             <button class="btn" style="width:174px; height: 60px; font-size: 20px; color:white; background-color: #39d274"  onclick="buy()" <c:if test="${payStatus.member_id ne Product.member_id}">disabled</c:if>>구매하기</button> --%>
			                             <button class="btn" style="width:174px; height: 60px; font-size: 20px; color:white; background-color: #39d274"  onclick="buy()">구매하기</button>
									
		                            </div>
	                              </div>
                                  </c:when>
                                  <c:when  test="${Product.trade_status eq 1 }">
	                                 <div class="col-lg-4 col-md-4 col-12">
	                                     <div class="wish-button">
	                                         <button class="btn" style="height: 60px;" id="productTradeIng"> 거래중 </button>
	                                     </div>
                                 	</div>
                                  </c:when>
                          	<c:otherwise>
                             	    <c:if test="${Product.trade_status eq 2 }">
	                                 <div class="col-lg-4 col-md-4 col-12">
	                                     <div class="wish-button">
	                                         <button class="btn" style="height: 60px;" id="productTradeEnd"> 판매완료 </button>
	                                     </div>
                                 	</div>
                                	</c:if>
                           	</c:otherwise>
                           	</c:choose>
                           </div>
                         </div>
                         <hr>
                         <div id="tradeAddressTag">
                         	<div id="tradeAddress" style="text-align: center">
                         		<div id="tradeAddressName">
	                         		<span id="tradeAddressSpan">거래지역</span>
	                         		<img src="${pageContext.request.contextPath}/resources/images/product-details/거래지역.png" width="25" height="25" id="tradeImage">
                         		</div>
                         		<div id="addressDetail">${guDong.gu }  ${guDong.dong }</div>
                         	</div>
                         	<div id="tradeAddress" style="text-align: center">
                         		<div id="tradeAddressName">
	                         		<span id="tradeAddressSpan">카테고리</span>
	                         		<img src="${pageContext.request.contextPath}/resources/images/product-details/카테고리이미지.png" width="25" height="25" id="tradeImage">
                         		</div>
                         		<div id="categoryDiv">
                         			<a href="SearchProduct?product_category=${Product.product_category}" id="addressDetailA" style="text-align: center;">
	                         			<span id="categoryDetail">${Product.product_category }</span>
	                         		</a>
                         		</div>
                         	</div>
                         	
                         	<div id="productTag" style="text-align: center">
                         		<div id="tradeAddressName">
	                         		<span id="tradeAddressSpan" >상품태그</span>
	                         		<img src="${pageContext.request.contextPath}/resources/images/product-details/상품태그이미지.png" width="25" height="25" id="tradeImage">
                         		</div>
                         		<div id="tagDiv">
                         		<c:forEach var="i" begin="1" end="4">
								  <c:set var="tagName" value="tag_name${i}" />
								  <c:if test="${not empty Product[tagName] and Product[tagName] ne '#null' }">
								  	<c:set var="modifiedTagName" value="${fn:replace(Product[tagName],'#','%23')}" />
								    <a href="SearchProduct?keyword=${modifiedTagName}" id="addressDetailA">
								      <span id="tagDetail">${Product[tagName]}</span>
								    </a>
								  </c:if>
								</c:forEach>
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
            		<c:choose>
						<c:when test="${not empty RelatedProducts }">
			            	<div id="relatedProductsImage">
			            		<div id="productImageName">
			            			<c:forEach var="product" items="${RelatedProducts }" varStatus="status">
			            				 <c:if test="${status.count <= 5 && product != null && !empty product.product_image1}">
				            			<a href="ProductDetail?product_id=${product.product_id}">
			            				   <img src="${pageContext.request.contextPath}/resources/upload/${product.product_image1}" id="current" alt="#" height="250px" width=250px;>
						            	 	<div id="productName">${product.product_name}</div>
					            	 	</a>
		            				   </c:if>
		            			</c:forEach>
		            	 	   </div>
		            		</div>
						</c:when>    
						<c:otherwise>
							<div>
							<br>
								연관상품이 없습니다.
							</div>
						</c:otherwise>        		
            		</c:choose>
            	</div>
            </div>
            <div class="product-details-info">
                <div class="single-block" id="single_block">
                	<div></div>
                    <div class="row">
				        <div id="productNameContent">
						    <div class="info-body custom-responsive-margin">
						        <b><span style="font-size: 20px; padding-top: 30px;">상품정보</span></b><hr>
						        <p style="font-size: 15px; white-space: pre-line;">${Product.product_txt }</p>
						    </div>
						</div>
                        <div class="col-lg-6 col-12" style="width: 350px;">
                            <div class="info-body" id="info_body">
                                <b><span style="font-size: 20px; padding-top: 30px;">판매자정보</span></b>
                                <hr>
                                <div>
                                	<a href="SellerInfo?member_id=${SellerInfo.member_id }"  id="profileImage">
                              	 	<c:if test="${SellerInfo.member_profile eq '' or SellerInfo.member_profile eq 'null'}">
                                		<img src="${pageContext.request.contextPath}/resources/images/products/평범한인간.svg" class="img" alt="#">
                                	</c:if>
                                		<img src="${pageContext.request.contextPath}/resources/upload/${SellerInfo.member_profile}" class="img" alt="#">
                                	</a>
                                	<div id="nickname">
                                		<a href="SellerInfo?member_id=${SellerInfo.member_id }" id="nicknameA">${SellerInfo.member_nickname }</a>
                                	</div>
                                </div>
                                <div id="myProductDiv">
                                	<div id="myProducts">
                                		<a href="SellerInfo?member_id=${SellerInfo.member_id }" id="aTag">
                                			<span style="font-size: 17px;">상품 ${SellerProductCount}</span>
                                		</a>
                                		<span id="after"></span>
                                	</div>
                                	<div id="reviews">
                                		<a href="SellerInfo?member_id=${SellerInfo.member_id }" id="aTag">
                                			<span style="font-size: 17px;">후기 ${SellerReview }</span>
                                		</a>
                                	</div>
                                </div>
                                <c:choose>
									<c:when test="${not empty SellerProductInfo}">
		                                <div style="height: 150px">
		                                	<div id="myProductImage">
		                                		<c:forEach var="SellerProductInfo" items="${SellerProductInfo }" begin="0" end="2" >
			                                	<a href="ProductDetail?product_id=${SellerProductInfo.product_id}" style="height: 150px;">
			                                		<img src="${pageContext.request.contextPath}/resources/upload/${SellerProductInfo.product_image1 }" class="img" alt="#" height="150px" width="150px">
			                                		<div id="imgPrice">
			                                			<span><fmt:formatNumber value="${SellerProductInfo.product_price }" pattern="###,###"/></span>원
			                                		</div>
			                                	</a>
		                                		</c:forEach>
		                                	</div>
		                                </div>
									</c:when>								                                
                                </c:choose>
                                <div style="text-align: center; margin-top: 20px;">
                                	<a href="SellerInfo?member_id=${SellerInfo.member_id }" id="productPlus">
                                		<span id="productCount">${SellerProductCount }개</span>
	                                	<span style="color: black;">상품 더보기 ></span>
                                	</a>
                                </div> 
                                	<span>
                                		Lv. ${levelExp.member_level }
                               		</span>
									<div class="progress" style="width: 250px;">
										<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
			        		    </div>
                                <hr>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
<!--          </form> -->
   </section>
<!--   </form> -->
    <!-- End Item Details -->
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