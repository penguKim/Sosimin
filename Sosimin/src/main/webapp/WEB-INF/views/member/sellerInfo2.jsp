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
	
	<%-- 신고하기 기능 --%>
	<jsp:include page="../report/report.jsp"></jsp:include>
	
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">판매자 정보</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> Home</a></li>
                        <li>상품 정보</li>
                        <li>판매자 정보</li>
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
<!-- 							<p id="sellerAuthArea"> -->
<%-- 							동네인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"> --%>
<%-- 							&nbsp;&nbsp;&nbsp;&nbsp;본인인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"> --%>
<!-- 							</p> -->
							<!-- 인증 완료되지않은 경우 예시 -->
							<p id="sellerAuthArea">
							동네인증<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png">
							&nbsp;&nbsp;&nbsp;&nbsp;본인인증<img src="${pageContext.request.contextPath}/resources/images/member/redXmark.png">
							</p>
					</div>
					<div id="profileRightUpperRight">
<!-- 						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewViewFrom"> -->
<!-- 							후기 보기 모달창 -->
<!-- 						</button> -->
						<a href="" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewViewFrom">
							<img src="${pageContext.request.contextPath}/resources/images/member/reviewicon.png">
							받은 후기
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="" data-bs-toggle="modal" data-bs-target="" id="startChat">
							<img src="${pageContext.request.contextPath}/resources/images/member/chaticon.png">
							채팅하기
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="" data-bs-toggle="modal" data-bs-target="#memberModal" id="reportBtn">
							<img src="${pageContext.request.contextPath}/resources/images/member/reporticon.png">
							신고하기
						</a>
<%-- 						동네인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"> --%>
<%-- 						&nbsp;&nbsp;&nbsp;&nbsp;본인인증<img src="${pageContext.request.contextPath}/resources/images/member/checkmark.png"> --%>
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
	  <input type="radio" class="btn-check" name="category" id="questionCategory" value="커뮤니티 작성 글" autocomplete="off">
	  <label class="btn btn-outline-primary" for="questionCategory">커뮤니티 작성 글</label>
	  <input type="radio" class="btn-check" name="category" id="dailyCategory" value="커뮤니티 작성 댓글" autocomplete="off">
	  <label class="btn btn-outline-primary" for="dailyCategory">커뮤니티 작성 댓글</label>
	</div>
    	

   	<%-- 페이지 옵션2 : 커뮤니티 관련 탭(커뮤니티 작성글, 커뮤니티 작성 댓글) 선택 시 표시 --%>
	<div id="communityButtonArea">
		<input type="button" value="글 삭제">
	</div>
		
	<section class="item-details section" style="padding: 10px 0px !important; background-color: #ffffff !important">
            
	    <div class="product-details-info" id="wholeCommunityArea">
			
			<!-- 커뮤니티 옵션1-1 : 커뮤니티 작성글 보기 탭 선택 시 -->
		    <div class="single-block" id="singleCommunityArea">
				<div id="communityLeft">
					<div id="communityLeftUpperLeft">
						<p>커뮤니티 카테고리</p>
						<b id="bold"><a href="">커뮤니티 작성 글 제목</a></b><br>
					</div>
					<div id="communityMiddleArea">
						<div id="communityMiddleLeft">n분 전</div>
						<div id="communityMiddleRight">
							조회 n&nbsp;&nbsp;&nbsp;&nbsp;댓글 n&nbsp;&nbsp;&nbsp;&nbsp;좋아요 n
						</div>
					</div>
					<div id="communityLeftBottom">
						<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
						Maecenas ac libero ac ligula consectetur accumsan in et diam. 
						Vestibulum commodo in sem sit amet laoreet. 
						Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
						Cras et sapien vel arcu suscipit vulputate. 
						</p>
					</div>
				</div>
				<div id="communityRight">
					<img src="${pageContext.request.contextPath}/resources/images/">
				</div>
			</div>

			<!-- 커뮤니티 옵션1-2 : 커뮤니티 작성글 보기 탭 선택 후 글 삭제 버튼 클릭 시 -->
			<!-- 삭제할 글 선택을 위한 체크박스 표시 -->
			<div id="communityCheckboxContainingArea">
				<input type="checkbox">
	  			<%-- 삭제버튼 클릭 시에만 표시 --%>
			    <div class="single-block" id="singleCommunityArea">
		  		
					<div id="communityLeft">
						<div id="communityLeftUpperLeft">
							<p>커뮤니티 카테고리</p>
							<b id="bold"><a href="">커뮤니티 작성 글 제목</a></b><br>
						</div>
						<div id="communityMiddleArea">
							<div id="communityMiddleLeft">n분 전</div>
							<div id="communityMiddleRight">
								조회 n&nbsp;&nbsp;&nbsp;&nbsp;댓글 n&nbsp;&nbsp;&nbsp;&nbsp;좋아요 n
							</div>
						</div>
						<div id="communityLeftBottom">
							<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							Maecenas ac libero ac ligula consectetur accumsan in et diam. 
							Vestibulum commodo in sem sit amet laoreet. 
							Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
							Cras et sapien vel arcu suscipit vulputate. 
							</p>
						</div>
					</div>
					<div id="communityRight">
						<img src="${pageContext.request.contextPath}/resources/images/">
					</div>
				</div>
			</div>
	    
			<!-- 커뮤니티 옵션2-1 : 커뮤니티 작성댓글 보기 탭 선택 시 -->
		    <div class="single-block" id="singleCommunityReplyArea">
				<div id="communityReplyTitleArea">
					<p>커뮤니티 카테고리</p>
					<b id="bold"><a href="">댓글이 등록된 게시글 제목</a></b><br>
				</div>
				<div id="communityReplyMiddleArea">
					<div id="communityReplyMiddleLeft">n분 전</div>
					<div id="communityReplyMiddleRight">
						대댓글 n개
					</div>
				</div>
				<div id="communityReplyLeftBottom">
					<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
					Maecenas ac libero ac ligula consectetur accumsan in et diam. 
					</p>
				</div>
			</div>
	    		
			<div id="communityCheckboxContainingArea">
				<!-- 커뮤니티 옵션2-2 : 커뮤니티 작성댓글 보기 탭 선택 시 -->
				<input type="checkbox">
	  			<!-- checkbox 가운데정렬 작업 필요 -->
	  			<%-- 삭제버튼 클릭 시에만 표시 --%>
			    <div class="single-block" id="singleCommunityReplyArea">
					<div id="communityReplyTitleArea">
						<p>커뮤니티 카테고리</p>
						<b id="bold"><a href="">댓글이 등록된 게시글 제목</a></b><br>
					</div>
					<div id="communityReplyMiddleArea">
						<div id="communityReplyMiddleLeft">n분 전</div>
						<div id="communityReplyMiddleRight">
							대댓글 n개
						</div>
					</div>
					<div id="communityReplyLeftBottom">
						<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
						Maecenas ac libero ac ligula consectetur accumsan in et diam. 
						</p>
					</div>
				</div>
			</div>
			
		</div>
	</section>
		
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