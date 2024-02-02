package com.itwillbs.c5d2308t1_2.handler;

import java.io.Console;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.itwillbs.c5d2308t1_2.vo.ChatMessage;

@Component
public class ChatHandler extends TextWebSocketHandler {
	private static Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결됨");
		users.put(session.getId(), session);
		System.out.println("접속 클라이언트 목록 : " + users);
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
		if(chatMessage.getType().equals(chatMessage.TYPE_ENTER)) { // 입장
//			System.out.println(session.getId() + " : 입장!");
			// ChatMessage 객체의 메세지를 "XXX 님이 입장하셨습니다" 로 설정(변경)
			chatMessage.setMessage(chatMessage.getNickname() + " 님이 입장하셨습니다.");
		} else if(chatMessage.getType().equals(chatMessage.TYPE_LEAVE)) { // 퇴장
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
		for(WebSocketSession userSession : users.values()) {
			// 각 WebSocketSession 객체를 통해 메세지 전송
			// 단, 자신을 제외한 나머지 세션에만 전송(session 과 userSession 의 아이디 비교)
			if(!session.getId().equals(userSession.getId())) {
				userSession.sendMessage(new TextMessage(gson.toJson(chatMessage)));
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("웹소켓 오류");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("해제됨");
		users.remove(session.getId(), session);
	}
}