<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />  
	
<title>Sosimin</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	
	<%-- sweetalert --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>

<style>
#ok{
	height: 200px;
	width: 200px;
}

.tradeStatus {
	color: red;
}

.txtChange {
	white-space: nowrap; 
	overflow: hidden;
	text-overflow: ellipsis;
}

/* 거래완료인 상품 opacity */
/* 부모요소 opacity 적용되어있음 */
#singleProductAreaDealComplete {
	border: none;
	width: 200px;
	height: 200px;
	display: inline-block;
	margin-right: 2px !important;
	margin-top: 0px;
	box-sizing: content-box !important;
	padding: 0 !important;
	position: relative;
/* 	background-color: rgba(0, 0, 0, 0.5); */
/* 	opacity: 0.4; */
}

/* 가상영역 opacity 처리 */
#singleProductAreaDealComplete::before {
	border: none;
	width: 200px;
	height: 200px;
	display: inline-block;
	margin-right: 2px !important;
	margin-top: 0px;
	box-sizing: content-box !important;
	padding: 0 !important;
	position: absolute;
    top: 0px;
    left: 0px;
    right: 0px;
    bottom: 0px;
	opacity: 0.7;
    content: " " ;
	transform: scale(1.0);
	background-color: white;
	z-index: 999;
}




/* 자식 요소 - 부모 요소의 opacity를 무시해야함 */
#dealComplete {
	position: absolute;
	z-index: 1000;
	width: 130px;
	height: 130px;
	left:60px;
	top:50px;
/*     display: none; */
}

#dealComplete b {
	color: #27B24A;
}

#dealComplete img {
	display: inline-block;
	width: 80px !important;
	height: 80px !important;
}

