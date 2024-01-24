<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
    <script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
$.ajax(function() {
	   url: "reportRegist",
	   data: {
		   reporter_id: "",
		   : "",
		   report_num: "숫자 1 ~ 8",
		   report_content: "report_content",
		   <%-- 신고 상태는 디폴트 0으로 처리 --%>
	  	   report_status: "숫자 0 ~ 1"
	   },
	   seccess: function(result) {
		   if(result == 'true') {
			   Swal.fire('신고가 완료되었습니다!', '화끈하시네요~!', 'success');
			<%-- 신고완료후 모달창 닫기 --%>
			   
		   } else {
			   Swal.fire('신고가 실패했습니다!', '다시 신고해주세요', 'fail');
		   }
		   
	   },
	   error: function() {
		
	   }


$(function() {
	$("#reviewCheckFrom").on("click", function() {
		$("#staticBackdropLabel").text("게시글 신고하기");
		$("#reviewCheck").empty();
		$("#reviewCheck").html(
				'<div class="accordion" id="accordionExample">'
					+ '<div class="accordion-subject">\'게시글 제목\' 게시글을 신고하는 이류를 선택해주세요 </div>'
					+ '<div class="accordion-item">'
						+ '<h2 class="accordion-header" id="headingOne">'
						+ '<button id="accordioncolor" class="accordion-button collapsed" sytle="background-color:#052ec0;" type="button" data-bs-toggle="collapse"'
							+ 'data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">'
							+ '<span class="title">거래 금지 물품이에요</span>' 
						+ '</button>'
						+ '</h2>'
						+ '<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"'
						   		+ 'data-bs-parent="#accordionExample">'
							+ '<div class="accordion-body">'
								+ '<p>어떤 물품을 판매하고 있나요? <br><br> 내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>'
								+ '<a href="#">거래 금지 물품을 확인해보세요</a>'		
								+ '<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>'
							+ '</div>'
						+ '</div>'
					+ '</div>'
					
					+ '<div class="accordion-item">'
						+ '<h2 class="accordion-header" id="headingTwo">'
						+ '<button id="accordioncolor" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"'
							+ 'data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">'
							+ '<span class="title">광고성 게시글이에요</span>' 
						+ '</button>'
						+ '</h2>'
						+ '<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"'
		    				+ 'data-bs-parent="#accordionExample">'
							+ '<div class="accordion-body">'
								+ '<p>어떤 내용의 광고성 게시글인가요? <br><br> 내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>'
								+ '<a href="#">이런 종류의 내용은 광고 입니다.</a>'		
								+ '<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>'		
							+ '</div>'
						+ '</div>'
					+ '</div>'
					
					+ '<div class="accordion-item">'
						+ '<h2 class="accordion-header" id="headingThree">'
						+ '<button id="accordioncolor" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"'
							+ 'data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">'
							+ '<span class="title">거래중 분쟁이 발생했어요</span>' 
						+ '</button>'
						+ '</h2>'
						+ '<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"'
				    		+ 'data-bs-parent="#accordionExample">'
							+ '<div class="accordion-body">'
								+ '<p>어떤 분쟁이 발생했나요? <br><br> 내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>'
								+ '<a href="#">분쟁 시 이렇게 대처 하세요</a>'		
								+ '<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>'		
							+ '</div>'
						+ '</div>'
					+ '</div>'
					
					+ '<div class="accordion-item">'
						+ '<h2 class="accordion-header" id="headingfour">'
						+ '<button id="accordioncolor" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"'
							+ 'data-bs-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">'
							+ '<span class="title">사기 인것 같아요</span>' 
						+ '</button>'
						+ '</h2>'
						+ '<div id="collapsefour" class="accordion-collapse collapse" aria-labelledby="headingfour"'
				    		+ 'data-bs-parent="#accordionExample">'
							+ '<div class="accordion-body">'
								+ '<p>어떤 종류의 사기인가요? <br><br> 내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>'
								+ '<a href="#">이런 내용은 사기니까 조심하세요!</a>'		
								+ '<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>'
							+ '</div>'
						+ '</div>'
					+ '</div>'
					
					+ '<div class="accordion-item">'
						+ '<h2 class="accordion-header" id="headingfive">'
						+ '<button id="accordioncolor" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"'
							+ 'data-bs-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">'
							+ '<span class="title">다른 문제가 있어요</span>' 
						+ '</button>'
						+ '</h2>'
						+ '<div id="collapsefive" class="accordion-collapse collapse" aria-labelledby="headingfive"'
				    		+ 'data-bs-parent="#accordionExample">'
							+ '<div class="accordion-body">'
								+ '<p>어떤 문제가 있나요? <br><br> 내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>'
								+ '<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>'
							+ '</div>'
						+ '</div>'
					+ '</div>'
				+ '</div>'
				
                
		);
		$(".modal-footer").html(
				'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>'
				+ '<button type="submit" class="btn btn-primary" id="reviewBtn" onclick="reviewRegist()">'
				+'신고 하기</button>'	
		);
	});
		
		
	
		
		
});
	
function reportBoard() {
	alert("신고합니다");
}	
	
function reviewRegist() {
	location.href="https://www.naver.com/";
}		
	
</script>
</head>
<body>
	<h1>신고한다</h1>
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="reviewCheckFrom" onclick="reportBoard()">
			신고하기
	</button>
	<div style="height: 80px;">
		<div class="position-absolute bottom-0 end-0"><i class="fa fa-warning" id="reportBtn" style="font-size:24px; margin-right: 50em;">신고하기</i></div>
	</div>
	
	<%-- 후기 모달 설정 --%>
<div class="modal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">신고 하기</h1>
			</div>
			<div class="modal-body">
				<div class="d-flex justify-content-center">
				</div>
				<div id="reviewCheck" class="mx-auto my-5 w-75">
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>


</body>
</html>