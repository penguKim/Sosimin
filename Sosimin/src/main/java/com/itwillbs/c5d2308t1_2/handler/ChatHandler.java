package com.itwillbs.c5d2308t1_2.handler;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{//websocket 연결 되었을때 클라이언트가 접속 성공했을때
		System.out.println("afterConnectionEstablished: " + session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{//websocket 메세지 송수신 할때
		
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{//websocket 연결이 종료시
		
	}

}
