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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
<script type="text/javascript">
	$(function() {
		console.log(${percentage});
		memberExp(${percentage});
		
		// 관리자 페이지 댓글 클릭시
	    var hashTag = window.location.hash;
	    if(hashTag) { // 스크롤 이동
	        var targetOffset = $(hashTag).offset().top - $(window).height()/2; // 영역의 중간으로 이동
	        $('html, body').animate({
	            scrollTop: targetOffset
	        }, 300, function() { // 댓글 표시
	            $(hashTag).addClass('highlight');
	            setTimeout(function() {
	                $(hashTag).removeClass('highlight');
	            }, 2000);
	        });
	    }
	    
		// 회원의 지역 정보 가져오기
		$.ajax({
			type: "POST",
			url: "TownCheck",
			dataType: "json",
			success: function(data) {
				if(typeof data.gu !== 'undefined') {
					$(".breadcrumbs-content").html(
							'<h1 class="page-title">' + data.gu + '의 커뮤니티</h1>'
							);
				} else {
					$(".breadcrumbs-content").html(
							'<h1 class="page-title">부산광역시의 커뮤니티</h1>'
							);
				}

			}
		});
		
		// 찜정보 가져오기
		$.ajax({
			type: "POST",
			url: "likeShow", <%-- 회원의 찜 정보 가져오기 --%>
			data: {
				community_like_status: 0,
				community_num: ${param.community_id}
			},
			dataType: "json",
			success: function(result) {
				console.log(result);
				if(result.community_num == ${param.community_id}) {
					$(".heart").addClass("is-active");
				}
			},
			error: function(xhr, textStatus, errorThrown) {
					alert("찜 불러오기를 실패했습니다.\n새로고침을 해주세요.");
			}
		});
		
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
        	if($(this).hasClass("isSameWriter")) {
				Swal.fire({
					position: 'center',
					icon: 'warning',
					title: '본인의 게시글은 좋아요할 수 없습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
        	} else {
        		$.ajax({
        			type: "POST",
        			url: "likeCheck",
        			data: {
        				community_like_status: 0,
        				community_num: ${param.community_id}
        			},
        			dataType: "json",
        			success: function(result) { <%-- 응답 결과가 문자열로 전송 --%>
        				if(result.isChecked == 'false') { <%-- 찜을 등록하는 경우 --%>
    						$(".heart").addClass("is-active");
        					$(".likeCount").text(result.likeCount);
            				Swal.fire({
            					position: 'center',
            					icon: 'success',
            					title: '게시글을 추천했습니다.',
            					showConfirmButton: false,
            					timer: 2000,
            					toast: true
            				});
        				} else if(result.isChecked == 'true') { <%-- 찜을 삭제하는 경우 --%>
    						$(".heart").removeClass("is-active");
        					$(".likeCount").text(result.likeCount);
            				Swal.fire({
            					position: 'center',
            					icon: 'success',
            					title: '게시글 추천을 삭제했습니다.',
            					showConfirmButton: false,
            					timer: 2000,
            					toast: true
            				});
        				}
        			},
        			error: function(xhr, textStatus, errorThrown) {
        				Swal.fire({
        	    	        title: '회원만 사용가능합니다.',
        	    	        text: '로그인 페이지로 이동하시겠습니까?',
        	    	        icon: 'error',
        	    	        showCancelButton: true,
        	    	        confirmButtonColor: '#39d274',
        	    	        cancelButtonColor: '#d33',
        	    	        confirmButtonText: '이동',
        	    	        cancelButtonText: '취소',
        	    	        reverseButtons: true,
        	    	        allowOutsideClick: false
        	    	    }).then((result) => {
        	    	        if (result.isConfirmed) {
        	    	        	location.href="MemberLogin";
        	    	        }
        	    	    });
        			}
        		});
        	}

        });
		
		// 신고 버튼 클릭 이벤트
//         $(".reportBtn").on("click", function() {
// 			if(confirm("신고하시겠습니까?")) {
// 				alert("신고했습니다.");
// 			}
// 		});
        
        // 댓글 숨기기/보이기 버튼 클릭 이벤트
        $("#replyBtn").on("click", function() {
			$(this).toggleClass("replyHide");
			if($(this).hasClass("replyHide")) {
				$("#replyArea").hide();
				$("#replyBtn").text("댓글 보이기");
			} else {
				$("#replyArea").show();
				$("#replyBtn").text("댓글 숨기기");
			}
		});
        
        // 댓글 글자수 제한
	    $('#replyTextarea').on('keyup', function() {
	        var text = $(this).val();
	        
	        // 텍스트 제한
	        if(text.length == 0 || text == "") {
		        $('#reLenth').text('(0/100)자까지 입력이 가능합니다.');
	        } else {
		        $('#reLenth').text('(' + text.length + '/100)자까지 입력이 가능합니다.');
	        }
	        
	        // 글자수 제한
	        if (text.length > 100) {
	        	// 제한수 넘으면 자르기
	            $(this).val($(this).val().substring(0, 99));
	            
				Swal.fire({
					position: 'center',
					icon: 'warning',
					title: '글자수는 100자까지 입력 가능합니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
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
    	        allowOutsideClick: false
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
	        allowOutsideClick: false
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
	        allowOutsideClick: false
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
	    					Swal.fire({
	    						position: 'center',
	    						icon: 'error',
	    						title: '댓글 삭제 실패!',
	    						showConfirmButton: false,
	    						timer: 2000,
	    						toast: true
	    					});
	    				} else if(result == "invalidSession") { // 세션아이디 없을 경우
	    					Swal.fire({
	    						position: 'center',
	    						icon: 'warning',
	    						title: '권한이 없습니다.',
	    						showConfirmButton: false,
	    						timer: 2000,
	    						toast: true
	    					});
	    					return;
	    				}
	    			},
	    			error: function() {
    					Swal.fire({
    						position: 'center',
    						icon: 'warning',
    						title: '요청 실패!',
    						showConfirmButton: false,
    						timer: 2000,
    						toast: true
    					});
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
			});
			$("#replyTextarea").focus();
			return;
		} else {
			 $(".needs-validation")[0].submit();
		}
		
		
	}
	
	// 대댓글 입력창
	var tempBubble;
	function reReplyWriteForm(reply_id, reply_re_ref, reply_re_lev, reply_re_seq) {
		console.log(reply_id, reply_re_ref, reply_re_lev, reply_re_seq);
    
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
				+ '<textarea class="form-control" id="reReplyTextarea" name="reply_content" required onkeyup="reReplyCheck()"></textarea>'
				+ '<input type="submit" class="btn btn-primary" value="댓글쓰기" id="reReplySubmit" onclick="reReplyWrite(this)">'
				+ '</form>'
				+ '<label id="reReLenth" for="reReplyTextarea" style="color: #888;">(0/100)자까지 입력이 가능합니다.</label>'
				+ '</div>'
				+ '</div>'
		);
	}
	
	// 대댓글 글자수 제한
	function reReplyCheck(reReply) {
        var text = $("#reReplyTextarea").val();
        
        // 텍스트 제한
        if(text.length == 0 || text == "") {
	        $('#reReLenth').text('(0/100)자까지 입력이 가능합니다.');
        } else {
	        $('#reReLenth').text('(' + text.length + '/100)자까지 입력이 가능합니다.');
        }
        
        // 글자수 제한
        if (text.length > 100) {
        	// 제한수 넘으면 자르기
            $("#reReplyTextarea").val(text.substring(0, 99));
            
			Swal.fire({
				position: 'center',
				icon: 'warning',
				title: '글자수는 100자까지 입력 가능합니다.',
				showConfirmButton: false,
				timer: 2000,
				toast: true
			});
        }
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
					Swal.fire({
						position: 'center',
						icon: 'warning',
						title: '댓글 삭제 실패!',
						showConfirmButton: false,
						timer: 2000,
						toast: true
					});
				}
			},
			error: function() {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '요청 실패!',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			}
			
		});
		
	}
	
	// 회원 경험치 프로그레스바
	function memberExp(percent) {
	// 스타일 요소를 만들고, @keyframes 규칙을 추가합니다.
	$('<style>')
	.prop('type', 'text/css')
	.html(`
		@keyframes progress-animation {
			0%   {width: 0%;}
			100% {width: percent + '%';}
		}
	`)
	.appendTo('head');
	
	// 프로그레스바 애니메이션을 시작합니다.
	$('.progress-bar').css('width', percent + '%').attr('aria-valuenow', percent + '%').text(percent + '%');
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
	<%-- 신고하기 기능 --%>
	<jsp:include page="../report/report.jsp"></jsp:include>
	<!-- End Header Area -->
	
	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">&nbsp;</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="Community?pageNum=${param.pageNum }">커뮤니티</a></li>
                        <li>상세 게시글</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<!-- End Breadcrumbs -->

	<!-- 게시판 상세내용 보기 -->
	<section class="communityArea section">
		<div class="container">
			<div class="communityDetail post p-4 mx-auto rounded-3 p-4"  style="width: 65%;">
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
			        	<div class="profile_image col-xl-1 col-2 me-1 pe-0">
						<a href="SellerInfo?member_id=${com.member_id }">
							<c:choose>
								<c:when test="${empty com.member_profile }">
									<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg">
								</c:when>
								<c:otherwise>
									<img class="rounded-circle " src="${pageContext.request.contextPath}/resources/upload/${com.member_profile}">
								</c:otherwise>
							</c:choose>
						</a>
				        </div>
				        <div class="col">
				        	<div class="row align-items-center">
						        <a class="col-auto" href="SellerInfo?member_id=${com.member_id }"><p class="fs-5 fw-bold">${com.member_nickname}</p></a>
						        <p class="col-auto fs-6">${com. dong}</p>
				        	</div>
				        	<div class="row align-items-center">
				        		<div class="col-xl-auto col-auto fs-6">
						        	LV. ${com.member_level }
					        	</div>
					        	<div class="col-xl-4 col-3">
									<div class="progress">
										<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
					        	</div>
						        <p class="col-auto offset-md-3 fs-6" id="comDate">${com.community_datetime }</p>
						        <p class="col-auto fs-6">조회수 ${com.community_readcount }</p>
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
								<img src="${pageContext.request.contextPath }/resources/upload/${image}" style="width:40%; height:40%;" class="imgFIle" onclick="imageModal(this)">
							</div>
			    		</c:if>
			    	</c:forEach>
					</div>
					<div class="row" style="height: 80px;">
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${com.community_writer ne sessionScope.sId}"> --%>
								<div class="col-1">
									<div class="heart <c:if test="${com.community_writer eq sessionScope.sId }">isSameWriter</c:if>"></div>
								</div>
								<span class="likeCount col-1 align-self-end ps-0" style="font-size: 20px;">${likeCount }</span>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<div class="col-1"></div> -->
<!-- 								<div class="col-1"></div> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
						<div class="col align-self-end btn btn-outline-secondary btn-sm align-top" id="replyBtn">
							댓글 숨기기
						</div>
						<c:choose>
							<c:when test="${com.community_writer ne sessionScope.sId and sessionScope.sId ne 'admin' and com.community_writer ne 'admin' }">
								<input type="hidden" id="report_type" value="3">
	                       		<input type="hidden" id="report_name" value="${com.community_subject}">
	                       		<input type="hidden" id="report_type_id" value="${com.community_id}">
	                       		<input type="hidden" id="reportee_id" value="${com.community_writer}">
								<div class="col-1 align-self-end" style="width: 80px;"><i class="reportBtn fa fa-warning d-flex justify-content-end" data-bs-toggle="modal" data-bs-target="#reportModal" style="font-size:24px"></i></div>
<!-- 								<span class="reportBtn fa fa-warning d-flex justify-content-end" data-bs-toggle="modal" data-bs-target="#reportModal" style="font-size:20px; white-space: nowrap">신고하기</span> -->
							</c:when>
							<c:otherwise>
								<div class="col-2"></div>
							</c:otherwise>
						</c:choose>
					</div>
			    </div>
			</div>
			<section id="replyArea" class="reply rounded-3 p-4 mx-auto"  style="width: 65%;">
<!-- 			<section id="replyArea" class="reply collapse rounded-3 p-4 w-50 mx-auto"> -->
				<form action="CommunityReplyWrite" method="post" class="needs-validation replyForm d-flex justify-content-center">
					<input type="hidden" name="community_id" value="${com.community_id }">
					<input type="hidden" name="pageNum" value="${param.pageNum }">
					<c:choose>
						<c:when test="${empty sessionScope.sId }">
							<textarea class="form-control" id="replyTextarea" name="reply_content" placeholder="로그인 한 사용자만 작성 가능합니다" disabled></textarea>
							<input type="submit" class="btn btn-primary" value="댓글쓰기" id="replySubmit" disabled>
						</c:when>
						<c:otherwise>
							<textarea class="form-control" id="replyTextarea" name="reply_content" required></textarea>
							<input type="submit" class="btn btn-primary col-2 px-0" value="댓글쓰기" id="replySubmit" onclick="ReplyWrite()">
						</c:otherwise>
					</c:choose>
				</form>
				<label id="reLenth" for="replyTextarea">(0/100)자까지 입력이 가능합니다.</label>
				<div id="replyListArea">
					<table class="table">
					<c:forEach var="reply" items="${replyList }" varStatus="index">
						<tr id="replyTr_${reply.reply_id }" class="replyArea">
							<td class="replyContent">
								<div class="row">
									<c:forEach var="i" begin="1" end="${reply.reply_re_lev }">
										<div class="col-1"></div>
									</c:forEach>
										<div class="col-auto align-self-top pe-0">
											<a href="SellerInfo?member_id=${reply.reply_writer }">
												<c:choose>
													<c:when test="${empty reply.member_profile }">
														<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg">
													</c:when>
													<c:otherwise>
														<img class="rounded-circle " src="${pageContext.request.contextPath}/resources/upload/${reply.member_profile}">
													</c:otherwise>
												</c:choose>
											</a>
										</div>
									<div class="col">
										<div class="row">
											<div class="col-auto pe-0 align-self-center">
												<a  href="SellerInfo?member_id=${reply.reply_writer }"><span class="fs-6 fw-bold">${reply.member_nickname }</span></a>
											</div>
											<div class="col-auto pe-0">
												<p>${reply.dong }</p>
											</div>
											<div class="col">
												<c:choose>
													<c:when test="${reply.reply_writer eq 'admin' }">
														<span class="badge rounded-pill text-bg-secondary" style="background-color: #000;">관리자</span>
													</c:when>
													<c:when test="${reply.reply_writer eq sessionScope.sId }">
														<span class="badge rounded-pill text-bg-secondary">작성자</span>
													</c:when>
												</c:choose>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<span class="align-middle">${reply.reply_content }</span>
											</div>
										</div>
										<c:if test="${not empty sessionScope.sId }">
										<div class="row" id="reReplyBtn"> <%-- 대댓글 버튼 --%>
											<div class="col">
												<a class="replyBtn" href="javascript:reReplyWriteForm(${reply.reply_id }, ${reply.reply_re_ref }, ${reply.reply_re_lev }, ${reply.reply_re_seq })">
													<i class="fa fa-comment-o" style="font-size:18px;"></i>
												</a>
											</div>
										</div>
										</c:if>
									</div>
									<div class="col-3"> <%-- 삭제/신고 버튼 --%>
										<div class="row mb-3">
											<span class="text-end">${reply.reply_datetime }</span>
										</div>		
															
										<div class="row">
											<c:choose>
<%-- 												<c:when test="${reply.reply_writer eq 'admin' }"><span></span></c:when> --%>
												<c:when test="${empty sessionScope.sId or sessionScope.sId ne reply.reply_writer and sessionScope.sId ne 'admin' }">
													<div class="col-1 offset-md-6" style="width: 80px;">
														<input type="hidden" id="replyreportee_${index.index}" value="${reply.reply_writer }">
    													<i class="reportBtn fa fa-warning d-flex justify-content-end" data-bs-toggle="modal" data-bs-target="#replyModal" style="font-size:18px" data-id="${index.index}"></i>
													</div>
												</c:when>
												<c:when test="${sessionScope.sId eq reply.reply_writer or sessionScope.sId eq 'admin' }">
													<span class="reDelBtn text-end">
														<a href="javascript:confirmReplyDelete(${reply.reply_id })">
															<i class="fa fa-times-circle align-middle" style="font-size:22px"></i>
														</a>
													</span>
												</c:when>
											</c:choose>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>
			</section>
			<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="commandCell"  style="width: 65%;">
				<c:if test="${not empty sessionScope.sId and (sessionScope.sId eq com.community_writer or sessionScope.sId eq 'admin') }">
					<input type="button" class="btn btn-secondary col-xl-2 col-md-3 col-12 me-2" id="modifyBtn" value="수정">
					<input type="button" class="btn btn-danger col-xl-2 col-md-3 col-12 me-auto" value="삭제" onclick="confirmDelete()">
				</c:if>
				<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="목록" 
						onclick="location.href='Community?category=${param.category }&searchType=${param.searchType }&searchKeyword=${param.searchKeyword }&pageNum=${param.pageNum }'">
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
<%-- 	<script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script> --%>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	</body>
</html>