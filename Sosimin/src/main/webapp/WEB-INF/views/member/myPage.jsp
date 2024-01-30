<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- sweetalert --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">

	// 받은 후기 클릭 시 모달 띄우는 함수 정의
	function openReceivedReviewModal() {
		$("#staticBackdropLabel").text("받은 후기");
		$(".modal-body input[type='radio']").attr("disabled", false);
		$(".modal-body input[type='radio']").eq(0).prop("checked", true); // 기본옵션 별로에요 선택
		
		$("#reviewCheck").empty();
		$("#reviewCheck").html(
			// 별로에요 옵션 표시(디폴트)
			'<ul class="list-group">'
				+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
					+ '약속 장소에 나타나지 않아요'
				+ '</li>'
				+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
					+ '상품 상태가 설명과 달라요'
				+ '</li>'
				+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
					+ '시간 약속을 안 지켜요'
				+ '</li>'
				+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
					+ '응답이 없어요'
				+ '</li>'
			+ '</ul>'
		);
		
		// 별로에요 버튼 클릭 이벤트
		$("#option1").on("click", function() {
			$("#reviewCheck").empty();
			$("#reviewCheck").html(
					'<ul class="list-group">'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '약속 장소에 나타나지 않아요'
					+ '</li>'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '상품 상태가 설명과 달라요'
					+ '</li>'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '시간 약속을 안 지켜요'
					+ '</li>'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/frowny.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '응답이 없어요'
					+ '</li>'
				+ '</ul>'
			);
		});

		// 최고에요 버튼 클릭 이벤트
		$("#option2").on("click", function() {
			$("#reviewCheck").empty();
			$("#reviewCheck").html(
				'<ul class="list-group">'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '제가 있는곳까지 와서 거래했어요'
					+ '</li>'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '친절하고 매너가 좋아요'
					+ '</li>'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '시간 약속을 잘 지켜요'
					+ '</li>'
					+ '<li class="list-group-item">'
					+ '<img src="${pageContext.request.contextPath}/resources/images/member/smiley.png">'
					+ '<h6>' + 'n개' + '</h6>'
						+ '응답이 빨라요'
					+ '</li>'
				+ '</ul>'
			);
			
		});
		
		$(".modal-footer").html(
			'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>'
		);
	}
	
	$(function(){
		// 받은 후기 클릭 이벤트
		$("#reviewViewFrom").on("click", function() {
			openReceivedReviewModal();
		});

		// 내 정보 수정 클릭 이벤트
		$("#myPageModifyInfoFrom").on("click", function() {
			openModifyMyInfoModal();
		});
			
		// 찜 버튼 클릭 이벤트
        $(".heart").on("click", function () {
            $(this).toggleClass("is-active");
    	    Swal.fire({
    			title: '찜했습니다!',         // Alert 제목
    			text: "감사합니다!",  // Alert 내용
    			icon:'success',                         // Alert 타입
    		});
        });
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		// 찜버튼 재클릭 시 deactive처리 및 sweetalert처리 필요!!!
		
		
		
		
	}); // document.ready 끝
	
	// 내 정보 수정 클릭 시 모달 띄우는 함수 정의
	function openModifyMyInfoModal() {
		$("#myPageModifyInfoModal").modal("show");
	}
	
</script>
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
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li>마이페이지</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    
	<section class="item-details section" style="padding: 10px 0px !important; background-color: #ffffff !important">
        <div class="container">
            <div class="top-area" id="profileArea">
				<div id="profileLeft">
					<img src="${pageContext.request.contextPath}/resources/images/">
				</div>
				<div id="profileRight">
					<div id="profileRightUpperLeft">
						<b id="bold">닉네임</b>&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- 인증 완료된 경우 예시 -->
							<p id="sellerAuthArea">
							동네인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
							&nbsp;&nbsp;&nbsp;&nbsp;본인인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
							</p>
							<!-- 인증 완료되지않은 경우 예시 -->
