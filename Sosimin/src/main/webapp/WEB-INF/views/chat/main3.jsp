<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sosimin</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/report.css" />
    
     <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    
    
    <%--  --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
	/* 채팅방 전체 영역 */
	#chatRoomArea {
		width: 450px;
		height: 600px;
		border: 1px solid black;
		margin-top: 20px;
		margin-bottom: 20px;
		/* 지정한 영역 크기보다 컨텐츠 양이 더 많을 경우 수직 방향 스크롤바 추가 */
		overflow-y: auto;
		display: inline-block;
		background-color: #eff3f7;
	}
	
	/* 채팅방 1개 영역 */
	.chatRoom {
	width:430px;
	height:450px;
	margin-right: 10px;
	margin-bottom: 20px;
	display: inline-block;
	border: 1px solid black;
	}
	
	.chatRoomTitle:hover {
		background-color: #5e616a;
	}
	
	/* 채팅 메세지 표시 영역 */
	.chatMessageArea {
		width: 100%;
		height: 100%;
		border: 1px solid gray;
		overflow-y: auto;
	}
	
	/* 채팅 메세지 */
	.message {
		height: 30px;
	}
	
	/* 채팅 메세지 정렬 */
	.message_align_center {
		text-align: center;
	}
	
	.message_align_left {
		text-align: left;
	}
	
	.message_align_right {
		text-align: right;
	}
	
	.chat_text {
		font-size: 16px;
	}
	
	.send_time {
		font-size: 9px;
		vertical-align: bottom;
	}
	
	.message_align_left .chat_text {
		background-color: yellow;
	}
	
	.message_align_right .chat_text {
		background-color: skyblue;
	}
	
	
	/* 채팅방 목록 전체 영역 */
	#chatRoomListArea {
		width: 300px;
		height: 600px;
		border: 1px solid black;
		margin-top: 20px;
		margin-bottom: 20px;
		/* 지정한 영역 크기보다 컨텐츠 양이 더 많을 경우 수직 방향 스크롤바 추가 */
		overflow-y: auto;
		display: inline-block;
		background-color:#3b3e49;
	}
	#article{
		text-align: center;
	}
	
	.chatMsg{
		margin-top:10px;
		margin-bottom:10px;
	    resize: none;
	    border: none;
	    display: block;
	    width: 100%;
	    height: 80px;
	    border-radius: 3px;
	    padding: 20px;
	    font-size: 13px;
	    margin-bottom: 13px;
	}
	.chatRoomList {
		position:relative;
		vertical-align: middle;
	}	
	.chatRoomTitle{
		vertical-align:middle;
		position:relative;
		height: 80px;
	}
	#chatSpan{
		position: relative;
		top:30px;
	}
	
	.btnSend, .btnQuitRoom{
	width: 100px;
    height: 40px;
    font-size: 16px;
    color: white;
    background-color: #39d274;
    border: none;
    border-radius: 5px;
	}
	
	#tradeOk:hover, #payOk:hover, #buyOk:hover, #stopBtn:hover{
		background-color: #001828;
	}
	#tradeOk, #payOk, #buyOk, #stopBtn{
		display: inline-block;
		width: 100px;
	}
	#stopBtn{
		position: relative;
		top: 26px;
		left: 322px;
	}
	#buyOk{
		position: relative;
		top: 79px;
		left: 210px;
	}
	#payOk{
		position: relative;
		top: 132px;
		left: 95px;
	}
	#tradeOk{
		position: relative;
		top: 185px;
		right: 20px;
	}
	
	#tradeButtonDiv{
		display: inline-block;
		position: relative;
	}
	
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script>
	let product;
	$(function() {
	    // 상품 상세 페이지에서 가져온 판매자 아이디
	//     var sellerId = "${productChat.member_id}";
		$("#receiver_id").val("${productChat.member_id}");
	    
		// 버튼 클릭 이벤트 처리
// 		$("#btnJoin").click(function() {
// 			// 상대방 아이디 미입력 시 오류메세지 출력 및 입력창 포커스 요청
// 			if($("#receiver_id").val() == "") {
// 				alert("상대방 아이디 입력 필수!");
// 				$("#receiver_id").focus();
// 				return;
// 			}
			
// 			startChat();
// 		});
		
		
	});
	
	// ===============================================================
	// 웹소켓 연결 요청
	let ws; // 웹소켓 연결 시 웹소켓 객체를 저장할 변수 선언
	let current_user_id; // 채팅방에서 사용할 사용자 아이디 저장 변수 선언
	
