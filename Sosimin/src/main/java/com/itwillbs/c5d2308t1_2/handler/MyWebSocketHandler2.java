package com.itwillbs.c5d2308t1_2.handler;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.itwillbs.c5d2308t1_2.service.ChatService;
import com.itwillbs.c5d2308t1_2.vo.ChatMessage;
import com.itwillbs.c5d2308t1_2.vo.ChatMessage2;
import com.itwillbs.c5d2308t1_2.vo.ChatRoomVO;

// 웹소켓 핸들링을 위한 클래스 정의 - TextWebSocketHandler 클래스 상속
// => 이 클래스의 인스턴스는 서버 당 하나의 인스턴스만 생성됨	
public class MyWebSocketHandler2 extends TextWebSocketHandler {
	// 접속한 클라이언트(사용자)들의 정보를 관리하기 위한 Map 객체 생성
	// key : 웹소켓 세션아이디(문자열)   value : 웹소켓 세션 객체(WebSocketSession)
	// => HashMap 구현체 대신 ConcurrentHashMap 타입 사용 시 멀티쓰레드 환경에서 
	//    락(Lock)을 통해 안전하게 데이터 관리
	private Map<String, WebSocketSession> wsSessions = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 웹소켓 세션아이디와 사용자 아이디 정보를 관리하기 위한 Map 객체
	private Map<String, String> users = new ConcurrentHashMap<String, String>();
	
	// 채팅방 1개의 정보를 관리할 Map 객체 생성
	// => 채팅방 룸ID(문자열) 와 해당 채팅방 접속자들의 ID 를 목록으로 관리할 List<String> 타입 지정
	private Map<String, List<String>> rooms = new ConcurrentHashMap<String, List<String>>();

	
	
