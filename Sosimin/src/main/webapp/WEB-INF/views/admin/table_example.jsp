<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Data - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

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

		<div class="d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">NiceAdmin</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
<!-- 				<input type="text" name="query" placeholder="Search" -->
<!-- 					title="Enter search keyword"> -->
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a>
				<!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul>
					<!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a>
				<!-- End Messages Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Maria Hudson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>4 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Anna Nelson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>6 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
								<div>
									<h4>David Muldon</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>8 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="dropdown-footer"><a href="#">Show all messages</a>
						</li>

					</ul>
					<!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="assets/img/profile-img.jpg" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
				</a>
				<!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>Kevin Anderson</h6> <span>Web Designer</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq.html"> <i class="bi bi-question-circle"></i>
								<span>Need Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="#"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul>
					<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link collapsed"
				href="index.html"> <i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-menu-button-wide"></i><span>Components</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="components-alerts.html"> <i
							class="bi bi-circle"></i><span>Alerts</span>
					</a></li>
					<li><a href="components-accordion.html"> <i
							class="bi bi-circle"></i><span>Accordion</span>
					</a></li>
					<li><a href="components-badges.html"> <i
							class="bi bi-circle"></i><span>Badges</span>
					</a></li>
					<li><a href="components-breadcrumbs.html"> <i
							class="bi bi-circle"></i><span>Breadcrumbs</span>
					</a></li>
					<li><a href="components-buttons.html"> <i
							class="bi bi-circle"></i><span>Buttons</span>
					</a></li>
					<li><a href="components-cards.html"> <i
							class="bi bi-circle"></i><span>Cards</span>
					</a></li>
					<li><a href="components-carousel.html"> <i
							class="bi bi-circle"></i><span>Carousel</span>
					</a></li>
					<li><a href="components-list-group.html"> <i
							class="bi bi-circle"></i><span>List group</span>
					</a></li>
					<li><a href="components-modal.html"> <i
							class="bi bi-circle"></i><span>Modal</span>
					</a></li>
					<li><a href="components-tabs.html"> <i
							class="bi bi-circle"></i><span>Tabs</span>
					</a></li>
					<li><a href="components-pagination.html"> <i
							class="bi bi-circle"></i><span>Pagination</span>
					</a></li>
					<li><a href="components-progress.html"> <i
							class="bi bi-circle"></i><span>Progress</span>
					</a></li>
					<li><a href="components-spinners.html"> <i
							class="bi bi-circle"></i><span>Spinners</span>
					</a></li>
					<li><a href="components-tooltips.html"> <i
							class="bi bi-circle"></i><span>Tooltips</span>
					</a></li>
				</ul></li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>Forms</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>Form
								Elements</span>
					</a></li>
					<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>Form
								Layouts</span>
					</a></li>
					<li><a href="forms-editors.html"> <i class="bi bi-circle"></i><span>Form
								Editors</span>
					</a></li>
					<li><a href="forms-validation.html"> <i
							class="bi bi-circle"></i><span>Form Validation</span>
					</a></li>
				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link "
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>Tables</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse show"
					data-bs-parent="#sidebar-nav">
					<li><a href="tables-general.html"> <i class="bi bi-circle"></i><span>General
								Tables</span>
					</a></li>
					<li><a href="tables-data.html" class="active"> <i
							class="bi bi-circle"></i><span>Data Tables</span>
					</a></li>
				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-bar-chart"></i><span>Charts</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="charts-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="charts-chartjs.html"> <i class="bi bi-circle"></i><span>Chart.js</span>
					</a></li>
					<li><a href="charts-apexcharts.html"> <i
							class="bi bi-circle"></i><span>ApexCharts</span>
					</a></li>
					<li><a href="charts-echarts.html"> <i class="bi bi-circle"></i><span>ECharts</span>
					</a></li>
				</ul></li>
			<!-- End Charts Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-gem"></i><span>Icons</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="icons-bootstrap.html"> <i
							class="bi bi-circle"></i><span>Bootstrap Icons</span>
					</a></li>
					<li><a href="icons-remix.html"> <i class="bi bi-circle"></i><span>Remix
								Icons</span>
					</a></li>
					<li><a href="icons-boxicons.html"> <i class="bi bi-circle"></i><span>Boxicons</span>
					</a></li>
				</ul></li>
			<!-- End Icons Nav -->

			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="users-profile.html"> <i class="bi bi-person"></i> <span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-faq.html"> <i class="bi bi-question-circle"></i> <span>F.A.Q</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-contact.html"> <i class="bi bi-envelope"></i> <span>Contact</span>
			</a></li>
			<!-- End Contact Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-register.html"> <i class="bi bi-card-list"></i> <span>Register</span>
			</a></li>
			<!-- End Register Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-login.html"> <i class="bi bi-box-arrow-in-right"></i>
					<span>Login</span>
			</a></li>
			<!-- End Login Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-error-404.html"> <i class="bi bi-dash-circle"></i> <span>Error
						404</span>
			</a></li>
			<!-- End Error 404 Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-blank.html"> <i class="bi bi-file-earmark"></i> <span>Blank</span>
			</a></li>
			<!-- End Blank Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Data Tables</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item">Tables</li>
					<li class="breadcrumb-item active">Data</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Datatables</h5>
							<p>
								Add lightweight datatables to your project with using the <a
									href="https://github.com/fiduswriter/Simple-DataTables"
									target="_blank">Simple DataTables</a> library. Just add
								<code>.datatable</code>
								class name to any table you wish to conver to a datatable. Check
								for <a
									href="https://fiduswriter.github.io/simple-datatables/demos/"
									target="_blank">more examples</a>.
							</p>

							<!-- Table with stripped rows -->
							<div
								class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
								<div class="datatable-top">
									<div class="datatable-dropdown">
										<label> <select class="datatable-selector"><option
													value="5">5</option>
												<option value="10" selected="">10</option>
												<option value="15">15</option>
												<option value="-1">All</option></select> entries per page
										</label>
									</div>
									<div class="datatable-search">
										<input class="datatable-input" placeholder="Search..."
											type="search" title="Search within table">
									</div>
								</div>
								<div class="datatable-container">
									<table class="table datatable datatable-table">
										<thead>
											<tr>
												<th data-sortable="true" aria-sort="ascending"
													class="datatable-ascending"
													style="width: 26.85589519650655%;"><button
														class="datatable-sorter">
														<b>N</b>ame
													</button></th>
												<th data-sortable="true" style="width: 9.170305676855897%;"><button
														class="datatable-sorter">Ext.</button></th>
												<th data-sortable="true" style="width: 28.49344978165939%;"><button
														class="datatable-sorter">City</button></th>
												<th data-format="YYYY/DD/MM" data-sortable="true"
													data-type="date" style="width: 16.921397379912666%;"><button
														class="datatable-sorter">Start Date</button></th>
												<th data-sortable="true" class="red"
													style="width: 18.5589519650655%;"><button
														class="datatable-sorter">Completion</button></th>
											</tr>
										</thead>
										<tbody>
											<tr data-index="0">
												<td>Adrienne Winters</td>
												<td>4425</td>
												<td>Laguna Blanca</td>
												<td>2014/15/09</td>
												<td class="green">24%</td>
											</tr>
											<tr data-index="1">
												<td>Alisa Horn</td>
												<td>9853</td>
												<td>Ucluelet</td>
												<td>2007/01/11</td>
												<td class="green">39%</td>
											</tr>
											<tr data-index="2">
												<td>Allegra Shepherd</td>
												<td>2576</td>
												<td>Meeuwen-Gruitrode</td>
												<td>2004/19/04</td>
												<td class="green">41%</td>
											</tr>
											<tr data-index="3">
												<td>Armand Suarez</td>
												<td>6583</td>
												<td>Funtua</td>
												<td>1999/06/11</td>
												<td class="green">9%</td>
											</tr>
											<tr data-index="4">
												<td>Athena Aguirre</td>
												<td>5741</td>
												<td>Romeral</td>
												<td>2010/24/03</td>
												<td class="green">15%</td>
											</tr>
											<tr data-index="5">
												<td>Berk Johnston</td>
												<td>4532</td>
												<td>Vergnies</td>
												<td>2016/23/02</td>
												<td class="green">93%</td>
											</tr>
											<tr data-index="6">
												<td>Blossom Dickerson</td>
												<td>5018</td>
												<td>Kempten</td>
												<td>2006/11/09</td>
												<td class="green">17%</td>
											</tr>
											<tr data-index="7">
												<td>Brennan Brooks</td>
												<td>9011</td>
												<td>Olmué</td>
												<td>2000/18/04</td>
												<td class="green">2%</td>
											</tr>
											<tr data-index="8">
												<td>Cairo Rice</td>
												<td>6273</td>
												<td>Ostra Vetere</td>
												<td>2016/27/02</td>
												<td class="green">13%</td>
											</tr>
											<tr data-index="9">
												<td>Caleb Livingston</td>
												<td>3094</td>
												<td>Fatehpur</td>
												<td>2014/13/02</td>
												<td class="green">8%</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="datatable-bottom">
									<div class="datatable-info">Showing 1 to 10 of 100
										entries</div>
									<nav class="datatable-pagination">
										<ul class="datatable-pagination-list">
											<li
												class="datatable-pagination-list-item datatable-hidden datatable-disabled"><button
													data-page="1" class="datatable-pagination-list-item-link"
													aria-label="Page 1">‹</button></li>
											<li class="datatable-pagination-list-item datatable-active"><button
													data-page="1" class="datatable-pagination-list-item-link"
													aria-label="Page 1">1</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="2" class="datatable-pagination-list-item-link"
													aria-label="Page 2">2</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="3" class="datatable-pagination-list-item-link"
													aria-label="Page 3">3</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="4" class="datatable-pagination-list-item-link"
													aria-label="Page 4">4</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="5" class="datatable-pagination-list-item-link"
													aria-label="Page 5">5</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="6" class="datatable-pagination-list-item-link"
													aria-label="Page 6">6</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="7" class="datatable-pagination-list-item-link"
													aria-label="Page 7">7</button></li>
											<li
												class="datatable-pagination-list-item datatable-ellipsis datatable-disabled"><button
													class="datatable-pagination-list-item-link">…</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="10" class="datatable-pagination-list-item-link"
													aria-label="Page 10">10</button></li>
											<li class="datatable-pagination-list-item"><button
													data-page="2" class="datatable-pagination-list-item-link"
													aria-label="Page 2">›</button></li>
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
		<div class="copyright">
			© Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.min.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>



	<svg id="SvgjsSvg1001" width="2" height="0"
		xmlns="http://www.w3.org/2000/svg" version="1.1"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns:svgjs="http://svgjs.dev"
		style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;">
		<defs id="SvgjsDefs1002"></defs>
		<polyline id="SvgjsPolyline1003" points="0,0"></polyline>
		<path id="SvgjsPath1004" d="M0 0 "></path></svg>
</body>
</html>