package com.itwillbs.c5d2308t1_2.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 웹소켓 채팅 메세지를 자동으로 파싱하기 위한 클래스 정의
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatMessage {
	private String type;
	private String nickname;
	private String message;
	
	// 타입(type) 으로 사용할 문자열을 상수로 제공
	public static final String TYPE_ENTER = "ENTER"; // 입장 메세지
	public static final String TYPE_LEAVE = "LEAVE"; // 퇴장 메세지
	public static final String TYPE_TALK = "TALK";   // 대화 메세지
}














