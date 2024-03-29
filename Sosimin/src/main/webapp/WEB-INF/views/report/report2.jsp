<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
<%-- sweetalert confirm --%>
function reportRegist(index) {
	<%-- 신고 분류 0: 게시물 신고, 1: 사용자 신고--%>
// 	let report_content = $("#reportTextArea").val();
	let report_type = index;
	
// 	if(report_content == null) {
// 		alert("신고내용을 입력해주세요");
		
// 	} else if(report_content != null) {
		Swal.fire({
			   title: '정말 신고하시겠습니까?',
			   text: '내용과 사실이 다를 경우 불이익을 당할 수 있습니다',
			   icon: 'warning',
			   
			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			   confirmButtonText: '신고하기', // confirm 버튼 텍스트 지정
			   cancelButtonText: '취소하기', // cancel 버튼 텍스트 지정
			   reverseButtons: true, // 버튼 순서 거꾸로
		}).then(result => {
		    // 만약 Promise리턴을 받으면,
		    if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		    	$("#modalDismiss").click();
				$("#memberDismiss").click();
		    	$.ajax({
						url: "ReportRegist",
						data: {
							report_type: report_type, // 신고 종류
							reporter_id: "너굴맨", // 신고자 아이디
							reportee_id: "사기꾼", // 피신고자 아이디
							report_reason: "1", // 신고 사유
							report_content: "너굴맨이 해치웠으니 안심하라구!" // 신고 내용
						},
						success: function() {
							const Toast = Swal.mixin({
							    toast: true,
							    position: 'center-center',
							    showConfirmButton: false,
							    timer: 2000,
							    timerProgressBar: false,
							})
							Toast.fire({
							    icon: 'success',
							    title: '신고 감사합니다!'
							})
							
						},
						error: function() {
							const Toast = Swal.mixin({
							    toast: true,
							    position: 'center-center',
							    showConfirmButton: false,
							    timer: 2000,
							    timerProgressBar: false,
							})
							Toast.fire({
							    icon: 'error',
							    title: '죄송하지만 다시 시도해주세요 ㅠㅠ'
							})
						}
				}); // 신고 등록 ajax 끝
		   	}
		});
	}	
	
</script>
</head>
<body>
<%-- 회원 모달 --%>
	<div class="modal fade review-modal" id="memberModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="reportsubject">회원 신고하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="memberDismiss"></button>
				</div>
				<div class="modal-body">
					<div class="accordion" id="accordionExample">
						<div class="accordion-subject">'사용자이름' 사용자를 신고하는 이유를 선택해주세요 </div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading6">
								<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
									data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
									<span class="title">비매너 사용자에요</span>
								</button>
							</h2>
							<div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6"
							   		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 행위를 했나요?</p> 
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<p><a href="#">이런 행위는 비매너행위에요!</a></p>		
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
								</div>
							</div>
						</div>
						
						<div class="accordion-item">
						<h2 class="accordion-header" id="heading7">
								<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
									data-bs-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
									<span class="title">욕설, 비방, 혐오를 표현을 해요</span>
								</button>
							</h2>
							<div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7"
			    				data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 표현을 했나요?</p>
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<p><a href="#">이런 말은 하면 안되요!!</a></p>		
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>	
								</div>
							</div>
						</div>
					
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading8">
							<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse8" aria-expanded="false" aria-controls="collapse8">
								<span class="title">거래중 분쟁이 발생했어요</span>
							</button>
							</h2>
							<div id="collapse8" class="accordion-collapse collapse" aria-labelledby="heading8"
					    		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 분쟁이 발생했나요?</p>
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<p><a href="#">분쟁 시 이렇게 대처 하세요</a></p>
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>	
								</div>
							</div>
						</div>
						
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading9">
							<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse9" aria-expanded="false" aria-controls="collapse9">
								<span class="title">전문 판매 업자같아요</span>
							</button>
							</h2>
							<div id="collapse9" class="accordion-collapse collapse" aria-labelledby="heading9"
					    		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 종류의 물건을 팔고있나요? </p>
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
								</div>
							</div>
						</div>
						
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading10">
							<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse10" aria-expanded="false" aria-controls="collapse10">
								<span class="title">다른 문제가 있어요</span>
							</button>
							</h2>
							<div id="collapse10" class="accordion-collapse collapse" aria-labelledby="heading10"
					    		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 문제가 있나요?</p>
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>
					<button type="submit" class="btn btn-primary" id="reportBtn" onclick="reportRegist(1)">신고 하기</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>