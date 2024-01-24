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
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		
		// 모달 닫기 버튼 클릭 이벤트
		$(".close").on("click", function() {
		  $("#myModal").hide(); <%-- div 영역 숨김 --%>
		});

		// 모달 외부 영역 클릭 시 모달 닫기
		$(window).on("click", function(event) {
			if ($(event.target).is("#myModal")) { <%-- 클릭한 곳이 모달창 바깥 영역일 경우 --%>
				$("#myModal").hide(); <%-- div 영역 숨김 --%>
			}
		});
		
		// 좋아요 버튼 클릭 이벤트
        $(".heart").on("click", function () {
            $(this).toggleClass("is-active");
        });
        
		// 신고 버튼 클릭 이벤트
        $("#reportBtn").on("click", function() {
			if(confirm("신고하시겠습니까?")) {
				alert("신고했습니다.");
			}
		});
        
        // 댓글 숨기기/보이기 버튼 클릭 이벤트
        $("#replyBtn").on("click", function() {
			$(this).toggleClass("replyHide");
			if($(this).hasClass("replyHide")) {
				console.log("댓글창 닫김");
// 				$("#replyArea").hide();
				$("#replyArea").slideUp();
			} else {
				console.log("댓글창 열렸어요!!!");
// 				$("#replyArea").show();
				$("#replyArea").slideDown();
			}
		});
        
        // 게시글 수정
        $("#modifyBtn").on("click", function() {
    		Swal.fire({
    	        title: '게시글을 수정하시겠습니까?',
    	        icon: 'question',
    	        showCancelButton: true,
    	        confirmButtonColor: '#39d274',
    	        cancelButtonColor: '#d33',
    	        confirmButtonText: '수정',
    	        cancelButtonText: '취소',
    	        reverseButtons: true,
    	    }).then((result) => {
    	        if (result.isConfirmed) {
    	        	location.href="CommunityModify?board_num=${board.board_num}&pageNum=${param.pageNum }";
    	        } else {
    	    		$(this).blur();
    	    	}
    	    });
		});
        
        
	});
	
	function confirmDelete() {
		Swal.fire({
	        title: '게시글을 삭제하시겠습니까?',
	        text: "삭제한 게시글은 복구할 수 없습니다.",
	        icon: 'error',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#6c757d',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	location.href="CommunityDelete?board_num=${board.board_num}&pageNum=${param.pageNum }";
	        } else {
	    		$(this).blur();
	    	}
	    });
	}
	
	function imageModal(image) {
		console.log($(image).attr("src"));
		let modal = $("#myModal");
		$(".modal-content").attr("src", $(image).attr("src"));
		modal.show();
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

	<!-- 게시판 상세내용 보기 -->
	<section class="communityArea section">
		<div class="container">
			<div class="communityDetail post p-4 w-50 mx-auto rounded-3 p-4">
			    <div class="post-header border-bottom">
			    	<div class="row"><p>카테고리명</p></div>
			    	<div class="row">
			        	<p class="post-title mb-2">게시글 제목</p>
		        	</div>
			        <div class="row mb-2">
			        	<div class="col-xl-1 col-2 me-1">
				        	<i class="fa fa-github-alt" style="font-size:48px"></i>
				        </div>
				        <div class="col">
				        	<div class="row">
						        <p class="col-xl-2 col-3">홍길동</p>
						        <p class="col">LV.1</p>
				        	</div>
				        	<div class="row">
						        <p class="col-xl-2 col-3">1분전</p>
						        <p class="col">조회수 0</p>
				        	</div>
				        </div>
			        </div>
			    </div>
			    <div class="post-content position-relative mt-3">
			    	<div class="h-auto">
			        <p>근로조건의 기준은 인간의 존엄성을 보장하도록 법률로 정한다. 국무총리는 국회의 동의를 얻어 대통령이 임명한다. 감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.</p>
					<p>모든 국민은 법 앞에 평등하다. 누구든지 성별·종교 또는 사회적 신분에 의하여 정치적·경제적·사회적·문화적 생활의 모든 영역에 있어서 차별을 받지 아니한다.</p>
					<img src="${pageContext.request.contextPath}/resources/images/banner/banner-1-bg.jpg" class="imgFIle" onclick="imageModal(this)">
					</div>
					<div class="d-flex justify-content-between" style="height: 80px;">
						<div class="heart"></div>
<!-- 						<div class="heart position-absolute bottom-0 start-0"></div> -->
						<div class="align-self-end btn btn-outline-secondary btn-sm align-top" id="replyBtn">댓글 숨기기</div>
						<div class="align-self-end" style="width: 80px;"><i class="fa fa-warning d-flex justify-content-end" id="reportBtn" style="font-size:24px"></i></div>
<!-- 						<div class="position-absolute bottom-0 end-0"><i class="fa fa-warning" id="reportBtn" style="font-size:24px"></i></div> -->
					</div>
			    </div>
			</div>
			<section id="replyArea" class="reply rounded-3 p-4 w-50 mx-auto">
				<form action="CommunityReplyWrite" method="post" class="d-flex justify-content-center">
					<input type="hidden" name="board_num" value="${board.board_num }">
					<input type="hidden" name="pageNum" value="${param.pageNum }">
					<%-- 만약, 아이디를 전송해야할 경우 reply_namem 파라미터 포함 --%>
					<%-- 단, 현재는 별도의 닉네임들을 사용하지 않으므로 임시로 세션아이디 전달 --%>
					<%-- (실제로 세션 아이디 사용시에는 컨트롤러에서 HttpSession 객체를 통해 접근) --%>
					<input type="hidden" name="reply_name" value="${sessionScope.sId }">
					<%-- 세션 아이디가 없을 경우(미로그인 시) 댓글 작성 차단 --%>
					<%-- textarea 및 버튼 disabled 처리 --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${empty sessionScope.sId }"> 세션 아이디 없음 --%>
<!-- 							<textarea class="form-control" id="replyTextarea" name="reply_content" placeholder="로그인 한 사용자만 작성 가능합니다" disabled></textarea> -->
<!-- 							<input type="submit" class="btn btn-primary disabled" value="댓글쓰기" id="replySubmit" disabled> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
							<textarea class="form-control" id="replyTextarea" name="reply_content" required></textarea>
							<input type="submit" class="btn btn-primary" value="댓글쓰기" id="replySubmit">
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
				</form>
				<div id="replyListArea">
					<table>
					<tr>
						<td class="replyContent">
						</td>
					</tr>
					<%-- 댓글 내용(reply_content), 작성자(reply_name), 작성일시(reply_date) 표시 --%>
					<%-- 반복문을 통해 List 객체로부터 Map 객체 꺼내서 출력 --%>
					<c:forEach var="tinyReplyBoard" items="${tinyReplyBoardList }">
							<%-- 댓글 1개에 대한 제어(대댓글 작성 폼 표시, 댓글 제거)를 위한 id 값 지정 --%>
							<%-- 각 댓글(tr 태그)별 고유 id 생성하기 위해 댓글 번호를 id 에 조합 --%>
						<tr id="replyTr_${tinyReplyBoard.reply_num }">
							<td class="replyContent">
								<%-- 대댓글 구분을 위해 reply_re_lev 값이 0 보다 크면 들여쓰기(공백2칸) --%>
								<c:forEach var="i" begin="1" end="${tinyReplyBoard.reply_re_lev }">&nbsp;&nbsp;</c:forEach>
								${tinyReplyBoard.reply_content }
								<%-- 세션 아이지 존재할 경우 대댓글 작성 이미지(reply-icon.png) 추가 --%>
								<c:if test="${not empty sessionScope.sId }">
									<%-- 대댓글 작성 아이콘 클릭 시 자바스크립트 함수 reReplyWriteForm() 호출 --%>
									<%-- 파라미터 : 댓글 번호, 댓글 참조글번호, 댓글 들여쓰기레벨, 댓글 순서번호 --%>
									<a href="javascript:reReplyWriteForm(${tinyReplyBoard.reply_num }, ${tinyReplyBoard.reply_re_ref }, ${tinyReplyBoard.reply_re_lev }, ${tinyReplyBoard.reply_re_seq })"> <%-- 하이퍼링크의 기본 기능으로 이동 --%>
										<img src="${pageContext.request.contextPath }/resources/images/reply-icon.png">
									</a>
									<%-- 또한, 세션 아이디가 댓글 작성자와 동일하거나 관리자일 경우 --%>
									<%-- 댓글 삭제이미지(delete-icon.png) 추가 --%>
									<c:if test="${sessionScope.sId eq tinyReplyBoard.reply_name or sessionScope.sId eq 'admin' }">
										<%-- 대댓글 작성 아이콘 클릭 시 자바스크립트 함수 confirmReplyDelete() 호출 --%>
										<%-- 파라미터 : 댓글 번호 --%>
									<a href="javascript:void(0)" onclick="confirmReplyDelete(${tinyReplyBoard.reply_num })"> <%-- void(0)으로 하이퍼링크를 막고 onclick 이벤트로 이동 --%>
										<img src="${pageContext.request.contextPath }/resources/images/delete-icon.png">
									</a>
									</c:if>
								</c:if>
							</td>
							<td class="replyWriter">${tinyReplyBoard.reply_name }</td>
							<td class="replyDate">
		<%-- 						${tinyReplyBoard.reply_date } --%>
								<%-- 파싱은 문자열을 객체로 변환하는것이고 포맷은 객체를 문자열로 변환하는 것이다. --%>
								<%--
								만약, 테이블 조회 결과를 Map 타입으로 저장 시 날짜 및 시각 데이터가
								JAVA 8 부터 지원하는 LocalXXX 타입으로 관리된다! (ex. LocalDate, LocalTime, LocalDateTime)
								=> 일반 Date 타입에서 사용하는 형태로 파싱 후 다시 포맷 변경하는 작업 필요 
								=> JSTL fmt 라이브러리의 <fmt:parseDate> 태그 활용하여 파싱 후
								   <fmt:formatDate> 태그 활용하여 포맷팅 수행
								=> 1) <fmt:parseDate>
								      var : 파싱 후 해당 날짜를 다룰 객체명
								      value : 파싱될 대상 날짜 데이터
								      pattern : 파싱 대상 날짜 데이터의 형식(이 때, 시각을 표시하는 문자 T 는 단순 문자로 취급하기 위해 'T' 로 표기)
								      type : 대상 날짜 파싱 타입(time : 시각, date : 날짜, both : 둘 다)
								   2) <fmt:formatDate>
								      value : 출력(포맷팅)할 날짜 데이터
								      pattern : 포맷팅 할 날짜 형식
								--%>
	<%-- 							<fmt:parseDate var="parsedReplyDate" value="${tinyReplyBoard.reply_date }" pattern="yyyy-MM-dd'T'HH:mm" type="both" />						  --%>
	<%-- 							<fmt:formatDate value="${parsedReplyDate }" pattern="MM-dd HH:mm"/> --%>
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>
			</section>
			<div class="mx-auto w-50 mt-1 mb-3 row d-flex justify-content-between" id="commandCell">
		<%-- 		<c:if test="${not empty sessionScope.sId and (sessionScope.sId eq board.board_name or sessionScope.sId eq 'admin') }"> --%>
					<input type="button" class="btn btn-secondary col-xl-2 col-md-3 col-12 me-2" id="modifyBtn" value="수정">
					<input type="button" class="btn btn-danger col-xl-2 col-md-3 col-12 me-auto" value="삭제" onclick="confirmDelete()">
		<%-- 		</c:if> --%>
				<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="목록" onclick="location.href='Community?pageNum=${param.pageNum}'">
			</div>
		</div>
	</section>
	<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- The Close Button -->
		<span class="close">&times;</span>
		<!-- Modal Content (The Image) -->
		<img class="modal-content" id="img01">
	</div>
	
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