</style>
<script type="text/javascript">
$(function() {
	<%-- 필터링을 위한 변수 초기화 --%>
	let id = "${sessionScope.sId}"; 
	let pageNum = "";
	let price = "";
	let status ="";
	let word = "";
	let sort = "";
	let trade = "";
	
	<%-- 필터링을 위한 변수 초기화 --%>
	let keyword = "${param.keyword}";
	let category = "${param.product_category}";
	
	if("${param.pageNum}" > 1) {
		pageNum = "${param.pageNum}";
	} else {
		pageNum = $("#pageNum").val();
	}
	
	<%-- 기본 상품 목록 최신순으로 출력 --%> 
	$.ajax({
		url: "StoreProductList",
		data: {
			pageNum: pageNum,
			keyword: keyword,
			category: category,
			price: price,
			status: status,
			word:word,
			trade: 0
		},
		dataType: 'json',
		success: function(data) {
		    let productList = data[0];
		    let pageInfo = data[1];
		    let pageNum = data[2];
			let singleProduct = '';
		    
			for(let i = 0; i < productList.length; i++) {
				singleProduct +='<div class="col-lg-4-1 col-md-6 col-12" >'
						+ ' <div class="single-product" >'
						
						if(productList[i].trade_status == 0) {
						    singleProduct += ' <a href="ProductDetail?product_id='+ productList[i].product_id + '" class="product-image">'
						        + ' <img src="${pageContext.request.contextPath}/resources/upload/' + productList[i].product_image1 + '" alt="#" id="ok">'
						    + ' </a>'
						} else if(productList[i].trade_status == 2) {
						    singleProduct += '<div class="single-block" id="singleProductAreaDealComplete">'
						        + ' <a href="ProductDetail?product_id='+ productList[i].product_id + '" class="product-image">'
						        + '     <img src="${pageContext.request.contextPath}/resources/upload/' + productList[i].product_image1 + '" alt="#" id="ok">'
						        + ' </a>'
						        + '<span id="dealComplete">'
						        + '     <img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>'
						        + '     <b>판매 완료</b>'
						        + '</span>'
						        + '</div>'
						}
 							
							singleProduct += ' <div class="product-info heartPosition">'
								+ '<h6 class="txtChange">' + productList[i].product_name + '</h6>'
								+ ' <div class="heart" id="heartLike'+i+'" onclick="heartLike('+ i + ','+ productList[i].product_id +' )"></div>'
								+ ' <ul class="review">'
									+ ' <li><span>' +  productList[i].dong + '</span></li>'
									+ ' <li><span>|</span></li>'
									+ ' <li><span>' + productList[i].product_datetime + '</span></li>'
								+ ' </ul>'
								+ ' <div class="price">'
									+ ' <span>' + productList[i].product_price.toLocaleString() + '원</span>'
								+ ' </div>'
								+ ' <div>'
									+ '<img src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png"'
	                            	+ 'style="height: 20px;" id="payImage">' 
								+ ' </div>'
							+ ' </div>'
						+ ' </div>'
				+ ' </div>'
			}
			
			$(".productList").append(singleProduct);
			
			let url = "";
		    if(keyword != "") url += '&keyword=' + keyword;
		    if(category != "") url += '&product_category=' + category;
			if(price != "") url += '&price=' + price;
			if(status != "") url += '&status=' + status;
			if(word != "") url += '&word=' + word;
			if(sort != "") url += '&sort=' + sort;
			if(trade != "") url += '&trade=' + trade;
			
// 		    alert("현재 주소는 : " + url );
			
			let pages = '';
			pages += '<nav aria-label="Page navigation">'
			    + '<ul class="pagination justify-content-center">'
			    + '<li class="page-item" id="prevPage">'
			   		 + '<a href="SearchProduct?pageNum=' + (pageNum - 1) + url + '" class="page-link">&laquo;</a>'
			    + '</li>';
			   
	        for (let i = pageInfo.startPage; i < pageInfo.endPage+1; i++) {
	            if (pageNum == i) {
	                pages += '<li class="page-item active"><span class="page-link">' + i + '</span></li>';
	            } else {
	                pages += '<li class="page-item">'
	                    + '<a href="SearchProduct?pageNum=' + i + url + '" class="page-link">' + i + '</a>'
	                    + '</li>';
	            }
	        }
	        
		    pages += '<li class="page-item" id="nextPage">'
			    + '<a href="SearchProduct?pageNum=' + (pageNum + 1) + url + '" class="page-link">&raquo;</a>'
			    + '</li>'
			    + '</ul>'
			    + '</nav>';
			
			<%-- 페이징 처리 --%>
			$(".pageing").append(pages);	
			
			<%-- pageNum 버튼 최소 최대 제한--%> 
			if(pageNum <= 1) {
				$("#prevPage").addClass("disabled");
			}
			if(pageNum >= pageInfo.maxPage) {
				$("#nextPage").addClass("disabled");
			}
			
			<%-- 관심 목록 불러오기 --%> 
			if(id == "") {
			    alert("아이디가 없습니다");
			} else {
			    alert("아이디는" + id);
			    $.ajax({
			        url: 'ProductLikeList',
			        dataType: 'json',
			        success: function(data) {
			            alert("리스트 목록 : " + productList.length);
			            for(let i = 0; i < productList.length; i++) {
			                for(let LikeList of data) {
			                    if(productList[i].product_id === LikeList.product_id) {
			                        $("#heartLike"+i).addClass("is-active");
			                    }
			                }
			            }
			        },
					error: function() {
						const Toast = Swal.mixin({
						    toast: true,
						    position: 'center-center',
						    showConfirmButton: false,
						    timer: 1000,
						    timerProgressBar: false,
						})
						Toast.fire({
						    icon: 'error',
						    title: '관심목록 불러오기 실패했습니다'
						})					
					}
				}); <%--관심목록 ajax 끝--%>
				
			} <%-- 아이디 판별 --%>
			
		},
		error: function() {
			const Toast = Swal.mixin({
			    toast: true,
			    position: 'center-center',
			    showConfirmButton: false,
			    timer: 2000,
			    timerProgressBar: false,
			})
			Toast.fire({
			    icon: 'error',
			    title: '다시 시도해 주세요!'
			})		
		}
	}); <%-- 상품목록 조회 ajax 끝 --%>
	
	
}); // ready 끝

