<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div class="btn-group categoryBtn px-0 col-xl-6 col-md-12 col-sm-12 col-12" role="group" aria-label="Basic radio toggle button group">
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
						<div class="form-group row">
							<div class="col-xl-3 px-0">
								<select class="form-select w-75">
									<option selected>전체</option>
									<option>작성자</option>
									<option>제목</option>
									<option>내용</option>
								</select>
							</div>
							<input type="text" name="searchKeyword" class="form-control col-xl-4 w-50">
							<input type="button" value="검색" class="btn btn-primary col-xl-2">
							<input type="button" value="글쓰기" class="btn btn-primary col-xl-2" onclick="location.href='CommunityWrite'" />
						</div>
					</form>
				</div>
			</div>
			<div class="communityTable">
				<table class="table table-hover contentList text-center">
					<thead>
						<tr class="table-light">
							<th width=5%>번호</th>
							<th>제목</th>
							<th width=15%>작성자</th>
							<th width=20%>날짜</th>
							<th width=8%>조회수</th>
						</tr>
					</thead>
					<c:forEach var="board" begin="0" end="15" varStatus="status">
						<tr>
							<td>${status.index }</td>
							<td id="subject" class="text-start">
								<a href="CommunityDetail?community_id=1&pageNum=1">
									제목입니다.
									</a>
							</td>
							<td>작성자</td>
							<td>
		<%-- 						<fmt:formatDate value="${board.board_date }" pattern="yy-MM-dd HH:mm"/> --%>
								2024-01-19
							</td>
							<td>0</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled">
						<a class="page-link">&laquo;</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link" href="#">&raquo;</a>
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