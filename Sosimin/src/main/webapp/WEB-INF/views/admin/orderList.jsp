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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script>
$(function() {
	// 파라미터에 order_id 값이 있을 경우 값을 저장
	let order_id = '${param.order_id}';
	if(order_id != null || order_id != '') {
		console.log(order_id);		
	}
	
	
	if (order_id) {
	    openModal(order_id);
	}
});

function openModal(order_id) {
	$("#modal-" + order_id).modal('show');
}

function deleteList(order_id) {
	Swal.fire({
		   title: '정말 삭제하시겠습니까?',
		   text: '삭제된 거래내역은 되돌릴수 없습니다',
		   icon: 'warning',
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '삭제하기', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소하기', // cancel 버튼 텍스트 지정
		   reverseButtons: true, // 버튼 순서 거꾸로
	}).then(result => {
	    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	    	$.ajax({
				url: "DeleteOrderList",
				data: {
					"order_id": order_id
				},
				success: function(data) {
					if(data == "true") {
						Swal.fire({
							position: 'center',
							icon: 'success',
							title: '거래 내역을 삭제했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
						location.reload();
					} else {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '거래 내역 삭제에 실패했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});			
					}
				},
				error: function(request, status, error) {
					// 요청이 실패한 경우 처리할 로직
					console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
				}
			}); 
		} else {
    		 event.preventDefault();
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
			<h1>거래관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">Home</a></li>
					<li class="breadcrumb-item active">거래관리</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th>거래내역번호</th>
										<th>상품명</th>
										<th>거래금액</th>
										<th>판매자</th>
										<th>구매자</th>
										<th>거래상태</th>
										<th>거래일</th>
										<th>상세보기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order_list" items="${orderList}">
										<tr>
											<td style="vertical-align: middle;">${order_list.order_id}</td>
											<td style="width: 500px; text-align: left; vertical-align: middle;">${order_list.product_name}</td>
											<td style="vertical-align: middle;">
												<c:choose>
													<c:when test="${order_list.order_status eq 0}">
														금액확인중
													</c:when>
													<c:when test="${order_list.order_type eq 1}">
														현금거래
													</c:when>
													<c:otherwise>
														<c:set var="payAmount" value="${order_list.payment_amount}" />
														<fmt:formatNumber value="${payAmount}" pattern="#,##0" />원
													</c:otherwise>
												</c:choose>
											</td>
											<td style="vertical-align: middle;">${order_list.product_seller}</td>
											<td style="vertical-align: middle;">${order_list.product_buyer}</td>
											<td style="vertical-align: middle;">
												<c:choose>
													<c:when test="${order_list.order_status eq 0}">거래진행</c:when>
													<c:when test="${order_list.order_status eq 1}">거래완료</c:when>
												</c:choose>
											</td>
											<td style="vertical-align: middle;">
											<c:choose>
												<c:when test="${order_list.order_status eq 0}">거래진행중</c:when>
												<c:otherwise>
													<c:set var="datetime" value="${fn:split(order_list.order_date, 'T')}" />
													<c:set var="date" value="${datetime[0]}" />
													${date}
												</c:otherwise>
											</c:choose>
											</td>
											<td class="green" style="vertical-align: middle;">
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-${order_list.order_id}">
													상세보기
												</button>
												<!-- Basic Modal -->
												<div class="modal fade" id="modal-${order_list.order_id}" tabindex="-1">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">거래내역 상세보기</h5><!-- 모달 제목 -->
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<!-- 모달 내용이 들어가는 부분 -->
																<table class="table modal_table">
																	<tr>
																		<th scope="row">거래내역번호</th>
																		<td>${order_list.order_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">상품번호</th>
																		<td>${order_list.product_id}</td>
																	</tr>
																	<tr>
																		<th scope="row">상품명</th>
																		<td>${order_list.product_name}</td>
																	</tr>
																	<tr>
																		<th scope="row">상품품목</th>
																		<td>${order_list.product_category}</td>
																	</tr>
																	<tr>
																		<th scope="row">판매자</th>
																		<td>${order_list.product_seller}</td>
																	</tr>
																	<tr>
																		<th scope="row">구매자</th>
																		<td>${order_list.product_buyer}</td>
																	</tr>
																	<tr>
																		<th scope="row">거래금액</th>
																		<td>
																			<c:choose>
																				<c:when test="${order_list.order_status eq 0}">
																					금액확인중
																				</c:when>
																				<c:otherwise>
																					<c:set var="payAmount" value="${order_list.payment_amount}" />
																					<fmt:formatNumber value="${payAmount}" pattern="#,##0" />원
																				</c:otherwise>
																			</c:choose>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">거래상태</th>
																		<td>
																			<c:choose>
																				<c:when test="${order_list.order_status eq 0}">거래진행</c:when>
																				<c:when test="${order_list.order_status eq 1}">거래완료</c:when>
																			</c:choose>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">거래일</th>
																		<td>
																			<c:choose>
																				<c:when test="${order_list.order_status eq 0}">거래진행중</c:when>
																				<c:otherwise>
																					<c:set var="datetime" value="${fn:split(order_list.order_date, 'T')}" />
																					<c:set var="date" value="${datetime[0]}" />
																					${date}
																				</c:otherwise>
																			</c:choose>
																		</td>
																	</tr>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
																<button type="button" class="btn btn-primary" onclick="deleteList('${order_list.order_id}')">삭제하기</button>
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