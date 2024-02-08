<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
<script type="text/javascript">
	$(function() {
		console.log(${percentage});
	    
		
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
                        <h1 class="page-title">&nbsp;</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="CsMain">고객센터</a></li>
                        <li>
                        	<c:choose>
                        		<c:when test="${detail.cs_type eq 1 }"><a href="CsNotice">공지사항</a></c:when>
                        		<c:when test="${detail.cs_type eq 2 }"><a href="CsFaq">자주묻는 질문</a></c:when>
                        		<c:when test="${detail.cs_type eq 3 }"><a href="CsOneOnOne">1대1문의</a></c:when>
                        	</c:choose>
                        </li>
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
			    	<div class="row mb-3">
			    		<p class="fs-5">
							<c:choose>
								<c:when test="${detail.cs_type_detail eq 1 }">공지</c:when>
								<c:when test="${detail.cs_type_detail eq 2 }">정책변경</c:when>
								<c:when test="${detail.cs_type_detail eq 3 }">사기예방</c:when>
								<c:when test="${detail.cs_type_detail eq 4 }">회원</c:when>
								<c:when test="${detail.cs_type_detail eq 5 }">거래분쟁</c:when>
								<c:when test="${detail.cs_type_detail eq 6 }">소심페이</c:when>
								<c:when test="${detail.cs_type_detail eq 7 }">사이트이용</c:when>
							</c:choose>
			    		</p>
			    	</div>
			    	<div class="row">
			        	<p class="post-title mb-2">${detail.cs_subject }</p>
		        	</div>
			        <div class="row mb-2">
				        <div class="col">
					        <p class="fs-6 text-end" id="comDate">
					        <fmt:parseDate var="date" value="${detail.cs_date }" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
					        <fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
					        </p>
				        </div>
			        </div>
			    </div>
			    <div class="post-content position-relative mt-3">
			    	<div class="contentText h-auto p-3 fs-6" style="min-height: 300px;">
			    	${detail.cs_content }
					</div>
					<hr>
			    </div>
			</div>
			<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="commandCell"  style="width: 65%;">
				<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="목록" 
						onclick="history.back()">
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