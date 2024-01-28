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
<!-- <ul class="sidebar-nav" id="sidebar-nav"> -->
<!--   <li class="nav-heading">관리자페이지 메인</li> -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" href="index.html"> -->
<!--       <i class="bi bi-grid"></i> -->
<!--       <span>Dashboard</span> -->
<!--     </a> -->
<!--   </li>End Dashboard Nav -->

<!--   <li class="nav-heading">결제관련</li> -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#"> -->
<!--       <i class="bi bi-menu-button-wide"></i><span>계좌관리</span><i class="bi bi-chevron-down ms-auto"></i> -->
<!--     </a> -->
<!--     <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav"> -->
<!--       <li> -->
<!--         <a href="components-alerts.html"> -->
<!--           <i class="bi bi-circle"></i><span>Alerts</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-accordion.html"> -->
<!--           <i class="bi bi-circle"></i><span>Accordion</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-badges.html"> -->
<!--           <i class="bi bi-circle"></i><span>Badges</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-breadcrumbs.html"> -->
<!--           <i class="bi bi-circle"></i><span>Breadcrumbs</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-buttons.html"> -->
<!--           <i class="bi bi-circle"></i><span>Buttons</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-cards.html"> -->
<!--           <i class="bi bi-circle"></i><span>Cards</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-carousel.html"> -->
<!--           <i class="bi bi-circle"></i><span>Carousel</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-list-group.html"> -->
<!--           <i class="bi bi-circle"></i><span>List group</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-modal.html"> -->
<!--           <i class="bi bi-circle"></i><span>Modal</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-tabs.html"> -->
<!--           <i class="bi bi-circle"></i><span>Tabs</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-pagination.html"> -->
<!--           <i class="bi bi-circle"></i><span>Pagination</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-progress.html"> -->
<!--           <i class="bi bi-circle"></i><span>Progress</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-spinners.html"> -->
<!--           <i class="bi bi-circle"></i><span>Spinners</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="components-tooltips.html"> -->
<!--           <i class="bi bi-circle"></i><span>Tooltips</span> -->
<!--         </a> -->
<!--       </li> -->
<!--     </ul> -->
<!--   </li>End Components Nav -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#"> -->
<!--       <i class="bi bi-journal-text"></i><span>페이관리</span><i class="bi bi-chevron-down ms-auto"></i> -->
<!--     </a> -->
<!--     <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav"> -->
<!--       <li> -->
<!--         <a href="forms-elements.html"> -->
<!--           <i class="bi bi-circle"></i><span>Form Elements</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="forms-layouts.html"> -->
<!--           <i class="bi bi-circle"></i><span>Form Layouts</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="forms-editors.html"> -->
<!--           <i class="bi bi-circle"></i><span>Form Editors</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="forms-validation.html"> -->
<!--           <i class="bi bi-circle"></i><span>Form Validation</span> -->
<!--         </a> -->
<!--       </li> -->
<!--     </ul> -->
<!--   </li>End Forms Nav -->

<!--   <li class="nav-heading">거래관련</li> -->


<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#"> -->
<!--       <i class="bi bi-layout-text-window-reverse"></i><span>거래내역관리</span><i class="bi bi-chevron-down ms-auto"></i> -->
<!--     </a> -->
<!--     <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav"> -->
<!--       <li> -->
<!--         <a href="tables-general.html"> -->
<!--           <i class="bi bi-circle"></i><span>General Tables</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="tables-data.html"> -->
<!--           <i class="bi bi-circle"></i><span>Data Tables</span> -->
<!--         </a> -->
<!--       </li> -->
<!--     </ul> -->
<!--   </li>End Tables Nav -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#"> -->
<!--       <i class="bi bi-bar-chart"></i><span>상품관리</span><i class="bi bi-chevron-down ms-auto"></i> -->
<!--     </a> -->
<!--     <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav"> -->
<!--       <li> -->
<!--         <a href="charts-chartjs.html"> -->
<!--           <i class="bi bi-circle"></i><span>Chart.js</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="charts-apexcharts.html"> -->
<!--           <i class="bi bi-circle"></i><span>ApexCharts</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="charts-echarts.html"> -->
<!--           <i class="bi bi-circle"></i><span>ECharts</span> -->
<!--         </a> -->
<!--       </li> -->
<!--     </ul> -->
<!--   </li>End Charts Nav -->




<!--   <li class="nav-heading">회원관련</li> -->


<!--   <li class="nav-item"> -->
<!--     <a class="nav-link" href="MemberList"> -->
<!--       <i class="bi bi-question-circle"></i> -->
<!--       <span>회원 관리</span> -->
<!--     </a> -->
<!--   </li>End F.A.Q Page Nav -->
<!-- <!--   <li class="nav-item"> --> -->
<!-- <!--     <a class="nav-link collapsed" href="pages-faq.html"> --> -->
<!-- <!--       <i class="bi bi-question-circle"></i> --> -->
<!-- <!--       <span>게시물 신고관리</span> --> -->
<!-- <!--     </a> --> -->
<!-- <!--   </li>End F.A.Q Page Nav --> -->


