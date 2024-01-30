<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>Sosimin</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
	
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
<script type="text/javascript">
	$(function() {
		
		let width = $(window).width();
		console.log(width);
		
		// 페이징 처리
		if(${pageInfo.page.pageNum <= 1 }) {
			$("#prevPage").addClass("disabled");
		}
		if(${pageInfo.page.pageNum >= pageInfo.maxPage }) {
			$("#nextPage").addClass("disabled");
		}
		
		<%-- 후기 코드 --%>
		$("#reviewCheckFrom").on("click", function() {
			$("#staticBackdropLabel").text("후기 등록");
			$(".modal-body input[type='radio']").attr("disabled", false);
			$("#reviewCheck").empty();
			$("#reviewCheck").html(
					
					'<ul class="list-group">'
						+ '<li class="list-group-item">'
							+ '<input class="form-check-input me-1" type="checkbox" name="hugi1" id="hugi1">'
							+ '<label class="form-check-label" for="hugi1" id="hugiLabel1">'
								+ '제가 있는곳까지 와서 거래했어요'
							+ '</label>'
						+ '</li>'
						+ '<li class="list-group-item">'
							+ '<input class="form-check-input me-1" type="checkbox" name="hugi2" id="hugi2">'
							+ '<label class="form-check-label" for="hugi2" id="hugiLabel2">'
								+ '친절하고 매너가 좋아요'
							+ '</label>'
						+ '</li>'
						+ '<li class="list-group-item">'
							+ '<input class="form-check-input me-1" type="checkbox" name="hugi3" id="hugi3">'
							+ '<label class="form-check-label" for="hugi3" id="hugiLabel3">'
								+ '시간 약속을 잘 지켜요'
							+ '</label>'
						+ '</li>'
						+ '<li class="list-group-item">'
							+ '<input class="form-check-input me-1" type="checkbox" name="hugi4" id="hugi4">'
							+ '<label class="form-check-label" for="hugi4" id="hugiLabel4">'
								+ '응답이 빨라요'
							+ '</label>'
						+ '</li>'
					+ '</ul>'
					
// 					'<div class="form-check">'
// 						+ '<input class="form-check-input" type="checkbox" name="hugi1" id="hugi1">'
// 						+ '<label class="form-check-label" for="hugi1" id="hugiLabel1">'
// 							+ '제가 있는곳까지 와서 거래했어요'
// 						+ '</label>'
// 				+ '	</div>'
// 				+ '	<div class="form-check">'
// 					+ '<input class="form-check-input" type="checkbox" name="hugi2" id="hugi2">'
// 					+ '<label class="form-check-label" for="hugi2" id="hugiLabel2">'
// 						+ '친절하고 매너가 좋아요'
// 					+ '</label>'
// 				+ '</div>'
// 				+ '<div class="form-check">'
// 					+ '<input class="form-check-input" type="checkbox" name="hugi3" id="hugi3">'
// 					+ '<label class="form-check-label" for="hugi3" id="hugiLabel3">'
// 						+ '시간 약속을 잘 지켜요'
// 					+ '</label>'
// 				+ '</div>'
// 				+ '<div class="form-check">'
// 					+ '<input class="form-check-input" type="checkbox" name="hugi4" id="hugi4">'
// 					+ '<label class="form-check-label" for="hugi4" id="hugiLabel4">'
// 						+ '응답이 빨라요'
// 					+ '</label>'
// 				+ '</div>'
			);
			$(".modal-footer").html(
					'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>'
					+ '<button type="submit" class="btn btn-primary" id="reviewBtn" onclick="reviewRegist()">'
					+'후기 등록</button>'	
			);
		});
		
		$("#reviewViewFrom").on("click", function() {
			$("#staticBackdropLabel").text("보낸 후기");
			$(".modal-body input[type='radio']").attr("disabled", true);
			$("#reviewCheck").empty();
			$("#reviewCheck").html(
					'<ul class="list-group list-group-flush">'
						+'<li class="list-group-item">후기입니다1.</li>'
						+'<li class="list-group-item">후기입니다1.</li>'
						+'<li class="list-group-item">후기입니다1.</li>'
						+'<li class="list-group-item">후기입니다1.</li>'
					+'</ul>'
			);
			$(".modal-footer").html(
					'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>'
					+ '<button type="button" class="btn btn-primary" id="reviewBtn" onclick="reviewDelete()">'
					+'후기 삭제</button>'	
			);
		});
		
		$("#option1").on("change", function() {
			$(".modal-body input[type='checkbox']").prop('checked', false);
			$("#hugiLabel1").text("약속 장소에 나타나지 않아요");
			$("#hugiLabel2").text("상품 상태가 설명과 달라요");
			$("#hugiLabel3").text("시간 약속을 잘 지켜요");
			$("#hugiLabel4").text("응답이 없어요");
		});
		
		$("#option2").on("change", function() {
			$(".modal-body input[type='checkbox']").prop('checked', false);
			$("#hugiLabel1").text("제가 있는곳까지 와서 거래했어요");
			$("#hugiLabel2").text("친절하고 매너가 좋아요");
			$("#hugiLabel3").text("시간 약속을 잘 지켜요");
			$("#hugiLabel4").text("응답이 빨라요");
		});
		
// 		$("#reviewRegist").on("click", function() {
// 			if($(".modal-body input[type='checkbox']:checked").length == 0) {
// 				alert("후기를 선택해주세요");
// 			} else {
// 				if(confirm("후기를 등록하시겠습니까?")) {
// 					let data = {};

// 					$(".modal input:checked").each(function() {
// 					    data[$(this).attr('name')] = $(this).val();
// 					});
// 					console.log(data);
// 					$.ajax({
// 						type: "POST",
// 						url: "reviewRegist",
// 						data: data,
// 						success: function(result) {
// 							if(result == 'true') {
// 								alert("후기를 등록했습니다.");
// 								$("#reviewClose").click();
// 							}
// 						}
// 					});
// 				}
// 			}
// 		});
		
// 		$("#reviewDelete").on("click", function() {
// 			console.log("123");
// 			if(confirm("후기를 삭제하시겠습니까?")) {
// 				alert("후기를 삭제했습니다.");
// 				$("#reviewClose").click();
// 			}
// 		});


		$(".categoryBtn .btn-check").on("click", function() {
			$('#CommunityForm #searchKeyword').val('');
			$('#CommunityForm #searchType').val('');
			
			$("#CommunityForm").submit();
		});

		
	});
	
	function reviewRegist() {
		if($(".modal-body input[type='checkbox']:checked").length == 0) {
			alert("후기를 선택해주세요");
		} else {
			if(confirm("후기를 등록하시겠습니까?")) {
				let data = {};

				$(".modal input:checked").each(function() {
				    data[$(this).attr('name')] = $(this).val();
				});
				console.log(data);
				$.ajax({
					type: "POST",
					url: "reviewRegist",
					data: data,
					success: function(result) {
						if(result == 'true') {
							alert("후기를 등록했습니다.");
							$("#reviewClose").click();
						} else if(result == 'false') {
							alert("후기 등록을 실패했습니다.");
						}
					}
				});
			}
		}
	}
	
	function reviewDelete() {
		if(confirm("후기를 삭제하시겠습니까?")) {
			alert("후기를 삭제했습니다.");
			$("#reviewClose").click();
		}
	}
