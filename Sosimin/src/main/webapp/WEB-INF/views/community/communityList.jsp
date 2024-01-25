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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
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
		
	});
	
	// 게시시간 변환
	function timeAgo() {
		let timeStamp = new Date("${com.community_datetime}".replace(" ", "T")).getTime(); // 비교 대상 시간
	    let now = new Date();
        secondsPast = (now.getTime() - timeStamp) / 1000;
	    
	    if(secondsPast < 60){
	    	 $("#comDate").text("방금전");
	    } else if(secondsPast < 60 * 60){
	    	 $("#comDate").text(parseInt(secondsPast/60) + '분전');
	    } else if(secondsPast <= 60 * 60 * 24){
	    	 $("#comDate").text(parseInt(secondsPast/60 * 60) + '시간전');
	    }
	}
	
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
			<div class="row mb-5 mx-auto">
				<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12 mb-2" role="group" aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="category" id="allCategory" value="전체" autocomplete="off" checked>
					<label class="btn btn-outline-primary" for="allCategory">전체</label>
					<input type="radio" class="btn-check" name="category" id="hotCategory" value="인기글" autocomplete="off">
					<label class="btn btn-outline-primary" for="hotCategory">인기글</label>
					<input type="radio" class="btn-check" name="category" id="infoCategory" value="동네소식" autocomplete="off">
					<label class="btn btn-outline-primary" for="infoCategory">동네소식</label>
					<input type="radio" class="btn-check" name="category" id="questionCategory" value="동네질문" autocomplete="off">
					<label class="btn btn-outline-primary" for="questionCategory">동네질문</label>
					<input type="radio" class="btn-check" name="category" id="dailyCategory" value="일상" autocomplete="off">
					<label class="btn btn-outline-primary" for="dailyCategory">일상</label>
				</div>
				<div class="col-xl-6 col-md-12 col-sm-12 col-12 mx-auto">
					<form action="">
	<!-- 					<div class="form-group row row-cols-1 row-cols-sm-2 row-cols-md-2"> -->
						<div class="form-group row d-flex justify-content-end">
							<div class="col-xl-2 col-md-2 col-sm-3 col-3 px-0 mb-2">
<!-- 								<select class="form-select col-xl-1 col-md-3 col-sm-3 col-3" style="width: 20%;"> -->
								<select class="form-select" name="searchType">
									<option selected value="">전체</option>
									<option value="writer">작성자</option>
									<option value="subject">제목</option>
									<option value="content">내용</option>
								</select>
							</div>
							<div class="searchKeyword col-xl-5 col-md-6 col-sm-9 col-9 px-1 mb-2">
								<input type="text" name="searchKeyword" class="form-control">
							</div>
							<div class="searchBtn col-xl-2 col-md-2 d-grid ps-0 pe-2 mb-2">
								<input type="button" value="검색" class="btn btn-primary">
							</div>
							<div class="col-xl-2 col-md-2 d-grid px-0 mb-2">
								<input type="button" value="글쓰기" class="writeBtn btn btn-primary" onclick="location.href='CommunityWrite'" />
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="communityTable">
				<table class="table table-hover contentList text-center">
					<thead>
						<tr class="table-light">
							<th width=5%><span class="d-none d-md-inline">번호</span><span class="d-sm-block d-md-none">나는바보</span></th>
							<th class="d-none d-md-table-cell">제목</th>
							<th class="d-none d-md-table-cell" width=15%>작성자</th>
							<th class="d-none d-md-table-cell" width=20%>게시시간</th>
							<th class="d-none d-md-table-cell" width=8%>조회수</th>
						</tr>
					</thead>
					<c:forEach var="com" items="${communityList }" varStatus="status">
						<tr>
							<td>
								${com.community_id }
								<div class="d-sm-block d-md-none">
									바보바보
								</div>
							</td>
							<td id="subject" class="text-start d-none d-md-table-cell">
								<a href="CommunityDetail?community_id=${com.community_id }&pageNum=${pageNum}">
									${com.community_subject }
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
				</table>
			</div>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item" id="prevPage">
						<a href="Community?pageNum=${pageNum + 1}" class="page-link">&laquo;</a>
					</li>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageNum eq i }">
						<li class="page-item active"><span class="page-link">${i }</span></li>
						</c:when>
						<c:otherwise>
						<li class="page-item"><a href="Community?pageNum=${i }" class="page-link" >${i }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<li class="page-item" id="nextPage">
						<a href="Community?pageNum=${pageNum + 1}" class="page-link">&raquo;</a>
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