<!-- 							<p id="sellerAuthArea"> -->
<%-- 							동네인증<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> --%>
<%-- 							&nbsp;&nbsp;&nbsp;&nbsp;본인인증<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png"> --%>
<!-- 							</p> -->
					</div>
					<div id="profileRightUpperRight">
<!-- 						<a href="javascript:reviewViewFrom()" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> -->
						<a href="#staticBackdrop" data-bs-toggle="modal" id="reviewViewFrom">
<!-- 						<a href="javascript:reviewViewFrom()"> -->
							<img src="${pageContext.request.contextPath}/resources/images/member/reviewicon.png">
							받은 후기
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="#myPageModifyInfoModal" data-bs-toggle="modal" id="myPageModifyInfoFrom">
							<img src="${pageContext.request.contextPath}/resources/images/member/usericon.png">
							내 정보 수정
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<section id="profileRightMiddle">
						<span>Lv.3</span>
						<span>상품 판매 n회</span>
						<span>커뮤니티 글 n개</span>
						<span>커뮤니티 댓글 n개</span>
						<span>받은 좋아요 n개</span>
					</section>
					<div id="profileRightBottom">
						<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
						Maecenas ac libero ac ligula consectetur accumsan in et diam. 
						Vestibulum commodo in sem sit amet laoreet. 
						Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
						Cras et sapien vel arcu suscipit vulputate. 
						</p>
					</div>
				</div>
            </div>
        </div>
    </section>
    
	<div id="categoryArea" class="btn-group col categoryBtn" role="group" aria-label="Basic radio toggle button group">
	  <input type="radio" class="btn-check" name="category" id="allCategory" value="판매내역" autocomplete="off" checked="">
	  <label class="btn btn-outline-primary" for="allCategory">판매내역</label>
	  <input type="radio" class="btn-check" name="category" id="hotCategory" value="구매내역" autocomplete="off">
	  <label class="btn btn-outline-primary" for="hotCategory">구매내역</label>
	  <input type="radio" class="btn-check" name="category" id="infoCategory" value="찜 목록" autocomplete="off">
	  <label class="btn btn-outline-primary" for="infoCategory">찜 목록</label>
	  <input type="radio" class="btn-check" name="category" id="questionCategory" value="커뮤니티 작성 글" autocomplete="off">
	  <label class="btn btn-outline-primary" for="questionCategory">커뮤니티 작성 글</label>
	  <input type="radio" class="btn-check" name="category" id="dailyCategory" value="커뮤니티 작성 댓글" autocomplete="off">
	  <label class="btn btn-outline-primary" for="dailyCategory">커뮤니티 작성 댓글</label>
	</div>
    
    
    
    
<!--      <div class="meta-information" id="categoryArea"> -->
<!--          <ul class="meta-info"> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-user"></i>판매내역</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-calendar"></i>구매내역</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-tag"></i>관심목록</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-timer"></i>커뮤니티 작성 글</a></li> -->
<!--              <li><a href="javascript:void(0)"><i class="lni lni-timer"></i>커뮤니티 작성 댓글</a></li> -->
<!--          </ul> -->
<!--      </div> -->

<%-- 페이지 옵션1 : 상품 관련 탭(판매내역, 구매내역, 관심목록) 선택 시 표시 --%>
   	<div id="filterArea">
   		<%-- 필터 옵션1 : 판매 내역 탭일 경우 --%>
   		<ul>
   			<li><a href="">전체</a></li>
   			<li><a href="">판매중</a></li>
   			<li><a href="">거래완료</a></li>
   			<li><a href="">취소/환불</a></li>
   		</ul>

   		<%-- 필터 옵션2 : 찜목록 탭일 경우 --%>
