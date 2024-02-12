<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Sosimin</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/quill.snow.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/quill.bubble.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/remixicon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/admin/style2.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/admin/style.css" rel="stylesheet">
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!-- bootstrap-icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- =======================================================
* Template Name: NiceAdmin
* Updated: Jan 09 2024 with Bootstrap v5.3.2
* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
======================================================== -->
</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="../inc/adminTop.jsp"></jsp:include>	
	</header><!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<jsp:include page="../inc/adminSidebar.jsp"></jsp:include>	
	</aside><!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>관리자메인</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="AdminMain">Home</a></li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">
		
		            <!-- Sales Card -->
		            <div class="col-xxl-4 col-md-6">
		              <div class="card info-card sales-card">
		
<!-- 		                <div class="filter"> -->
<!-- 		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a> -->
<!-- 		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"> -->
<!-- 		                    <li class="dropdown-header text-start"> -->
<!-- 		                      <h6>Filter</h6> -->
<!-- 		                    </li> -->
		
<!-- 		                    <li><a class="dropdown-item" href="#">Today</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Month</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Year</a></li> -->
<!-- 		                  </ul> -->
<!-- 		                </div> -->
		
		                <div class="card-body">
		                  <h5 class="card-title">상품등록 <span>| 오늘</span></h5>
		
		                  <div class="d-flex align-items-center">
		                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
		                      <i class="bi bi-cart"></i>
		                    </div>
		                    <div class="ps-3 productCount">
		                      <h6></h6>
		                      <span class="small pt-1 fw-bold productIncreaseCount"></span> <span class="text-muted small pt-2 ps-1 productIncreaseText"></span>
		                    </div>
		                  </div>
		                </div>
						<script type="text/javascript">
							$(function() {
								$.ajax({
									url: "ProductCount",
									dataType: "json",
									success: function(data) {
										$(".productCount h6").text(data.product_count + "개");
										$(".productIncreaseCount").text(data.increase);
										if(data.increase > 0) {
											$(".productIncreaseText").text("개 증가");
											$(".productIncreaseCount").addClass("text-success");
										} else if(data.increase < 0) {
											$(".productIncreaseText").text("개 감소");
											$(".productIncreaseCount").addClass("text-danger");
										} else {
											$(".productIncreaseText").text("개 변동없음");

										}
									}
									
								});
							});
						</script>
		              </div>
		            </div><!-- End Sales Card -->
		
		            <!-- Revenue Card -->
		            <div class="col-xxl-4 col-md-6">
		              <div class="card info-card revenue-card">
		
<!-- 		                <div class="filter"> -->
<!-- 		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a> -->
<!-- 		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"> -->
<!-- 		                    <li class="dropdown-header text-start"> -->
<!-- 		                      <h6>Filter</h6> -->
<!-- 		                    </li> -->
		
<!-- 		                    <li><a class="dropdown-item" href="#">Today</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Month</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Year</a></li> -->
<!-- 		                  </ul> -->
<!-- 		                </div> -->
		
		                <div class="card-body">
		                  <h5 class="card-title">결제금액 <span>| 오늘</span></h5>
		
		                  <div class="d-flex align-items-center">
		                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
		                      <i class="bi bi-currency-dollar"></i>
		                    </div>
		                    <div class="ps-3 priceCount">
		                      <h6></h6>
		                      <span class="text-success small pt-1 fw-bold priceIncreaseCount"></span> <span class="text-muted small pt-2 ps-1 priceIncreaseText"></span>
		                    </div>
		                  </div>
		                </div>
						<script type="text/javascript">
 							$(function() {
 								$.ajax({
 									url: "PriceCount",
 									dataType: "json",
 									success: function(data) {
 										$(".priceCount h6").text(data.price_count + "원");
 										$(".priceIncreaseCount").text(data.increase);
 										if(data.increase > 0) {
 											$(".priceIncreaseText").text("원 증가");
 											$(".priceIncreaseText").addClass("text-success");
 										} else if(data.increase < 0) {
 											$(".priceIncreaseText").text("원 감소");
 											$(".priceIncreaseText").addClass("text-danger");
 										} else {
 											$(".priceIncreaseText").text("원 변동없음");
										}
 									}
									
								});
							});
						</script>
		              </div>
		            </div>
		            