	@Autowired
	private ChatService chatService;
	// ===========================================================================================
	// WebSocket 객체 생성(연결)될 때 자동으로 호출되는 메서드 afterConnectionEstablied() 오버라이딩
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 연결됨!(afterConnectionEstablished)");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메세지 전송됨!(handleTextMessage)");
		
		// [ 채팅 메세지 파싱 - ChatMessage2 클래스 활용 ]
		Gson gson = new Gson();
		ChatMessage2 chatMessage = gson.fromJson(message.getPayload(), ChatMessage2.class);
		System.out.println("ChatMessage : " + chatMessage);
		System.out.println("메세지 도착 시각 : " + getDateTimeForNow());
		// 메세지 도착 시각 저장
		chatMessage.setSend_time(getDateTimeForNow());
		
		// --------------------------------------------------------------------------
		// 사용자 아이디와 상대방 아이디를 변수에 저장
		String sender_id = chatMessage.getSender_id();
		String receiver_id = chatMessage.getReceiver_id();
		
		// ============================================================================
		// 메세지 타입 판별
		// 1) TYPE_INIT - 초기화
		// 채팅 페이지 진입(로그아웃 후 로그인 및 새로고침 등 포함)
		if(chatMessage.getType().equals(ChatMessage2.TYPE_INIT)) { 
			// 기존 사용자 목록에서 사용자 아이디와 일치하는 세션 가져온 후
			// 세션 목록에서 일치하는 세션 정보 제거
			// => 단, 사용자 세션 목록이 하나라도 존재할 경우에만 수행
			if(users.size() > 0 && wsSessions.size() > 0) { 
				// users 객체의 키 중에서 사용자 아이디가 존재하고
				// wsSession 객체의 키 중에서 사용자 아이디에 해당하는 세션 아이디가 존재할 경우
				// 해당 세션 정보만 제거
				// => Map 객체의 containsKey() 메서드 활용
				if(users.containsKey(sender_id) && wsSessions.containsKey(users.get(sender_id))) {
					wsSessions.remove(users.get(sender_id));
				}
			}
			
			// 사용자 목록(users)에 자신의 아이디와 웹소켓 세션 아이디 저장
			users.put(sender_id, session.getId());
			
			// 세션 목록(wsSessions)에 세션 아이디와 세션 객체 저장
			wsSessions.put(session.getId(), session);
			
//			System.out.println("사용자 목록 : " + users);
//			System.out.println("사용자 세션 목록 : " + wsSessions);
//			System.out.println("사용자 목록 수 : " + users.size());
//			System.out.println("사용자 세션 목록 수 : " + wsSessions.size());
			// ------------------------------------------------------------------
			// 기존 채팅방 목록(= 자신의 아이디가 포함된 채팅방) 조회 후 목록 전송
			// ChatService - getChatRoomList() 메서드 호출
			// => 파라미터 : 자신의 아이디(sender_id)   
			//    리턴타입 : List<ChatRoomVO>(chatRoomList)
			List<ChatRoomVO> chatRoomList = chatService.getChatRoomList(sender_id);
//			System.out.println(chatRoomList);
			// 조회 결과를 JSON 형식으로 변환하여 메세지로 설정
			chatMessage.setMessage(gson.toJson(chatRoomList));
			// 메세지 타입을 채팅방 전체 목록 표시를 수행하도록 TYPE_LIST 타입으로 설정
			chatMessage.setType(ChatMessage2.TYPE_LIST);
			// 메세지 전송
			sendMessage(session, chatMessage);
		} else if(chatMessage.getType().equals(ChatMessage2.TYPE_START)) { 
			System.out.println("START");
			// 채팅창 열기(신규 or 기존 채팅방 구분)
			boolean needCreateRoom = true; // true : 신규, false : 기존 채팅방 존재
			
			// 기존 채팅방 존재 여부 판별
			if(rooms.size() > 0) { // 채팅방이 1개라도 존재할 경우
				// 기존 채팅방 탐색하여 새 채팅방 개설 필요 여부 판별하여 needCreateRoom 변수값 제어
				// 반복문을 통해 생성되어 있는 채팅방(rooms) 하나씩 탐색
				// => Map 객체(rooms) 에서 java.util.Map.Entry 타입 객체(키&값)를 하나씩 꺼내기
				// => Entry 객체의 getKey() 는 키 리턴, getValue() 는 값 리턴
				for(Entry<String, List<String>> room : rooms.entrySet()) {
					// 해당 방의 참가자 목록 꺼내기(Entry 객체의 getValue() 메서드 활용)
					List<String> roomUsers = room.getValue();
					
					// 상대방과 나의 채팅방 존재 여부 판별
					// => 채팅방의 참가자 수가 2명(생략 가능)이고
					//    참가자 아이디에 자신과 상대방의 아이디가 포함된 경우 기존 채팅방으로 취급
					if(roomUsers.contains(sender_id) && roomUsers.contains(receiver_id)) {
						// 이미 존재하는 채팅방일 경우 새로운 채팅방 개설 불필요
						needCreateRoom = false;
						// 기존 채팅방 룸ID 를 메세지 객체에 저장
						chatMessage.setRoom_id(room.getKey());
					}
				}
			} // 기존 채팅방 존재여부 판별 끝
			
			// 새 채팅방 생성이 필요할 경우
			if(needCreateRoom) {
				// 새 채팅방 생성 후 생성된 채팅방 정보 전송
				// 1. 새 채팅방의 방번호(room_id) 생성 - UUID 활용 또는 웹소켓 세션 아이디 활용도 가능
				chatMessage.setRoom_id(UUID.randomUUID().toString());
				
				// 2. 사용자에게 채팅방 생성 메세지 전송을 위해 메세지 설정
				chatMessage.setMessage(receiver_id + " 님과의 채팅방 생성");
				
				// 3. 채팅방 멤버 리스트 생성
				// => 발신자와 수신자 아이디를 목록에 추가
				List<String> roomUsers = new ArrayList<String>();
				roomUsers.add(sender_id);
				roomUsers.add(receiver_id);
				
				// 4. 채팅방 목록(rooms)에 새 채팅방 1개 추가
				// => 채팅방 룸ID, 채팅방 멤버 리스트
				rooms.put(chatMessage.getRoom_id(), roomUsers);
				
				// 5. 생성된 채팅방 정보를 DB 에 저장 위해 ChatService - addChatRoom() 메서드 호출
				//    => 파라미터 : ChatMessage2 객체   리턴타입 : void
				chatService.addChatRoom(chatMessage);
				
				// --------------------------
				// 사용자에게 새 채팅방 알림을 위해
				// 채팅 메세지 타입을 LIST_ADD 로 변경 후 메세지 전송
				chatMessage.setType(ChatMessage2.TYPE_LIST_ADD);
				sendMessage(session, chatMessage);
				
				// 채팅방 시작 정보를 알리기 위해 메세지 타입을 다시 START 로 변경
				chatMessage.setType(ChatMessage2.TYPE_START);
			} else { // 기존 채팅방 입장(열기)
				// 재입장 메세지 설정하여 클라이언트로 전송
				// ChatMessage 객체를 통해 재입장 관련 정보 설정
			}
			
			System.out.println("현재 채팅방 목록 : " + rooms);
			System.out.println("새 채팅방 생성 메세지 : " + chatMessage);
			
			// 사용자에게 새 채팅방 알림을 위한 메세지 전송
			sendMessage(session, chatMessage);
			
			return;
		} else if(chatMessage.getType().equals(ChatMessage2.TYPE_MESSAGE_LIST)) {
			// ChatService - getChatList() 메서드 호출하여 기존 채팅방 채팅 목록 조회
			// => 파라미터 : ChatMessage2 객체   리턴타입 : List<ChatMessage2>(chatList)
			List<ChatMessage2> chatList = chatService.getChatList(chatMessage);
//			System.out.println("기존 메세지 목록 갯수 : " + chatList.size());
			
			if(chatList.size() > 0) {
				// 조회 결과를 JSON 형식으로 변환하여 메세지로 설정
				chatMessage.setMessage(gson.toJson(chatList));
				
				// 메세지 전송
				sendMessage(session, chatMessage);
			}
			
			return;
		}
		
		
		try {
			// [ TYPE_ENTER, TYPE_LEAVE, TYPE_TALK 공통 작업 ]
			// 전체 채팅방 중 룸ID 가 일치하는 채팅방의 참가자 목록 가져오기
			// => rooms 객체의 get() 메서드 파라미터로 현재 채팅방의 룸ID 전달
			List<String> currentRoomUserList = rooms.get(chatMessage.getRoom_id());
			System.out.println("currentRoomUserList : " + currentRoomUserList);
			
			// 현재 채팅방 내의 사용자 목록을 반복문으로 접근하여
			// 사용자ID 와 일치하는 사용자 정보 객체와 웹소켓 세션 객체에 접근
			if(currentRoomUserList != null) {
				for(String roomUserId : currentRoomUserList) {
					// wsSession 객체에서 사용자ID 에 해당하는 세션아이디로 탐색하여 세션 꺼내기
					WebSocketSession userSession = wsSessions.get(users.get(roomUserId));
					
					// sendMessage() 메서드를 호출하여 메세지 전송
					// => 파라미터 : WebSocketSession 객체, ChatMessage2 객체
					// => 단, 자신의 세션이 아닌 세션에만 메세지 전송
					//    (현재 채팅방 사용자 아이디와 전송된 메세지 발신자 아이디가 일치하지 않을 경우)
					if(!roomUserId.equals(chatMessage.getSender_id())) { // 자신의 세션이 아닐 경우
						// 메세지 타입 판별(ChatMessage 객체의 type 멤버변수값 활용)
						if(chatMessage.getType().equals(ChatMessage.TYPE_ENTER)) { // 입장
							// ChatMessage 객체의 메세지를 "XXX 님이 입장하셨습니다" 로 설정(변경)
							chatMessage.setMessage(chatMessage.getSender_id() + " 님이 입장하셨습니다.");
						} else if(chatMessage.getType().equals(ChatMessage.TYPE_LEAVE)) { // 퇴장
							// ChatMessage 객체의 메세지를 "XXX 님이 퇴장하셨습니다" 로 설정(변경)
							chatMessage.setMessage(chatMessage.getSender_id() + " 님이 퇴장하셨습니다.");
						}
					} else if(chatMessage.getType().equals(ChatMessage.TYPE_LEAVE)) { 
						// 자신의 세션일 경우 LEAVE 타입인지 판별하여 채팅방 정보 제거
						// chatService - removeChatRoomUser() 메서드 호출하여 채팅방 정보 제거
						// => 파라미터 : ChatMessage2 객체   리턴타입 : int(currentRoomUserCnt)
						int currentRoomUserCnt = chatService.removeChatRoomUser(chatMessage);
						
						// 해당 채팅방 사용자가 아무도 없을 경우
						// rooms 객체에서 채팅방 제거
						if(currentRoomUserCnt == 0) {
							rooms.remove(chatMessage.getRoom_id());
						} 
					}
					
					// 메세지 전송
					// => 주의! 현재 채팅방 사용자의 세션(userSession) 객체 활용
					sendMessage(userSession, chatMessage);
				} // 반복문 종료
				
				// ChatService - addMessage() 메서드 호출하여 채팅메세지 DB 에 저장
				chatService.addMessage(chatMessage);
			}
		} catch (NullPointerException e) {
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
			chatService.addMessage(chatMessage);
		}
			
