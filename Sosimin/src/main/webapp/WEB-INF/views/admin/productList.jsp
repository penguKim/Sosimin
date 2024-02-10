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
<script type="text/javascript">
function deleteProduct(id) {
	let product_id = id;
	
	console.log("번호는:" + product_id);
	
	Swal.fire({
		   title: '정말 삭제하시겠습니까?',
		   text: '삭제된 상품은 되돌릴수 없습니다',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '삭제하기', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소하기', // cancel 버튼 텍스트 지정
		   reverseButtons: true, // 버튼 순서 거꾸로
	}).then(result => {
	    // 만약 Promise리턴을 받으면,
	    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	    	$.ajax({
					url: "ProductDelete",
					data: {
						product_id : product_id
					},
					dataType: "json",
					success: function(data) {
						const Toast = Swal.mixin({
						    toast: true,
						    position: 'center-center',
						    showConfirmButton: false,
						    timer: 1000,
						    timerProgressBar: false,
						})
						Toast.fire({
						    icon: 'success',
						    title: '상품이 삭제되었습니다'
						})
						location.reload();
					},
					error: function() {
						const Toast = Swal.mixin({
						    toast: true,
						    position: 'center-center',
						    showConfirmButton: false,
						    timer: 1000,
						    timerProgressBar: false,
						})
						Toast.fire({
						    icon: 'error',
						    title: '상품 삭제를 실패했습니다 ㅠㅠ'
						})
					}
			}); // 신고 등록 ajax 끝
	   	}
	});
}	
	
</script>
</head>
<style>
#image1,#image2,#image3,#image4,#image5 {
	display:inline-block;
	position:relative;
	color: #888;
	cursor: pointer;
	transition: 0.5s;
	width:10px;
}
#image2{
	position: relative;
	left:10px;
}
#image3{
	position: relative;
	left:30px;
}
#image4{
	position: relative;
	left:50px;
}
#image5{
	position: relative;
	left:70px;
}


#image1:hover, #image2:hover, #image3:hover ,#image4:hover , #image5:hover {
	transform: scale(10);
	z-index: 1000;
}
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
		<h1>등록 상품 관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="adminMain">Home</a></li>
					<li class="breadcrumb-item active">상품관리</li>
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
										<th>상품 사진</th>
										<th>아이디</th>
										<th>상품명</th>
										<th>가격</th>
										<th>카테고리</th>
										<th>등록일</th>
										<th>상세보기</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="productList" items="${productList }" varStatus="index">
										<tr>
											<td>
												<img style="width: 80px; height: 80px; " alt="" src="${pageContext.request.contextPath}/resources/upload/${productList.product_image1}">	
											</td>
											<td style="vertical-align: middle;" class="admin-title" onclick="location.href='SellerInfo?member_id=${productList.member_id}'">
												<span class="d-inline-block ellipsis ps-3">${productList.member_id}</span>
											</td>
											<td style="width: 500px; vertical-align: middle;"class="admin-title text-start" onclick="location.href='ProductDetail?product_id=${productList.product_id}'">
												<span class="d-inline-block ellipsis ps-3">${productList.product_name}</span>
											</td>
											<td style="vertical-align: middle;">
												<fmt:formatNumber value="${productList.product_price}" pattern="#,##0" />원
											</td>
											<td style="vertical-align: middle;">${productList.product_category}</td>
											<td style="vertical-align: middle;">
												<c:set var="datetime" value="${fn:split(productList.product_datetime, 'T')}" />
												<c:set var="date" value="${datetime[0]}" />
												${date}
											</td>
											<td class="green" style="vertical-align: middle;">
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-${productList.product_id}">
													상세보기
												</button>
												<!-- Basic Modal -->
												<div class="modal fade" id="modal-${productList.product_id}" tabindex="-1">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">등록된 상품 상세보기</h5><!-- 모달 제목 -->
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="prodismiss"></button>
															</div>
															<div class="modal-body">
																<!-- 모달 내용이 들어가는 부분 -->
																<table class="table modal_table">
																	<tr>
																		<th scope="row">상품번호</th>
																		<td style="">${productList.product_id }</td>
																	</tr>
																	<tr>
																		<th scope="row">판매자</th>
																		<td class="admin-title" onclick="location.href='SellerInfo?member_id=${productList.member_id}'">
																			<span class="d-inline-block ellipsis ps-3">${productList.member_id}</span>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">상품명</th>
																		<td style="width: 500px; vertical-align: middle;"class="admin-title" onclick="location.href='ProductDetail?product_id=${productList.product_id}'">
																			<span class="d-inline-block ellipsis ps-3">${productList.product_name}</span>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">상품설명</th>
																		<td style="width: 500px; vertical-align: middle;"class="admin-title" onclick="location.href='ProductDetail?product_id=${productList.product_id}'">
																			<span class="d-inline-block ellipsis ps-3">${productList.product_txt}</span>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">판매가격</th>
																		<td>
																			<fmt:formatNumber value="${productList.product_price}" pattern="#,##0" />원
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">판매위치</th>
																		<td>부산광역시 ${productList.gu } ${productList.dong }</td>
																	</tr>
																	<tr>
																		<th scope="row">상품등록일</th>
																		<td>
																			<c:set var="datetime" value="${fn:split(productList.product_datetime, 'T')}" />
																			<c:set var="date" value="${datetime[0]}" />
																			${date}
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">카테고리</th>
																		<td>${productList.product_category }</td>
																	</tr>
																	<tr>
																		<th scope="row">거래상태</th>
																		<td>
																			<c:choose>
																				<c:when test="${productList.product_status eq 0}">거래대기</c:when>
																				<c:when test="${productList.product_status eq 1}">거래중</c:when>
																				<c:when test="${productList.product_status eq 2}">거래완료</c:when>
																			</c:choose>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">거래방법</th>
																		<td>
																			<c:choose>
																				<c:when test="${productList.trade_method eq 0}">대면거래</c:when>
																				<c:when test="${productList.trade_method eq 1}">비대면거래</c:when>
																			</c:choose>
																		</td>
																	</tr>
																	<tr>
																		<th scope="row">상품이미지</th>
																		<td>
																			<c:if test="${not empty productList.product_image1 }"><span id="image1"><img style="width: 20px; height: 20px;" alt="" src="${pageContext.request.contextPath}/resources/upload/${productList.product_image1}"></span></c:if>
																			<c:if test="${not empty productList.product_image2 }"><span id="image2"><img style="width: 20px; height: 20px;" alt="" src="${pageContext.request.contextPath}/resources/upload/${productList.product_image2}"></span></c:if>
																			<c:if test="${not empty productList.product_image3 }"><span id="image3"><img style="width: 20px; height: 20px;" alt="" src="${pageContext.request.contextPath}/resources/upload/${productList.product_image3}"></span></c:if>
																			<c:if test="${not empty productList.product_image4 }"><span id="image4"><img style="width: 20px; height: 20px;" alt="" src="${pageContext.request.contextPath}/resources/upload/${productList.product_image4}"></span></c:if>
																			<c:if test="${not empty productList.product_image5 }"><span id="image5"><img style="width: 20px; height: 20px;" alt="" src="${pageContext.request.contextPath}/resources/upload/${productList.product_image5}"></span></c:if>
																		</td>
																	</tr>
																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="productModal">닫기</button>
																<button type="button" class="btn btn-primary" onclick="deleteProduct('${productList.product_id }')">삭제하기</button>
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