<%-- 좋아요 등록 --%>
function heartLike(heart, product_id) {
	$("#heartLike"+heart).addClass("is-active");
    $.ajax({
    	url:"ProductLikeRegist",
    	data: {
    		product_id: product_id
    	},
    	success: function(result) {
    		<%-- 찜을 등록하는 경우 --%>
    		if(result.isChecked == 'false') { 
				$("#heartLike"+heart).addClass("is-active");
				
			<%-- 찜을 삭제하는 경우 --%>
			} else if(result.isChecked == 'true') { 
				$("#heartLike"+heart).removeClass("is-active");
			}
		},
		error: function() {
			
		}
    }); // ajax 끝
}

<%-- 카테고리 선택 시 이동--%>
$(function() {
	let word = "";
	$("#submenu-1-3>li").on("click", function() {
		let length =  $("#submenu-1-3>li").length;
		let	category = $(this).text();
		
		location.href="SearchProduct?product_category=" + category;
	});
		
});
</script>

<script type="text/javascript">
// 필터링 옵션 처리 후 ajax
function wordDis() {
	let	word = $("#wordExclude").val();
	<%-- 미포함 단어 없을경우 모달 출력 --%>
	if(word != "") {
	} else {
		const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 2000,
		    timerProgressBar: false,
		})
		Toast.fire({
		    icon: 'error',
		    title: '제외할 단어를 입력해주세요!'
		})
		return false;
	}
}

function wordDel() {
	$("#wordExclude").val("");
}
	
function wordPress(event) {
    alert("제외할 모달");
    let key = event.key;
    let word = $("#wordExclude").val();
    alert("제외할 단어11 :" +  word);
        
	if (key === 'Enter') { 
    alert("제외할 단어22 :" +  word);
		<%-- 미포함 단어 없을경우 모달 출력 --%>
		if(word != "") {
		} else {
			const Toast = Swal.mixin({
			    toast: true,
			    position: 'center-center',
			    showConfirmButton: false,
			    timer: 2000,
			    timerProgressBar: false,
			})
			Toast.fire({
			    icon: 'error',
			    title: '제외할 단어를 입력해주세요!'
			})
			return false;
		}
	}
}