</script>
</head>
<body>
	<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1 로 저장) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>
	<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

	<!-- Preloader -->
	<div class="preloader" style="opacity: 0; display: none;">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->
	
	<!-- Start Header Area -->
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- End Header Area -->
	
	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">XX동 커뮤니티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li>커뮤니티</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
	<section class="communityArea section">
		<div class="container-lg">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewCheckFrom">
				후기 작성 모달창
			</button>
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewViewFrom">
				후기 보기 모달창
			</button>
			<br>
			<br>
			<br>
					<form action="" id="CommunityForm">
			<div class="row mb-5 mx-auto">
				<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12 mb-2" role="group" aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="category" id="allCategory" value="" autocomplete="off" <c:if test="${param.category eq '' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="allCategory">전체</label>
					<input type="radio" class="btn-check" name="category" id="hotCategory" value="4" autocomplete="off" <c:if test="${param.category eq '4' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="hotCategory">인기글</label>
					<input type="radio" class="btn-check" name="category" id="infoCategory" value="1" autocomplete="off" <c:if test="${param.category eq '1' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="infoCategory">동네소식</label>
					<input type="radio" class="btn-check" name="category" id="questionCategory" value="2" autocomplete="off" <c:if test="${param.category eq '2' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="questionCategory">동네질문</label>
					<input type="radio" class="btn-check" name="category" id="dailyCategory" value="3" autocomplete="off" <c:if test="${param.category eq '3' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="dailyCategory">일상</label>
<%-- 					<input type="radio" class="btn-check" name="category" id="allCategory" value="" autocomplete="off" <c:if test="${param.category eq '' }">checked</c:if>> --%>
<!-- 					<label class="btn btn-outline-primary" for="allCategory">전체</label> -->
<%-- 					<input type="radio" class="btn-check" name="category" id="hotCategory" value="hot" autocomplete="off" <c:if test="${param.category eq 'hot' }">checked</c:if>> --%>
<!-- 					<label class="btn btn-outline-primary" for="hotCategory">인기글</label> -->
<%-- 					<input type="radio" class="btn-check" name="category" id="infoCategory" value="info" autocomplete="off" <c:if test="${param.category eq 'info' }">checked</c:if>> --%>
<!-- 					<label class="btn btn-outline-primary" for="infoCategory">동네소식</label> -->
<%-- 					<input type="radio" class="btn-check" name="category" id="questionCategory" value="question" autocomplete="off" <c:if test="${param.category eq 'question' }">checked</c:if>> --%>
<!-- 					<label class="btn btn-outline-primary" for="questionCategory">동네질문</label> -->
<%-- 					<input type="radio" class="btn-check" name="category" id="dailyCategory" value="daily" autocomplete="off" <c:if test="${param.category eq 'daily' }">checked</c:if>> --%>
<!-- 					<label class="btn btn-outline-primary" for="dailyCategory">일상</label> -->
				</div>
				<div class="col-xl-6 col-md-12 col-sm-12 col-12 mx-auto">
	<!-- 					<div class="form-group row row-cols-1 row-cols-sm-2 row-cols-md-2"> -->
						<div class="form-group row d-flex justify-content-end">
							<div class="col-xl-2 col-md-2 col-sm-3 col-3 px-0 mb-2">
<!-- 								<select class="form-select col-xl-1 col-md-3 col-sm-3 col-3" style="width: 20%;"> -->
								<select class="form-select" name="searchType" id="searchType">
									<option value="" <c:if test="${param.searchType eq '' }">selected</c:if>>전체</option>
									<option value="writer" <c:if test="${param.searchType eq 'writer' }">selected</c:if>>작성자</option>
									<option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>
									<option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>
								</select>
							</div>
							<div class="searchKeyword col-xl-5 col-md-6 col-sm-9 col-9 px-1 mb-2">
								<input type="text" name="searchKeyword" id="searchKeyword" class="form-control" value="${param.searchKeyword }">
							</div>
							<div class="searchBtn col-xl-2 col-md-2 d-grid ps-0 pe-2 mb-2">
								<input type="submit" value="검색" class="btn btn-primary" formaction="Community">
							</div>
							<div class="col-xl-2 col-md-2 d-grid px-0 mb-2">
								<input type="button" value="글쓰기" class="writeBtn btn btn-primary" onclick="location.href='CommunityWrite'" />
							</div>
						</div>
				</div>
			</div>
					</form>
			<div class="communityTable">
				<table class="table table-hover contentList text-center">
					<thead>
						<tr class="table-light">
							<th width=5%><span class="d-none d-md-inline">번호</span><span class="d-sm-block d-md-none">게시글</span></th>
							<th class="d-none d-md-table-cell" width=15%>유형</th>
							<th class="d-none d-md-table-cell">제목</th>
							<th class="d-none d-md-table-cell" width=15%>작성자</th>
							<th class="d-none d-md-table-cell" width=20%>게시시간</th>
							<th class="d-none d-md-table-cell" width=8%>조회수</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty communityList }">
							<td colspan="6">결과가 없습니다.</td>
						</c:when>
						<c:otherwise>
						<c:forEach var="com" items="${communityList }" varStatus="status">
						<tr>
							<td>
								<div class="d-none d-md-table-cell px-2"><span>${com.community_id }</span></div>
								<div class="d-sm-block d-md-none">
								<a class="mobileArea row" href="CommunityDetail?category=${com.community_category }&community_id=${com.community_id }&pageNum=${pageNum}">
									<div class="col">
										<div class="row mb-2">