<!--     		<ul> -->
<!--     			<li><a href="">전체</a></li> -->
<!--     			<li><a href="">판매중</a></li> -->
<!--     			<li><a href="">거래완료</a></li> -->
<!--     		</ul> -->
	</div>
            
            
	<section class="item-details section" style="padding: 10px 0px !important; background-color: #ffffff !important">
            
	    <div class="product-details-info" id="wholeProductArea">

	    	<!-- 판매내역 옵션1-1 판매 중(끌올 불가) -->
	        <div class="single-block" id="singleProductArea">
				<img src="${pageContext.request.contextPath}/resources/images/products/product-1.jpg">

				<span class="heart"></span>
				<div id="singleProductTitleArea">
					<b>판매중끌올x</b>
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
	        <div class="single-block" id="singleProductArea">
				<img src="${pageContext.request.contextPath}/resources/images/products/product-2.jpg">
				<span class="heart"></span>
				<div id="singleProductTitleArea">
					<b>판매중끌올o</b>
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
	        <div class="single-block" id="singleProductArea">
				<img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg">
				<span class="heart"></span>
				<span id="dealInProcess">거래중</span>
				<div id="singleProductTitleArea">
					<b>판매거래중</b>
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
	        <div class="single-block" id="singleProductArea">
		        <div class="single-block" id="singleProductAreaDealComplete">
					<img src="${pageContext.request.contextPath}/resources/images/products/product-4.jpg">
					<span id="dealComplete">
						<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
						<b>판매 완료</b>
					</span>				
					<span class="heart"></span>
					<div id="singleProductTitleArea">
						<b>판매완료후기x</b>
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
	        </div>

			<!-- 판매내역 옵션4 거래완료(후기작성완료) -->
	        <div class="single-block" id="singleProductArea">
		        <div class="single-block" id="singleProductAreaDealComplete">
					<img src="${pageContext.request.contextPath}/resources/images/products/product-5.jpg">
					<span id="dealComplete">
						<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
						<b>판매 완료</b>
					</span>				
					<span class="heart"></span>
					<div id="singleProductTitleArea">
						<b>판매완료후기o</b>
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
	        
			<!-- 구매내역 옵션1 거래중 -->
	        <div class="single-block" id="singleProductArea">
				<img src="${pageContext.request.contextPath}/resources/images/products/product-6.jpg">
				<span class="heart"></span>
				<span id="dealInProcess">거래중</span>
				<div id="singleProductTitleArea">
					<b>구매거래중</b>
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

			<!-- 구매내역 옵션2 구매완료(후기미작성) -->
	        <div class="single-block" id="singleProductArea">
		        <div class="single-block" id="singleProductAreaDealComplete">
					<img src="${pageContext.request.contextPath}/resources/images/products/product-7.jpg">
					<span id="dealComplete">
						<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
						<b>구매 완료</b>
					</span>				
					<span class="heart"></span>
					<div id="singleProductTitleArea">
						<b>구매완료후기x</b>
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
	        </div>

			<!-- 구매내역 옵션3 거래완료(후기작성완료) -->
	        <div class="single-block" id="singleProductArea">
		        <div class="single-block" id="singleProductAreaDealComplete">
					<img src="${pageContext.request.contextPath}/resources/images/products/product-8.jpg">
					<span id="dealComplete">
						<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"><br>
						<b>구매 완료</b>
					</span>						
					<span class="heart"></span>
					<div id="singleProductTitleArea">
						<b>구매완료후기o</b>
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
	        
	        
	
	    </div>
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
						<input type="radio" class="btn-check" name="options" id="option1" value="bad" autocomplete="off">
						<label class="btn btn-outline-primary mx-4" for="option1">별로예요</label>
						<input type="radio" class="btn-check" name="options" id="option2" value="good" autocomplete="off" checked>
						<label class="btn btn-outline-primary mx-4" for="option2">최고예요</label>
					</div>
					<div id="reviewCheck" class="mx-auto my-5 w-75">
					</div>
				</div>
				<div class="modal-footer">
<!-- 					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button> -->
<!-- 					<button type="submit" class="btn btn-primary" id="reviewRegist">후기 등록</button> -->
				</div>
			</div>
		</div>
	</div>

    <%-- 회원정보 수정 모달 설정 --%>
	<div class="modal" id="myPageModifyInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">내 정보 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="modifyMyInfo" class="mx-auto my-5 w-75">
						<form action="" class="row" method="post">
							<div class="form-group" id="formGroupForProfilePic">
								<label for="reg-fn" id="mgForFiveMod">프로필사진</label>
								<img alt="" src=""><%-- 썸네일 처리!!!! --%>
								<label for="profilePicFile">