<!--   <li class="nav-heading">신고관련</li> -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#"> -->
<!--       <i class="bi bi-gem"></i><span>신고관리</span><i class="bi bi-chevron-down ms-auto"></i> -->
<!--     </a> -->
<!--     <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav"> -->
<!--       <li> -->
<!--         <a href="icons-bootstrap.html"> -->
<!--           <i class="bi bi-circle"></i><span>회원신고 관리</span> -->
<!--         </a> -->
<!--       </li> -->
<!--       <li> -->
<!--         <a href="icons-remix.html"> -->
<!--           <i class="bi bi-circle"></i><span>게시물 신고관리</span> -->
<!--         </a> -->
<!--       </li> -->
<!-- <!--       <li> --> -->
<!-- <!--         <a href="icons-boxicons.html"> --> -->
<!-- <!--           <i class="bi bi-circle"></i><span>Boxicons</span> --> -->
<!-- <!--         </a> --> -->
<!-- <!--       </li> --> -->
<!--     </ul> -->
<!--   </li>End Icons Nav -->


<!--   <li class="nav-heading">고객센터관련</li> -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" href="pages-contact.html"> -->
<!--       <i class="bi bi-envelope"></i> -->
<!--       <span>공지사항 관리</span> -->
<!--     </a> -->
<!--   </li>End Contact Page Nav -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" href="pages-register.html"> -->
<!--       <i class="bi bi-card-list"></i> -->
<!--       <span>자주묻는질문 관리</span> -->
<!--     </a> -->
<!--   </li>End Register Page Nav -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" href="pages-login.html"> -->
<!--       <i class="bi bi-box-arrow-in-right"></i> -->
<!--       <span>1대1문의 채팅 관리</span> -->
<!--     </a> -->
<!--   </li>End Login Page Nav -->

<!--   <li class="nav-heading">커뮤니티관련</li> -->


<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" href="pages-error-404.html"> -->
<!--       <i class="bi bi-dash-circle"></i> -->
<!--       <span>커뮤니티 게시글 관리</span> -->
<!--     </a> -->
<!--   </li>End Error 404 Page Nav -->

<!--   <li class="nav-item"> -->
<!--     <a class="nav-link collapsed" href="pages-blank.html"> -->
<!--       <i class="bi bi-file-earmark"></i> -->
<!--       <span>커뮤니티 댓글 관리</span> -->
<!--     </a> -->
<!--   </li>End Blank Page Nav -->

<!-- </ul> -->
	</aside>
	<!-- End Sidebar-->


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>회원 정보 관리</h1>
<!-- 			<nav> -->
<!-- 				<ol class="breadcrumb"> -->
<!-- 					<li class="breadcrumb-item"><a href="index.html">관리자페이지</a></li> -->
<!-- 					<li class="breadcrumb-item">회원정보관리</li> -->
<!-- 					<li class="breadcrumb-item active">Data</li> -->
<!-- 				</ol> -->
<!-- 			</nav> -->
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
									<div class="datatable-dropdown">
<!-- 										<label> <select class="datatable-selector"><option -->
<!-- 													value="5">5</option> -->
<!-- 												<option value="10" selected="">10</option> -->
<!-- 												<option value="15">15</option> -->
<!-- 												<option value="-1">All</option></select> entries per page -->
<!-- 										</label> -->
									</div>
									<div class="datatable-search">
										<select class="datatable-selector">
											<option>전체</option>
											<option>아이디</option>
											<option>이름</option>
											<option>닉네임</option>
											<option>회원레벨</option>
											<option>회원상태</option>
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
												<th data-sortable="true">
													<button class="datatable-sorter">
														<b>프</b>로필사진
													</button>
												</th>
												<th data-sortable="true" aria-sort="descending" class="datatable-descending">
													<button class="datatable-sorter">아이디</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">이름</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">닉네임</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">이메일</button>
												</th>
												<th data-format="YYYY/DD/MM" data-sortable="true" data-type="date">
													<button class="datatable-sorter">생년월일</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">주소</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">회원번호</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">회원레벨</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">회원상태</button>
												</th>
												<th data-sortable="true" class="red">
													<button class="datatable-sorter">관리</button>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr data-index="0">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="1">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="2">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="3">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="4">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="5">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="6">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="7">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="8">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
											<tr data-index="9">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>UniPugh</td>
												<td>Unity Pugh</td>
												<td>UniPugh</td>
												<td>UniPugh@gmail.com</td>
												<td>2005/02/11</td>
												<td>부산광역시 부산진구 어쩌고저쩌고 109번길 123 2층</td>
												<td>9958</td>
												<td>Lv.3</td>
												<td>활동</td>
												<td class="green">
													<input type="button" class="btn btn-outline-primary" value="수정">
												</td>
											</tr>
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