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
    	
    	<%-- 페이지 옵션1 : 상품 관련 탭(판매내역, 구매내역, 관심목록) 선택 시 표시 --%>
    	<div id="tabArea">
    		<%-- 카테고리 옵션1 : 판매 내역 탭일 경우 --%>
    		<ul>
    			<li><a href="">전체</a></li>
    			<li><a href="">판매중</a></li>
    			<li><a href="">거래완료</a></li>
    			<li><a href="">취소/환불</a></li>
    		</ul>

    		<%-- 카테고리 옵션2 : 관심목록 탭일 경우 --%>
<!--     		<ul> -->
<!--     			<li><a href="">전체</a></li> -->
<!--     			<li><a href="">판매중</a></li> -->
<!--     			<li><a href="">거래완료</a></li> -->
<!--     		</ul> -->
		</div>
		<div id="wholeProductArea">
		
			<!-- 판매내역 옵션1-1 판매 중(끌올 불가) -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="수정">
				</div>
			</div>

			<!-- 판매내역 옵션1-2 판매 중(끌올 가능) -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="수정">
					<input type="button" value="UP">
				</div>
			</div>

			<!-- 판매내역 옵션2 거래중 -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="구매확정요청">
				</div>
			</div>

			<!-- 판매내역 옵션3 판매완료(후기미작성) -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="거래후기작성">
				</div>
			</div>

			<!-- 판매내역 옵션4 거래완료(후기작성완료) -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="거래후기보기">
				</div>
			</div>

			<!-- 구매내역 옵션1 거래중 -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="구매확정하기">
				</div>
			</div>

			<!-- 판매내역 옵션2 구매완료(후기미작성) -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="거래후기작성">
				</div>
			</div>

			<!-- 판매내역 옵션3 거래완료(후기작성완료) -->
			<div id="singleProductArea">
				<img>
				<div id="singleProductTitleArea">
					<b>상품글제목자리</b>
				</div>
				<div id="singleProductInfoArea">
					nnnnn원
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					n시간 전
				</div>
				<div id="singleProductContactArea">
					찜 n개
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					채팅 n회
				</div>
				<div id="singleProductButtonArea">
					<input type="button" value="거래후기보기">
				</div>
			</div>
		
		</div>
    	<%-- 페이지 옵션1 끝 --%>
		
    	<%-- 페이지 옵션2 : 받은 후기 탭 선택 시 표시 --%>
    	<%-- 페이지 옵션2 끝 --%>

    	<%-- 페이지 옵션3 : 커뮤니티 관련 탭(커뮤니티 작성글, 커뮤니티 작성 댓글) 선택 시 표시 --%>
    	
    	
    	<%-- 페이지 옵션3 끝 --%>
		
		
		
    </div>
</body>

</html>