function filtering(data) {
	<%-- 필터링 옵션 처리를 위한 변수 정의 --%>
	let id = "${sessionScope.sId}";
	let pageNum = 1;
	let category = "${param.keyword}";
	let keyword = "${param.keyword}";
	let price = "";
	let	word = "";
	let trade = 0;
	
	if(!($("#tradeCheck").prop("checked"))) {
		trade = 2;	
	}
	
	alert("트레이드 값 : " + trade);
	<%-- 정렬 방식 설정--%>
	let sort = 1;
	if(data > 1) {
		sort = data; 
	} else {
		sort = 1;
	}
	
	<%-- 가격 필터 선택 시 값 설정 --%>
	price = $("input[name='priceRadio']:checked").val() || "";
	
	<%-- 상품 상태 버튼 선택시 내용 저장 --%> 
	let status = "";  
    $("input[name=productStatus]:checked").each(function(index) {  
    	status += $(this).val() + ",";  
    });  
    status = status.slice(0, -1);
    
    <%-- 제외된 단어 입력 시 저장될 단어 --%>
    if($("#wordExclude").val() != "") {
		word = $("#wordExclude").val();
	}
    
    <%-- 초기화 버튼 --%>
	if(data == 0) {
		location.href="SearchProduct";
	}
    
    <%-- 페이징 넘버 변수 지정 --%>
    if("${param.pageNum}" > 1) {
		pageNum = "${param.pageNum}";
	} else {
		pageNum = $("#pageNum").val();
	}
    
	<%-- 상품 필터링을 위한 ajax --%>    
		$.ajax({
			url: "StoreProductList",
			data: {
				pageNum: pageNum,
				keyword: keyword,
				category: category,
				price: price,
				status: status,
				word: word,
				sort: sort,
				trade: trade
			},
			dataType: 'json',
			success: function(data) {
				let productList = data[0];
			    let pageInfo = data[1];
			    let pageNum = data[2];
			    $(".productList").empty();
			    $(".pageing").empty();
			    let singleProduct = '';
			    
				for(let i = 0; i < productList.length; i++) {
					singleProduct +='<div class="col-lg-4-1 col-md-6 col-12" >'
							+ ' <div class="single-product" >'
							
							if(productList[i].trade_status == 0) {
							    singleProduct += ' <a href="ProductDetail?product_id='+ productList[i].product_id + '" class="product-image">'
							        + ' <img src="${pageContext.request.contextPath}/resources/upload/' + productList[i].product_image1 + '" alt="#" id="ok">'
							    + ' </a>'
							} else if(productList[i].trade_status == 2) {
							    singleProduct 
							        += ' <a href="ProductDetail?product_id='+ productList[i].product_id + '" class="product-image">'
							        + '<div class="single-block" id="singleProductAreaDealComplete">'
							        + '     <img src="${pageContext.request.contextPath}/resources/upload/' + productList[i].product_image1 + '" alt="#" id="ok">'
							        
							        + '<span id="dealComplete">'
							        + '     <img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>'
							        + '     <b>판매 완료</b>'
							        + '</span>'
							        + '</div>'
							        + ' </a>'
							}
	 							
								singleProduct += ' <div class="product-info heartPosition">'
									+ '<h6 class="txtChange">' + productList[i].product_name + '</h6>'
									+ ' <div class="heart" id="heartLike'+i+'" onclick="heartLike('+ i + ')"></div>'
									+ ' <ul class="review">'
										+ ' <li><span>' +  productList[i].dong + '</span></li>'
										+ ' <li><span>|</span></li>'
										+ ' <li><span>' + productList[i].product_datetime + '</span></li>'
									+ ' </ul>'
									+ ' <div class="price">'
										+ ' <span>' + productList[i].product_price.toLocaleString() + '원</span>'
									+ ' </div>'
									+ ' <div>'
										+ '<img src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png"'
		                            	+ 'style="height: 20px;" id="payImage">' 
									+ ' </div>'
								+ ' </div>'
							+ ' </div>'
					+ ' </div>'
				}
				
				$(".productList").append(singleProduct);
				
			    let url = "";
			    if(keyword != "") url += '&keyword=' + keyword;
			    if(category != "") url += '&product_category=' + category;
				if(trade != "") url += '&trade=' + trade;
				if(price != "") url += '&price=' + price;
				if(status != "") url += '&status=' + status;
				if(word != "") url += '&word=' + word;
				if(sort != "") url += '&sort=' + sort;
			    
				alert("현제 url은" + url);
				
			    let pages = '';
				pages += '<nav aria-label="Page navigation">'
				    + '<ul class="pagination justify-content-center">'
				    + '<li class="page-item" id="prevPage">'
				   		 + '<a href="SearchProduct?pageNum=' + (pageNum - 1) + url + '" class="page-link">&laquo;</a>'
				    + '</li>';
				   
		        for (let i = pageInfo.startPage; i < pageInfo.endPage+1; i++) {
		            if (pageNum == i) {
		                pages += '<li class="page-item active"><span class="page-link">' + i + '</span></li>';
		            } else {
		                pages += '<li class="page-item">'
		                    + '<a href="SearchProduct?pageNum=' + i + url +  '" class="page-link">' + i + '</a>'
		                    + '</li>';
		            }
		        }
		        
			    pages += '<li class="page-item" id="nextPage">'
				    + '<a href="SearchProduct?pageNum=' + (pageNum + 1) + url + '" class="page-link">&raquo;</a>'
				    + '</li>'
				    + '</ul>'
				    + '</nav>';
				
				<%-- 페이징 처리 --%>
			$(".pageing").append(pages);	
			
			<%-- pageNum 버튼 최소 최대 제한--%> 
			if(pageNum <= 1) {
				$("#prevPage").addClass("disabled");
			}
			if(pageNum >= pageInfo.maxPage) {
				$("#nextPage").addClass("disabled");
			}
			
			<%-- 관심 목록 불러오기 --%> 
			if(id == "") {
			    alert("아이디가 없습니다");
			} else {
			    alert("아이디는" + id);
			    $.ajax({
			        url: 'ProductLikeList',
			        dataType: 'json',
			        success: function(data) {
			            alert("리스트 목록 : " + productList.length);
			            for(let i = 0; i < productList.length; i++) {
			                for(let LikeList of data) {
			                    if(productList[i].product_id === LikeList.product_id) {
			                        $("#heartLike"+i).addClass("is-active");
			                    }
			                }
			            }
			        },
					error: function() {
						const Toast = Swal.mixin({
						    toast: true,
						    position: 'center-center',
						    showConfirmButton: false,
						    timer: 1000,
						    timerProgressBar: false,
						})
						Toast.fire({
						    icon: 'error',
						    title: '관심목록 불러오기 실패했습니다'
						})					
					}
				}); <%--관심목록 ajax 끝--%>
			}
		},
		error: function() {
			alert("실패");
		}
		
	}); // ajax 끝
}

