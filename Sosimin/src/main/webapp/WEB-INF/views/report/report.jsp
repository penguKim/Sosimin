<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
let reporter_id = "${sessionScope.sId}";
$(function() {
	$("#testBtn").on("click", function() {
		let test = $("#testBtn").val();
		
		const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 1000,
		    timerProgressBar: false,
		})
		Toast.fire({
		    icon: 'info',
		    title: '테스트중입니다'
		})
		
	});
});
</script>
<script type="text/javascript">
<%-- 게시글 신고에서 사용자 신고로 전환 시 기존 모달 제거 후 새모달 띄우기 --%>
$(function() {
	$("#memberReportModal").on("click", function() {
		$("#modalDismiss").click();
		
		$("#memberModal").modal('show');
	});
});

// $(function() {
// 	$("#submenu-1-3>li").on("click", function() {
// 		let length =  $("#submenu-1-3>li").length;
// 		let	category = $(this).text();
// 		location.href="SearchProduct?category=" + category;
// 	});
// });

<%-- sweetalert confirm --%>
function reportRegist(index, reason) {
	<%-- 신고 분류 0: 게시물 신고, 1: 사용자 신고--%>
	let report_type = index;
	let report_content = ""; 
	let reportee_id = $("#reportee_id").val();
	
	// 신고사유에 따른 내용 저장
	if(reason === 1) {
		report_content = $(".reportTextArea").eq(reason - 1).val();
	} else if (reason === 2 ) {
		report_content = $(".reportTextArea").eq(reason - 1).val();
	} else if (reason === 3 ) {
		report_content = $(".reportTextArea").eq(reason - 1).val();
	} else if (reason === 4 ) {
		report_content = $(".reportTextArea").eq(reason - 1).val();
	} else if (reason === 5 ) {
		report_content = $(".reportTextArea").eq(reason - 1).val();
	} else if (reason === 6 ) {
		report_content = $(".reportTextArea").eq(reason - 1).val();
	} else if (reason === 7 ) {
		report_content = $(".reportTextArea").eq(reason - 1).val();
	} 
	
	// 신고 내용 미입력시 
 	if (report_content === "") {
	    // textarea가 입력되지 않은 경우 모달 창 띄우기
	    const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 2000,
		    timerProgressBar: false,
		})
		Toast.fire({
		    icon: 'error',
		    title: '신고 내용을 입력해주세요!!!'
		})
		return false;
    }
	
 	// 사용자 미로그인 시
 	if(reporter_id === "") {
 		 const Toast = Swal.mixin({
 		    toast: true,
 		    position: 'center-center',
 		    showConfirmButton: false,
 		    timer: 2000,
 		    timerProgressBar: false,
 		})
 		Toast.fire({
 		    icon: 'info',
 		    title: '로그인 후 이용해주세요!'
 		})
 		
 		$("#modalDismiss").click();
 		return false;
 	} 	
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
							report_type: index, // 신고 종류
							reporter_id: reporter_id, // 신고자 아이디
							reportee_id: reportee_id, // 피신고자 아이디
							report_reason: reason, // 신고 사유
							report_content: report_content // 신고 내용
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

function guide(url) {
	Swal.fire({
		   title: '가이드를 보시겠습니까?',
		   icon: 'question',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '신고하기', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소하기', // cancel 버튼 텍스트 지정
		   reverseButtons: true, // 버튼 순서 거꾸로
	}).then(result => {
		 if (result.isConfirmed) {
			location.href=url;
		 }
	});
}
	
</script>
</head>
<body>
	
	<%-- 게시글 모달 설정 --%>
	<div class="modal fade review-modal" id="reportModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="reportsubject">신고하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="modalDismiss"></button>
				</div>
				<div class="modal-body">
					<div class="accordion" id="accordionExample">
						<div class="accordion-subject">게시글 신고</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading1">
								<button id="accordionBtn" class="accordion-button collapsed .accordioncolor" type="button" data-bs-toggle="collapse"
									data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
									<span class="title">거래 금지 물품이에요</span>
								</button>
							</h2>
							<div id="collapse1" class="accordion-collapse collapse" aria-labelledby="heading1"
							   		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 물품을 판매하고 있나요?</p> 
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<p><a href="javascript:void(0)" onclick="guide('ProhibitionOnsale')">거래 금지 품목을 살펴봅시다</a></p>
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
									<button type="button" class="btn btn-primary" id="reportBtn" onclick="reportRegist(0, 1)">신고 하기</button>		
								</div>
							</div>
						</div>
						
						<div class="accordion-item">
						<h2 class="accordion-header" id="heading2">
								<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
									data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
									<span class="title">광고성 게시글이에요</span>
								</button>
							</h2>
							<div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2"
			    				data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 내용의 광고성 게시글인가요? </p>
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<p><a href="#">이런 종류의 내용은 광고 입니다.</a></p>		
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
									<button type="button" class="btn btn-primary" id="reportBtn" onclick="reportRegist(0, 2)">신고 하기</button>	
								</div>
							</div>
						</div>
					
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading3">
							<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
								<span class="title">거래중 분쟁이 발생했어요</span>
							</button>
							</h2>
							<div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3"
					    		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 분쟁이 발생했나요? </p> 
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다 </p>
									<p><a href="#">분쟁 시 이렇게 대처 하세요</a></p>
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
									<button type="button" class="btn btn-primary" id="reportBtn" onclick="reportRegist(0, 3)">신고 하기</button>	
								</div>
							</div>
						</div>
						
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading4">
							<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
								<span class="title">사기 인것 같아요</span>
							</button>
							</h2>
							<div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4"
					    		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 종류의 사기인가요? </p> 
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<p><a href="#">이런 내용은 사기니까 조심하세요!</a></p>
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
									<button type="button" class="btn btn-primary" id="reportBtn" onclick="reportRegist(0, 4)">신고 하기</button>
								</div>
							</div>
						</div>
						
						<div class="accordion-subject">사용자 신고</div>
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
									<form>
										<p class="accordion-body-1">어떤 행위를 했나요?</p> 
										<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
										<p><a href="#">이런 행위는 비매너행위에요!</a></p>		
										<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
										<button type="submit" class="btn btn-primary" id="reportBtn" onclick="reportRegist(1, 5)">신고 하기</button>
										
									</form>
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
									<button type="button" class="btn btn-primary" id="reportBtn" onclick="reportRegist(1, 6)">신고 하기</button>	
								</div>
							</div>
						</div>
						
						<div class="accordion-subject">기타</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading5">
							<button id="accordionBtn" class="accordion-button collapsed accordioncolor" type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
								<span class="title">다른 문제가 있어요</span>
							</button>
							</h2>
							<div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5"
					    		data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<p class="accordion-body-1">어떤 문제가 있나요?</p> 
									<p class="accordion-body-2">내용과 사실이 다를 경우 불이익을 당할 수 있습니다</p>
									<textarea class="reportTextArea" placeholder="신고내용을 직접 입력해주세요"></textarea>
									<button type="button" class="btn btn-primary" id="reportBtn" onclick="reportRegist(1, 7)">신고 하기</button>
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewClose">창닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>