// 	function connect() {
// 		// 사용자 세션 아이디 변수에 저장
// 		current_user_id = "${sessionScope.sId}";

// 		// 웹소켓 연결에 사용할 기본 주소 설정(ws 프로토콜 사용)
// 		// => 보안을 위해서는 ws 대신 wss 사용해야함
// 		let ws_base_url = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}";
// 		// => 주의! request 객체의 contextPath 값은 "/XXX" 형식으로 리턴되므로 문자열 결합 시 / 생략
		
// 		// 웹소켓 요청(Handshake)
// 		// => WebSocket 객체 생성(생성자 파라미터로 요청 주소 전달)
// 		ws = new WebSocket(ws_base_url + "/echo2");
// 		// => 이 요청을 서버에서 처리하기 위해 매핑을 수행해야하는데
// 		//    이 매핑은 컨트롤러가 아닌 xml 파일에서 설정 필요
// 		//    (=> ws-context.xml 파일 만들어서 설정)
		
// 		// WebSocket 객체의 onxxx 이벤트에 각각의 함수 연결
// 		// => 주의! onxxx 이벤트에 전달하는 함수는 반드시 함수명만 기술
// 		ws.onopen = onOpen;
// 		ws.onmessage = onMessage;
// 		ws.onclose = onClose;
// 		ws.onerror = onError;
		