<!-- 										<input type="button" class="btnProfilePicModify" value="사진 변경"> -->
									<div class="btnProfilePicModify">사진 변경</div>
								</label>
								<input type="file" name="file" id="profilePicFile">
								<div class="btnProfilePicModify">삭제</div>
							</div>

							<div class="form-group">
								<label for="reg-fn" id="mgForTwoMod">이름</label> 
								<input class="form-control" placeholder="기존이름" maxlength="5" type="text" name="member_name" id="name" readonly>
							</div>
							<div class="form-group" >
								<label for="reg-ln" id="mgForThreeMod">아이디</label> 
								<input class="form-control" placeholder="기존아이디" maxlength="20" type="text"  name="member_id" id="id" readonly>
							</div>
							<div class="form-group">
								<label for="reg-pass" id="mgForFiveOneMod">새 비밀번호</label> 
								<input class="form-control" maxlength="16" placeholder="비밀번호를 수정할 경우에만 입력해주세요" type="password"  name="member_password" id="password">
								<div id="checkPasswordResult" class="resultArea"></div><%--8~16자의 영문 대/소문자, 숫자, 특수문자(!@#%^&*) --%>
							</div>
							<div class="form-group">
								<label for="reg-pass-confirm" id="mgForSevenTwoMod">새 비밀번호 확인</label> 
								<input class="form-control" maxlength="16" placeholder="비밀번호를 한 번 더 입력해주세요" type="password" id="passwordConfirm">
								<div id="checkPasswordConfirmResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForThreeMod">닉네임</label> 
								<input class="form-control" type="text" placeholder="기존닉네임" name="member_nickname" id="nickname" required>
								<input type="button" value="중복확인" id="checkNicknameDupButton">
<!-- 								<input type="button" value="닉네임만들기" id="generateNicknameButton"> -->
								<%-- 입력값이 비어있을 경우 DB에서 임의로 난수발생해 insert 처리 --%>
								<div id="checkNicknameResult" class="resultArea"></div><%--2~10글자의 한글, 숫자(선택입력) --%>
							</div>

							<div class="form-group">
								<label for="reg-ln" id="mgForFourMod">생년월일</label> 
								<input class="form-control" type="date" name="member_birth" id="birthdate" required>
								<%--회원가입과 동일하게 범위제한하고 기존 생년월일 placeholder --%>
								<div id="checkBirthdateResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-ln" id="mgForTwoMod">주소</label> 
								<input type="hidden" id="map">
								<input class="form-control" type="text" placeholder="기존주소" name="member_address" id="myMap" required readonly>
								<%--회원가입과 동일. 기존 주소 placeholder --%>
								<input type="button" value="동네인증" id="myMapButton" onclick="AddressMap()">
								<div id="checkAddressResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-email" id="mgForThreeMod">이메일</label> 
								<input class="form-control" type="email" placeholder="기존이메일" name="member_email" id="email" required>
								<%--회원가입과 동일하게 정규표현식 검증 및 중복확인. 기존 이메일 placeholder --%>
								<input type="button" value="중복확인" id="checkEmailDupButton">
								<div id="checkEmailResult" class="resultArea"></div>
							</div>
							<div class="form-group">
								<label for="reg-phone" id="mgForFiveMod">휴대폰번호</label> 
								<input class="form-control" placeholder="기존휴대폰번호" type="tel" name="member_phone" id="phone" required>
								<%--회원가입과 동일하게 인증, 정규표현식 검증, 중복확인(회원아이디 일치하고 휴대폰 번호 동일한 경우 자바스크립트 처리?). 기존 폰번호 placeholder --%>
								<input type="button" value="인증">
								<div id="checkPhoneResult" class="resultArea"></div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modifyInfoClose">창닫기</button>
					<button type="submit" class="btn btn-primary" onclick="location.reload()">수정</button>
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
	

</body>

</html>