<!-- 		                <div class="card-body"> -->
<!-- 		                  <h5 class="card-title">결제횟수 <span>| 오늘</span></h5> -->
		
<!-- 		                  <div class="d-flex align-items-center"> -->
<!-- 		                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center"> -->
<!-- 		                      <i class="bi bi-currency-dollar"></i> -->
<!-- 		                    </div> -->
<!-- 		                    <div class="ps-3 orderCount"> -->
<!-- 		                      <h6></h6> -->
<!-- 		                      <span class="text-success small pt-1 fw-bold orderIncreaseCount"></span> <span class="text-muted small pt-2 ps-1 orderIncreaseText"></span> -->
<!-- 		                    </div> -->
<!-- 		                  </div> -->
<!-- 		                </div> -->
<!-- 						<script type="text/javascript"> -->
<!-- // 							$(function() {  -->
<!-- // 								$.ajax({ -->
<!-- // 									url: "OrderCount", -->
<!-- // 									dataType: "json",  -->
<!-- // 									success: function(data) {  -->
<!-- // 										$(".orderCount h6").text(data.order_count + "회");  -->
<!-- // 										$(".orderIncreaseCount").text(data.increase);  -->
<!-- // 										if(data.increase > 0) {  -->
<!-- // 											$(".orderIncreaseText").text("회 증가"); -->
<!-- // 											$(".orderIncreaseCount").addClass("text-success"); -->
<!-- // 										} else if(data.increase < 0) {  -->
<!-- //  											$(".orderIncreaseText").text("회 감소"); -->
<!-- // 											$(".orderIncreaseCount").addClass("text-danger");  -->
<!-- // 										} else {  -->
<!-- //  											$(".orderIncreaseText").text("회 변동없음"); -->
<!-- // 										} -->
<!-- //  									} -->
									
<!-- // 								}); -->
<!-- //  							}); -->
<!--  						</script> -->
<!-- 		              </div> -->
<!-- 		            </div> -->
		
		            <!-- Customers Card -->
		            <div class="col-xxl-4 col-xl-12">
		
		              <div class="card info-card customers-card">
		
<!-- 		                <div class="filter"> -->
<!-- 		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a> -->
<!-- 		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"> -->
<!-- 		                    <li class="dropdown-header text-start"> -->
<!-- 		                      <h6>Filter</h6> -->
<!-- 		                    </li> -->
		
<!-- 		                    <li><a class="dropdown-item" href="#">Today</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Month</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Year</a></li> -->
<!-- 		                  </ul> -->
<!-- 		                </div> -->
		
		                <div class="card-body">
		                  <h5 class="card-title">신고횟수 <span>| 오늘</span></h5>
		
		                  <div class="d-flex align-items-center">
		                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
		                      <i class="bi bi-people"></i>
		                    </div>
		                    <div class="ps-3 reportCount">
		                      <h6></h6>
		                      <span class="text-danger small pt-1 fw-bold reportIncreaseCount"></span> <span class="text-muted small pt-2 ps-1 reportIncreaseText"></span>
		                    </div>
		                  </div>
							<script type="text/javascript">
								$(function() {
									$.ajax({
										url: "ReportCount",
										dataType: "json",
										success: function(data) {
											$(".reportCount h6").text(data.report_count + "회");
											$(".reportIncreaseCount").text(data.increase);
											if(data.increase > 0) {
												$(".reportIncreaseText").text("회 증가");
												$(".reportIncreaseCount").addClass("text-success");
											} else if(data.increase < 0) {
												$(".reportIncreaseText").text("회 감소");
												$(".reportIncreaseCount").addClass("text-danger");
											} else {
												$(".reportIncreaseText").text("회 변동없음");
											}
										}
										
									});
								});
							</script>
		                </div>
		              </div>
		
		            </div><!-- End Customers Card -->
		
		            <!-- Reports -->
		            <div class="col-12">
		              <div class="card">
		
<!-- 		                <div class="filter"> -->
<!-- 		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a> -->
<!-- 		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"> -->
<!-- 		                    <li class="dropdown-header text-start"> -->
<!-- 		                      <h6>Filter</h6> -->
<!-- 		                    </li> -->
		