// 	}
	// =========================================================================
	// 웹소켓(서버) 연결 시 open 이벤트 처리 메서드(채팅방 입장 버튼 클릭 시)
	function onOpen() {
		setTimeout(function() {
			// 채팅 페이지 접속 시 웹소켓 연결 후 초기화 메세지 전송
			// => 메세지타입(INIT), 사용자 아이디, 3개 널스트링
			ws.send(getJsonString("INIT", current_user_id, "", "", "", ${param.product_id}));
			
			startChat(); // 채팅 시작
		}, 300);
	}
	
	// ================================================================
	// 상대방과의 채팅 시작(이미 채팅페이지 접속 시점에 웹소켓은 생성되어 있음)
	function startChat() {
		// 채팅 시작을 알리는 웹소켓 메세지 전송
		// => 타입(START), 사용자아이디, 상대방아이디, 나머지 2개 널스트링
		ws.send(getJsonString("START", current_user_id, $("#receiver_id").val(), "", "", ${param.product_id}));
	}
	
	// ===============================================================
	// 판매자가 거래수락 버튼을 누를 경우
	function acceptPayment() {
		// 거래 수락을 알리는 웹소켓 메세지 전송
		// => 타입(CONFIRM), 사용자아이디, 상대방아이디, 나머지 2개 널스트링
		Swal.fire({
	        title: "거래를 수락하시겠습니까?",
	        text: "확인을 누르시면 거래가 진행됩니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: "수락",
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	    	if (result.isConfirmed) {
				ws.send(getJsonString("CONFIRM", current_user_id, $("#receiver_id").val(), "", "", product));
	    	}
	    });
	}
	
	// ===============================================================
	// 구매자가 구매확정 버튼을 누를 경우
	function confirmPayment() {
		// 채팅방에서 produtct_id 들고오기
//	 	location.href="ConfirmPayment?product_id=303";
		event.preventDefault();
		Swal.fire({
	        title: "구매를 확정하시겠습니까?",
	        text: "확인을 누르시면 거래가 완료됩니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: "확인",
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	    	if (result.isConfirmed) {
				ws.send(getJsonString("PAY_CONFIRM", current_user_id, $("#receiver_id").val(), "", "", product));
	    	}
	    });	
	}//confirmPayment 끝
	// ===============================================================
	// 거래중단 버튼을 누를 경우
	function stopPayment() {
		// 채팅방에서 produtct_id 들고오기
		event.preventDefault();
		Swal.fire({
	        title: "거래를 중단하시겠습니까?",
	        text: "확인을 누르시면 거래가 중단됩니다.",
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#39d274',
	        cancelButtonColor: '#d33',
	        confirmButtonText: "중단",
	        cancelButtonText: '취소',
	        reverseButtons: true,
	    }).then((result) => {
	    	if (result.isConfirmed) {
				ws.send(getJsonString("STOP_PAY", current_user_id, $("#receiver_id").val(), "", "", product));
	    	}
	    });
	}//stopPayment 끝
	
	
	// ================================================================
	// 전송할 메세지 및 각종 정보를 JSON 타입 문자열로 변환하여 리턴하는 getJsonString() 함수 정의
	function getJsonString(type, current_user_id, receiver_id, room_id, message, product_id) {
		// 전달받은 파라미터들을 하나의 객체로 결합하여 JSON 타입 문자열로 변환 후 리턴
		// => 파라미터 : 메세지타입, 사용자아이디, 상대방아이디, 방번호, 메세지
		let data = {
			type : type,
			sender_id : current_user_id,
			receiver_id : receiver_id,
			room_id : room_id,
			message : message,
			product_id : product_id
		};
		
		// JSON.stringify() 메서드를 통해 객체 -> JSON 문자열로 변환
		return JSON.stringify(data);
	}
	
	// ================================================================
	// 현재 채팅창에 메세지 출력
	// => 파라미터 : 룸ID, 발신자, 수신자, 메세지, 타입, 발신시각
	function appendMessageToTargetRoom(room_id, sender_id, receiver_id, message, type, send_time) {
// 		console.log(room_id + ", " + sender_id + ", " + receiver_id + ", " + message + ", " + type);
		// ================================================================
		// 메세지 시각 표시 설정
		// => 현재 시스템의 시각 정보와 비교하여 다음 형식으로 시각 변경
		//    오늘일 경우 시:분, 같은 연도일 경우 월-일 시:분, 다른 연도일 경우 연-월-일 시:분
		
		// --------------------------------------------------------------
		// 메세지 종류에 따라 정렬 위치 다르게 표시
		let chat_text = "";
		let align = "";
		let message_div = "";
		
		if(type != "TALK") { // // 시스템 메세지 판별
			// 메세지만 표시(사용자 아이디 생략), 가운데 정렬
			chat_text = "> " + message + " <";
			message_div = "<div class='message message_align_center'><span class='chat_text'>" + chat_text + "</span></div>";
		} else if(sender_id == current_user_id) { // 자신의 메세지(발신자가 자신일 경우)
			// 메세지와 시각 표시(사용자 아이디 생략), 우측 정렬
			chat_text = message;
			message_div = "<div class='message message_align_right'><span class='send_time'>" + send_time + "</span><span class='chat_text'>" + chat_text + "</span></div>";
		} else if(receiver_id == current_user_id) { // 상대방의 메세지(수신자가 자신일 경우)
			// 발신자 아이디와 메세지와 시각 표시, 좌측 정렬
			chat_text = sender_id + " : " + message;
			message_div = "<div class='message message_align_left'><span class='chat_text'>" + chat_text + "</span><span class='send_time'>" + send_time + "</span></div>";
		}
		
		// ================================================================
		// 단순히 메세지만 표시(임시)
		// 1) 현재 채팅방 찾기
		//    => #chatRoomArea 의 자식들 중 클래스 선택자(.)가 room_id 인 채팅방 탐색
		let chatRoom = $("#chatRoomArea").find("." + room_id);
		// 2) 현재 채팅방의 자식들 중 메세지 표시 영역(클래스 선택자 chatMessageArea) 탐색
		let chatMessageArea = $(chatRoom).find(".chatMessageArea");
		// 3) 해당 메세지 표시 영역에 메세지 표시
		$(chatMessageArea).append(message_div);
		// 4) 채팅 메세지 출력창 스크롤바를 항상 맨 밑으로 유지
		// => 메세지 영역의 크기 활용
		$(chatMessageArea).scrollTop($(".chatMessageArea").height());
	}
	
	// =========================================================================
	// 서버로부터 메세지 수신 시 message 이벤트 처리 메서드
	// => 파라미터로 MessageEvent 객체가 전달됨
	function onMessage(event) {
		// 전달받은 데이터(event.data)가 JSON 타입 문자열로 전달되므로
		// JSON.parse() 메서드를 통해 JSON 객체로 변환하여 접근
		let data = JSON.parse(event.data);
			
		// 전달받은 메세지의 타입 판별(ENTER or LEAVE or TALK)
		if(data.type == "ENTER" || data.type == "LEAVE") { // 입장 또는 퇴장
			// 입장&퇴장 메세지는 시스템 메세지 형식(>>> xxx <<<) 으로 출력
			appendMessageToTargetRoom(
					data.room_id, data.sender_id, data.receiver_id, data.message, data.type, data.send_time);
			// ------------------------------------------------------------
			// 나가기(LEAVE)일 경우 채팅방 및 채팅 목록에서 삭제
			if(data.type == "LEAVE") { 
				appendMessageToTargetRoom(
						data.room_id, data.sender_id, data.receiver_id, "대화가 종료되었습니다", data.type, data.send_time);
				
				// 자신이 아이디가 발신자 아이디와 동일할 경우(자신이 나가기 버튼 클릭했을 경우)
				if(current_user_id == data.sender_id) {
					// 현재 화면에서 해당 채팅방 삭제 및 채팅방 목록에서도 삭제
					$("#chatRoomArea").find("." + data.room_id).remove();
					$("#chatRoomListArea").find("." + data.room_id).remove();
				}
				
// 				lockToFinishChatRoom(data.room_id);
				
			}
		} else if(data.type == "TALK") { // 대화
			// =============================================
			// 상대방으로부터 채팅 메세지가 수신되었을 경우
			// 현재 화면에서 상대방과의 채팅방이 열려있지 않을 때 새 채팅방 표시
			// 또한, 채팅 목록에 해당 채팅방 없으면 표시(추가)
			if(data.sender_id == current_user_id) { // 내가 보낸 메세지
				// 채팅창의 수신자 아이디를 그대로 설정
// 				createRoom(data.room_id, data.receiver_id, data.product_id);
// 				appendChatRoomToRoomList(data.room_id, data.receiver_id, "채팅-" + data.receiver_id, null);
			} else { // 상대방이 보낸 메세지
				// 채팅창의 수신자 아이디를 상대방(발신자 아이디)으로 설정
// 				createRoom(data.room_id, data.sender_id, data.product_id);
				appendChatRoomToRoomList(data.room_id, data.sender_id, "Id-" + data.sender_id, null, data.product_id, data.receiver_member_profile);
			}
			
			// =============================================
			// 현재 채팅방에 메세지 표시 처리
			appendMessageToTargetRoom(
					data.room_id, data.sender_id, data.receiver_id, data.message, data.type, data.send_time);
		} else if(data.type == "START") { // 채팅방 열기(생성)
			// createRoom() 함수 호출
			// => 파라미터 : 룸 아이디, 상대방 아이디
			createRoom(data.room_id, data.receiver_id, data.product_id);
		
			// 현재 채팅방에 메세지 표시
			appendMessageToTargetRoom(
					data.room_id, data.sender_id, data.receiver_id, data.message, data.type, data.send_time);
		} else if(data.type == "LIST_ADD") {
			console.log("LIST_ADD");
			console.log(data.room_id + ", " + data.receiver_id);
			// 기존 채팅방 목록에 새 채팅방 추가
			// => 룸ID, 상대방ID, 채팅방 제목, status 값(null) 전달
			let title = "Id-" + data.receiver_id;
			appendChatRoomToRoomList(data.room_id, data.receiver_id, title, null, data.product_id, data.receiver_member_profile);
		} else if(data.type == "LIST") {
			// 전체 채팅방 목록 표시
			// 1) 기존 채팅방 목록 표시 영역 초기화
			$("#chatRoomListArea").empty();
			
			// 2) 전달받은 메세지를 JSON 객체로 파싱하여 반복문을 통해 채팅방 목록 생성 표시
			// => 파싱 과정에서 배열 내의 객체 형식으로 파싱되므로 반복문 통해 배열 접근
			for(let room of JSON.parse(data.message)) {
				console.log(room);
				appendChatRoomToRoomList(room.room_id, room.receiver_id, room.title, room.status, room.product_id, room.member_profile);
			}
		} else if(data.type == "MESSAGE_LIST") {
			// 전체 목록을 파싱하여 객체로 변환
			let chatList = JSON.parse(data.message);
			
			for(let chat of chatList) {
				// 현재 채팅방에 메세지 표시
				appendMessageToTargetRoom(
						chat.room_id, chat.sender_id, chat.receiver_id, chat.message, chat.type, chat.send_time);
			}
		} else if(data.type == "CONFIRM") {
			console.log("CONFIRM의 아이디" + data.product_id);
			// 채팅방에서 produtct_id 들고오기
			<%-- 서블릿 요청 --%>
			$.ajax({
				type: "GET",
				url: "AcceptPayment",
				data: {
					"product_id": data.product_id,
//		 			"product_id": "${sellProduct.product_id}",
					"product_buyer": current_user_id
//		 			"product_buyer": "leess"
				},
				success:  function(data) {
					if(data == "not-login") {
						Swal.fire({
							icon: 'warning',
							title: '로그인을 해주세요!',
							text: '로그인 페이지로 이동합니다!',
							allowOutsideClick: false
						}).then((result) => {
								location.href="MemberLogin";
						});	
					} else if(data == "ordered") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '이미 수락한 거래입니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});	
					} else if(data == "true") {
						Swal.fire({
							position: 'center',
							icon: 'success',
							title: '거래를 수락했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
					} else if(data == "inconsistency") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '판매자 정보가 일치하지 않습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});				
					} else {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '거래 수락을 실패했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});			
					}
				},
				error: function(request, status, error) {
			      // 요청이 실패한 경우 처리할 로직
			      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
				}
			});
		} else if(data.type == "PAY_CONFIRM") {
// 			alert("구매확정");
			confirmPayment2();

		} else if(data.type == "STOP_PAY"){
			stopPayment2();
		}
		
	}
	
	// =========================================================================
	// 채팅방 생성
	function createRoom(room_id, receiver_id, product_id) {
		// 룸ID 에 해당하는 class 선택자가 없을 경우에만 새 채팅방 표시
		// (.chatRoom 이 room_id 에 해당하는 클래스를 가지고 있지 않을 경우에만 표시)
		$("#chatRoomArea").empty();
		product = product_id;
		console.log("내가 원하는 상품의 아이디는 : " + product);	
		if(!$(".chatRoom").hasClass(room_id)) {
			console.log("채팅방 새로 생성!");
			// ===========================================================
			// 웹소켓 메세지로 이전 채팅 내역 조회 요청("MessageList")
			ws.send(getJsonString("MESSAGE_LIST", current_user_id, receiver_id, room_id, "", product_id));
			// ===========================================================
			// 채팅방 생성
			
			let room = "<div class='chatRoom " + room_id + " product_" + product_id + "'>"
						+ "		<div class='chatMessageArea'></div>"
						+ "			<div class='commandArea'>"
						+ "				<input type='hidden' class='room_id' value='" + room_id + "'>"
						+ "				<input type='hidden' class='receiver_id' value='" + receiver_id + "'>"
						+ "				<input type='hidden' class='product_id' value='" + product_id + "'>"
						+ "				<input type='text' class='chatMsg' onkeypress='checkEnter(this)' placeholder='메세지를 입력해주세요.'>"
						+ "				<input type='button' class='btnSend' value='전송' onclick='sendMessage(this)'>"
						+ "				<input type='button' class='btnQuitRoom' value='나가기' onclick='quitRoom(this)'>"
						+ "			</div>"
						+ "</div>"
			
						
			$("#chatRoomArea").append(room);
		
		}
		
	}
	
	// =========================================================================
	// 채팅방 목록에 새 채팅방 추가
	function appendChatRoomToRoomList(room_id, receiver_id, title, status, product_id, receiver_member_profile) {
		// 채팅방 목록 1개 정보에 chatRoomList 와 room_id 값을 class 선택자로 추가
		// => 단, 해당 채팅방 목록이 없을 경우에만 추가
		console.log(receiver_member_profile);
		if(!$(".chatRoomList").hasClass(room_id)) {
			let room = "<div class='chatRoomList " + room_id + " id_" + product_id + "'>"
						+ "		<div class='chatRoomTitle' ondblclick='createRoom(\"" + room_id + "\", \"" + receiver_id + "\", \"" + product_id + "\")'><img class='rounded-circle' src='${pageContext.request.contextPath}/resources/upload/" + receiver_member_profile + "' style='width: 40px; height: 40px;'><span id='chatSpan'>" + title + "</span></div>" + "</div>";
			
			$("#chatRoomListArea").append(room);
		}
	}
	// =========================================================================
	// 웹소켓 연결 해제
	function disconnect() {
		// WebSocket 객체의 close() 메서드 호출하여 웹소켓 연결 종료
	}
	
	// 웹소켓 연결 해제 시 close 이벤트에 대한 처리 메서드
	function onClose() {
		
	}
	// =========================================================================
	// 웹소켓 연결 실패 등의 사유로 오류 발생 시 error 이벤트에 대한 처리 메서드
	// => 에러 정보 객체가 event 파라미터로 전달됨
	function onError(event) {
		console.log(">>> 시스템 오류 발생 <<<");
		console.log(event);
	}
	// =========================================================================
	// 채팅창 엔터키 입력 판별
	function checkEnter(target) {
		let keyCode = event.keyCode;
		
		if(keyCode == '13') {
			sendMessage(target);
		}
	}
	// =========================================================================
	// 웹소켓 서버로 메세지 전송
	function sendMessage(target) {
		// 메세지가 입력된 채팅방 구분
		// 전달받은 요소 객체(target)의 부모 탐색(<div class='commandArea'></div>)
		let commandArea = $(target).parent();
		
		// 입력창의 채팅메세지 가져오기
		// => 부모에 해당하는 commandArea 의 자식들 중 클래스 선택자(".chatMsg") 요소 탐색
		let msg = $(commandArea).find(".chatMsg").val();
// 		console.log("msg : " + msg);
		
		// 해당 채팅방의 룸 아이디 가져오기
		let room_id = $(commandArea).find(".room_id").val();
// 		console.log("room_id : " + room_id);
		
		// 해당 채팅방의 상대방 아이디 가져오기
		let receiver_id = $(commandArea).find(".receiver_id").val();
// 		console.log("receiver_id : " + receiver_id);
		
		// 해당 채팅방의 상품 아이디 가져오기
		let product_id = $(commandArea).find(".product_id").val();
		
		// 입력창의 채팅메세지가 널스트링이 아닐 경우에만 sendMessage() 호출
		if(msg == "") {
			alert("메세지 입력 필수!");
			$(commandArea).find(".chatMsg").focus();
			return;
		}
		
		// 서버로 메세지 전송
		ws.send(getJsonString("TALK", current_user_id, receiver_id, room_id, msg, product_id));
		
		// 입력창 초기화 후 포커스 요청
		$(commandArea).find(".chatMsg").val("");
		$(commandArea).find(".chatMsg").focus();
	}
	
	// ==========================
	// 채팅방 나가기
	function quitRoom(target) {
		console.log("채팅방 종료");
		
		// 전달받은 요소 객체(target)의 부모 탐색(<div class='commandArea'></div>)
		let commandArea = $(target).parent();
		
		// 해당 채팅방의 룸 아이디 가져오기
		let room_id = $(commandArea).find(".room_id").val();
		
		// 메세지 전송(LEAVE 타입, 현재 사용자 아이디(발신자), 수신자 불필요, 룸ID, 메세지 불필요)
		ws.send(getJsonString("LEAVE", current_user_id, "", room_id, ""));
	}
	
	//===============================================================
		
