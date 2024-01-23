<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product.css" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	
	
	function prductLike() {
		
		$.ajax({
			type: "POST",
			url: "",
			data: {
				
			},
			dataType: "json",
			success: function(result) {
				
				
				
				
			},
			error: function() {
				
			}
		}); // ajax 끝
	}

</script>
<body>
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	<!-- Start Product Grids -->
    <section class="product-grids section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-12">
                    <!-- Start Product Sidebar -->
                    <div class="product-sidebar">
                        <!-- Start Single Widget -->
                        <div class="single-widget">
                            <h3>카테고리</h3>
                            <ul class="list">
                                <li>
                                    <a href="product-grids.html">상의 </a><span>(1138)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">하의</a><span>(2356)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">아우터</a><span>(420)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">아동복</a><span>(874)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">셋업/세트</a><span>(1239)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">패션/잡화</a><span>(340)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">신발</a><span>(512)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">기타</a><span>(512)</span>
                                </li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <div class="single-widget condition">
                            <h3>가격필터</h3>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">
                                <label class="form-check-label" for="flexCheckDefault1">
                                    $50 - $100L (208)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
                                <label class="form-check-label" for="flexCheckDefault2">
                                    $100L - $500 (311)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3">
                                <label class="form-check-label" for="flexCheckDefault3">
                                    $500 - $1,000 (485)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault4">
                                <label class="form-check-label" for="flexCheckDefault4">
                                    $1,000 - $5,000 (213)
                                </label>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <div class="single-widget condition">
                            <h3>상품 상태</h3>
                            <div class="form-check" >
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault11">
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
                        </div>
                        <!-- End Single Widget -->
	                    <!-- End Product Sidebar -->
	                    <div class="single-widget">
		                    <h3>결과내 검색</h3>
		                    <form action="#">
			               		<p>포함할 단어</p>
		               			<input type="text" placeholder="포함할 단어를 입력해주세요">
			                    <p>제외할 단어</p>
			                    <input type="text" placeholder="제외할 단어를 입력해주세요">
			                    <div class="resultSearch">
				                   	<button class="reset-btn" style="margin-left: 10%;">초기화</button>
				                   	<button type="submit" class="resultSearch-btn" style="margin-left: 10%;">적용하기</button>
			                    </div>
		                    </form>
	                	<!-- End Single Widget -->
	                    </div>
                   </div>
               </div>
                
                <!-- 상품 목록 -->
                <div class="col-lg-9 col-12">
                	<!-- 상품 검색 조건 -->
                    <div class="product-grids-head">
                        <div class="product-grid-topbar">
                            <div class="row align-items-center">
                                <div class="col-lg-7 col-md-8 col-12">
                                    <div class="product-sorting">
                                        <label for="sorting">검색결과</label>
                                        <h3 class="total-show-product"> </h3>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-4 col-12">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        	<a href="javascript:void(0)">추천순</a> | 
                                        	<a href="javascript:void(0)">최신순</a> | 
                                        	<a href="javascript:void(0)">낮은 가격순</a> | 
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
                                    <a href="#" class="col-lg-4-1 col-md-6 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                        	<div class="porduct_like">
                                        		<input class="product_like_img" type="image" src="${pageContext.request.contextPath}/resources/images/products/indexheart.png"
                                            		onclick="prductLike()">
                                            </div>
                                            <div class="product-image">
                                                <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="#">
                                            	
                                            </div>
                                            <div class="product-info">
                                                    <h6>블루투스 스피커</h6>
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
                                    </a>
                                    <a href="#" class="col-lg-4-1 col-md-6 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="porduct_like">
                                        		<input class="product_like_img" type="image" src="${pageContext.request.contextPath}/resources/images/products/indexheart.png"
                                            		onclick="prductLike()">
                                            </div>
                                            <div class="product-image">
                                                <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="#">
                                            </div>
                                            <div class="product-info">
                                                <span class="category">Speaker</span>
                                                    <h6>Bluetooth Speaker</h6>
                                                <div class="price">
                                                    <span>$275.00</span> 
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                    </a>
                                   
                                    <a href="#" class="col-lg-4-1 col-md-6 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="porduct_like">
                                        		<input class="product_like_img" type="image" src="${pageContext.request.contextPath}/resources/images/products/indexheart.png"
                                            		onclick="alert('찜하기')">
                                            </div>
                                            <div class="product-image">
                                                <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="#">
                                            </div>
                                            <div class="product-info">
                                                <span class="category">Speaker</span>
                                                    <h6>Bluetooth Speaker</h6>
                                                <div class="price">
                                                    <span>$275.00</span> 
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                    </a>
                                    <a href="#" class="col-lg-4-1 col-md-6 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="porduct_like">
                                        		<input class="product_like_img" type="image" src="${pageContext.request.contextPath}/resources/images/products/indexheart.png"
                                            		onclick="alert('찜하기')">
                                            </div>
                                            <div class="product-image">
                                                <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="#">
                                            </div>
                                            <div class="product-info">
                                                <span class="category">Speaker</span>
                                                    <h6>Bluetooth Speaker</h6>
                                                <div class="price">
                                                    <span>$275.00</span> 
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                    </a>
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
                            
                            
                            <div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="row align-items-center">
                                                <div class="col-lg-4 col-md-4 col-12">
                                                    <div class="product-image">
                                                        <img src="assets/images/products/product-1.jpg" alt="#">
                                                        <div class="button">
                                                            <a href="product-details.html" class="btn"><i
                                                                    class="lni lni-cart"></i> Add to
                                                                Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-12">
                                                    <div class="product-info">
                                                        <span class="category">Watches</span>
                                                        <h4 class="title">
                                                            <a href="product-grids.html">Xiaomi Mi Band 5</a>
                                                        </h4>
                                                        <ul class="review">
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star"></i></li>
                                                            <li><span>4.0 Review(s)</span></li>
                                                        </ul>
                                                        <div class="price">
                                                            <span>$199.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="row align-items-center">
                                                <div class="col-lg-4 col-md-4 col-12">
                                                    <div class="product-image">
                                                        <img src="assets/images/products/product-2.jpg" alt="#">
                                                        <span class="sale-tag">-25%</span>
                                                        <div class="button">
                                                            <a href="product-details.html" class="btn"><i
                                                                    class="lni lni-cart"></i> Add to
                                                                Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-12">
                                                    <div class="product-info">
                                                        <span class="category">Speaker</span>
                                                        <h4 class="title">
                                                            <a href="product-grids.html">Big Power Sound Speaker</a>
                                                        </h4>
                                                        <ul class="review">
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><span>5.0 Review(s)</span></li>
                                                        </ul>
                                                        <div class="price">
                                                            <span>$275.00</span>
                                                            <span class="discount-price">$300.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="row align-items-center">
                                                <div class="col-lg-4 col-md-4 col-12">
                                                    <div class="product-image">
                                                        <img src="assets/images/products/product-3.jpg" alt="#">
                                                        <div class="button">
                                                            <a href="product-details.html" class="btn"><i
                                                                    class="lni lni-cart"></i> Add to
                                                                Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-12">
                                                    <div class="product-info">
                                                        <span class="category">Camera</span>
                                                        <h4 class="title">
                                                            <a href="product-grids.html">WiFi Security Camera</a>
                                                        </h4>
                                                        <ul class="review">
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><span>5.0 Review(s)</span></li>
                                                        </ul>
                                                        <div class="price">
                                                            <span>$399.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <!-- Start Single Product -->
                                        <div class="single-product">
                                            <div class="row align-items-center">
                                                <div class="col-lg-4 col-md-4 col-12">
                                                    <div class="product-image">
                                                        <img src="assets/images/products/product-4.jpg" alt="#">
                                                        <span class="new-tag">New</span>
                                                        <div class="button">
                                                            <a href="product-details.html" class="btn"><i
                                                                    class="lni lni-cart"></i> Add to
                                                                Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-12">
                                                    <div class="product-info">
                                                        <span class="category">Phones</span>
                                                        <h4 class="title">
                                                            <a href="product-grids.html">iphone 6x plus</a>
                                                        </h4>
                                                        <ul class="review">
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><i class="lni lni-star-filled"></i></li>
                                                            <li><span>5.0 Review(s)</span></li>
                                                        </ul>
                                                        <div class="price">
                                                            <span>$400.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
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
            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
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
    <footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>