</script>
<body>
	<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1 로 저장) --%>
	<input type="hidden" id="pageNum" value="1">
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<%-- 1. 신고하기 기능 --%>
	<jsp:include page="../report/report.jsp"></jsp:include>
	<!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">상품 목록</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="index.html">상품</a></li>
                        <li>상품목록</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	
	<!-- Start Product Grids -->
    <section class="product-grids section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-12">
                <%-- 필터링 옵션 사이드바 --%>
                    <!-- Start Product Sidebar -->
                    <div class="product-sidebar">
                        <!-- Start Single Widget -->
                        
                        <div class="single-widget">
                        	<div class="filter">
		                        <span class="filter_title">필터</span>
	                        	<span class="filter_reset">
	                        		<a href="javascript:void(0)" onclick="filtering(0)" style="text-decoration: underline; color: grey;">초기화</a>
	                        	</span>
                        	</div>
                        	<div><input type="checkbox" class="form-check-input productCheckbox" id="tradeCheck" checked onclick="filtering()">&nbsp; <b class="tradeStatus">거래 가능한 상품만 보기</b></b></div>
                            <div style="margin-bottom: 20px;"></div>
		                    <h3>가격</h3>
		                    <!-- Start Single Widget -->
		                    <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="" id="priceCheck1" onclick="filtering()">
                                <label class="form-check-label" for="priceCheck1" >
                                    전체
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="0~100000" id="priceCheck2" onclick="filtering()">
                                <label class="form-check-label" for="priceCheck2" >
                                    10만원 이하
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="100000~300000" id="priceCheck3" onclick="filtering()">
                                <label class="form-check-label" for="priceCheck3">
                                   	10만원 이상 - 30만원 이하
                                </label>
                            </div>
                            <div class="form-check"> 
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="300000~500000"  id="priceCheck4" onclick="filtering()">
                                <label class="form-check-label" for="priceCheck4">
                                    30만원 이상 - 50만원 이하 
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="500000" id="priceCheck5" onclick="filtering()">
                                <label class="form-check-label" for="priceCheck5">
                                    50만원 이상
                                </label>
                            </div>
                            
                            <div style="margin-bottom: 20px;"></div>
                            <h3>상품 상태</h3>
                            <div class="form-check" >
                                <input class="form-check-input productCheckbox" type="checkbox" name="productStatus" value="0" id="flexCheckDefault1" onclick="filtering()">
                                <label class="form-check-label" for="flexCheckDefault1">
                                    보통
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input productCheckbox" type="checkbox" name="productStatus" value="1"  id="flexCheckDefault2" onclick="filtering()">
                                <label class="form-check-label" for="flexCheckDefault2">
                                    좋은 상태
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input productCheckbox" type="checkbox" name="productStatus" value="2" id="flexCheckDefault3" onclick="filtering()">
                                <label class="form-check-label" for="flexCheckDefault3">
                                    새상품
                                </label>
                            </div>
                            
                            <div style="margin-bottom: 20px;"></div>
		                    <h3>결과내 검색</h3>
		                    <form action="javascript:filtering()">
			                    <p>제외할 단어</p>
			                    <input type="text" placeholder="제외 단어 입력" size="20" id="wordExclude" onkeypress="wordPress()">
			                    <div class="resultSearch">
				                   	<button class="reset-btn" style="margin-left: 10%;"onclick="wordDel()">초기화</button>
				                   	<button type="submit" class="resultSearch-btn" style="margin-left: 10%;" onclick="wordDis()" >적용하기</button>
			                    </div>
		                    </form>
		                    <div style="margin-bottom: 20px;"></div>
			                    <h3>카테고리</h3>
	                            <ul class="list" id="submenu-1-3">
	                                <li><a href="javascript:void(0)" class="selcategory">상의</a></li>
	                                <li><a href="javascript:void(0)" class="selcategory">하의</a></li>
	                                <li><a href="javascript:void(0)" class="selcategory">아우터</a></li>
	                                <li><a href="javascript:void(0)"  class="selcategory">아동복</a></li>
	                                <li><a href="javascript:void(0)" class="selcategory">셋업/세트</a></li>
	                                <li><a href="javascript:void(0)" class="selcategory">패션/잡화</a></li>
	                                <li><a href="javascript:void(0)" class="selcategory">신발</a></li>
	                                <li><a href="javascript:void(0)" class="selcategory">기타</a></li>
	                            </ul>
                        <%-- 3. 신고하기 기능 버튼 --%>
                        <div class="product-info heartPosition">
                        	<div class="heart" id="heartLike"></div>
                        </div>
                        <button type="button" class="btn btn-primary" id="testBtn" value="테스트중입니다">
								테스트버튼
						</button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" 
                        		data-bs-target="#reportModal" >
								신고하기
						</button>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
                        		data-bs-target="#memberModal">
								회원 신고하기
						</button>
						
                        </div>
                   </div>
               </div>
                <script type="text/javascript">
                	
                
                
                </script>
                <!-- 상품 목록 -->
                <div class="col-lg-9 col-12">
                	<!-- 상품 검색 조건 -->
                    <div class="product-grids-head">
                        <div class="product-grid-topbar">
                            <div class="row align-items-center">
                                <div class="col-lg-7 col-md-8 col-12">
                                    <div class="product-sorting">
                                        <label for="sorting"></label>
                                        <h3 class="total-show-product" style="font-size: 20px; font-weight: 600; color: black;">검색결과</h3>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-4 col-12">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        	<a href="javascript:filtering(1)">최신순</a><span style="padding-left: 2px; padding-right: 2px;"> | </span>  
                                        	<a href="javascript:filtering(2)">인기순</a><span style="padding-left: 2px; padding-right: 2px;"> | </span> 
                                        	<a href="javascript:filtering(3)">낮은 가격순</a><span style="padding-left: 2px; padding-right: 2px;"> | </span> 
                                        	<a href="javascript:filtering(4)">높은 가격순</a>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                                aria-labelledby="nav-grid-tab">
                                <div class="row productList ">
                                	<!-- 한개의 상품 목록 -->