function payment() {
	// 채팅방에서 produtct_id 들고오기
	var product_id = product;
// 	var product_id = "${param.product_id}";
	location.href="Payment?product_id=" + product_id;
	alert(product_id);
}


//임시로 테스트용 거래수락 버튼 추가
// function acceptPayment() {
function acceptPayment2() {
	// 채팅방에서 produtct_id 들고오기
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "AcceptPayment",
		data: {
			"product_id": product,
// 			"product_id": "${sellProduct.product_id}",
			"product_buyer": current_user_id
// 			"product_buyer": "leess"
		},
		success:  function(data) {
			if(data == "not-login") {
				Swal.fire({
					icon: 'warning',
					title: '로그인을 해주세요!',
					text: '로그인 페이지로 이동합니다!',
					allowOutsideClick: false
				}).then((result) => {
						location.href="MemberLogin";
				});	
			} else if(data == "true") {
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: '거래를 수락했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			} else if(data == "inconsistency") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '판매자 정보가 일치하지 않습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});				
			} else {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '거래 수락을 실패했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			}
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
}

//임시로 테스트용 구매확정 버튼 추가(에이젝스)
// function confirmPayment() {
function confirmPayment2() {
	// 채팅방에서 produtct_id 들고오기
// 	location.href="ConfirmPayment?product_id=303";
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "ConfirmPayment",
		data: {
			"product_id": product,
// 			"product_id": "${sellProduct.product_id}",
		},
		success:  function(data) {
			if(data == "not-login") {
				Swal.fire({
					icon: 'warning',
					title: '로그인을 해주세요!',
					text: '로그인 페이지로 이동합니다!',
					allowOutsideClick: false
				}).then((result) => {
						location.href="MemberLogin";
				});	
			} else if(data == "true") {
				Swal.fire({
					position: 'center',
					icon: 'success',
					title: '구매를 확정했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});
			} else if(data == "none") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '구매 확정 가능한 상품이 없습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});				
			} else if(data == "inconsistency") {
					Swal.fire({
						position: 'center',
						icon: 'error',
						title: '구매자 정보가 일치하지 않습니다.',
						showConfirmButton: false,
						timer: 2000,
						toast: true
				});			
			} else if(data == "unpaid") {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '결제를 먼저 진행해주세요.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			} else if(data == "not-access_token") {
				Swal.fire({
					icon: 'warning',
					title: '계좌 인증이 필요합니다',
					text: '계좌 인증 페이지로 이동합니다.',
					allowOutsideClick: false
				}).then((result) => {
						location.href="AccountVerification";
				});	
			} else if(data == "not-payInfo") {
				Swal.fire({
					icon: 'warning',
					title: '계좌 등록이 필요합니다',
					text: '계좌 등록 페이지로 이동합니다.',
					allowOutsideClick: false
				}).then((result) => {
						location.href="AccountRegist";
				});	
			} else {
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '구매 확정을 실패했습니다.',
					showConfirmButton: false,
					timer: 2000,
					toast: true
				});			
			}
	
		},
		error: function(request, status, error) {
	      // 요청이 실패한 경우 처리할 로직
	      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
		}
	});
	
}		

