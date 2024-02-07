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
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.svg" />
        <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csStyle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.lineicons.com/3.0/LineIcons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.js"></script>
</head>
<style>

.police{
	margin-left: 300px;
    color: rgb(204, 204, 204);
    font-size: 16px;
    -webkit-box-align: center;
    align-items: center;
    border: none;
    background-color: white;
}
	 #tradeFinish, #payTrade{
	display: inline-block;
	position: relative;
	left: 250px;
	bottom: 70px;
	}
	
	#imageTag{
	position: relative;
	left: 370px;
	bottom: 130px;
	width: 25px;
	height: 25px;
	}
	#priceProposal{
		position: relative;
		left: 340px;
		bottom: 5px;
	}
	#policeText{
	position: relative;
	bottom:48px;
	left:128px;
}
.reportBtn {
	position:relative;
	color: #888;
	cursor: pointer;
	transition: 0.5s;
	left: 410px;
	bottom:220px;
	width:10px;
}

.reportBtn:hover{
	color: #f00;
	transform: scale(1.2);
	transition: 0.5s;
}
#reportBtn3{
	display: inline-block;
	position: relative;
	
}
#tradeButton1{

position:relative;
left:55px;
bottom:28px;
}

#tradeButton2{
position:relative;
left:156px;
bottom:82px;
}

#tradeButton3{
position:relative;
left:257px;
bottom:136px;
}


#tradeButtonDiv{
	display: inline-block;
	position: relative;
	width: 550px;
}

#chat{
	overflow-y: auto; /*스크롤 밑으로 내리기*/
}

</style>
<script type="text/javascript">

function payment() {
	// 채팅방에서 produtct_id 들고오기
	var product_id = "${sellMember.product_id}";
	location.href="Payment?product_id=" + product_id;
}


