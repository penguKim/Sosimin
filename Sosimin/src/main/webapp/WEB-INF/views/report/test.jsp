<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
   
    <%-- sweetalert --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
$(function() {
	
	//새로운 모달 창 열기 버튼 클릭 이벤트 처리
	$('#openNewModalButton').click(function() {
	  // 기존 모달 창 닫기
	  $('#memberModal1').modal('hide');
	
	  // 새로운 모달 창 열기
	  $('#newModal').modal('show');
	});
});
// $(function() {
	
// 	$(".heart").on("click", function () {
//         $(this).toggleClass("is-active");
//     });
	
// 	$("#reportBtn").on("click", function() {
			
// 	});
	
// 	let searchKeyword = ""; 
// 	let category = "";
// 	let id = "";
	<%-- 기본적으로 상품목록은 사용자의 지역 구(지역) 기준으로 상품 목록 처리 --%>
// 	$.ajax({
// 		url: "",
// 		data: {
			<%-- searchKeyword 의 경우 검색 내용으로 글목록 비교 상품목록 출력  --%>
			
			<%-- category 의 경우 카테고리 선택 시 상품 카테고리 비교 상품목록 출력 --%>
			
// 		},
// 		dataType: "json",
// 		success: function(result) {
			
			
// 		},
// 		error: function() {
			
// 		}
<%-- 	}); 상품 목록 ajax 끝 --%>
	
	
	<%-- 찜 하기 처리 --%> 
// 	$.ajax({
// 		url: "찜목록 조회를 위한 테이블 조회",
// 		data: {
			<%-- 유저아이디 판별 찜목록 조회 --%>	
// 		},
// 		dataType: "json",
// 		success: function(result) {
			
			
// 		},
// 		error: function() {
			
// 		}
		
<%-- 	}); 찜하기 ajax 끝 --%>
<%-- });	 상품목록 조회, 찜하기 처리 끝 --%>
	
	
// 	function prductLike() {
		
// 		$.ajax({
// 			type: "POST",
// 			url: "",
// 			data: {
				
// 			},
// 			dataType: "json",
// 			success: function(result) {
				
				
				
				
// 			},
// 			error: function() {
				
// 			}
// 		}); // ajax 끝
// 	}

</script>
</head>
<body>
	<!-- 기존 모달 창 -->
<div class="modal fade" id="memberModal1" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="memberModalLabel">기존 모달 창</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>기존 모달 창의 내용입니다.</p>
        <button id="openNewModalButton" type="button" class="btn btn-primary">새로운 모달 창 열기</button>
      </div>
    </div>
  </div>
</div>

<!-- 새로운 모달 창 -->
<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="newModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="newModalLabel">새로운 모달 창</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>새로운 모달 창의 내용입니다.</p>
      </div>
    </div>
  </div>
</div>

</body>
</html>