<!--                                     <div class="col-lg-4-1 col-md-6 col-12" > -->
<!--                                         Start Single Product -->
<!--                                         <div class="single-product" > -->
<!--                                         	<a href="ProductDetail" class="product-image"> -->
<%--                                               	 <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="#"> --%>
<!--                                             </a> -->
<!--                                             <div class="product-info"> -->
<!--                                                     <h6>블루투스 스피커</h6> -->
<!--                                                     좋아요 -->
<!-- 													<div class="heart position-absolute bottom-0 start-0"></div> -->
<!--                                                 <ul class="review"> -->
<!--                                                     <li><span>전포동</span></li> -->
<!--                                                     <li><span>|</span></li> -->
<!--                                                     <li><span>5분전</span></li> -->
<!--                                                 </ul> -->
<!--                                                 <div class="price"> -->
<!--                                                     <span>14,000원</span> -->
<!--                                                 </div> -->
<!--                                                 <div> -->
                                                	
<!--                                                 	<span>Pay</span>  -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                        <!-- End Single Product -->
                                    </div>
                                    <div class="pageing"> 
                                    
                                    </div>
                                </div>
<!--                                 <div class="row"> -->
<!--                                     <div class="col-12"> -->
<!--                                         Pagination -->
<!--                                         <div class="pagination left"> -->
<!--                                             <ul class="pagination-list"> -->
<!--                                                 <li><a href="javascript:void(0)">1</a></li> -->
<!--                                                 <li class="active"><a href="javascript:void(0)">2</a></li> -->
<!--                                                 <li><a href="javascript:void(0)">3</a></li> -->
<!--                                                 <li><a href="javascript:void(0)">4</a></li> -->
<!--                                                 <li><a href="javascript:void(0)"><i -->
<!--                                                             class="lni lni-chevron-right"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         / End Pagination -->
<!--                                     </div> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- End Product Grids -->
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