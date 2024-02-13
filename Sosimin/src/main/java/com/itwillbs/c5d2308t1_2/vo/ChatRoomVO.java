package com.itwillbs.c5d2308t1_2.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

// 
/*
 * 채팅방 목록 중 1개의 채팅방 정보를 관리
 * --------------------------------------------
 * [ chat_room_list 테이블 생성 ] 
   CREATE TABLE chat_room_list (
   		room_id VARCHAR(50) NOT NULL,
   		user_id VARCHAR(16) NOT NULL,
   		title VARCHAR(50) NOT NULL,
   		status VARCHAR(16)
   );
 */
@Data
@AllArgsConstructor
public class ChatRoomVO {
	private String room_id; // 9ee92dc7-9e33-4792-8199-4df8557735f3
	private String sender_id; // 16글자
	private String receiver_id; // 16글자
	private String title; // 50글자
	private String status; // 16글자
	private String product_id;
	private String member_profile;
//	private String sender_nickname;
//	private String receiver_nickname;
//	private String product_name;
//	private String product_price;
//	private String product_category;
}











