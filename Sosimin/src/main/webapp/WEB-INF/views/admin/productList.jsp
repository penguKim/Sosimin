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
	<%-- sweetalert --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Jan 09 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
function deleteProduct() {
	
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
			Swal.fire('삭제되었습니다!', '화끈하시네요!', 'success');
			$("#modalDismiss").click();
// 	    	$.ajax({
// 					url: "ProductDelete",
// 					data: {
// 					},
// 					success: function() {
// 						Swal.fire('삭제되었습니다!', '화끈하시네요!', 'success');
						
// 					},
// 					error: function() {
// 						Swal.fire('삭제 실패했습니다!', '죄송하지만 다시 부탁해요~!', 'error');
// 					}
// 			}); // 신고 등록 ajax 끝
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
		<h1>등록 상품 관리</h1>
	</div>
  	
  	<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<!-- Table with stripped rows -->
							<div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
								<div class="datatable-top">
									<div class="datatable-dropdown">
									</div>
									<div class="datatable-search">
										<select class="datatable-selector">
											<option>전체</option>
											<option>아이디</option>
											<option>거래방법</option>
											<option>거래장소</option>
											<option>상품상태</option>
											<option>거래상태</option>
										</select>
										<input class="datatable-input" placeholder="정보를 검색하세요"
											type="search" title="Search within table">
										<input type="submit" value="조회" class="btn btn-outline-primary">
									</div>
								</div>
								<div class="datatable-container">
									<table class="table datatable datatable-table">
										<thead>
											<tr>
												<th data-sortable="true">
													<button class="datatable-sorter">
														<b>상품 사진</b>
													</button>
												</th>
												<th data-sortable="true" aria-sort="descending" class="datatable-descending">
													<button class="datatable-sorter">아이디</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">상품명</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">가격</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">글내용</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">카테고리</button>
												</th>
												<th data-format="YYYY/DD/MM" data-sortable="true" data-type="date">
													<button class="datatable-sorter">상품 등록일</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">거래 방법</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">거래 장소</button>
												</th>
												<th data-sortable="true">
													<button class="datatable-sorter">상품 상태</button>
												</th>
												<th data-sortable="true" class="red">
													<button class="datatable-sorter">거래 상태</button>
												</th>
												<th data-sortable="true" class="red">
													<button class="datatable-sorter">비고</button>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr data-index="0">
												<td>
													<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
												</td>
												<td>아이디</td>
												<td>상품명</td>
												<td>가격</td>
												<td>글내용</td>
												<td>카테고리</td>
												<td>2024/01/28</td>
												<td>비대면</td>
												<td>부산진구 부전동</td>
												<td>보통</td>
												<td>거래중</td>
												<td class="green">
													<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" 
							                        		data-bs-target="#productListModal">
															상세
													</button>
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
  
<div class="modal fade review-modal" id="productListModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="reportsubject">등록 상품 상세 정보</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="modalDismiss"></button>
			</div>
			<div class="modal-body">
				<table border="1" class="table datatable datatable-table">
					<tr>
						<th>상품번호</th>
						<td>1</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>admin</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>가짜</td>
					</tr>
					<tr>
						<th>글내용</th>
						<td>이것은 가짜입니다</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>50,000원</td>
					</tr>
					<tr>
						<th>거래 지역</th>
						<td>부산진구 부전동</td>
					</tr>
					<tr>
						<th>상품 등록일</th>
						<td>2024-01-28 16:55:24</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>패션/잡화</td>
					</tr>
					<tr>
						<th>상품 상태</th>
						<td>보통</td>
					</tr>
					<tr>
						<th>거래 방법</th>
						<td>비대면</td>
					</tr>
					<tr>
						<th>거래 상태</th>
						<td>거래중</td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td>
							<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
							<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
							<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
							<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
							<img src="${pageContext.request.contextPath}/resources/images/" width="80px" height="80px">
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal" id="modalDismiss">창닫기</button>
				<button type="button" class="btn btn-outline-primary" onclick="deleteProduct()">삭제하기</button>
			</div>
		</div>
	</div>
</div>
  	
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