<!-- 		                    <li><a class="dropdown-item" href="#">Today</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Month</a></li> -->
<!-- 		                    <li><a class="dropdown-item" href="#">This Year</a></li> -->
<!-- 		                  </ul> -->
<!-- 		                </div> -->
		
		                <div class="card-body">
		                  <h5 class="card-title">7일 통계</h5>
<!-- 		                  <h5 class="card-title">Reports <span>/Today</span></h5> -->
		
		                  <!-- Line Chart -->
		                  <div id="reportsChart"></div>
		
		                  <script>
							$(function() {
								$.ajax({
								    url: "MainReports",
								    dataType: "json",
								    success: function(data) {
								        let dates = data.dates;  // 날짜 데이터
								        let productCounts = data.productCounts;  // 상품등록 데이터
								        let orderCounts = data.orderCounts;  // 상품결제 데이터
								        let reportCounts = data.reportCounts;  // 회원신고 데이터

								        new ApexCharts(document.querySelector("#reportsChart"), {
								            series: [{
								                name: '상품등록',
								                data: productCounts,
								            }, {
								                name: '상품결제',
								                data: orderCounts,
								            }, {
								                name: '회원신고',
								                data: reportCounts,
								            }],
								            chart: {
								                height: 350,
								                type: 'area',
								                toolbar: {
								                    show: false
								                },
								            },
								            markers: {
								                size: 4
								            },
								            colors: ['#4154f1', '#2eca6a', '#ff771d'],
								            fill: {
								                type: "gradient",
								                gradient: {
								                    shadeIntensity: 1,
								                    opacityFrom: 0.3,
								                    opacityTo: 0.4,
								                    stops: [0, 90, 100]
								                }
								            },
								            dataLabels: {
								                enabled: false
								            },
								            stroke: {
								                curve: 'smooth',
								                width: 2
								            },
								            xaxis: {
								                type: 'datetime',
								                labels: { // 차트 날짜 형식을 바꾸기 위한 moment.js 라이브러리 추가
								                	formatter: function(value, timestamp) {
														return moment(timestamp).format('MM/DD');
													}
								                },
								                categories: dates
								            },
								            tooltip: {
								                x: {
								                    format: 'yy/MM/dd'
// 								                    format: 'dd/MM/yy'
								                },
								            }
								        }).render();
								    }
								});

							});
		                  

		                  </script>
		                  <!-- End Line Chart -->
		
		                </div>
		
		              </div>
		            </div><!-- End Reports -->
		
		            <!-- Recent Sales -->
		            <div class="col-12">
		              <div class="card recent-sales overflow-auto">
		
		                <div class="filter">
		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                    <li class="dropdown-header text-start">
		                      <h6>Filter</h6>
		                    </li>
		
		                    <li><a class="dropdown-item" href="#">Today</a></li>
		                    <li><a class="dropdown-item" href="#">This Month</a></li>
		                    <li><a class="dropdown-item" href="#">This Year</a></li>
		                  </ul>
		                </div>
		
		                <div class="card-body">
		                  <h5 class="card-title">Recent Sales <span>| Today</span></h5>
		
		                  <table class="table table-borderless datatable">
		                    <thead>
		                      <tr>
		                        <th scope="col">#</th>
		                        <th scope="col">Customer</th>
		                        <th scope="col">Product</th>
		                        <th scope="col">Price</th>
		                        <th scope="col">Status</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                      <tr>
		                        <th scope="row"><a href="#">#2457</a></th>
		                        <td>Brandon Jacob</td>
		                        <td><a href="#" class="text-primary">At praesentium minu</a></td>
		                        <td>$64</td>
		                        <td><span class="badge bg-success">Approved</span></td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#">#2147</a></th>
		                        <td>Bridie Kessler</td>
		                        <td><a href="#" class="text-primary">Blanditiis dolor omnis similique</a></td>
		                        <td>$47</td>
		                        <td><span class="badge bg-warning">Pending</span></td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#">#2049</a></th>
		                        <td>Ashleigh Langosh</td>
		                        <td><a href="#" class="text-primary">At recusandae consectetur</a></td>
		                        <td>$147</td>
		                        <td><span class="badge bg-success">Approved</span></td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#">#2644</a></th>
		                        <td>Angus Grady</td>
		                        <td><a href="#" class="text-primar">Ut voluptatem id earum et</a></td>
		                        <td>$67</td>
		                        <td><span class="badge bg-danger">Rejected</span></td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#">#2644</a></th>
		                        <td>Raheem Lehner</td>
		                        <td><a href="#" class="text-primary">Sunt similique distinctio</a></td>
		                        <td>$165</td>
		                        <td><span class="badge bg-success">Approved</span></td>
		                      </tr>
		                    </tbody>
		                  </table>
		
		                </div>
		
		              </div>
		            </div><!-- End Recent Sales -->
		
		            <!-- Top Selling -->
		            <div class="col-12">
		              <div class="card top-selling overflow-auto">
		
		                <div class="filter">
		                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                    <li class="dropdown-header text-start">
		                      <h6>Filter</h6>
		                    </li>
		
		                    <li><a class="dropdown-item" href="#">Today</a></li>
		                    <li><a class="dropdown-item" href="#">This Month</a></li>
		                    <li><a class="dropdown-item" href="#">This Year</a></li>
		                  </ul>
		                </div>
		
		                <div class="card-body pb-0">
		                  <h5 class="card-title">Top Selling <span>| Today</span></h5>
		
		                  <table class="table table-borderless">
		                    <thead>
		                      <tr>
		                        <th scope="col">Preview</th>
		                        <th scope="col">Product</th>
		                        <th scope="col">Price</th>
		                        <th scope="col">Sold</th>
		                        <th scope="col">Revenue</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                      <tr>
		                        <th scope="row"><a href="#"><img src="assets/img/product-1.jpg" alt=""></a></th>
		                        <td><a href="#" class="text-primary fw-bold">Ut inventore ipsa voluptas nulla</a></td>
		                        <td>$64</td>
		                        <td class="fw-bold">124</td>
		                        <td>$5,828</td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#"><img src="assets/img/product-2.jpg" alt=""></a></th>
		                        <td><a href="#" class="text-primary fw-bold">Exercitationem similique doloremque</a></td>
		                        <td>$46</td>
		                        <td class="fw-bold">98</td>
		                        <td>$4,508</td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#"><img src="assets/img/product-3.jpg" alt=""></a></th>
		                        <td><a href="#" class="text-primary fw-bold">Doloribus nisi exercitationem</a></td>
		                        <td>$59</td>
		                        <td class="fw-bold">74</td>
		                        <td>$4,366</td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#"><img src="assets/img/product-4.jpg" alt=""></a></th>
		                        <td><a href="#" class="text-primary fw-bold">Officiis quaerat sint rerum error</a></td>
		                        <td>$32</td>
		                        <td class="fw-bold">63</td>
		                        <td>$2,016</td>
		                      </tr>
		                      <tr>
		                        <th scope="row"><a href="#"><img src="assets/img/product-5.jpg" alt=""></a></th>
		                        <td><a href="#" class="text-primary fw-bold">Sit unde debitis delectus repellendus</a></td>
		                        <td>$79</td>
		                        <td class="fw-bold">41</td>
		                        <td>$3,239</td>
		                      </tr>
		                    </tbody>
		                  </table>
		
		                </div>
		
		              </div>
		            </div><!-- End Top Selling -->
		
		          </div>
		        </div><!-- End Left side columns -->
		
		        <!-- Right side columns -->
		        <div class="col-lg-4">
		
		          <!-- Recent Activity -->
		          <div class="card">
		            <div class="filter">
		              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                <li class="dropdown-header text-start">
		                  <h6>Filter</h6>
		                </li>
		
		                <li><a class="dropdown-item" href="#">Today</a></li>
		                <li><a class="dropdown-item" href="#">This Month</a></li>
		                <li><a class="dropdown-item" href="#">This Year</a></li>
		              </ul>
		            </div>
		
		            <div class="card-body">
		              <h5 class="card-title">Recent Activity <span>| Today</span></h5>
		
		              <div class="activity">
		
		                <div class="activity-item d-flex">
		                  <div class="activite-label">32 min</div>
		                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
		                  <div class="activity-content">
		                    Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo officiis</a> beatae
		                  </div>
		                </div><!-- End activity item-->
		
		                <div class="activity-item d-flex">
		                  <div class="activite-label">56 min</div>
		                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
		                  <div class="activity-content">
		                    Voluptatem blanditiis blanditiis eveniet
		                  </div>
		                </div><!-- End activity item-->
		
		                <div class="activity-item d-flex">
		                  <div class="activite-label">2 hrs</div>
		                  <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
		                  <div class="activity-content">
		                    Voluptates corrupti molestias voluptatem
		                  </div>
		                </div><!-- End activity item-->
		
		                <div class="activity-item d-flex">
		                  <div class="activite-label">1 day</div>
		                  <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
		                  <div class="activity-content">
		                    Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati voluptatem</a> tempore
		                  </div>
		                </div><!-- End activity item-->
		
		                <div class="activity-item d-flex">
		                  <div class="activite-label">2 days</div>
		                  <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
		                  <div class="activity-content">
		                    Est sit eum reiciendis exercitationem
		                  </div>
		                </div><!-- End activity item-->
		
		                <div class="activity-item d-flex">
		                  <div class="activite-label">4 weeks</div>
		                  <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
		                  <div class="activity-content">
		                    Dicta dolorem harum nulla eius. Ut quidem quidem sit quas
		                  </div>
		                </div><!-- End activity item-->
		
		              </div>
		
		            </div>
		          </div><!-- End Recent Activity -->
		
		          <!-- Budget Report -->
		          <div class="card">
