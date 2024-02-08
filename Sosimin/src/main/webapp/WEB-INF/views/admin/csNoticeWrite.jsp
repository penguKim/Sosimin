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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment.css" />

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
<style type="text/css">
	#content {
		height: 300px;
		resize: none;
	}

	#btnArea {
		text-align: right;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
$(function() {
	$("#write").click(function() {
		event.preventDefault();
		Swal.fire({
	        title: '공지사항을 등록하시겠습니까?',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '등록',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	        allowOutsideClick: false
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	if($("#select").val() == "") { 
					Swal.fire({
						position: 'center',
						icon: 'warning',
						title: '유형을 선택해주세요.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
					});
					$("#select").focus();
					return false;
				} else if($("#subject").val() == "") { 
					Swal.fire({
						position: 'center',
						icon: 'warning',
						title: '제목을 입력해주세요.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
					});
					$("#subject").focus();
					return false;
				} else if($("#content").val() == "") { 
					Swal.fire({
						position: 'center',
						icon: 'warning',
						title: '내용을 입력해주세요.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
					});
					$("#content").focus();
					return false;
				}
	        	$("#notice-write").submit();
	        } else {
	        	return false;
	        }
	    });
		
	});
	
	$("#cancel").on("click", function() {
		Swal.fire({
	        title: '등록을 취소하시겠습니까?',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '확인',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	        allowOutsideClick: false
	    }).then((result) => {
	        if (result.isConfirmed) {
				location.href="CsNoticeList";
			} else {
	        	return false;
	        }
	    });
	});
	
});

</script>
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
			<h1>공지사항등록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">Home</a></li>
					<li class="breadcrumb-item">고객센터관리</li>
					<li class="breadcrumb-item">공지사항관리</li>
					<li class="breadcrumb-item active">공지사항등록</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">공지사항 등록</h5>
							<!-- General Form Elements -->
							<form action="CsNoticeWritePro" method="post" id="notice-write">
								<div class="row mb-3">
									<label for="select" class="col-sm-2 col-form-label">유형선택</label>
									<div class="col-sm-10">
										<select class="form-select" aria-label="Default select example" name="cs_type_detail" id="select">
											<option value=''>유형을 선택해주세요</option>
											<option value="1">공지</option>
											<option value="2">정책변경</option>
											<option value="3">사기예방</option>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<label for="subject" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="cs_subject" id="subject">
									</div>
								</div>
								<div class="row mb-3">
									<label for="content" class="col-sm-2 col-form-label">내용</label>
									<div class="col-sm-10">
										<textarea class="form-control" name="cs_content" id="content"></textarea>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-12" id="btnArea">
										<button type="button" id="cancel" class="btn btn-secondary">나가기</button>
										<button type="button" class="btn btn-primary" id="write">등록하기</button>
									</div>
								</div>
							</form><!-- End General Form Elements -->
						</div>
					</div>
				</div>
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