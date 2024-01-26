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
<script type="text/javascript">
// 	function reviewViewFrom() {
// 		$("#staticBackdropLabel").text("보낸 후기");
// 		$(".modal-body input[type='radio']").attr("disabled", true);
// 		$("#reviewCheck").empty();
// 		$("#reviewCheck").html(
// 				'<ul class="list-group list-group-flush">'
// 					+'<li class="list-group-item">후기입니다1.</li>'
// 					+'<li class="list-group-item">후기입니다1.</li>'
// 					+'<li class="list-group-item">후기입니다1.</li>'
// 					+'<li class="list-group-item">후기입니다1.</li>'
// 				+'</ul>'
// 		);
// 		$(".modal-footer").html(
// 				'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>'
// 				+ '<button type="button" class="btn btn-primary" id="reviewBtn" onclick="reviewDelete()">'
// 				+'후기 삭제</button>'	
// 		);
// 	}
	$(function(){
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
			// 좋아요 버튼 클릭 이벤트
	        $(".heart").on("click", function () {
	            $(this).toggleClass("is-active");
	        });
		
	});
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
					<img src="${pageContext.request.contextPath}/resources/images/">
				</div>
				<div id="profileRight">
					<div id="profileRightUpperLeft">
						<b id="bold">닉네임</b>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="">내 정보 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 						<a href="">받은 후기</a> -->
						<a href="" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewViewFrom">받은 후기</a>
<!-- 						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewViewFrom"> -->
<!-- 							후기 보기 모달창 -->
<!-- 						</button> -->
					</div>
					<div id="profileRightUpperRight">
						동네인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
						&nbsp;&nbsp;&nbsp;&nbsp;본인인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png">
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
   	<div id="tabArea">
   		<%-- 카테고리 옵션1 : 판매 내역 탭일 경우 --%>
   		<ul>
   			<li><a href="">전체</a></li>
   			<li><a href="">판매중</a></li>
   			<li><a href="">거래완료</a></li>
   			<li><a href="">취소/환불</a></li>
   		</ul>

   		<%-- 카테고리 옵션2 : 찜목록 탭일 경우 --%>
<!--     		<ul> -->
<!--     			<li><a href="">전체</a></li> -->
<!--     			<li><a href="">판매중</a></li> -->
<!--     			<li><a href="">거래완료</a></li> -->
<!--     		</ul> -->
	</div>
            
            
	<section class="item-details section" style="padding: 10px 0px !important; background-color: #ffffff !important">
            
	    <div class="product-details-info" id="wholeProductArea">

	    	<!-- 판매내역 옵션1-1 판매 중(끌올 불가) -->
	    	<!-- 현재 hover시 singleProductArea 영역 모두 opacity 되도록 설정됨 -->
	    	<!-- 이후에 판별 후 거래완료인 상품만 opacity 되도록 수정 -->
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