package com.itwillbs.c5d2308t1_2.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.ChatMapper;
import com.itwillbs.c5d2308t1_2.vo.ChatMessage2;
import com.itwillbs.c5d2308t1_2.vo.ChatRoomVO;


@Service
public class ChatService {
	@Autowired
	private ChatMapper mapper;

	// 새 채팅방 정보 저장 요청
	public void addChatRoom(ChatMessage2 chatMessage) {
		// 1개 채팅방 정보(룸ID, 사용자ID)를 갖는 ChatRoomVO 객체 생성
		// => 이 때, 2명의 사용자 정보를 각각의 레코드로 추가하기 위해 List 객체로 저장
		// => 채팅방 제목은 "채팅-상대방아이디" 형식으로 지정
		List<ChatRoomVO> chatRoom = new ArrayList<ChatRoomVO>();
		chatRoom.add(new ChatRoomVO(chatMessage.getRoom_id(), chatMessage.getSender_id(), chatMessage.getReceiver_id(), chatMessage.getReceiver_id() + "님과의 채팅방", null, chatMessage.getProduct_id(), chatMessage.getReceiver_member_profile()));
		chatRoom.add(new ChatRoomVO(chatMessage.getRoom_id(), chatMessage.getReceiver_id(), chatMessage.getSender_id(), chatMessage.getSender_id()  + "님과의 채팅방", null, chatMessage.getProduct_id(), chatMessage.getSender_member_profile()));
		mapper.insertChatRoom(chatRoom);
	}

	// 채팅방 목록 조회 요청
	public List<Map<String, Object>> getChatRoomList(String sender_id) {
		return mapper.selectChatRoomList(sender_id);
	}

	// 채팅 메세지 저장 요청
	public void addMessage(ChatMessage2 chatMessage) {
		mapper.insertMessage(chatMessage);	
	}

	// 채팅방 사용자 삭제 요청
	public int removeChatRoomUser(ChatMessage2 chatMessage) {
		// ChatMapper - deleteChatRoomUser() 메서드 호출하여 삭제 요청
		mapper.deleteChatRoomUser(chatMessage);
		// ChatMapper - selectCurrentChatRoomUser() 메서드 호출하여 현재 채팅방의 사용자 수 조회 
		return mapper.selectCurrentChatRoomUser(chatMessage);
	}

	public List<ChatMessage2> getChatList(ChatMessage2 chatMessage) {
		// ChatMapper - selectChatList() 메서드 호출하여 이전 채팅 내역 조회 요청
		return mapper.selectChatList(chatMessage);
	}

	public Map<String, String> selectSellInfo(Map<String, String> map) {
		
		return mapper.selectSellInfo(map);
	}

	public String selectBuyerInfo(String receiver_id) {
		return mapper.selectBuyerInfo(receiver_id);
	}

}












