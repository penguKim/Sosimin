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
.comAdmin th {
	min-width: 100px;
}

.comAdmin .admin-title {
	cursor: pointer;
} 

.comAdmin .admin-title:hover {
	color: #4154f1;
}

.comAdmin .ellipsis {
	max-width: 600px !important;
}

</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
function statusUpdate(report_id) {
	let reportStatus = $("#reportStatus").val();
	
	console.log("스테이터스 : " + reportStatus);
	console.log(report_id);
	
	Swal.fire({
		   title: '정말 변경하시겠습니까?',
		   text: '다시 한번 확인해주세요!',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '변경', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   reverseButtons: true, // 버튼 순서 거꾸로
	}).then(result => {
	    // 만약 Promise리턴을 받으면,
	    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	    	$.ajax({
					url: "ReportModify",
					data: {
						report_status: reportStatus,
						report_id: report_id
					},
					success: function() {
						location.reload();
					},
					error: function() {
						Swal.fire('삭제 실패했습니다!', '죄송하지만 다시 부탁해요~!', 'error');
					}
			}); // 신고 등록 ajax 끝
	   	}
	});
}	
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
			<h1>커뮤니티 신고관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">Home</a></li>
					<li class="breadcrumb-item active">신고관리</li>
					<li class="breadcrumb-item active">커뮤니티신고관리</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<!-- Table with stripped rows -->
							<table class="comAdmin table table-hover datatable text-center">
								<thead>
									<tr>
										<th style="width: 130px;">신고번호</th>
										<th style="width: 150px;">신고자</th>
										<th style="width: 150px;">피신고자</th>
										<th style="width: 150px;">신고날짜</th>
										<th style="width: 120px;">신고사유</th>
										<th style="width: 300px;">신고내용</th>
										<th style="width: 150px;">처리상태</th>
										<th style="width: 120px;">상세보기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="reportList" items="${communityReportList}">
										<tr>
											<td>${reportList.report_id}</td>
											<td>${reportList.reporter_id}</td>
											<td class="admin-title" onclick="location.href='SellerInfo?member_id=${reportList.reportee_id}'">${reportList.reportee_id}</td>
											<td>
												<c:set var="datetime" value="${fn:split(reportList.report_datetime, 'T')}" />
												<c:set var="date" value="${datetime[0]}" />
												${date}
											</td>
											<td>
												<c:choose>
													<c:when test="${reportList.report_reason eq 1}">금지품목</c:when>
													<c:when test="${reportList.report_reason eq 2}">광고</c:when>
													<c:when test="${reportList.report_reason eq 3}">분쟁</c:when>
													<c:when test="${reportList.report_reason eq 4}">사기</c:when>
													<c:when test="${reportList.report_reason eq 5}">비매너</c:when>
													<c:when test="${reportList.report_reason eq 6}">욕설</c:when>
													<c:when test="${reportList.report_reason eq 7}">기타</c:when>
												</c:choose>
											</td>
											<td style="width: 150px;"class="admin-title text-start" onclick="location.href='CommunityDetail?community_id=${reportList.report_type_id}'">
												<span class="d-inline-block ellipsis ps-3">${reportList.report_content}</span>
											</td>
											<td>
												<c:choose>
													<c:when test="${reportList.report_status eq 0}">처리진행중</c:when>
													<c:when test="${reportList.report_status eq 1}">신고확정</c:when>
													<c:when test="${reportList.report_status eq 2}">문제없음</c:when>
												</c:choose>
											</td>
											<td class="green">
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-${reportList.report_id}">
													상세보기
												</button>
												<!-- Basic Modal -->
												<div class="modal fade" id="modal-${reportList.report_id}" tabindex="-1">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">커뮤니티 신고 상세</h5><!-- 모달 제목 -->
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<!-- 모달 내용이 들어가는 부분 -->
																<table class="table modal_table">
																	<tr>
																		<th scope="row">신고번호</th>
																		<td>${reportList.report_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">신고자</th>
																		<td>${reportList.reporter_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">피신고자</th>
																		<td class="admin-title" onclick="location.href='SellerInfo?member_id=${reportList.reportee_id}'">${reportList.reportee_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">게시글 제목</th>
																		<td class="admin-title" onclick="location.href='CommunityDetail?community_id=${reportList.report_type_id}'">${reportList.report_name}</td>
																	</tr>
																	<tr>
																		<th scope="row">신고사유</th>
																		<td>
																			<c:choose>
																				<c:when test="${reportList.report_reason eq 1}">금지품목</c:when>
																				<c:when test="${reportList.report_reason eq 2}">광고</c:when>
																				<c:when test="${reportList.report_reason eq 3}">분쟁</c:when>
																				<c:when test="${reportList.report_reason eq 4}">사기</c:when>
																				<c:when test="${reportList.report_reason eq 5}">비매너</c:when>
																				<c:when test="${reportList.report_reason eq 6}">욕설</c:when>
																				<c:when test="${reportList.report_reason eq 7}">기타</c:when>
																			</c:choose>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">신고내용</th>
																		<td class="admin-title" onclick="location.href='CommunityDetail?community_id=${reportList.report_type_id}'">${reportList.report_content}</td>
																	</tr>
																	<tr>
																		<th scope="row">신고날짜</th>
																		<c:set var="datetime" value="${fn:replace(reportList.report_datetime, 'T', ' ')}" />
																		<td>${datetime}</td>
																	</tr>
																	<tr>
																		<th>신고처리 상태</th>
																		<td>
																			<c:choose>
																				<c:when test="${reportList.report_status eq 0}">처리진행중</c:when>
																				<c:when test="${reportList.report_status eq 1}">신고확정</c:when>
																				<c:when test="${reportList.report_status eq 2}">문제없음</c:when>
																			</c:choose>
																			<select id="reportStatus">
																				<option value="0">처리중</option>
																				<option value="1">신고확정</option>
																				<option value="2">문제없음</option>
																			</select>
																		</td>
																	</tr>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="Dismiss">닫기</button>
																<button type="button" class="btn btn-primary" onclick="statusUpdate('${reportList.report_id}')">변경하기</button>
															</div>
														</div>
													</div>
												</div>
												<!-- End Basic Modal-->
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->
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