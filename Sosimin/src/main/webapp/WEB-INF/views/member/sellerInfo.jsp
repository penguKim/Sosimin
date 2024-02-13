<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Sosimin</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
<!-- ========================= CSS here ========================= -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<%-- sweetalert --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />

	

<script type="text/javascript">
	


	$(function(){
		
		// 경험치
		memberExp(${percentage});
		
		// url에서 filter 값 추출
		let urlParams = new URLSearchParams(window.location.search);
		let filterValue = urlParams.get("filter");
		  
		// filterValue 값에 따라 해당 필터 글자 굵게 처리
		if(filterValue == null || filterValue == '0') {
			$('.eachFilter:eq(0) a').css('font-weight', 'bold');
		} else if(filterValue == '1') {
			$('.eachFilter:eq(1) a').css('font-weight', 'bold');
		} else if(filterValue == '2') {
			$('.eachFilter:eq(2) a').css('font-weight', 'bold');
		}

		
		// 페이징 처리
		if(${pageInfo.page.pageNum <= 1 }) {
			$("#prevPage").addClass("disabled");
		}
		if(${pageInfo.page.pageNum >= pageInfo.maxPage }) {
			$("#nextPage").addClass("disabled");
		}
		
		// 카테고리 선택
		$("#categoryArea input[type='radio']").on("click", function() {
	//			alert("확인");
			$("#myPageCategory").submit();
		});
	
	
		
		// 좋아요정보 가져오기
		$.ajax({
			type: "POST",
			url: "ShowLikeInfo", <%-- 회원의 좋아요 정보 가져오기 --%>
				dataType: "json",
				success: function(result) {
					console.log(result);
					if(result.length > 0) {
						for(let i = 0; i < ${fn:length(MyPageList)}; i++) {
							let product_id = $(".list" + i).data("id");
							for(let id of result) {
								if(id.product_id == product_id) {
									$(".list" + i).find(".heart").toggleClass("is-active");
								}
							}
						}
					}
				},
				error: function(xhr, textStatus, errorThrown) {
						alert("좋아요 불러오기를 실패했습니다.\n새로고침을 해주세요.");
				}
			});
		
		// 좋아요 버튼 클릭 이벤트
        $(".heart").on("click", function () {
        	if($(this).hasClass("isSameUser")) {
   				Swal.fire({
   					position: 'center',
   					icon: 'warning',
   					title: '내 상품은 좋아요를 누를 수 없어요!',
   					showConfirmButton: false,
   					timer: 2000,
   					toast: true
   				});
        	} else {
	        	let heart = $(this);
	    		$.ajax({
	    			type: "POST",
	    			url: "CheckLike",
	    			data: {
	    				product_id: $(this).parent().data("id")
	    			},
	//     			dataType: "json",
	    			success: function(result) { <%-- 응답 결과가 문자열로 전송 --%>
// 	    				alert(result);
	    				if(result == 'false') { // 좋아요를 등록하는 경우
							$(heart).addClass("is-active");
	        				Swal.fire({
	        					position: 'center',
	        					icon: 'success',
	        					title: '좋아요 추가했습니다.',
	        					showConfirmButton: false,
	        					timer: 2000,
	        					toast: true
	        				});
	    				} else if(result == 'true') { // 좋아요를 삭제하는 경우
							$(heart).removeClass("is-active");
	// 						$(heart).parent().remove();
	        				Swal.fire({
	        					position: 'center',
	        					icon: 'success',
	        					title: '좋아요 삭제했습니다.',
	        					showConfirmButton: false,
	        					timer: 2000,
	        					toast: true
	        				});
	    				} else if(result == 'login') { // 세션 아이디가 없는 경우
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
	    			}	
	    			
	    		});
        		
        		
        	}
        });
		
		// 필터 선택
		$("#myPageFilter a").on("click", function(event) {
			event.preventDefault();
			$("#myPageFilter").submit();
		});
		
		
	}); // document.ready 끝




	// 받은 후기 클릭 및 별로예요 클릭 시 함수 정의
	function openReceivedReviewModal(sId) {
		$("#staticBackdropLabel").text("받은 후기");
 		$("#option1").prop("checked", true); // 기본옵션 별로에요 선택
 		$("#reviewCheck").empty();
 		$.ajax({
			url: "BadReviews",
			data: {
				sId: sId
			},
			dataType: "json",
			success: function(data) {
				if(Object.keys(data).length == 0) {
					console.log("비었음");
		 			$("#reviewCheck").html(
	 					'<ul class="list-group">'
	 					+ '<li class="list-group-item">'
	 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
	 					+ '<h6>' + '0개' + '</h6>'
	 						+ '약속 장소에 나타나지 않아요'
	 					+ '</li>'
	 					+ '<li class="list-group-item">'
	 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
	 					+ '<h6>' + '0개' + '</h6>'
	 						+ '상품 상태가 설명과 달라요'
	 					+ '</li>'
	 					+ '<li class="list-group-item">'
	 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
	 					+ '<h6>' + '0개' + '</h6>'
	 						+ '시간 약속을 안 지켜요'
	 					+ '</li>'
	 					+ '<li class="list-group-item">'
	 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
	 					+ '<h6>' + '0개' + '</h6>'
	 						+ '응답이 없어요'
	 					+ '</li>'
	 					+ '</ul>'
	 				);
				} else {
					console.log("안비었음");
			 		$("#reviewCheck").html(
			 			'<ul class="list-group">'
			 				+ '<li class="list-group-item">'
			 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
			 					+ '<h6>' +  data.review_check1 + '개' + '</h6>'
			 					+ '약속 장소에 나타나지 않아요'
			 				+ '</li>'
			 				+ '<li class="list-group-item">'
			 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
			 					+ '<h6>' +  data.review_check2 + '개' + '</h6>'
			 					+ '상품 상태가 설명과 달라요'
			 				+ '</li>'
			 				+ '<li class="list-group-item">'
			 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
			 					+ '<h6>' +  data.review_check3 + '개' + '</h6>'
			 					+ '시간 약속을 안 지켜요'
			 				+ '</li>'
			 				+ '<li class="list-group-item">'
			 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
			 					+ '<h6>' +  data.review_check4 + '개' + '</h6>'
			 					+ '응답이 없어요'
			 				+ '</li>'
			 			+ '</ul>'
			 		);
				}
			},
			error: function(xhr,textStatus,errorThrown) {
				console.log(xhr + ", " + textStatus + ", " + errorThrown);
			}
		});
	}
	
	// 후기 최고예요 클릭 시 함수 정의
	function goodReviews(sId) {
		$("#staticBackdropLabel").text("받은 후기");
 		$("#option2").prop("checked", true); // 기본옵션 별로에요 선택
 		$("#reviewCheck").empty();
 		$.ajax({
			url: "GoodReviews",
			data: {
				sId: sId
			},
			dataType: "json",
			success: function(data) {
				if(Object.keys(data).length == 0) {
					console.log("비었음");
		 			$("#reviewCheck").html(
		 				'<ul class="list-group">'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' + '0개' + '</h6>'
		 						+ '제가 있는곳까지 와서 거래했어요'
		 					+ '</li>'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' + '0개' + '</h6>'
		 						+ '친절하고 매너가 좋아요'
		 					+ '</li>'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' + '0개' + '</h6>'
		 						+ '시간 약속을 잘 지켜요'
		 					+ '</li>'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' + '0개' + '</h6>'
		 						+ '응답이 빨라요'
		 					+ '</li>'
		 				+ '</ul>'
		 			);
				} else {
					console.log("안비었음");
			 			$("#reviewCheck").html(
		 				'<ul class="list-group">'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' +  data.review_check1 + '개' + '</h6>'
		 						+ '제가 있는곳까지 와서 거래했어요'
		 					+ '</li>'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' +  data.review_check2 + '개' + '</h6>'
		 						+ '친절하고 매너가 좋아요'
		 					+ '</li>'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' +  data.review_check3 + '개' + '</h6>'
		 						+ '시간 약속을 잘 지켜요'
		 					+ '</li>'
		 					+ '<li class="list-group-item">'
		 					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
		 					+ '<h6>' +  data.review_check4 + '개' + '</h6>'
		 						+ '응답이 빨라요'
		 					+ '</li>'
		 				+ '</ul>'
		 			);
				}
			},
			error: function(xhr,textStatus,errorThrown) {
				console.log(xhr + ", " + textStatus + ", " + errorThrown);
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
	<jsp:include page="../report/report.jsp"></jsp:include>
	
	<c:set var="filter" value="${param.filter}" />
	<c:choose>
		<c:when test="${filter == 0}">
			<c:set var="fontWeight" value="bold" />
		</c:when>
		<c:otherwise>
			<c:set var="fontWeight" value="normal" />
		</c:otherwise>
	</c:choose>
	
	
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
                        <h1 class="page-title">판매자페이지</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i>홈</a></li>
                        <li>판매자페이지</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	<section class="item-details section row" id="myPageProfileSectionArea">
        <div class="container">
            <div class="top-area" id="profileArea">
				<div id="profileLeft">
					<c:choose>
						<c:when test="${empty MyProfileMember.member_profile }">
							<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/images/member/Default_pfp.svg">
						</c:when>
						<c:otherwise>
							<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/upload/${MyProfileMember.member_profile}">
						</c:otherwise>
					</c:choose>
				</div>
				<div id="profileRight">
					<div id="profileRightUpperLeft">
						<b id="bold">${MyProfileMember.member_nickname }</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- 인증 완료된 경우 예시 -->
							<p id="sellerAuthArea">
							동네인증
							<c:choose>
								<c:when test="${MyProfileMember.member_neighbor_auth eq 0 }"> <%-- 미인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> 
								</c:when>
								<c:otherwise> <%-- 인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;&nbsp;&nbsp;휴대폰인증
							<c:choose>
								<c:when test="${MyProfileMember.member_phone_auth eq 0 }"> <%-- 미인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> 
								</c:when>
								<c:otherwise> <%-- 인증 --%>
									<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
								</c:otherwise>
							</c:choose>
							
							</p>
					</div>
					<div id="profileRightUpperRight">
<!-- 						<a href="javascript:reviewViewFrom()" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> -->
						<a href="#staticBackdrop" data-bs-toggle="modal" id="reviewViewFrom" onclick="openReceivedReviewModal('${param.member_id }')">
<!-- 						<a href="javascript:reviewViewFrom()"> -->
							<img src="${pageContext.request.contextPath}/resources/images/member/reviewicon.png">
							받은 후기
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="" data-bs-toggle="modal" data-bs-target="#reportModal" id="reportButton">
                       		<input type="hidden" id="report_type" value="1">
                       		<input type="hidden" id="report_name" value="회원">
                       		<input type="hidden" id="report_type_id" value="0">
                       		<input type="hidden" id="reportee_id" value="${param.member_id }">
<%-- 							<img src="${pageContext.request.contextPath}/resources/images/member/reporticon.png"> --%>
							<span class="reportBtn fa fa-warning d-flex justify-content-end" style="font-size:small; white-space: nowrap">신고하기</span>
						</a>
<!--                        	<div class="reportBtn2"> -->
                       		
<!-- 						</div> -->
						
						
					</div>
					<section id="profileRightMiddle" class="row align-items-center">
						<span class="col auto">Lv. ${MyProfileMember.member_level }</span>
			        	<div class="col-xl-2 col-3">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
			        	</div>						
			        	<span class="col auto">상품 판매 ${MyProfileCountProductSold }회</span>
						<span class="col auto">커뮤니티 글 ${MyProfileCountCommunity }개</span>
						<span class="col auto">커뮤니티 댓글 ${MyProfileCountCommunityReply }개</span>
						<span class="col auto">받은 좋아요 ${MyProfileCountCommunityLike }개</span>
					</section>
					<div id="profileRightBottom">
						<p>
						<c:choose>
							<c:when test="${not empty MyProfileMember.member_intro }">
								${MyProfileMember.member_intro }
							</c:when>
							<c:otherwise>
								등록된 소개글이 없습니다.
							</c:otherwise>
						</c:choose>
						</p>
					</div>
				</div>
            </div>
        </div>
    </section>
    <form action="" id="myPageCategory">
		<div id="categoryArea" class="btn-group col categoryBtn" role="group" aria-label="Basic radio toggle button group">
		<input type="hidden" name="member_id" value="${param.member_id }">
		  <input type="radio" class="btn-check" name="category" id="soldCategory" value="1" autocomplete="off" <c:if test="${category eq '1' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="soldCategory">판매내역</label>
		  <input type="radio" class="btn-check" name="category" id="boughtCategory" value="2" autocomplete="off" <c:if test="${category eq '2' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="boughtCategory">구매내역</label>
		  <input type="radio" class="btn-check" name="category" id="likeCategory" value="3" autocomplete="off" <c:if test="${category eq '3' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="likeCategory">좋아요 목록</label>
		  <input type="radio" class="btn-check" name="category" id="communityCategory" value="4" autocomplete="off" <c:if test="${category eq '4' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="communityCategory">커뮤니티 작성 글</label>
		  <input type="radio" class="btn-check" name="category" id="communityReplyCategory" value="5" autocomplete="off" <c:if test="${category eq '5' }">checked</c:if>>
		  <label class="btn btn-outline-primary" for="communityReplyCategory">커뮤니티 작성 댓글</label>
		</div>
    </form>
    
    
    

	<%-- 페이지 옵션1 : 상품 관련 탭(판매내역, 구매내역, 좋아요목록) 선택 시 표시 --%>
	<c:if test="${category eq '1' or category eq '3'}">
	   	<div class="filterArea">
	   		<ul class="row allFilter filter-3">
	   			<li class="col-3 eachFilter">
	   				<a href="SellerInfo?filter=0&category=${category }&member_id=${param.member_id}">
						전체
	   				</a>
   				</li>
	   			<li class="col-3 eachFilter">
	   				<a href="SellerInfo?filter=1&category=${category }&member_id=${param.member_id}">
	   					판매중
	   				</a>
   				</li>
	   			<li class="col-3 eachFilter">
	   				<a href="SellerInfo?filter=2&category=${category }&member_id=${param.member_id}">
	   					거래완료
	   				</a>
   				</li>
	   		</ul>
		</div>
	</c:if>            
            
	<section class="item-details section wholeProductSection">
	    <div class="product-details-info row" id="wholeProductArea">
	    <c:if test="${empty MyPageList }">
	    	<div class="single-block col">표시할 내역이 없습니다</div>
	    </c:if>
			<c:forEach var="mypage" items="${MyPageList }" varStatus="status">
				<c:choose> <%-- 탭선택 --%>
					<c:when test="${category eq '1' }"> <%-- 판매내역 탭 시작--%>
						<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductArea">
							<c:choose>
								<c:when test="${mypage.trade_status eq '0' or mypage.trade_status eq '1'}"> <%-- 거래(판매) 대기/거래 중 --%>
								<a href="ProductDetail?product_id=${mypage.product_id }">
									<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
								</a>								
								<span class="heart <c:if test='${sessionScope.sId eq mypage.member_id }'>isSameUser</c:if>"></span>
								<c:if test="${mypage.trade_status eq '1' }"> <%-- 거래(판매) 중 --%>
									<span class="dealInProcess" id="dealInProcess">거래중</span>
								</c:if>
								<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>
									</b>
								</div>
								<div id="singleProductInfoArea">
									좋아요 ${mypage.count}개
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${mypage.product_datetime }
								</div>
								<div id="singleProductContactArea">
									<span class="singleProductPrice">
										<fmt:formatNumber value="${mypage.product_price }" pattern="###,###"/>원
									</span>
<!-- 										채팅 n회 -->
									<c:forEach var="pay" items="${payUser }">
										<c:if test="${pay.member_id eq mypage.member_id }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img class="sosimPay" src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png">											
										</c:if>
									</c:forEach>
								</div>
								<div id="singleProductButtonArea">
									<input type="button" value="상세보기" onclick="location.href='ProductDetail?product_id=${mypage.product_id}'">
								</div>
							</c:when>
							
							<c:when test="${mypage.trade_status eq '2' }"> <%-- 거래(판매) 완료 --%>
								<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductAreaDealComplete">
										<a href="ProductDetail?product_id=${mypage.product_id }">
											<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
										</a>									
										<span id="dealComplete">
										<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
										<b>판매 완료</b>
									</span>				
									<span class="heart <c:if test='${sessionScope.sId eq mypage.member_id }'>isSameUser</c:if>"></span>
									<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>
									</b>
									</div>
									<div id="singleProductInfoArea">
										좋아요 ${mypage.count}개
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										${mypage.product_datetime }
									</div>
									<div id="singleProductContactArea">
										<span class="singleProductPrice">
											<fmt:formatNumber value="${mypage.product_price }" pattern="###,###"/>원
										</span>
	<!-- 										채팅 n회 -->
										<c:forEach var="pay" items="${payUser }">
											<c:if test="${pay.member_id eq mypage.member_id }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<img class="sosimPay" src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png">											
											</c:if>
										</c:forEach>
									</div>
									<div id="singleProductButtonArea">
										<input type="button" value="상세보기" onclick="location.href='ProductDetail?product_id=${mypage.product_id}'">
									</div>
								</div>	
							</c:when>
						</c:choose>
				        </div> <%--singleProductArea 끝 --%>
					</c:when> <%-- 판매내역탭 끝 --%>
					
					
			       
					<c:when test="${category eq '2' }"> <%-- 구매내역 탭 시작 --%>
						<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductArea">
				        <c:choose>
							<c:when test="${mypage.order_status eq '0'}"> <%-- 거래(구매) 중 --%>
							<a href="ProductDetail?product_id=${mypage.product_id }">
								<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
							</a>							
							<span class="heart <c:if test='${sessionScope.sId eq mypage.member_id }'>isSameUser</c:if>"></span>
							<span class="dealInProcess" id="dealInProcess">거래중</span>
							<div id="singleProductTitleArea">
								<b>
								<c:choose>
							        <c:when test="${fn:length(mypage.product_name) gt 9}">
							        	${fn:substring(mypage.product_name, 0, 8)} ...
							        </c:when>
							        <c:otherwise>
							        	${mypage.product_name }
							        </c:otherwise>
								</c:choose>								
								</b>
							</div>
							<div id="singleProductInfoArea">
								좋아요 ${mypage.count}개
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${mypage.product_datetime }
							</div>
							<div id="singleProductContactArea">
								<span class="singleProductPrice">
									<fmt:formatNumber value="${mypage.product_price }" pattern="###,###"/>원
								</span>
<!-- 										채팅 n회 -->
								<c:forEach var="pay" items="${payUser }">
									<c:if test="${pay.member_id eq mypage.member_id }">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img class="sosimPay" src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png">											
									</c:if>
								</c:forEach>
							</div>
							<div id="singleProductButtonArea">
								<input type="button" value="상세보기" onclick="location.href='ProductDetail?product_id=${mypage.product_id}'">
							</div>
							</c:when>						
							<c:when test="${mypage.order_status eq '1'}"> <%-- 거래(구매)완료 --%>
							<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductAreaDealComplete">
								<a href="ProductDetail?product_id=${mypage.product_id }">
									<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
								</a>								
								<span id="dealComplete">
									<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
									<b>구매 완료</b>
								</span>				
								<span class="heart <c:if test='${sessionScope.sId eq mypage.member_id }'>isSameUser</c:if>"></span>
								<div id="singleProductTitleArea">
								<b>
								<c:choose>
							        <c:when test="${fn:length(mypage.product_name) gt 9}">
							        	${fn:substring(mypage.product_name, 0, 8)} ...
							        </c:when>
							        <c:otherwise>
							        	${mypage.product_name }
							        </c:otherwise>
								</c:choose>								
								</b>
								</div>
								<div id="singleProductInfoArea">
									좋아요 ${mypage.count}개
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${mypage.product_datetime }
								</div>
								<div id="singleProductContactArea">
									<span class="singleProductPrice">
										<fmt:formatNumber value="${mypage.product_price }" pattern="###,###"/>원
									</span>
<!-- 										채팅 n회 -->
									<c:forEach var="pay" items="${payUser }">
										<c:if test="${pay.member_id eq mypage.member_id }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img class="sosimPay" src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png">											
										</c:if>
									</c:forEach>
								</div>
								<div id="singleProductButtonArea">
									<input type="button" value="상세보기" onclick="location.href='ProductDetail?product_id=${mypage.product_id}'">
								</div>
					        </div>
							</c:when>
						</c:choose>
				        </div> <%--singleProductArea 끝 --%>
					</c:when> <%-- 구매내역 탭 끝 --%>
					
					<c:when test="${category eq '3' }"> <%-- 좋아요목록 탭 시작--%>
						<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductArea">
							<c:choose>
								<c:when test="${mypage.trade_status eq '0' or mypage.trade_status eq '1'}"> <%-- 거래(판매) 대기/거래 중 --%>
								<a href="ProductDetail?product_id=${mypage.product_id }">
									<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
								</a>				
								<span class="heart <c:if test='${sessionScope.sId eq mypage.member_id }'>isSameUser</c:if>"></span>
								<c:if test="${mypage.trade_status eq '1' }"> <%-- 거래(판매) 중 --%>
									<span class="dealInProcess" id="dealInProcess">거래중</span>
								</c:if>
								<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>									
									</b>
								</div>
								<div id="singleProductInfoArea">
									좋아요 ${mypage.count}개
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${mypage.product_datetime }
								</div>
								<div id="singleProductContactArea">
									<span class="singleProductPrice">
										<fmt:formatNumber value="${mypage.product_price }" pattern="###,###"/>원
									</span>
<!-- 										채팅 n회 -->
									<c:forEach var="pay" items="${payUser }">
										<c:if test="${pay.member_id eq mypage.member_id }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img class="sosimPay" src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png">											
										</c:if>
									</c:forEach>
								</div>
								<div id="singleProductButtonArea">
									<input type="button" value="상세보기" onclick="location.href='ProductDetail?product_id=${mypage.product_id}'">
								</div>
							</c:when>
							
							<c:when test="${mypage.trade_status eq '2' }"> <%-- 거래(판매) 완료 --%>
								<div class="single-block list${status.index} col-4"  data-id="${mypage.product_id }" id="singleProductAreaDealComplete">
									<a href="ProductDetail?product_id=${mypage.product_id }">
										<img src="${pageContext.request.contextPath}/resources/upload/${mypage.product_image1}">
									</a>									
									<span id="dealComplete">
										<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
										<b>판매 완료</b>
									</span>				
									<span class="heart <c:if test='${sessionScope.sId eq mypage.member_id }'>isSameUser</c:if>"></span>
									<div id="singleProductTitleArea">
									<b>
									<c:choose>
								        <c:when test="${fn:length(mypage.product_name) gt 9}">
								        	${fn:substring(mypage.product_name, 0, 8)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.product_name }
								        </c:otherwise>
									</c:choose>								
									</b>
									</div>
									<div id="singleProductInfoArea">
										좋아요 ${mypage.count}개
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										${mypage.product_datetime }
									</div>
									<div id="singleProductContactArea">
										<span class="singleProductPrice">
											<fmt:formatNumber value="${mypage.product_price }" pattern="###,###"/>원
										</span>
	<!-- 										채팅 n회 -->
										<c:forEach var="pay" items="${payUser }">
											<c:if test="${pay.member_id eq mypage.member_id }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<img class="sosimPay" src="${pageContext.request.contextPath}/resources/images/product-details/소심페이.png">											
											</c:if>
										</c:forEach>
									</div>
									<div id="singleProductButtonArea">
										<input type="button" value="상세보기" onclick="location.href='ProductDetail?product_id=${mypage.product_id}'">
									</div>
								</div>	
							</c:when>
						</c:choose>
				        </div> <%--singleProductArea 끝 --%>
					</c:when> <%-- 좋아요목록탭 끝 --%>
					
					
					
					<c:when test="${category eq '4' }"> <%-- 커뮤니티 작성글 탭 시작--%>
					    <div class="single-block col-1" id="singleCommunityArea">
							<div id="communityLeft">
								<div id="communityLeftUpperLeft" class="row">
									<div class="col-10">
										<c:choose>
											<c:when test="${mypage.community_category eq 1}">
												<p>동네소식</p>
											</c:when>
											<c:when test="${mypage.community_category eq 2}">
												<p>동네질문</p>
											</c:when>
											<c:when test="${mypage.community_category eq 3}">
												<p>일상</p>
											</c:when>
										</c:choose>
										<input type="hidden" name="community_id" value="${mypage.community_id }">
										<b id="bold"><a href="CommunityDetail?community_id=${mypage.community_id }">
										<c:choose>
									        <c:when test="${fn:length(mypage.community_subject) gt 15}">
									        	${fn:substring(mypage.community_subject, 0, 14)} ...
									        </c:when>
									        <c:otherwise>
									        	${mypage.community_subject }
									        </c:otherwise>
										</c:choose>
										</a></b><br>
									</div>
									<div class="col d-flex justify-content-end">
<%-- 										<input type="button" class="btn btn-primary" value="삭제" style="width:60% !important;" onclick="deleteCommunity('${mypage.community_id }', this)"> --%>
									</div>
								</div>
								<div id="communityMiddleArea">
									<div id="communityMiddleLeft">${mypage.community_datetime }</div>
									<div id="communityMiddleRight" <c:if test="${empty mypage.community_image1 }">class="noCommunityImage"</c:if>>
										조회수 ${mypage.community_readcount }&nbsp;&nbsp;&nbsp;&nbsp;댓글 ${mypage.reply_count }&nbsp;&nbsp;&nbsp;&nbsp;좋아요 ${mypage.like_count }
									</div>
								</div>
								<div id="communityLeftBottom" <c:if test="${empty mypage.community_image1 }">class="communityLeftBottomNoImage"</c:if>>
									<p>
									<c:choose>
								        <c:when test="${fn:length(mypage.community_content) gt 30}">
								        	${fn:substring(mypage.community_content, 0, 29)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.community_content }
								        </c:otherwise>
									</c:choose>
									</p>
								</div>
							</div>
							<div id="communityRight">
								<c:if test="${not empty mypage.community_image1 }">
									<img src="${pageContext.request.contextPath}/resources/upload/${mypage.community_image1}">
								</c:if>
							</div>
				        </div> <%--singleCommunityArea 끝 --%>
					</c:when> <%-- 커뮤니티 작성글 탭 끝 --%>
					
					<c:when test="${category eq '5' }"> <%-- 커뮤니티 작성댓글 탭 시작--%>
					    <div class="single-block col-1" id="singleCommunityReplyArea">
							<div id="communityReplyTitleArea" class="row">
								<div class="col-10">
									<c:choose>
										<c:when test="${mypage.community_category eq 1}">
											<p>동네소식</p>
										</c:when>
										<c:when test="${mypage.community_category eq 2}">
											<p>동네질문</p>
										</c:when>
										<c:when test="${mypage.community_category eq 3}">
											<p>일상</p>
										</c:when>
									</c:choose>
									<b id="bold"><a href="CommunityDetail?community_id=${mypage.community_id }">
									<c:choose>
								        <c:when test="${fn:length(mypage.community_subject) gt 15}">
								        	${fn:substring(mypage.community_subject, 0, 14)} ...
								        </c:when>
								        <c:otherwise>
								        	${mypage.community_subject }
								        </c:otherwise>
									</c:choose>
									</a></b><br>
								</div>
								<div class="col d-flex justify-content-end">
<%-- 									<input type="button" class="btn btn-primary" value="삭제" style="width:60% !important;" onclick="deleteCommunityReply('${mypage.reply_id }', this)"> --%>
								</div>
							</div>
							<div id="communityReplyMiddleArea">
<%-- 								<div id="communityReplyMiddleLeft">${mypage.reply_datetime }</div> --%>
								<div id="communityReplyMiddleRight">
<!-- 									대댓글 n개 -->
									${mypage.reply_datetime }
								</div>
							</div>
							<div id="communityReplyLeftBottom">
								<p>
								<c:choose>
							        <c:when test="${fn:length(mypage.reply_content) gt 7}">
							        	${fn:substring(mypage.reply_content, 0, 6)} ...
							        </c:when>
							        <c:otherwise>
							        	${mypage.reply_content }
							        </c:otherwise>
								</c:choose>
								</p>
							</div>
						</div> <%--singleCommunityReplyArea 끝 --%>
					</c:when> <%-- 커뮤니티 작성글 탭 끝 --%>
		        </c:choose> <%-- 탭선택 --%>
			</c:forEach>
	    </div>
	    <nav aria-label="Page navigation">
				<ul class="pagination d-flex justify-content-center">
					<li class="page-item" id="prevPage">
<%-- 						<a href="Community?pageNum=${pageNum - 1}" class="page-link">&laquo;</a> --%>
						<a href="MyPage?category=${param.category }&pageNum=${pageNum - 1}" class="page-link">&laquo;</a>
					</li>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageNum eq i }">
						<li class="page-item active"><span class="page-link">${i }</span></li>
						</c:when>
						<c:otherwise>
						<li class="page-item"><a href="MyPage?category=${param.category }&pageNum=${i }" class="page-link" >${i }</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					<li class="page-item" id="nextPage">
						<a href="MyPage?category=${param.category }&pageNum=${pageNum + 1}" class="page-link">&raquo;</a>
					</li>
				</ul>
			</nav>
	</section>    

    <%-- 후기 모달 설정 --%>
	<div class="modal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">후기 등록</h1>
	<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-center" id="reviewModalButtonArea">
						<input type="radio" class="btn-check" name="options" id="option1" value="bad" autocomplete="off" onclick="openReceivedReviewModal('${param.member_id }')">
						<label class="btn btn-outline-primary mx-4" for="option1">별로예요</label>
						<input type="radio" class="btn-check" name="options" id="option2" value="good" autocomplete="off" onclick="goodReviews('${param.member_id }')">
<!-- 						<input type="radio" class="btn-check" name="options" id="option2" value="good" autocomplete="off" checked> -->
						<label class="btn btn-outline-primary mx-4" for="option2">최고예요</label>
					</div>
					<div id="reviewCheck" class="mx-auto my-5 w-75">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>
				</div>
			</div>
		</div>
	</div>

 <!-- ============================================ 메인영역 끝 ================================================================= -->	
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