//임시로 테스트용 거래중단 버튼 추가(에이젝스)
// function stopPayment() {
function stopPayment2() {

			<%-- 서블릿 요청 --%>
			$.ajax({
				type: "GET",
				url: "StopPayment",
				data: {
					"product_id": product
// 					"product_id": 80
				},
				success:  function(data) {
					if(data == "not-login") {
						Swal.fire({
							icon: 'warning',
							title: '로그인을 해주세요!',
							text: '로그인 페이지로 이동합니다!',
							allowOutsideClick: false
						}).then((result) => {
								location.href="MemberLogin";
						});	
					} else if(data == "none") {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '거래 중단 가능한 상품이 없습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});				
					} else if(data == "inconsistency") {
							Swal.fire({
								position: 'center',
								icon: 'error',
								title: '판매자 정보가 일치하지 않습니다.',
								showConfirmButton: false,
								timer: 2000,
								toast: true
						});			
					} else if(data == "true") {
						Swal.fire({
							position: 'center',
							icon: 'success',
							title: '거래를 중단했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});
					} else {
						Swal.fire({
							position: 'center',
							icon: 'error',
							title: '거래 중단을 실패했습니다.',
							showConfirmButton: false,
							timer: 2000,
							toast: true
						});			
					}
			
				},
				error: function(request, status, error) {
			      // 요청이 실패한 경우 처리할 로직
			      console.log("AJAX 요청 실패:", status, error); // 예시: 에러 메시지 출력
				}
			});
	
}

	
</script>
</head>
<body>
	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">1:1채팅</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="./"><i class="lni lni-home"></i> 홈</a></li>
                        <li>1:1 채팅</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	
	<article id="article">
		<!-- 본문 표시 영역 -->
<!-- 		<h1>채팅 페이지</h1> -->
<!-- 		<hr> -->
		<div class="d-none">
			<!-- 상대방 아이디를 직접 입력하여 채팅방 생성 -->
			<!-- 실제 환경에서는 게시물 내의 상대방 아이디를 클릭하여 채팅하기 등을 클릭했을 경우 -->
			<input type="text" id="receiver_id"> 
			<input type="button" value="채팅 시작" id="btnJoin">
			<input type="button" value="채팅방 나가기" id="btnQuit">
		</div>
		<hr>
			<div>
				<div id="tradeButtonDiv">
					<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="tradeButton1" >
						<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="거래수락" onclick="acceptPayment()" id="tradeOk">
					</div>
					<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="tradeButton3" >
						<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="결제하기" onclick="payment()" id="payOk">
					</div>
					<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="tradeButton4" >
						<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="구매확정" onclick="confirmPayment()" id="buyOk">
					</div>
					<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="tradeButton2">
						<input type="button"class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="거래중단" onclick="stopPayment()" id="stopBtn" >
					</div>
				</div>
			</div>
		
		<div id="chatRoomListArea"><%-- 현재 사용자의 채팅방 목록 추가될 위치 --%></div>
		<div id="chatRoomArea"><%-- 채팅방 추가될 위치 --%></div>
	</article>
	<footer class="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>
	
	    <!-- ========================= JS here ========================= -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
 	<script src="${pageContext.request.contextPath}/resources/js/main/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main/main.js"></script>
	
</body>
</html>














