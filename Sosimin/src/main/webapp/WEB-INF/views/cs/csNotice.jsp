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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csStyle.css" />
<script type="text/javascript">
	$(function() {
		
		let width = $(window).width();
		console.log(width);
		
		// 게시시간 변환 함수 호출
		timeAgo();
		
		// 페이징 처리
		if(${pageInfo.page.pageNum <= 1 }) {
			$("#prevPage").addClass("disabled");
		}
		if(${pageInfo.page.pageNum >= pageInfo.maxPage }) {
			$("#nextPage").addClass("disabled");
		}
		

	
	// 게시시간 변환
	function timeAgo() {
		let timeStamp = new Date("${cs.cs_datetime}".replace(" ", "T")).getTime(); // 비교 대상 시간
	    let now = new Date();
        secondsPast = (now.getTime() - timeStamp) / 1000;
	    
	    if(secondsPast < 60){
	    	 $("#csDate").text("방금전");
	    } else if(secondsPast < 60 * 60){
	    	 $("#csDate").text(parseInt(secondsPast/60) + '분전');
	    } else if(secondsPast <= 60 * 60 * 24){
	    	 $("#csDate").text(parseInt(secondsPast/60 * 60) + '시간전');
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
                        <h1 class="page-title">공지사항</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="CsMain">고객센터</a></li>
                        <li>공지사항</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->
	<section class="csArea section">
		<div class="container-lg">
			<div class="row mb-5 mx-auto">
				<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12 mb-2" role="group" aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="category" id="allMenu" value="전체" autocomplete="off" checked>
					<label class="btn btn-outline-primary" for="allMenu">전체</label>
					<input type="radio" class="btn-check" name="category" id="Menu1" value="공지" autocomplete="off">
					<label class="btn btn-outline-primary" for="Menu1">공지</label>
					<input type="radio" class="btn-check" name="category" id="Menu2" value="정책변경" autocomplete="off">
					<label class="btn btn-outline-primary" for="Menu2">정책변경</label>
					<input type="radio" class="btn-check" name="category" id="Menu3" value="사기예방" autocomplete="off">
					<label class="btn btn-outline-primary" for="Menu3">사기예방</label>
				</div>
			</div>
			<div class="csTable">
				<table class="table table-hover contentList text-center">
					<thead>
						<tr class="table-light">
							<th width=5%><span class="d-none d-md-inline">번호</span><span class="d-sm-block d-md-none">나는바보</span></th>
							<th class="d-none d-md-table-cell">제목</th>
							<th class="d-none d-md-table-cell" width=15%>유형</th>
							<th class="d-none d-md-table-cell" width=20%>게시시간</th>
							<th class="d-none d-md-table-cell" width=20%>작성자</th>
						</tr>
					</thead>
					<c:forEach var="cs" items="${csList }" varStatus="status">
						<tr>
							<td>
								${cs.cs_id }
								<div class="d-sm-block d-md-none">
									바보바보
								</div>
							</td>
							<td id="subject" class="text-start d-none d-md-table-cell">
								<a href="CsDetail?cs_id=${cs.cs_id }&pageNum=${pageNum}">
									${cs.cs_subject }
								</a>
							</td>
							<td class="d-none d-md-table-cell">${cs.cs_type }</td>
							<td class="d-none d-md-table-cell">
								<span id="csDate">${cs.cs_datetime }</span>
<%-- 								<fmt:formatDate value="${com.community_datetime }" pattern="yy-MM-dd HH:mm"/> --%>
							</td>
							<td class="d-none d-md-table-cell">${cs.cs_writer }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item" id="prevPage">
						<a href="Cs?pageNum=${pageNum + 1}" class="page-link">&laquo;</a>
					</li>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageNum eq i }">
						<li class="page-item active"><span class="page-link">${i }</span></li>
						</c:when>
						<c:otherwise>
						<li class="page-item"><a href="Cs?pageNum=${i }" class="page-link" >${i }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<li class="page-item" id="nextPage">
						<a href="Cs?pageNum=${pageNum + 1}" class="page-link">&raquo;</a>
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
</body>
</html>