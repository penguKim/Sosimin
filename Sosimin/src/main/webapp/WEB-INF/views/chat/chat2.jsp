<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>채팅</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<div id="one">
		별명:<input type="text" id="nickname" /> <input type="button" id="enter" value="입장" />
	</div>
	<div id="two">
		<input type="button" id="exit" value="퇴장" /><br />
	<div id="chatarea" style="width:400px; height:600px; border:1px solid;"></div>
		<input type="text" id="message" /> <input type="button" id="send" value="보내기" />
	</div>
</body>
<script type="text/javascript">
	one = $("#one").val(); //id가 one인 놈 선택
	two = $("two").val();
	
	$("#enter").on("click", function() {// 웹 소켓 연결해주는 함수 호출
		connect();
	});
	
	$("#exit").on("click", function() {
		disconnect();
	});
	
	
	$("#send").on("click", function() {// 데이터를 서버로 전송하는 함수 호출
		send();
	});
	
	var websocket;
	function connect(){
		websocket = new WebSocket("ws://localhost:8081/c5d2308t1_2/echo"); //"ws://localhost:8081/c5d2308t1_2/chat-ws" 주소로 새로운 웹 소켓 인스턴스를 생성
		//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	function onOpen() {
		websocket.send($("#nickname").val() + "님이 입장하셨습니다."); // 입장 메시지 전송
	}

	function onMessage(){}
	
	function onClose() {}//웹 소켓에서 연결이 해제 되었을 때 호출될 함수
	
	//퇴장 버튼을 눌렀을 때 호출되는 함수
	function disconnect() {
		var msg = $("#nickname").val();
		websocket.send($("#nickname").val() + "님이 퇴장하셨습니다."); // 퇴장 메시지 전송
		websocket.close();
	}
	
	//보내기 버튼을 눌렀을 때 호출될 함수
	function send(){
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		websocket.send(nickname + ":" + msg);
		$("#chatarea").append(nickname + ":" + msg + "<br>");
		$("#message").val("");
	}
	
	
</script>
</html>