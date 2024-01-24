<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%-- sweetalert confirm --%>
function reportRegist() {
	Swal.fire({
		   title: '정말 신고하시겠습니까?',
		   text: '내용과 사실이 다를 경우 불이익을 당할 수 있습니다',
		   icon: 'Report',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '신고하기', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소하기', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result => {
		    // 만약 Promise리턴을 받으면,
		    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		    	Swal.fire('신고가 실패했습니다!', '다시 신고해주세요', 'fail');
		   }
		});
}	
</script>
<script type="text/javascript">
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
				+ '<button type="submit" class="btn btn-primary" id="reviewBtn" onclick="reportRegist()">'
				+'신고 하기</button>'	
		);
	});
		
		
});	
</script>
</head>
<body>
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