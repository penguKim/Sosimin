<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<!-- <link href="./css/default.css" rel="stylesheet" type="text/css"> -->
<%-- EL 을 활용하여 컨텍스트경로를 얻어와서 절대주소처럼 사용 가능 --%>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#chatArea {
		width: 300px;
		height: 200px;
		border: 1px solid black;
		margin-top: 20px;
		margin-bottom: 20px;
		/* 지정한 영역 크기보다 컨텐츠 양이 더 많을 경우 수직 방향 스크롤바 추가 */
		overflow-y: auto;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
<script>
	$(function() {
		// 입장, 나가기, 전송 버튼 클릭 이벤트 처리
		$("#btnJoin").click(function() {
			connect();
		});
		
		$("#btnQuit").click(function() {
			disconnect();	
		});
		
		$("#btnSend").click(function() {
			sendMessage();	
		});
		
		// 채팅메세지 입력창 키 누를때마다 이벤트 처리
		$("#chatMsg").keypress(function(event) { // 누른 키의 정보가 event 매개변수로 전달됨
			// 누른 키(event)의 코드값(keyCode 속성) 가져와서 엔터키(keyCode 값 '13')일 때
			// 메세지 전송을 위한 sendMessage() 함수 호출
			let keyCode = event.keyCode;
		
			if(keyCode == '13') {
				// 입력창의 채팅메세지가 널스트링이 아닐 경우에만 sendMessage() 호출
				if($("#chatMsg").val() != "") {
					sendMessage();
				}
			}
		});
		
		// 처음 로딩 시 입장 버튼은 활성화, 나가기 버튼은 비활성화
		$("#btnJoin").prop("disabled", false);
		$("#btnQuit").prop("disabled", true);
	});
	
	// ===============================================================
	// 웹소켓 연결 요청
	let ws; // 웹소켓 연결 시 웹소켓 객체를 저장할 변수 선언
	let nickname; // 채팅방에서 사용할 닉네임을 저장할 변수 선언
	
	function connect() {
// 		alert("connect");
		
		// 닉네임을 입력받아 변수에 저장(임시로 세션아이디 활용)
		nickname = "${sessionScope.sId}";
// 		alert("닉네임 : " + nickname);

		// 웹소켓 연결에 사용할 기본 주소 설정(ws 프로토콜 사용)
		// => 보안을 위해서는 ws 대신 wss 사용해야함
		let ws_base_url = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}";
		// => 주의! request 객체의 contextPath 값은 "/XXX" 형식으로 리턴되므로 문자열 결합 시 / 생략
		
		// 웹소켓 요청(Handshake)
		// => WebSocket 객체 생성(생성자 파라미터로 요청 주소 전달)
		ws = new WebSocket(ws_base_url + "/echo");
		// => 이 요청을 서버에서 처리하기 위해 매핑을 수행해야하는데
		//    이 매핑은 컨트롤러가 아닌 xml 파일에서 설정 필요
		//    (=> ws-context.xml 파일 만들어서 설정)
		
		// WebSocket 객체의 onxxx 이벤트에 각각의 함수 연결
		// => 주의! onxxx 이벤트에 전달하는 함수는 반드시 함수명만 기술
		ws.onopen = onOpen;
		ws.onmessage = onMessage;
		ws.onclose = onClose;
		ws.onerror = onError;
		
	}
	
	// ===============================================================
	// 웹소켓 연결 해제
	function disconnect() {
// 		alert("disconnect");

		// 나가기 버튼 클릭 시 퇴장 메세지를 상대방 채팅창에 표시하기 위해
		// 퇴장 메세지(타입 LEAVE, nickname, 메세지는 "")로 설정된 JSON 메세지를 서버로 전송
		ws.send(getJsonString("LEAVE", nickname, ""));
		// => 주의! 웹소켓 연결이 끊어지기 전에 먼저 작업 수행 필요

		// WebSocket 객체의 close() 메서드 호출하여 웹소켓 연결 종료
		ws.close();
	}
	
	// ================================================================
	// 웹소켓 서버로 메세지 전송
	function sendMessage() {
// 		alert("sendMessage");
		// 메세지 입력창의 채팅 메세지 가져오기
		let msg = $("#chatMsg").val();

		// -------------------------------------------------------------------
		// 웹소켓 객체를 통해 메세지 전송을 수행할 send() 메서드 호출
// 		ws.send(msg);
		// => 웹소켓 핸들러 객체의 handleTextMessage() 메서드가 자동 호출됨
		//    이 때 전송되는 메세지(msg)가 TextMessage 타입 파라미터로 전달됨
		// -------------------------------------------------------------------
		// 전송할 메세지를 JSON 형식으로 변환하여 여러 정보를 함께 전송
		ws.send(getJsonString("TALK", nickname, msg));
		// -------------------------------------------------------------------
		
		// 입력한 메세지를 자신의 채팅창에 출력하기 위해 appendMessage() 함수 호출하여 메세지 전달
		appendMessage(msg);
		
		// 채팅 입력메세지 초기화 후 포커스 요청
		$("#chatMsg").val("");
		$("#chatMsg").focus();
	}
	
	// 전송할 메세지 및 각종 정보를 JSON 타입 문자열로 변환하여 리턴하는 getJsonString() 함수 정의
	function getJsonString(type, nickname, message) {
		// 전달받은 파라미터들을 하나의 객체로 결합하여 JSON 타입 문자열로 변환 후 리턴
		let data = {
			type : type,
			nickname : nickname,
			message : message
		};
		
		// JSON.stringify() 메서드를 통해 객체 -> JSON 문자열로 변환
		return JSON.stringify(data);
	}
	
	// ================================================================
	// 자신의 채팅창에 메세지 출력
	function appendMessage(msg) {
		$("#chatMessageArea").append(msg + "<br>");
		
		// 채팅 메세지 출력창 스크롤바를 항상 맨 밑으로 유지
		// => 메세지 영역의 크기 활용
		$("#chatArea").scrollTop($("#chatMessageArea").height());
	}
	
	// =========================================================================
	// 웹소켓(서버) 연결 시 open 이벤트 처리 메서드
	function onOpen() {
// 		appendMessage(">>> onOpen <<<");
		appendMessage(">>> 채팅방에 입장하였습니다. <<<");
		
		// 입장 메세지를 상대방 채팅창에 표시하기 위해
		// 입장 메세지(타입 ENTER, nickname, 메세지는 "")로 설정된 JSON 메세지를 서버로 전송
		ws.send(getJsonString("ENTER", nickname, ""));

		// 웹소켓 연결 완료 시 입장 버튼 비활성화, 나가기 버튼 활성화 상태 반대로 전환
		$("#btnJoin").prop("disabled", true);
		$("#btnQuit").prop("disabled", false);
	}
	
	// =========================================================================
	// 서버로부터 메세지 수신 시 message 이벤트 처리 메서드
	// => 파라미터로 MessageEvent 객체가 전달됨
	function onMessage(event) {
// 		appendMessage(">>> onMessage <<<");
// 		console.log(event);
		
		// MessageEvent 객체(event)의 data 속성에 전송된 메세지가 저장되어 있음
// 		appendMessage(event.data);
		
		// 전달받은 데이터(event.data)가 JSON 타입 문자열로 전달되므로
		// JSON.parse() 메서드를 통해 JSON 객체로 변환하여 접근
		let data = JSON.parse(event.data);
			
		// 전달받은 메세지의 타입 판별(ENTER or LEAVE or TALK)
		if(data.type == "ENTER" || data.type == "LEAVE") { // 입장 또는 퇴장
			// 입장&퇴장 메세지는 시스템 메세지 형식(>>> xxx <<<) 으로 출력
			appendMessage(">>> " + data.message + "<<<");
		} else if(data.type == "TALK") { // 대화
			// 대화 메세지는 닉네임 : 메세지 형식으로 출력
			appendMessage(data.nickname + " : " + data.message);
		}
		
	}
	
	// =========================================================================
	// 웹소켓 연결 해제 시 close 이벤트에 대한 처리 메서드
	function onClose() {
// 		appendMessage(">>> onClose <<<");
		appendMessage(">>> 채팅을 종료합니다. <<<");
		
		// 웹소켓 연결 해제 시 입장 버튼 활성화, 나가기 버튼 비활성화 전환
		$("#btnJoin").prop("disabled", false);
		$("#btnQuit").prop("disabled", true);
	}
	
	// =========================================================================
	// 웹소켓 연결 실패 등의 사유로 오류 발생 시 error 이벤트에 대한 처리 메서드
	// => 에러 정보 객체가 event 파라미터로 전달됨
	function onError(event) {
// 		appendMessage(">>> onError <<<");
// 		console.log(event);
		appendMessage(">>> 시스템 오류 발생 <<<");
		appendMessage(">>> 잠시 후 다시 접속하여 주시기 바랍니다. <<<");
		
		// 웹소켓 연결 해제 시 입장 버튼 활성화, 나가기 버튼 비활성화 전환
		$("#btnJoin").prop("disabled", false);
		$("#btnQuit").prop("disabled", true);
	}
	
</script>
</head>
<body>
	<article>
		<!-- 본문 표시 영역 -->
		<h1>채팅 페이지</h1>
		<input type="button" value="채팅방 입장" id="btnJoin">
		<input type="button" value="채팅방 나가기" id="btnQuit">
		<hr>
		<div id="chatArea">
			<!-- 채팅 메세지 표시 영역 -->
			<span id="chatMessageArea"></span>
		</div>
		<input type="text" id="chatMsg">
		<input type="button" value="전송" id="btnSend">
	</article>
</body>
</html>