<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
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
		

		$(".categoryBtn .btn-check").on("click", function() {
			$('#CommunityForm #searchKeyword').val('');
			$('#CommunityForm #searchType').val('');
			
			$("#CommunityForm").submit();
		});

		
	});
	
</script>
</head>
<body>
	<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1 로 저장) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>

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
                        <h1 class="page-title">자주묻는질문</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="CsMain">고객센터</a></li>
                        <li>자주묻는질문</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
	<section class="communityArea section">
		<div class="container-lg">
					<form action="" id="CommunityForm">
			<div class="row mb-5 mx-auto">
				<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12 mb-2" role="group" aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="category" id="allCategory" value="" autocomplete="off" checked>
					<label class="btn btn-outline-primary" for="allCategory">전체</label>
					<input type="radio" class="btn-check" name="category" id="hotCategory" value="4" autocomplete="off" <c:if test="${param.category eq '4' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="hotCategory">회원</label>
					<input type="radio" class="btn-check" name="category" id="infoCategory" value="5" autocomplete="off" <c:if test="${param.category eq '5' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="infoCategory">거래분쟁</label>
					<input type="radio" class="btn-check" name="category" id="questionCategory" value="6" autocomplete="off" <c:if test="${param.category eq '6' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="questionCategory">소심페이</label>
					<input type="radio" class="btn-check" name="category" id="dailyCategory" value="7" autocomplete="off" <c:if test="${param.category eq '7' }">checked</c:if>>
					<label class="btn btn-outline-primary" for="dailyCategory">사이트이용</label>
				</div>
				<div class="col-xl-6 col-md-12 col-sm-12 col-12 mx-auto">
					<div class="form-group row d-flex justify-content-end">
						<div class="col-xl-2 col-md-2 col-sm-3 col-3 px-0 mb-2">
							<select class="form-select" name="searchType" id="searchType">
								<option value="" <c:if test="${param.searchType eq '' }">selected</c:if>>전체</option>
								<option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>
								<option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>
							</select>
						</div>
						<div class="searchKeyword col-xl-5 col-md-6 col-sm-9 col-9 px-1 mb-2">
							<input type="text" name="searchKeyword" id="searchKeyword" class="form-control" value="${param.searchKeyword }">
						</div>
						<div class="searchBtn col-xl-2 col-md-2 d-grid ps-0 pe-2 mb-2">
							<input type="submit" value="검색" class="btn btn-primary" formaction="CsFaq">
						</div>
					</div>
				</div>
			</div>
					</form>
			<div class="communityTable">
				<table class="table table-hover contentList text-center">
					<thead>
						<tr class="table-light">
							<th class="col-1"><span class="d-none d-md-inline">번호</span><span class="d-sm-block d-md-none">게시글</span></th>
							<th class="col-1 d-none d-md-table-cell">유형</th>
							<th class="col-5 d-none d-md-table-cell">제목</th>
							<th class="col-1 d-none d-md-table-cell">게시시간</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty csFaqList}">
							<td colspan="4">결과가 없습니다.</td>
						</c:when>
						<c:otherwise>
							<c:forEach var="faq" items="${csFaqList}">
								<tr>
									<td class="d-none d-md-table-cell">${faq.cs_type_list_num}</td>
									<td class="d-none d-md-table-cell">
										<c:choose>
											<c:when test="${faq.cs_type_detail eq '4'}">회원</c:when>
											<c:when test="${faq.cs_type_detail eq '5'}">거래분쟁</c:when>
											<c:when test="${faq.cs_type_detail eq '6'}">소심페이</c:when>
											<c:when test="${faq.cs_type_detail eq '7'}">사이트이용</c:when>
										</c:choose>
									</td>
									<td class="d-none d-md-table-cell">
										<a href="CsNoticeDetail?cs_id=${faq.cs_id}">${faq.cs_subject}</a>
									</td>
									<td class="d-none d-md-table-cell">
										<c:set var="datetime" value="${fn:split(faq.cs_date, 'T')}" />
										<c:set var="date" value="${datetime[0]}" />
										${date}
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item" id="prevPage">
						<a href="CsFaq?category=${param.category }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }&pageNum=${pageNum - 1}" class="page-link">&laquo;</a>
					</li>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageNum eq i }">
						<li class="page-item active"><span class="page-link">${i }</span></li>
						</c:when>
						<c:otherwise>
						<li class="page-item"><a href="CsFaq?category=${param.category }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }&pageNum=${i }" class="page-link" >${i }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<li class="page-item" id="nextPage">
						<a href="CsFaq?category=${param.category }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }&pageNum=${pageNum + 1}" class="page-link">&raquo;</a>
					</li>
				</ul>
			</nav>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>