<!-- 		            <div class="filter"> -->
<!-- 		              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a> -->
<!-- 		              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"> -->
<!-- 		                <li class="dropdown-header text-start"> -->
<!-- 		                  <h6>Filter</h6> -->
<!-- 		                </li> -->
		
<!-- 		                <li><a class="dropdown-item" href="#">Today</a></li> -->
<!-- 		                <li><a class="dropdown-item" href="#">This Month</a></li> -->
<!-- 		                <li><a class="dropdown-item" href="#">This Year</a></li> -->
<!-- 		              </ul> -->
<!-- 		            </div> -->
		
		            <div class="card-body pb-0">
		              <h5 class="card-title">커뮤니티 활동지역 <span>| 이번 달</span></h5>
		
		              <div id="CommunityGu" style="min-height: 400px;" class="echart"></div>
		
		              <script>
						$(function() {
							$.ajax({
								url: "CommunityChart",
								dataType: "json",
								success: function(data) {
									console.log("커뮤니티 통계");
									console.log(data[0]);
									let chart = data[0];
															
									var chartData = [];
									for (var i = 0; i < chart.length; i++) {
										chartData.push({
											value: chart[i].count,
											name: chart[i].gu
										});
									}
						           
					                echarts.init($("#CommunityGu")[0]).setOption({
					                  tooltip: {
					                    trigger: 'item'
					                  },
					                  legend: {
					                    top: '5%',
					                    left: 'center'
					                  },
					                  series: [{
					                    name: '구',
					                    type: 'pie',
					                    radius: ['30%', '70%'],
					                    avoidLabelOverlap: false,
					                    label: {
					                      show: false,
					                      position: 'center'
					                    },
					                    emphasis: {
					                      label: {
					                        show: true,
					                        fontSize: '18',
					                        fontWeight: 'bold'
					                      }
					                    },
					                    labelLine: {
					                      show: false
					                    },
					                    data: chartData
					                  }]
					                });
								},
								error: function() {
									alert("오류");
								}
							});
						});	
		              </script>
		
		            </div>
		          </div><!-- End Budget Report -->
		          <!-- Website Traffic -->
		          <div class="card">
		            <div class="filter">
		              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