//임시로 테스트용 거래수락 버튼 추가
function acceptPayment() {
	$("#buyOk").prop("disabled", false);
	$("#tradeOk").prop("disabled", true);
	// 채팅방에서 produtct_id 들고오기
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "AcceptPayment",
		data: {
			"product_id": "${sellProduct.product_id}",
			"product_buyer": "leess"
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
function confirmPayment() {
	
	// 채팅방에서 produtct_id 들고오기
// 	location.href="ConfirmPayment?product_id=303";
	<%-- 서블릿 요청 --%>
	$.ajax({
		type: "GET",
		url: "ConfirmPayment",
		data: {
			"product_id": "${sellProduct.product_id}",
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
				$("#payOk").prop("disabled", false)
				$("#buyOk").prop("disabled", true)
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


$(function() {
	// 입장, 나가기, 전송 버튼 클릭 이벤트 처리
	$("#btnJoin").click(function() {
		connect();
	});
	
	$("#btnQuit").click(function() {
		disconnect();	
	});
	
	$("#btnSend").click(function() {
		if($("#chatMsg").val() != "") {
			sendMessage();
		}
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
	
});

// ===============================================================
// 웹소켓 연결 요청
let ws; // 웹소켓 연결 시 웹소켓 객체를 저장할 변수 선언
let nickname; // 채팅방에서 사용할 닉네임을 저장할 변수 선언

function connect() {
//		alert("connect");
	
	// 닉네임을 입력받아 변수에 저장(임시로 세션아이디 활용)
	nickname = "${sessionScope.sId}";
//		alert("닉네임 : " + nickname);

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
//		alert("disconnect");

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
//		alert("sendMessage");
	// 메세지 입력창의 채팅 메세지 가져오기
	let msg = $("#chatMsg").val();

	// -------------------------------------------------------------------
	// 웹소켓 객체를 통해 메세지 전송을 수행할 send() 메서드 호출
//		ws.send(msg);
	// => 웹소켓 핸들러 객체의 handleTextMessage() 메서드가 자동 호출됨
	//    이 때 전송되는 메세지(msg)가 TextMessage 타입 파라미터로 전달됨
	// -------------------------------------------------------------------
	// 전송할 메세지를 JSON 형식으로 변환하여 여러 정보를 함께 전송
	ws.send(getJsonString("TALK", nickname, msg));
	// -------------------------------------------------------------------
	
	// 입력한 메세지를 자신의 채팅창에 출력하기 위해 appendMessage() 함수 호출하여 메세지 전달
	appendMessage(msg); //나에게 보이게 메세지 출력
	
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
function appendMessage(msg) { // 상대방 채팅 띄울곳
	var sId = "${sId}";
		if(sId == "iuzzang12"){
			$("#chatMsg").append(msg + "<br>");
			// 채팅 메세지 출력창 스크롤바를 항상 맨 밑으로 유지
			// => 메세지 영역의 크기 활용
			$("#chat").scrollTop($("#chatMessageArea").height());
		} else {
			$("#chatMessageArea2").append(msg + "<br>");
		
		// 채팅 메세지 출력창 스크롤바를 항상 맨 밑으로 유지
		// => 메세지 영역의 크기 활용
			$("#chat").scrollTop($("#chatMessageArea2").height());
		}
}


// function appendMessage(msg) { // 내채팅띄울곳

// =========================================================================
// 웹소켓(서버) 연결 시 open 이벤트 처리 메서드
function onOpen() {
	alert(nickname);
// 		appendMessage(">>> onOpen <<<");
// 	appendMessage(">>> 채팅방에 입장하였습니다. <<<");
	
	// 입장 메세지를 상대방 채팅창에 표시하기 위해
	// 입장 메세지(타입 ENTER, nickname, 메세지는 "")로 설정된 JSON 메세지를 서버로 전송
	ws.send(getJsonString("ENTER", nickname, ""));

}

// =========================================================================
// 서버로부터 메세지 수신 시 message 이벤트 처리 메서드
// => 파라미터로 MessageEvent 객체가 전달됨
function onMessage(event) {
//		appendMessage(">>> onMessage <<<");
//		console.log(event);
	
	// MessageEvent 객체(event)의 data 속성에 전송된 메세지가 저장되어 있음
//		appendMessage(event.data);
	
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
//		appendMessage(">>> onClose <<<");
	appendMessage(">>> 채팅을 종료합니다. <<<");
	
}

// =========================================================================
// 웹소켓 연결 실패 등의 사유로 오류 발생 시 error 이벤트에 대한 처리 메서드
// => 에러 정보 객체가 event 파라미터로 전달됨
function onError(event) {
//		appendMessage(">>> onError <<<");
//		console.log(event);
	appendMessage(">>> 시스템 오류 발생 <<<");
	appendMessage(">>> 잠시 후 다시 접속하여 주시기 바랍니다. <<<");
	

}





</script>
<body>

	<header class="header navbar-area">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<jsp:include page="../report/report.jsp"></jsp:include>
	
	
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
			<div><input type="button" value="채팅방 입장" id="btnJoin" onclick="onOpen()"></div>
			<div><input type="button" value="채팅방 나가기" id="btnQuit" onclick="btnQuit()"></div>
		
				
				
				
<div id="container">
	<aside>
		<ul>
			<li>
				<div>
					<h1><a href="ChatMain?member_id=${sId }">채팅리스트</a></h1>
				</div>
			</li>
      
			<li>
				<img src="${pageContext.request.contextPath}/resources/upload/${sellMember.member_profile}">
				<div>
					<h2>${sellMember.member_nickname }</h2>
					<h3><span>방금전</span></h3>
				</div>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/resources/upload/${sellMember.member_profile}">
				<div>
					<h2>${sellMember.member_nickname }</h2>
					<h3><span>방금전</span></h3>
				</div>
			</li>
		</ul>
	</aside>
	
	<main>
	<header>
		<img src="${pageContext.request.contextPath}/resources/upload/${sellMember.member_profile}">
		<div>
			<h2>${sellMember.member_nickname }</h2>
		</div>
		
		<div>
			<div id="tradeButtonDiv">
				<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="tradeButton1" >
					<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="거래수락" onclick="acceptPayment()" id="tradeOk">
				</div>
				<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="tradeButton2" >
					<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="구매확정" onclick="confirmPayment()" id="buyOk" disabled="disabled">
				</div>
				<div class="mx-auto mt-1 mb-3 row d-flex justify-content-between" id="tradeButton3" >
					<input type="button" class="btn btn-primary col-xl-2 col-md-3 col-12 float-end" value="결제하기" onclick="payment()" id="payOk" disabled="disabled">
				</div>
			</div>
		</div>
			<i class="reportBtn fa fa-warning d-flex justify-content-end" style="font-size:24px" style="width: 80px;" data-bs-toggle="modal" data-bs-target="#reportModal"></i>
	</header>
    
   <div>
	<ul id="chat">

		<li class="you">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/upload/${sellMember.member_profile}">${sellMember.member_nickname }</h2>
			</div>
			<div class="triangle"></div><!-- 말풍선 색상정하는 클래스  -->
			<div class="message">
				<span id="chatMessageArea"></span>
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	      
		<li class="me">
			<div class="entete">
				<h2><img src="${pageContext.request.contextPath}/resources/images/product-details/karina.jpg" alt=""></h2>
			</div>
			<div class="triangle"></div>
			<div class="message">
				<span id="chatMessageArea2"></span>
			</div>
			<div>
				<h3>10:12AM, Today</h3>
			</div>
		</li>
	</ul>
	</div> 
		<footer>
			<textarea placeholder="Type your message" id="chatMsg"></textarea>
<!-- 				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt=""> -->
<!-- 				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt=""> -->
<!-- 			<input type="button" value="메세지보내기" id="btnSend" onclick="btnSend()"> -->
			<div class="col-lg-4 col-md-4 col-12">
				<div class="wish-button" id="priceProposal">
					<button class="btn" style="width:100px; height: 40px; font-size: 16px; color:white; background-color: #39d274" id="btnSend" onclick="btnSend()">전송</button>
				</div>
			</div>
		</footer>
	</main>
</div>


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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
        
<body>
</html>