<!-- 											<div class="col-3 text-start"> -->
											<span class="col-3 text-start">
											<c:choose>
												<c:when test="${com.community_category eq '1' }">[동네소식]</c:when>
												<c:when test="${com.community_category eq '2' }">[동네질문]</c:when>
												<c:when test="${com.community_category eq '3' }">[일상]</c:when>
											</c:choose>
											</span>
<!-- 											</div> -->
<!-- 											<div class="col text-start"> -->
												<span class="title col text-start px-0 ellipsis">${com.community_subject }</span>
<!-- 											</div> -->
										</div>
										<div class="row">
											<div class="col text-start">
												<span class="mobileComInfo">${com.community_writer } | ${com.community_datetime } | 조회수 ${com.community_readcount }</span>
											</div>
										</div>
									</div>
									<div class="col-2">
										<c:if test="${com.community_image1 ne ''}">
											<img src="${pageContext.request.contextPath }/resources/upload/${com.community_image1}" style="max-height: 50px;">
										</c:if>
									</div>
								</a>
								</div>
							</td>
							<td class="d-none d-md-table-cell">
								<c:choose>
									<c:when test="${com.community_category eq '1' }">동네소식</c:when>
									<c:when test="${com.community_category eq '2' }">동네질문</c:when>
									<c:when test="${com.community_category eq '3' }">동네일상</c:when>
								</c:choose>
							</td>
							<td id="subject" class="text-start d-none d-md-table-cell" onclick="location.href='CommunityDetail?community_id=${com.community_id }&pageNum=${pageNum}'">
								<a href="CommunityDetail?community_id=${com.community_id }&pageNum=${pageNum}">
									<div class="row">
										<span class="col ellipsis pe-1">${com.community_subject }
										</span>
										<c:if test="${com.community_image1 ne ''}">
											<i class="fa fa-image col-1 px-0 py-1"></i>
										</c:if>
									</div>
								</a>
							</td>
							<td class="d-none d-md-table-cell">${com.community_writer }</td>
							<td class="d-none d-md-table-cell">
								<span id="comDate">${com.community_datetime }</span>
