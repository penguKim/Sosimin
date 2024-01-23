<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소시민:: 소심한 시민들의 거래</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
</head>

<body>
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
                        <h1 class="page-title">마이페이지</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li>마이페이지</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    <div id="fullArea">
		<div id="profileArea">
			<div id="profileLeft">
				<img>
			</div>
			<div id="profileRight">
				<div id="profileRightUpperLeft">
					<b id="bold">닉네임</b>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="">내 정보 수정</a>
				</div>
				<div id="profileRightUpperRight">
					동네인증 완료&nbsp;&nbsp;&nbsp;&nbsp;본인인증 완료
				</div>
				<section id="profileRightMiddle">
					<span>Lv.3</span>
					<span>상품 판매 n회</span>
					<span>커뮤니티 글 n개</span>
					<span>커뮤니티 댓글 n개</span>
					<span>받은 공감 n개</span>
				</section>
				<div id="profileRightBottom">
					소개글 영역
				</div>
			</div>
		</div>
    	<div id="categoryArea">
    		<ul>
    			<li><a href="">판매내역</a></li>
    			<li><a href="">구매내역</a></li>
    			<li><a href="">관심목록</a></li>
    			<li><a href="">받은 후기</a></li>
    			<li><a href="">커뮤니티 작성 글</a></li>
    			<li><a href="">커뮤니티 작성 댓글</a></li>
    		</ul>
    	</div>
    	

    	<%-- 페이지 옵션3 : 커뮤니티 관련 탭(커뮤니티 작성글, 커뮤니티 작성 댓글) 선택 시 표시 --%>
		<div id="communityButtonArea">
			<input type="button" value="글 삭제">
		</div>
		
		<div id=wholeCommunityArea>
		
			<div id="communityCheckboxContainingArea">
				<!-- 커뮤니티 옵션1 : 커뮤니티 작성글 보기 탭 선택 시 -->
				<input type="checkbox">
	  			<!-- checkbox 가운데정렬 작업 필요 -->
	  			<%-- 삭제버튼 클릭 시에만 표시 --%>
		  		<div id="communitySingleArea">
					<div id="communityLeft">
						<div id="communityLeftUpperLeft">
							커뮤니티 카테고리<br>
							<b id="bold">커뮤니티 작성 글 제목</b><br>
						</div>
						<div id="communityMiddleLeft">n분 전</div>
						<div id="communityMiddleRight">
							조회 n&nbsp;&nbsp;&nbsp;&nbsp;댓글 n&nbsp;&nbsp;&nbsp;&nbsp;좋아요 n
						</div>
						<div id="communityLeftBottom">
							커뮤니티 작성 글 내용 미리보기 영역
						</div>
					</div>
					<div id="communityRight">
						<img>
					</div>
				</div>
			</div>

			<div id="communityCheckboxContainingArea">
				<!-- 커뮤니티 옵션1 : 커뮤니티 작성글 보기 탭 선택 시 -->
				<input type="checkbox">
	  			<!-- checkbox 가운데정렬 작업 필요 -->
	  			<%-- 삭제버튼 클릭 시에만 표시 --%>
		  		<div id="communitySingleArea">
					<div id="communityLeft">
						<div id="communityLeftUpperLeft">
							커뮤니티 카테고리<br>
							<b id="bold">커뮤니티 작성 글 제목</b><br>
						</div>
						<div id="communityMiddleLeft">n분 전</div>
						<div id="communityMiddleRight">
							조회 n&nbsp;&nbsp;&nbsp;&nbsp;댓글 n&nbsp;&nbsp;&nbsp;&nbsp;좋아요 n
						</div>
						<div id="communityLeftBottom">
							커뮤니티 작성 글 내용 미리보기 영역
						</div>
					</div>
					<div id="communityRight">
						<img>
					</div>
				</div>
			</div>
	  		
			<div id="communityCheckboxContainingArea">
				<!-- 커뮤니티 옵션2 : 커뮤니티 작성댓글 보기 탭 선택 시 -->
				<input type="checkbox">
	  			<!-- checkbox 가운데정렬 작업 필요 -->
	  			<%-- 삭제버튼 클릭 시에만 표시 --%>
		  		<div id="communityReplySingleArea">
					<div id="communityReplyTitleArea">
						커뮤니티 카테고리<br>
						<b id="bold">댓글이 등록된 게시글 제목</b><br>
					</div>
					<div id="communityReplyMiddleLeft">n분 전</div>
					<div id="communityReplyMiddleRight">
						대댓글 n개
					</div>
					<div id="communityReplyLeftBottom">
						댓글 내용 미리보기
					</div>
				</div>
			</div>
	
			<div id="communityCheckboxContainingArea">
				<!-- 커뮤니티 옵션2 : 커뮤니티 작성댓글 보기 탭 선택 시 -->
				<input type="checkbox">
	  			<!-- checkbox 가운데정렬 작업 필요 -->
	  			<%-- 삭제버튼 클릭 시에만 표시 --%>
		  		<div id="communityReplySingleArea">
					<div id="communityReplyTitleArea">
						커뮤니티 카테고리<br>
						<b id="bold">댓글이 등록된 게시글 제목</b><br>
					</div>
					<div id="communityReplyMiddleLeft">n분 전</div>
					<div id="communityReplyMiddleRight">
						대댓글 n개
					</div>
					<div id="communityReplyLeftBottom">
						댓글 내용 미리보기
					</div>
				</div>
			</div>
		
		</div>

    	<%-- 페이지 옵션3 끝 --%>
		
		
		
    </div>
</body>

</html>