<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script>
	// sweetalert - icon 속성 값
	// 성공 : success, 실패 : error, 경고 : warning, 정보 : info, 질문 : question
	$(function() {
		// 전달받은 msg 속성값 alert() 함수로 출력
		Swal.fire({
			icon: '${msg3}',
			title: '${msg}',
			text: '${msg2}',
			allowOutsideClick: false
		}).then((result) => {
			if(result.isConfirmed) {
				// Model 객체로 전달받은 "isClose" 값이 true일 경우 현재 창 종료, 아니면 이전페이지로 돌아가기
				// => 단, Model 객체에 저장된 실제 데이터타입과 상관없이 자바스크립트에서 문자열로 처리
				if("${isClose}" == "true") { // 만약, "true"일 때만 문자열 전달 시 == "true" 생략해도 됨
					// 현재 창 닫기
					window.close();
//			 		window.opener.close(); // 부모창 닫기
				} else {
					// 이전페이지로 돌아가기
					history.back();
				}
			}
		});
	});
</script>