<%-- 								<fmt:formatDate value="${com.community_datetime }" pattern="yy-MM-dd HH:mm"/> --%>
							</td>
							<td class="d-none d-md-table-cell">${com.community_readcount }</td>
						</tr>
					</c:forEach>
						</c:otherwise>
					</c:choose>
					

				</table>
			</div>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item" id="prevPage">
<%-- 						<a href="Community?pageNum=${pageNum - 1}" class="page-link">&laquo;</a> --%>
						<a href="Community?category=${param.category }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }&pageNum=${pageNum - 1}" class="page-link">&laquo;</a>
					</li>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageNum eq i }">
						<li class="page-item active"><span class="page-link">${i }</span></li>
						</c:when>
						<c:otherwise>
						<li class="page-item"><a href="Community?category=${param.category }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }&pageNum=${i }" class="page-link" >${i }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<li class="page-item" id="nextPage">
						<a href="Community?category=${param.category }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }&pageNum=${pageNum + 1}" class="page-link">&raquo;</a>
					</li>
				</ul>
			</nav>
		</div>
		
		<%-- 후기 모달 설정 --%>
		<div class="modal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">후기 등록</h1>
		<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
					</div>
					<div class="modal-body">
						<div class="d-flex justify-content-center">
							<input type="radio" class="btn-check" name="options" id="option1" value="bad" autocomplete="off">
							<label class="btn btn-outline-primary mx-4" for="option1">별로예요</label>
							<input type="radio" class="btn-check" name="options" id="option2" value="good" autocomplete="off" checked>
							<label class="btn btn-outline-primary mx-4" for="option2">최고예요</label>
						</div>
						<div id="reviewCheck" class="mx-auto my-5 w-75">
		<!-- 					<div class="form-check"> -->
		<!-- 						<input class="form-check-input" type="checkbox" name="hugi1" id="hugi1"> -->
		<!-- 						<label class="form-check-label" for="hugi1" id="hugiLabel1"> -->
		<!-- 							제가 있는곳까지 와서 거래했어요 -->
		<!-- 						</label> -->
		<!-- 					</div> -->
		<!-- 					<div class="form-check"> -->
		<!-- 						<input class="form-check-input" type="checkbox" name="hugi2" id="hugi2"> -->
		<!-- 						<label class="form-check-label" for="hugi2" id="hugiLabel2"> -->
		<!-- 							친절하고 매너가 좋아요 -->
		<!-- 						</label> -->
		<!-- 					</div> -->
		<!-- 					<div class="form-check"> -->
		<!-- 						<input class="form-check-input" type="checkbox" name="hugi3" id="hugi3"> -->
		<!-- 						<label class="form-check-label" for="hugi3" id="hugiLabel3"> -->
		<!-- 							시간 약속을 잘 지켜요 -->
		<!-- 						</label> -->
		<!-- 					</div> -->
		<!-- 					<div class="form-check"> -->
		<!-- 						<input class="form-check-input" type="checkbox" name="hugi4" id="hugi4"> -->
		<!-- 						<label class="form-check-label" for="hugi4" id="hugiLabel4"> -->
		<!-- 							응답이 빨라요 -->
		<!-- 						</label> -->
		<!-- 					</div> -->
						</div>
					</div>
					<div class="modal-footer">
		<!-- 				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button> -->
		<!-- 				<button type="submit" class="btn btn-primary" id="reviewRegist">후기 등록</button> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top">
	    <i class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
</body>
</html>