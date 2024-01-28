<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%-- 신고 안되면 다시살려야됨 --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
$(function() {
	//좋아요 버튼 클릭 이벤트
	$(".heart").on("click", function () {
	    $(this).toggleClass("is-active");
	});
	
});

	<%-- 필터링 옵션 처리를 위한 변수 정의 --%>
	let category = "${param.category}";
	let keyword = "${param.keyword}";
	
	
	
	
	
function filtering() {
	var price = $("input[name='priceRadio']:checked").val();
	
	alert(price);
// 	$.ajax({
// 		url: "SearchProduct",
// 		data: {
// 			keyword:keyword,
// 			product_category:category,
// 			product_price: price
			
			
			
			
// 		},
// 		success: function() {
			
// 		},
// 		error: function() {
// 			alert("실패");
// 		}
		
// 	});
	
}

</script>
<body>
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
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="index.html">Shop</a></li>
                        <li>Shop List</li>
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
	                        		<a href="javascript:void(0)" style="text-decoration: underline; color: grey;">초기화</a>
	                        	</span>
                        	</div>
                            <div style="margin-bottom: 20px;"></div>
		                    <h3>가격</h3>
		                    <!-- Start Single Widget -->
		                    <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="" id="priceCheck" onclick="filtering()">
                                <label class="form-check-label" for="priceCheck" >
                                    전체
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="0~100000" id="priceCheck" onclick="filtering()">
                                <label class="form-check-label" for="priceCheck" >
                                    10만원 이하
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="100000~300000" id="priceCheck" >
                                <label class="form-check-label" for="priceCheck">
                                   	10만원 이상 - 30만원 이하
                                </label>
                            </div>
                            <div class="form-check"> 
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="300000~500000"  id="priceCheck" >
                                <label class="form-check-label" for="priceCheck">
                                    30만원 이상 - 50만원 이하 
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input clickfunc" type="radio" name="priceRadio" value="500000" id="priceCheck" >
                                <label class="form-check-label" for="priceCheck">
                                    50만원 이상
                                </label>
                            </div>
                            
                            <div style="margin-bottom: 20px;"></div>
                            <h3>상품 상태</h3>
                            <div class="form-check" >
                                <input class="form-check-input clickfunc" type="checkbox" value="" id="flexCheckDefault11" >
                                <label class="form-check-label" for="flexCheckDefault11">
                                    보통
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault22">
                                <label class="form-check-label" for="flexCheckDefault22">
                                    좋은 상태
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault33">
                                <label class="form-check-label" for="flexCheckDefault33">
                                    새상품
                                </label>
                            </div>
                            
                            <div style="margin-bottom: 20px;"></div>
		                    <h3>결과내 검색</h3>
		                    <form action="#">
			               		<p>포함할 단어</p>
		               			<input type="text" placeholder="포함할 단어를 입력해주세요" size="23">
			                    <p>제외할 단어</p>
			                    <input type="text" placeholder="제외할 단어를 입력해주세요" size="23">
			                    <div class="resultSearch">
				                   	<button class="reset-btn" style="margin-left: 10%;">초기화</button>
				                   	<button type="submit" class="resultSearch-btn" style="margin-left: 10%;">적용하기</button>
			                    </div>
		                    </form>
		                    <div style="margin-bottom: 20px;"></div>
		                    
		                    <h3>카테고리</h3>
                            <ul class="list">
                                <li>
                                    <a href="product-grids.html">상의 </a>
                                </li>
                                <li>
                                    <a href="product-grids.html">하의</a>
                                </li>
                                <li>
                                    <a href="product-grids.html">아우터</a>
                                </li>
                                <li>
                                    <a href="product-grids.html">아동복</a>
                                </li>
                                <li>
                                    <a href="product-grids.html">셋업/세트</a>
                                </li>
                                <li>
                                    <a href="product-grids.html">패션/잡화</a>
                                </li>
                                <li>
                                    <a href="product-grids.html">신발</a>
                                </li>
                                <li>
                                    <a href="product-grids.html">기타</a>
                                </li>
                            </ul>
                        <%-- 3. 신고하기 기능 버튼 --%>
                        <button type="button" class="btn btn-primary" id="testBtn" value="테스트중입니다">
								테스트버튼
						</button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" 
                        		data-bs-target="#reportModal" id="reportBtn">
								게시글 신고하기
						</button>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
                        		data-bs-target="#memberModal" id="reportBtn">
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
                                        	<a href="javascript:void(0)" >추천순</a><span style="padding-left: 2px; padding-right: 2px;"> | </span>  
                                        	<a href="javascript:void(0)">최신순</a><span style="padding-left: 2px; padding-right: 2px;"> | </span> 
                                        	<a href="javascript:void(0)">낮은 가격순</a><span style="padding-left: 2px; padding-right: 2px;"> | </span> 
                                        	<a href="javascript:void(0)">높은 가격순</a>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                                aria-labelledby="nav-grid-tab">
                                <div class="row">
                                	<!-- 한개의 상품 목록 -->
                                    <div class="col-lg-4-1 col-md-6 col-12" >
                                        <!-- Start Single Product -->
                                        <div class="single-product" >
                                        	<a href="ProductDetail" class="product-image">
                                              	 <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="#">
                                            </a>
                                            <div class="product-info">
                                                    <h6>블루투스 스피커</h6>
                                                    <!-- 좋아요 -->
													<div class="heart position-absolute bottom-0 start-0"></div>
                                                <ul class="review">
                                                    <li><span>전포동</span></li>
                                                    <li><span>|</span></li>
                                                    <li><span>5분전</span></li>
                                                </ul>
                                                <div class="price">
                                                    <span>14,000원</span>
                                                </div>
                                                <div>
                                                	
                                                	<span>Pay</span> 
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <!-- Pagination -->
                                        <div class="pagination left">
                                            <ul class="pagination-list">
                                                <li><a href="javascript:void(0)">1</a></li>
                                                <li class="active"><a href="javascript:void(0)">2</a></li>
                                                <li><a href="javascript:void(0)">3</a></li>
                                                <li><a href="javascript:void(0)">4</a></li>
                                                <li><a href="javascript:void(0)"><i
                                                            class="lni lni-chevron-right"></i></a></li>
                                            </ul>
                                        </div>
                                        <!--/ End Pagination -->
                                    </div>
                                </div>
                            </div>
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