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
<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
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

//	function reviewViewFrom() {
//		$("#staticBackdropLabel").text("보낸 후기");
//		$(".modal-body input[type='radio']").attr("disabled", true);
//		$("#reviewCheck").empty();
//		$("#reviewCheck").html(
//				'<ul class="list-group list-group-flush">'
//					+'<li class="list-group-item">후기입니다1.</li>'
//					+'<li class="list-group-item">후기입니다1.</li>'
//					+'<li class="list-group-item">후기입니다1.</li>'
//					+'<li class="list-group-item">후기입니다1.</li>'
//				+'</ul>'
//		);
//		$(".modal-footer").html(
//				'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>'
//				+ '<button type="button" class="btn btn-primary" id="reviewBtn" onclick="reviewDelete()">'
//				+'후기 삭제</button>'	
//		);
//	}	
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
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
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
					<img>
				</div>
				<div id="profileRight">
					<div id="profileRightUpperLeft">
						<b id="bold">닉네임</b>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="">내 정보 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewViewFrom">받은 후기</a>
<!-- 						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewViewFrom"> -->
<!-- 							후기 보기 모달창 -->
<!-- 						</button> -->
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
        </div>
    </section>
    
     <div class="meta-information" id="categoryArea">
         <ul class="meta-info">
             <li><a href="javascript:void(0)"> <i class="lni lni-user"></i> 판매내역</a></li>
             <li><a href="javascript:void(0)"><i class="lni lni-calendar"></i>구매내역</a></li>
             <li><a href="javascript:void(0)"><i class="lni lni-tag"></i>관심목록</a></li>
             <li><a href="javascript:void(0)"><i class="lni lni-timer"></i>커뮤니티 작성 글</a></li>
             <li><a href="javascript:void(0)"><i class="lni lni-timer"></i>커뮤니티 작성 댓글</a></li>
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
            
            
	<section class="item-details section" style="padding: 10px 0px !important; background-color: #ffffff !important">
            
	    <div class="product-details-info" id="wholeProductArea">

	    	<!-- 판매내역 옵션1-1 판매 중(끌올 불가) -->
	        <div class="single-block" id="singleProductArea">
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
	        <div class="single-block" id="singleProductArea">
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
	        <div class="single-block" id="singleProductArea">
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
	        <div class="single-block" id="singleProductArea">
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
	        <div class="single-block" id="singleProductArea">
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
	        <div class="single-block" id="singleProductArea">
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

			<!-- 구매내역 옵션2 구매완료(후기미작성) -->
	        <div class="single-block" id="singleProductArea">
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

			<!-- 구매내역 옵션3 거래완료(후기작성완료) -->
	        <div class="single-block" id="singleProductArea">
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



</body>

</html>