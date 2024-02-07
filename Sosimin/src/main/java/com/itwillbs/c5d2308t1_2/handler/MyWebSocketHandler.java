package com.itwillbs.c5d2308t1_2.handler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.itwillbs.c5d2308t1_2.vo.ChatMessage;

// 웹소켓 핸들링을 위한 클래스 정의 - TextWebSocketHandler 클래스 상속
// => 이 클래스의 인스턴스는 서버 당 하나의 인스턴스만 생성됨	
public class MyWebSocketHandler extends TextWebSocketHandler {
	// 접속한 클라이언트(사용자)들의 정보를 관리하기 위한 Map 객체 생성
	// key : 웹소켓 세션아이디(문자열)   value : 웹소켓 세션 객체(WebSocketSession)
	// => HashMap 구현체 대신 ConcurrentHashMap 타입 사용 시 멀티쓰레드 환경에서 
	//    락(Lock)을 통해 안전하게 데이터 관리
	private Map<String, WebSocketSession> wsSessions = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 웹소켓 세션아이디와 사용자 아이디 정보를 관리하기 위한 Map 객체
	private Map<String, String> users = new ConcurrentHashMap<String, String>();
	
	
	
	// WebSocket 객체 생성(연결)될 때 자동으로 호출되는 메서드 afterConnectionEstablied() 오버라이딩
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 연결됨!(afterConnectionEstablished)");
		
		// 웹소켓 연결 시 해당 클라이언트의 정보가 WebSocketSession 타입 객체로 관리됨
//		System.out.println("연결된 세션 ID : " + session.getId());
		
		// 접속된 클라이언트의 정보(WebSocketSession 객체)를 하나의 객체에 저장
		// => 모든 접속자의 세션을 하나의 객체로 모으기
		// => 이 때, 사용자의 회원 아이디는 현재 메서드에서 접근이 불가능하므로
		//    세션아이디를 구분자로 활용해야함
		wsSessions.put(session.getId(), session);
		System.out.println("접속 클라이언트 목록 : " + wsSessions);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println("메세지 전송됨!(handleTextMessage)");
		
		// 메세지 전송 시 상대방 세션의 정보와 메세지가 전달됨
		// => TextMessage 객체의 getPayload() 메서드를 통해 전달받은 메세지 확인 가능
		System.out.println(session.getId() + " : " + message.getPayload());
		// => 전송받은 메세지는 모두 JSON 타입 문자열로 전달받음
		// --------------------------------------------------------------------------
		// [ JSON 형식 문자열 파싱 ]
		// 1. JSONObject 객체를 통해 파싱하는 방법
		//    => 객체 생성 시 생성자 파라미터로 메세지 전달
//		JSONObject jo = new JSONObject(message.getPayload());
//		System.out.println("메세지타입 : " + jo.getString("type"));
//		System.out.println("발신자 : " + jo.getString("nickname"));
//		System.out.println("메세지 : " + jo.getString("message"));
		
		// 2. Gson(또는 jackson) 객체를 활용하여 자동 파싱
		//    => 파싱에 필요한 속성명과 동일한 이름을 갖는 VO 클래스 필요
		// Gson 객체의 fromJson() 메서드를 호출하여 파싱할 데이터와 파싱 클래스 타입 지정
		// => 리턴타입은 지정한 파싱 클래스 타입(ChatMessage)   
		Gson gson = new Gson();
		ChatMessage chatMessage = gson.fromJson(message.getPayload(), ChatMessage.class);
		System.out.println("ChatMessage : " + chatMessage);
		// --------------------------------------------------------------------------
		// 메세지 타입 판별(ChatMessage 객체의 type 멤버변수값 활용)
		if(chatMessage.getType().equals(ChatMessage.TYPE_ENTER)) { // 입장
//			System.out.println(session.getId() + " : 입장!");
			// ChatMessage 객체의 메세지를 "XXX 님이 입장하셨습니다" 로 설정(변경)
			chatMessage.setMessage(chatMessage.getNickname() + " 님이 입장하셨습니다.");
			
			// ----------------------------------------------------
			// Map 객체(users)에 현재 웹소켓 세션ID 와 전달받은 닉네임 저장
			users.put(session.getId(), chatMessage.getNickname());
			System.out.println("현재 접속한 사용자 목록 : " + users);
			// ----------------------------------------------------
			
		} else if(chatMessage.getType().equals(ChatMessage.TYPE_LEAVE)) { // 퇴장
//			System.out.println(session.getId() + " : 퇴장!");
			// ChatMessage 객체의 메세지를 "XXX 님이 퇴장하셨습니다" 로 설정(변경)
			chatMessage.setMessage(chatMessage.getNickname() + " 님이 퇴장하셨습니다.");
		}
		
		
		
		// -----------------------------------------------------------------------------------
		// 웹소켓 세션 객체의 sendMessage() 메서드를 호출하여 클라이언트로 메세지 전송
		// => 파라미터로 TextMessage 객체 전달
		// => 이 때, 실제 메세지가 저장된 ChatMessage 객체를 JSON 문자열 형식으로 변환 후 전송 필요
		//    (Gson 객체의 toJson() 메서드 활용)
//		session.sendMessage(new TextMessage(gson.toJson(chatMessage)));
		// -----------------------------------------------------------------------------------
		// 클라이언트 목록(Map 객체 - users)에 저장된 모든 세션에게 메세지 전송
		// => Map 객체의 values() 메서드를 통해 모든 값들을 향상된 for문으로 반복하여
		//    WebSocketSession 객체를 하나씩 꺼내기
		for(WebSocketSession userSession : wsSessions.values()) {
			// 각 WebSocketSession 객체를 통해 메세지 전송
			// 단, 자신을 제외한 나머지 세션에만 전송(session 과 userSession 의 아이디 비교)
			if(!session.getId().equals(userSession.getId())) {
				userSession.sendMessage(new TextMessage(gson.toJson(chatMessage)));
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("웹소켓 오류 발생!(handleTransportError)");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("웹소켓 연결 해제됨!(afterConnectionClosed)");
		
		// 채팅방 나갈 때 Map 객체에서 해당 세션 제거
		// => 클라이언트 정보가 저장된 Map 객체에서 현재 종료 요청이 발생한 세션 객체를 제거
		// => Map 객체의 remove() 메서드 호출하여 전달받은 세션 아이디를 키로 지정하여 삭제
		System.out.println("삭제할 유져 세션 : " + session.getId());
		wsSessions.remove(session.getId());
		System.out.println("삭제 후 클라이언트 목록 : " + wsSessions);
	}
	
}













