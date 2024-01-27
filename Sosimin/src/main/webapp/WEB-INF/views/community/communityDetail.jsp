<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
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
				$("#replyArea").hide();
// 				$("#replyArea").slideUp();
			} else {
				console.log("댓글창 열렸어요!!!");
				$("#replyArea").show();
// 				$("#replyArea").slideDown();
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
    	        	location.href="CommunityModify?community_id=${com.community_id}&pageNum=${param.pageNum }";
    	        } else {
    	    		$(this).blur();
    	    	}
    	    });
		});
        
        
	});
	
	// 게시글 삭제
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
	        	location.href="CommunityDelete?community_id=${com.community_id}&pageNum=${param.pageNum }";
	        } else {
	    		$(this).blur();
	    	}
	    });
	}
	
	// 이미지 모달
	function imageModal(image) {
		console.log($(image).attr("src"));
		let modal = $("#myModal");
		$(".modal-content").attr("src", $(image).attr("src"));
		modal.show();
	}
	
	// 댓글 삭제
	function confirmReplyDelete(reply_id) {
		Swal.fire({
	        title: '댓글을 삭제하시겠습니까?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#d33',
	        cancelButtonColor: '#d6C757D',
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	        if (result.isConfirmed) {
	    		$.ajax({
	    			type: "GET",
	    			url: "CommunityReplyDelete",
	    			data: {
	    				"reply_id":reply_id
	    			},
	    			dataType: "text",
	    			success: function(result) {
	    				// 댓글 삭제 요청 결과 판별("true"/"false")
	    				if(result == "true") {
	    					// 댓글 삭제 성공 시 해당 댓글의 tr 태그 자체 삭제
	    					// => replyTr_ 문자열과 댓글번호를 조합하여 id 선택자 지정
	    					$("#replyTr_" + reply_id).remove();
	    				} else if(result == "false") {
	    					alert("댓글 삭제 실패");
	    				} else if(result == "invalidSession") { // 세션아이디 없을 경우
	    					alert("권한이 없습니다!");
	    					return;
	    				}
	    			},
	    			error: function() {
	    				alert("요청 실패!");
	    			}
	    		});
	        } else {
	    		$(this).blur();
	    	}
	    });
	}
	
	// 댓글 작성
	function ReplyWrite() {
		event.preventDefault();
		if (!$(".needs-validation")[0].checkValidity()) {
			event.stopPropagation();
			$(".replyForm").addClass('was-validated');
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '내용을 입력해주세요.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			})
			$("#replyTextarea").focus();
			return;
		} else {
			 $(".needs-validation")[0].submit();
		}
		
		
	}
	
	// 대댓글 입력창
	function reReplyWriteForm(reply_id, reply_re_ref, reply_re_lev, reply_re_seq) {
		console.log(reply_id, reply_re_ref, reply_re_lev, reply_re_seq);
		// 대댓글 말풍선 제거
		$("#reReplyBtn").remove();
		// 기존 대댓글 제거
		$("#reReplyTr").remove();
		
		$("#replyTr_" + reply_id + " .replyContent").append(
				'<div class="row" id="reReplyTr">'
				+ '<div class="col">'
				+ '<form action="CommunityReReplyWrite" method="post" class="needs-validation reReplyForm d-flex justify-content-center">'
				+ '<input type="hidden" name="community_id" value="${com.community_id }">'
				+ '<input type="hidden" name="reply_writer" value="${sessionScope.sid }">'
				+ '<input type="hidden" name="reply_id" value="' + reply_id + '">'
				+ '<input type="hidden" name="reply_re_ref" value="' + reply_re_ref + '">'
				+ '<input type="hidden" name="reply_re_lev" value="' + reply_re_lev + '">'
				+ '<input type="hidden" name="reply_re_seq" value="' + reply_re_seq + '">'
				+ '<textarea class="form-control" id="reReplyTextarea" name="reply_content" required></textarea>'
				+ '<input type="submit" class="btn btn-primary" value="댓글쓰기" id="reReplySubmit" onclick="reReplyWrite()">'
				+ '</form>'
				+ '</div>'
				+ '</div>'
		);
	}
	
	// 대댓글 작성
	function reReplyWrite() {
		event.preventDefault();
		if (!$(".needs-validation")[1].checkValidity()) {
			event.stopPropagation();
			$(".reReplyForm").addClass('was-validated');
			Swal.fire({
				position: 'center',
				icon: 'error',
				title: '내용을 입력해주세요.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			})
			$("#reReplyTextarea").focus();
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "CommunityReReplyWrite",
			data: $(".reReplyForm").serialize(),
			dataType: "text",
			success: function(result) {
				if(result == "true") {
					location.reload(); // 페이지 갱신(POST 방식일 시 전달받은 데이터 유지,브라우저 갱신 이력 남지 않음)
				} else {
					alert("댓글 삭제 실패!");
				}
			},
			error: function() {
				alert("요청 실패!");
			}
			
		});
		
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
			    	<div class="row">
			    		<p>
			    			<c:choose>
			    				<c:when test="${com.community_category eq '1' }">동네소식</c:when>
			    				<c:when test="${com.community_category eq '2' }">동네질문</c:when>
			    				<c:when test="${com.community_category eq '3' }">일상</c:when>
			    			</c:choose>
			    		</p>
			    	</div>
			    	<div class="row">
			        	<p class="post-title mb-2">${com.community_subject }</p>
		        	</div>
			        <div class="row mb-2">
			        	<div class="col-xl-1 col-2 me-1">
				        	<i class="fa fa-github-alt" style="font-size:48px"></i>
				        </div>
				        <div class="col">
				        	<div class="row">
						        <p class="col-xl-2 col-3">${com.community_writer }</p>
						        <p class="col">LV. ${com.member_level }</p>
				        	</div>
				        	<div class="row">
						        <p class="col-xl-2 col-3" id="comDate">${com.community_datetime }</p>
						        <p class="col">조회수 ${com.community_readcount }</p>
				        	</div>
				        </div>
			        </div>
			    </div>
			    <div class="post-content position-relative mt-3">
			    	<div class="contentText h-auto" style="min-height: 100px;">
			    	${com.community_content }
					<c:set var="imageName">${com.community_image1},${com.community_image2},${com.community_image3},${com.community_image4},${com.community_image5}</c:set>
					<c:set var="imageArr" value="${fn:split(imageName, ',') }"></c:set>			    	
			    	<c:forEach var="image" items="${imageArr }">
			    		<c:if test="${not empty image }">
	 						<div class="file my-1">
								<img src="${pageContext.request.contextPath }/resources/upload/${image}" class="imgFIle" onclick="imageModal(this)">
							</div>
			    		</c:if>
			    	</c:forEach>
					</div>
					<div class="d-flex justify-content-between" style="height: 80px;">
<%-- 						<c:if test="${com.community_writer ne 'leess'}"> --%>
							<div class="heart"></div>
<%-- 						</c:if> --%>
						<div class="align-self-end btn btn-outline-secondary btn-sm align-top" id="replyBtn">댓글 숨기기</div>
<!-- 						  <button class="align-self-end btn btn-outline-secondary btn-sm align-top" id="replyBtn" type="button" data-bs-toggle="collapse" data-bs-target="#replyArea" aria-expanded="false" aria-controls="collapseExample">댓글 숨기기</button> -->
<%-- 						<c:if test="${com.community_writer ne 'leess'}"> --%>
							<div class="align-self-end" style="width: 80px;"><i class="fa fa-warning d-flex justify-content-end" id="reportBtn" style="font-size:24px"></i></div>
<%-- 						</c:if> --%>
					</div>
			    </div>
			</div>
			<section id="replyArea" class="reply rounded-3 p-4 w-50 mx-auto">
<!-- 			<section id="replyArea" class="reply collapse rounded-3 p-4 w-50 mx-auto"> -->
				<form action="CommunityReplyWrite" method="post" class="needs-validation replyForm d-flex justify-content-center">
					<input type="hidden" name="community_id" value="${com.community_id }">
					<input type="hidden" name="pageNum" value="${param.pageNum }">
<%-- 					<input type="hidden" name="reply_writer" value="${sessionScope.sId }"> --%>
					<%-- 세션 아이디가 없을 경우(미로그인 시) 댓글 작성 차단 --%>
					<%-- textarea 및 버튼 disabled 처리 --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${empty sessionScope.sId }"> 세션 아이디 없음 --%>
<!-- 							<textarea class="form-control" id="replyTextarea" name="reply_content" placeholder="로그인 한 사용자만 작성 가능합니다" disabled></textarea> -->
<!-- 							<input type="submit" class="btn btn-primary disabled" value="댓글쓰기" id="replySubmit" disabled> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
							<textarea class="form-control" id="replyTextarea" name="reply_content" required></textarea>
							<input type="submit" class="btn btn-primary" value="댓글쓰기" id="replySubmit" onclick="ReplyWrite()">
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
				</form>
				<div id="replyListArea">
					<table class="table">
<!-- 					<tr> -->
<!-- 						<td class="replyContent"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					<c:forEach var="reply" items="${replyList }">
						<tr id="replyTr_${reply.reply_id }">
							<td class="replyContent">
								<div class="row">
									<c:forEach var="i" begin="1" end="${reply.reply_re_lev }">
	<!-- 									&nbsp;&nbsp; -->
										<div class="col-1"></div>
									</c:forEach>
									<div class="col">
										<div class="row">
											<div class="col">
												<span class="me-2 mb-2">${reply.reply_writer }</span>
												<c:if test="${reply.reply_writer eq 'leess' }">
													<span class="writerInfo border rounded-3 me-3 align-middle">작성자</span>
												</c:if>
												<span class="float-end">${reply.reply_datetime }</span>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<span class="align-middle">${reply.reply_content }</span>
											</div>
											<div class="col-1">
												<span class="reDelBtn ms-3 align-middle float-end">
													<a href="javascript:confirmReplyDelete(${reply.reply_id })">
														<i class="fa fa-times-circle align-middle" style="font-size:18px"></i>
													</a>
												</span>
											</div>
										</div>
										<div class="row" id="reReplyBtn">
											<div class="col">
												<a href="javascript:reReplyWriteForm(${reply.reply_id }, ${reply.reply_re_ref }, ${reply.reply_re_lev }, ${reply.reply_re_seq })">
													<i class="fa fa-comment-o"></i>
												</a>
											</div>
										</div>
									</div>
<%-- 								${reply.reply_content } --%>
<%-- 								<c:if test="${not empty sessionScope.sId }"> --%>
<%-- 									<a href="javascript:reReplyWriteForm(${reply.reply_id }, ${reply.reply_re_ref }, ${reply.reply_re_lev }, ${reply.reply_re_seq })"> 하이퍼링크의 기본 기능으로 이동 --%>
<!-- 										<i class="fa fa-comment-o"></i> -->
<%-- 										<img src="${pageContext.request.contextPath }/resources/images/reply-icon.png"> --%>
<!-- 									</a> -->
<%-- 									<c:if test="${sessionScope.sId eq reply.reply_writer or sessionScope.sId eq 'admin' }"> --%>
<%-- 									<a href="javascript:void(0)" onclick="confirmReplyDelete(${reply.reply_id })"> void(0)으로 하이퍼링크를 막고 onclick 이벤트로 이동 --%>
<!-- 										<i class="fa fa-times-circle"></i> -->
<%-- 										<img src="${pageContext.request.contextPath }/resources/images/delete-icon.png"> --%>
<!-- 									</a> -->
<%-- 									</c:if> --%>
<%-- 								</c:if> --%>
								</div>
							</td>
<%-- 							<td class="replyWriter">${reply.reply_writer }</td> --%>
<!-- 							<td class="replyDate"> -->
<%-- 								${reply.reply_datetime } --%>
<!-- 							</td> -->
						</tr>
					</c:forEach>
					</table>
				</div>
			</section>
			<div class="mx-auto w-50 mt-1 mb-3 row d-flex justify-content-between" id="commandCell">
		<%-- 		<c:if test="${not empty sessionScope.sId and (sessionScope.sId eq board.board_name or sessionScope.sId eq 'admin') }"> --%>
<%-- 				<c:if test="${com.community_writer ne 'leess'}"> --%>
					<input type="button" class="btn btn-secondary col-xl-2 col-md-3 col-12 me-2" id="modifyBtn" value="수정">
					<input type="button" class="btn btn-danger col-xl-2 col-md-3 col-12 me-auto" value="삭제" onclick="confirmDelete()">
<%-- 				</c:if> --%>
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