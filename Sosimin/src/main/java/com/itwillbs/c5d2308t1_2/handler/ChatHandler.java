package com.itwillbs.c5d2308t1_2.handler;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler {
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Map<WebSocketSession, String> nicknameMap = new HashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String sessionId = session.getId();
        nicknameMap.put(session, sessionId);
        System.out.println("연결됨: " + sessionId);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		String nickname = nicknameMap.get(session);
		
		for (WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(nickname + ": " + msg));
		}
		System.out.println("메세지: " + msg);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("해제됨");
		sessionList.remove(session);
		nicknameMap.remove(session);
	}
}