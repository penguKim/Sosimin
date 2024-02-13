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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" /> --%>

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
	// 후기보기 버튼 클릭 시 호출되는 함수 정의
	function reviewView(btn) {
		let review_id = $(btn).data("id");
		let modal = $("#reviewModal_"+ review_id);
		// 모달 제목 변경
		modal.find(".modal-title").text("보낸 후기 보기");
		// 카테고리 disabled
		$("#categoryBtnArea_" + review_id).find("input[type='radio']").attr("disabled", true);
		$("#reviewCheck_" + review_id).empty();
		
		$.ajax({
			type: "POST",
			url: "AdminReviewView",
			data: {
				review_id: review_id
			},
			dataType: "json",
			success: function(result) {
	// 			console.log(result);
				$("#reviewCheck_" + review_id).html('<ul class="list-group list-group-flush ps-4 reviewList' + review_id + '"></ul>');
				let list = $(".reviewList" + review_id);
				if(result.review_status == "good") {
					$("#option1_" + review_id).prop("checked", false);
					$("#option2_" + review_id).prop("checked", true);
					
					if(result.review_check1 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">제가 있는곳까지 와서 거래했어요</li>');
					}
					if(result.review_check2 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">친절하고 매너가 좋아요</li>');
					}
					if(result.review_check3 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">시간 약속을 잘 지켜요</li>');
					}
					if(result.review_check4 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">응답이 빨라요</li>');
					}
					
				} else {
					$("#option1_" + review_id).prop("checked", true);
					$("#option2_" + review_id).prop("checked", false);
					
					if(result.review_check1 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">약속 장소에 나타나지 않아요</li>');
					}
					if(result.review_check2 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">상품 상태가 설명과 달라요</li>');
					}
					if(result.review_check3 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">시간 약속을 못 지켜요</li>');
					}
					if(result.review_check4 == "on") {
						$(list).append('<li class="list-group-item fs-6 fw-bold">응답이 없어요</li>');
					}
				}
				
				$(".modal-footer").html(
						'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose_' + review_id + '">창닫기</button>'
						+ '<button type="button" class="btn btn-primary" id="reviewBtn" onclick="reviewDelete(' + review_id + ')">'
						+'후기 삭제</button>'	
				);
			},
			error: function(xhr, textStatus, errorThrown) {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '비정상적인 접근입니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			}
		});
	}

	// 보낸 후기 버튼을 눌러 후기 삭제하기
	function reviewDelete(review_id) {
// 		let btnParent = $(".reviewBtn_" + review_id).parent();
		Swal.fire({
	        title: '후기를 삭제하시겠습니까?',
	        text: '삭제 시 보낸 회원의 경험치가 차감됩니다.',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#888',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	    	if (result.isConfirmed) {

				$.ajax({
					type: "POST",
					url: "AdminReviewDelete",
					data:{
						review_id: review_id						
					},
					success: function(result) {
						if(result == 'true') {
							Swal.fire({
								position: 'center',
								icon: 'success',
								title: '보낸 후기를 삭제했습니다.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
							});
				    		$("#reviewClose_" + review_id).click();
				    		$(".review_" + review_id).remove();
						} else if(result == 'false') {
							Swal.fire({
								position: 'center',
								icon: 'error',
								title: '후기 등록을 실패했습니다.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
							});
						}
					}
				}); // ajax 끝
	    	}
	    }); // confirm 끝
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
			<h1>리뷰관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="AdminMain">Home</a></li>
					<li class="breadcrumb-item active">리뷰관리</li>
				</ol>
			</nav>
		</div><!-- End Page Title -->
	
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<!-- Table with stripped rows -->
							<table class="table datatable text-center table-hover">
								<thead>
									<tr>
										<th class="text-center">리뷰번호</th>
										<th class="text-center">상품명</th>
										<th class="text-center">결제 번호</th>
										<th class="text-center">보낸 회원</th>
										<th class="text-center">받는 회원</th>
										<th class="text-center">상세보기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="review" items="${reviewList}">
										<tr class="review_${review.review_id }">
											<td class="align-middle">${review.review_id}</td>
											<td class="text-start align-middle ps-5">${review.product_name}</td>
											<td class="align-middle">${review.order_id}</td>
											<td class="align-middle">${review.member_id}</td>
											<td class="align-middle">${review.target_member_id}</td>
											<td class="green">
												<button type="button" class="btn btn-primary" data-id="${review.review_id }" data-bs-toggle="modal" data-bs-target="#reviewModal_${review.review_id}" onclick="reviewView(this)">
													상세보기
												</button>
												<!-- Basic Modal -->
												<div class="modal fade" id="reviewModal_${review.review_id}" tabindex="-1">
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">보낸 리뷰 보기</h5><!-- 모달 제목 -->
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<!-- 모달 내용이 들어가는 부분 -->
																<div class="d-flex justify-content-center" id="categoryBtnArea_${review.review_id}">
																	<input type="radio" class="btn-check" name="review_status" id="option1_${review.review_id}" value="bad" autocomplete="off" onchange="option1(${review.review_id})">
																	<label class="btn btn-outline-primary mx-4" for="option1_${review.review_id}" style="opacity: 1;">별로예요</label>
																	<input type="radio" class="btn-check" name="review_status" id="option2_${review.review_id}" value="good" autocomplete="off" onchange="option2(${review.review_id})">
																	<label class="btn btn-outline-primary mx-4" for="option2_${review.review_id}" style="opacity: 1;">최고예요</label>
																</div>
																<div id="reviewCheck_${review.review_id}" class="mx-auto my-4 ps-3 w-75 text-start">
																	<c:choose>
																		<c:when test="${review.review_status eq 'good' }">
																		
																		</c:when>
																	</c:choose>
																
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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