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
			<h1>${payList.member_id} 님의 페이 정보</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">Home</a></li>
					<li class="breadcrumb-item">페이관리</li>
					<li class="breadcrumb-item">페이정보관리</li>
					<li class="breadcrumb-item active">회원 페이 정보</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<table class="top_table">
								<tr>
									<th>페이 번호</th>
									<td>${payList.pay_id}</td>
									<th>회원아이디</th>
									<td>${payList.member_id}</td>
									<th>가입상태</th>
									<td>
										<c:choose>
											<c:when test="${payList.pay_status eq '0'}">정상</c:when>
											<c:when test="${payList.pay_status eq '1'}">탈퇴</c:when>
										</c:choose>
									</td>
									<td class="green">
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-${pay_list.pay_history_id}">
											정보수정
										</button>
										<!-- Basic Modal -->
										<div class="modal fade" id="modal-${pay_list.pay_history_id}" tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">소심페이 정보수정</h5><!-- 모달 제목 -->
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<!-- 모달 내용이 들어가는 부분 -->
														<table class="table modal_table">
															<tr>
																<th scope="row">소심페이잔액</th>
																<td>
																	<input type="text" placeholder="${payList.pay_balance}">
																</td>
															</tr>
															<tr>
																<th scope="row">소심페이상태</th>
																<td>
																	<select>
																		<option <c:if test="${payList.pay_status eq '0'}">selected</c:if>>정상</option>
																		<option <c:if test="${payList.pay_status eq '1'}">selected</c:if>>탈퇴</option>
																	</select>
																</td>
															</tr>
															<tr>
																<th scope="row">소심페이비밀번호</th>
																<td><input type="password" maxlength="6" placeholder="변경시에만 입력"></td>
															</tr>
														</table>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
														<button type="button" class="btn btn-primary">변경하기</button>
													</div>
												</div>
											</div>
										</div>
										<!-- End Basic Modal-->
									</td>
								</tr>
							</table>
						
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th>페이내역번호</th>
										<th>거래금액</th>
										<th>거래유형</th>
										<th>거래일</th>
										<th>상세보기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pay_list" items="${payHistoryList}">
										<tr>
											<td>${pay_list.pay_history_id}</td>
											<td>
												<c:set var="payAmount" value="${pay_list.pay_amount}" />
												<fmt:formatNumber value="${payAmount}" pattern="#,##0" />원
											</td>
											<td>
												<c:choose>
													<c:when test="${pay_list.pay_history_type eq '1'}">충전</c:when>
													<c:when test="${pay_list.pay_history_type eq '2'}">환급</c:when>
													<c:when test="${pay_list.pay_history_type eq '3'}">사용</c:when>
													<c:when test="${pay_list.pay_history_type eq '4'}">수익</c:when>
												</c:choose>
											</td>
											<td>
												<c:set var="datetime" value="${fn:split(pay_list.pay_history_date, 'T')}" />
												<c:set var="date" value="${datetime[0]}" />
												${date}
											</td>
											<td class="green">
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-${pay_list.pay_history_id}">
													상세보기
												</button>
												<!-- Basic Modal -->
												<div class="modal fade" id="modal-${pay_list.pay_history_id}" tabindex="-1">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">페이사용내역 상세보기</h5><!-- 모달 제목 -->
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<!-- 모달 내용이 들어가는 부분 -->
																<table class="table modal_table">
																	<tr>
																		<th scope="row">페이내역번호</th>
																		<td>${pay_list.pay_history_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">pay번호</th>
																		<td>${pay_list.pay_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">회원아이디</th>
																		<td>${payList.member_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">거래금액</th>
																		<td>
																			<c:set var="payAmount" value="${pay_list.pay_amount}" />
																			<fmt:formatNumber value="${payAmount}" pattern="#,##0" />원
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">거래유형</th>
																		<td>
																			<c:choose>
																				<c:when test="${pay_list.pay_history_type eq '1'}">충전</c:when>
																				<c:when test="${pay_list.pay_history_type eq '2'}">환급</c:when>
																			</c:choose>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">소심페이잔액</th>
																		<td>
																			<c:set var="payBalance" value="${pay_list.pay_history_balance}" />
																			<fmt:formatNumber value="${payBalance}" pattern="#,##0" />원
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">거래일</th>
																		<td>
																			<c:set var="datetime" value="${fn:split(pay_list.pay_history_date, 'T')}" />
																			<c:set var="date" value="${datetime[0]}" />
																			${date}
																		</td>
																	</tr>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
																<button type="button" class="btn btn-primary">거래취소</button>
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