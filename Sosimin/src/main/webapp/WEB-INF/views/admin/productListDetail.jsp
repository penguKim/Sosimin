<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Sosimin</title>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
  
  </main>
	
  <footer id="footer" class="footer">
	<jsp:include page="../inc/adminBottom.jsp"></jsp:include>	
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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