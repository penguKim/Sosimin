package com.itwillbs.c5d2308t1_2.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c5d2308t1_2.vo.ChatMessage2;
import com.itwillbs.c5d2308t1_2.vo.ChatRoomVO;


@Mapper
public interface ChatMapper {
	
	// 채팅방 1개 정보 추가
	void insertChatRoom(List<ChatRoomVO> chatRoom);

	// 채팅방 목록 조회
	List<ChatRoomVO> selectChatRoomList(String sender_id);

	// 채팅 메세지 저장
	void insertMessage(ChatMessage2 chatMessage);

	// 채팅방 사용자 삭제
	void deleteChatRoomUser(ChatMessage2 chatMessage);

	// 채팅방 사용자 수 조회
	int selectCurrentChatRoomUser(ChatMessage2 chatMessage);

	// 이전 채팅 내역 조회
	List<ChatMessage2> selectChatList(ChatMessage2 chatMessage);
	// 채팅방에서 판매자 조회
	Map<String, String> selectSellInfo(Map<String, String> map);

	// 채팅방에서 구매자 조회
	String selectBuyerInfo(String receiver_id);

}










