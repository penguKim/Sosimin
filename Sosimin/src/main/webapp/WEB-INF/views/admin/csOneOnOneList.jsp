<%-- admin_member.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>소시민:: 소심한 시민들의 거래</title>

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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="../inc/adminTop.jsp"></jsp:include>
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<jsp:include page="../inc/adminSidebar.jsp"></jsp:include>
	</aside>
	<!-- End Sidebar-->


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>이페이지는 어떻게 만들어야할지 감이 안옵니다</h1>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
<!-- 							<h5 class="card-title">Datatables</h5> -->
<!-- 							<p> -->
<!-- 								Add lightweight datatables to your project with using the <a -->
<!-- 									href="https://github.com/fiduswriter/Simple-DataTables" -->
<!-- 									target="_blank">Simple DataTables</a> library. Just add -->
<%-- 								<code>.datatable</code> --%>
<!-- 								class name to any table you wish to conver to a datatable. Check -->
<!-- 								for <a -->
<!-- 									href="https://fiduswriter.github.io/simple-datatables/demos/" -->
<!-- 									target="_blank">more examples</a>. -->
<!-- 							</p> -->

							<!-- Table with stripped rows -->
							<div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
								<div class="datatable-top">
<!-- 									<div class="datatable-dropdown"> -->
<!-- 										<label> <select class="datatable-selector"><option -->
<!-- 													value="5">5</option> -->
<!-- 												<option value="10" selected="">10</option> -->
<!-- 												<option value="15">15</option> -->
<!-- 												<option value="-1">All</option></select> entries per page -->
<!-- 										</label> -->
<!-- 									</div> -->
									<div class="float-start">
									</div>
									<div class="datatable-search">
										<select class="datatable-selector">
											<option>제목</option>
											<option>내용</option>
											<option>글쓴이</option>
										</select>
										<input class="datatable-input" placeholder="회원정보를 검색하세요"
											type="search" title="Search within table">
										<input type="submit" value="조회" class="btn btn-outline-primary">
									</div>
								</div>
								<div class="datatable-container">
									<table class="table datatable datatable-table" id="memberManagementTable">
										<thead>
											<tr>
												<th data-sortable="true" aria-sort="descending" class="datatable-descending">
													<button class="datatable-sorter">글번호</button>
												</th>
<!-- 												<th data-sortable="true"> -->
<!-- 													<button class="datatable-sorter">유형</button> -->
<!-- 												</th> -->
												<th data-sortable="true">
													<button class="datatable-sorter" style="width: 300px;">채팅내용</button>
												</th>
												<th data-format="YYYY/DD/MM" data-sortable="true" data-type="date">
													<button class="datatable-sorter" style="width: 80px;">글쓴이</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">채팅방열린시간</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">상세정보</button>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="com" begin="1" end="15" varStatus="status">
												<tr data-index="${status.index }">
													<td>${status.index }</td>
													<td>거래 감사합니다</td>
													<td>admin</td>
													<td>2024.01.29</td>
													<td>
														<input type="button" value="상세정보" onclick="location.href='Chat'">
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="datatable-bottom">
<!-- 									<div class="datatable-info">Showing 1 to 10 of 100 -->
<!-- 										entries</div> -->
									<nav class="datatable-pagination">
										<ul class="datatable-pagination-list">
											<li class="datatable-pagination-list-item datatable-hidden datatable-disabled">
												<button data-page="1" class="datatable-pagination-list-item-link" aria-label="Page 1">
												‹
												</button>
											</li>
											<li class="datatable-pagination-list-item datatable-active">
												<button data-page="1" class="datatable-pagination-list-item-link" aria-label="Page 1">
												1
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="2" class="datatable-pagination-list-item-link" aria-label="Page 2">
												2
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="3" class="datatable-pagination-list-item-link" aria-label="Page 3">
												3
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="4" class="datatable-pagination-list-item-link" aria-label="Page 4">
												4
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="5" class="datatable-pagination-list-item-link" aria-label="Page 5">
												5
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="6" class="datatable-pagination-list-item-link" aria-label="Page 6">
												6
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="7" class="datatable-pagination-list-item-link" aria-label="Page 7">
												7
												</button>
											</li>
											<li class="datatable-pagination-list-item datatable-ellipsis datatable-disabled">
												<button class="datatable-pagination-list-item-link">
												…
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="10" class="datatable-pagination-list-item-link" aria-label="Page 10">
												10
												</button>
											</li>
											<li class="datatable-pagination-list-item">
												<button data-page="2" class="datatable-pagination-list-item-link" aria-label="Page 2">
												›
												</button>
											</li>
										</ul>
									</nav>
								</div>
							</div>
							<!-- End Table with stripped rows -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<jsp:include page="../inc/adminBottom.jsp"></jsp:include>
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>

	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/chart.umd.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin//quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/simple-datatables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/js/admin/main.js"></script>
</body>
</html>