//		
//		// 현재 채팅방 내의 사용자 목록을 반복문으로 접근하여
//		// 사용자ID 와 일치하는 사용자 정보 객체와 웹소켓 세션 객체에 접근
//		if(currentRoomUserList != null) {
//			for(String roomUserId : currentRoomUserList) {
//				// wsSession 객체에서 사용자ID 에 해당하는 세션아이디로 탐색하여 세션 꺼내기
//				WebSocketSession userSession = wsSessions.get(users.get(roomUserId));
//				
//				// sendMessage() 메서드를 호출하여 메세지 전송
//				// => 파라미터 : WebSocketSession 객체, ChatMessage2 객체
//				// => 단, 자신의 세션이 아닌 세션에만 메세지 전송
//				//    (현재 채팅방 사용자 아이디와 전송된 메세지 발신자 아이디가 일치하지 않을 경우)
//				if(!roomUserId.equals(chatMessage.getSender_id())) { // 자신의 세션이 아닐 경우
//					// 메세지 타입 판별(ChatMessage 객체의 type 멤버변수값 활용)
//					if(chatMessage.getType().equals(ChatMessage.TYPE_ENTER)) { // 입장
//						// ChatMessage 객체의 메세지를 "XXX 님이 입장하셨습니다" 로 설정(변경)
//						chatMessage.setMessage(chatMessage.getSender_id() + " 님이 입장하셨습니다.");
//					} else if(chatMessage.getType().equals(ChatMessage.TYPE_LEAVE)) { // 퇴장
//						// ChatMessage 객체의 메세지를 "XXX 님이 퇴장하셨습니다" 로 설정(변경)
//						chatMessage.setMessage(chatMessage.getSender_id() + " 님이 퇴장하셨습니다.");
//					}
//				} else if(chatMessage.getType().equals(ChatMessage.TYPE_LEAVE)) { 
//					// 자신의 세션일 경우 LEAVE 타입인지 판별하여 채팅방 정보 제거
//					// chatService - removeChatRoomUser() 메서드 호출하여 채팅방 정보 제거
//					// => 파라미터 : ChatMessage2 객체   리턴타입 : int(currentRoomUserCnt)
//					int currentRoomUserCnt = chatService.removeChatRoomUser(chatMessage);
//					
//					// 해당 채팅방 사용자가 아무도 없을 경우
//					// rooms 객체에서 채팅방 제거
//					if(currentRoomUserCnt == 0) {
//						rooms.remove(chatMessage.getRoom_id());
//					} 
//				}
//				
//				// 메세지 전송
//				// => 주의! 현재 채팅방 사용자의 세션(userSession) 객체 활용
//				sendMessage(userSession, chatMessage);
//			} // 반복문 종료
//			
//			// ChatService - addMessage() 메서드 호출하여 채팅메세지 DB 에 저장
//			chatService.addMessage(chatMessage);
//		}
		
	}
	
	// 채팅 메세지를 JSON 형식으로 변환하여 현재 세션에게 전송하는 메서드
	private void sendMessage(WebSocketSession session, ChatMessage2 chatMessage) throws IOException {
		Gson gson = new Gson();
		session.sendMessage(new TextMessage(gson.toJson(chatMessage)));
	}
	
	// 현재 시스템의 날짜 및 시각 정보를 문자열로 리턴하는 메서드 정의
	private String getDateTimeForNow() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return dateTime.format(dtf);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println("웹소켓 오류 발생!(handleTransportError)");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("웹소켓 연결 해제됨!(afterConnectionClosed)");
	}
	
	
}



