<!-- 		              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"> -->
<!-- 		                <li class="dropdown-header text-start"> -->
<!-- 		                  <h6>Filter</h6> -->
<!-- 		                </li> -->
		
<!-- 		                <li><a class="dropdown-item" href="#">Today</a></li> -->
<!-- 		                <li><a class="dropdown-item" href="#">This Month</a></li> -->
<!-- 		                <li><a class="dropdown-item" href="#">This Year</a></li> -->
<!-- 		              </ul> -->
		            </div>
		
		            <div class="card-body pb-0">
		              <h5 class="card-title">카테고리 점유율 <span>| 현재</span></h5>
		
		              <div id="trafficChart" style="min-height: 400px;" class="echart"></div>
		              <script>
		              document.addEventListener("DOMContentLoaded", () => {
		            	  	$.ajax({
								url: "Chart",
								dataType: "json",
								success: function(data) {
									let chart = data[0];
									console.log(chart[0].count);	

									var chartData = [];
						            for (var i = 0; i < chart.length; i++) {
						                chartData.push({
						                    value: chart[i].count,
						                    name: chart[i].product_category 
						                });
						            }
						            
					                  echarts.init(document.querySelector("#trafficChart")).setOption({
					                    tooltip: {
					                      trigger: 'item'
					                    },
					                    legend: {
					                      top: '5%',
					                      left: 'center'
					                    },
					                    series: [{
					                      name: '카테고리',
					                      type: 'pie',
					                      radius: ['40%', '70%'],
					                      avoidLabelOverlap: false,
					                      label: {
					                        show: false,
					                        position: 'center'
					                      },
					                      emphasis: {
					                        label: {
					                          show: true,
					                          fontSize: '18',
					                          fontWeight: 'bold'
					                        }
					                      },
					                      labelLine: {
					                        show: false
					                      },
					                      data: chartData
					                    }]
					                  });
								},
								error: function() {
									alert("오류");
								}
							});
						});
		              </script>
		
		            </div>
		          </div><!-- End Website Traffic -->
		
		          <!-- News & Updates Traffic -->
		          <div class="card">
		            <div class="filter">
		              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
		              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
		                <li class="dropdown-header text-start">
		                  <h6>Filter</h6>
		                </li>
		
		                <li><a class="dropdown-item" href="#">Today</a></li>
		                <li><a class="dropdown-item" href="#">This Month</a></li>
		                <li><a class="dropdown-item" href="#">This Year</a></li>
		              </ul>
		            </div>
		
		            <div class="card-body pb-0">
		              <h5 class="card-title">News &amp; Updates <span>| Today</span></h5>
		
		              <div class="news">
		                <div class="post-item clearfix">
		                  <img src="assets/img/news-1.jpg" alt="">
		                  <h4><a href="#">Nihil blanditiis at in nihil autem</a></h4>
		                  <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
		                </div>
		
		                <div class="post-item clearfix">
		                  <img src="assets/img/news-2.jpg" alt="">
		                  <h4><a href="#">Quidem autem et impedit</a></h4>
		                  <p>Illo nemo neque maiores vitae officiis cum eum turos elan dries werona nande...</p>
		                </div>
		
		                <div class="post-item clearfix">
		                  <img src="assets/img/news-3.jpg" alt="">
		                  <h4><a href="#">Id quia et et ut maxime similique occaecati ut</a></h4>
		                  <p>Fugiat voluptas vero eaque accusantium eos. Consequuntur sed ipsam et totam...</p>
		                </div>
		
		                <div class="post-item clearfix">
		                  <img src="assets/img/news-4.jpg" alt="">
		                  <h4><a href="#">Laborum corporis quo dara net para</a></h4>
		                  <p>Qui enim quia optio. Eligendi aut asperiores enim repellendusvel rerum cuder...</p>
		                </div>
		
		                <div class="post-item clearfix">
		                  <img src="assets/img/news-5.jpg" alt="">
		                  <h4><a href="#">Et dolores corrupti quae illo quod dolor</a></h4>
		                  <p>Odit ut eveniet modi reiciendis. Atque cupiditate libero beatae dignissimos eius...</p>
		                </div>
		
		              </div><!-- End sidebar recent posts-->
		
		            </div>
		          </div><!-- End News & Updates -->
		
		        </div><!-- End Right side columns -->

			</div>
		</section>

	</main><!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<jsp:include page="../inc/adminBottom.jsp"></jsp:include>	
	</footer><!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/apexcharts.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart.umd.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin//quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/simple-datatables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>