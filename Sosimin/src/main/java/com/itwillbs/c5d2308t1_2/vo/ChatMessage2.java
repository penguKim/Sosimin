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
public class ChatMessage2 {
	private String type;
	private String sender_id;
	private String receiver_id;
	private String room_id;
	private String message;
	private String send_time;
	private String product_id;
	private String sender_member_profile;
	private String receiver_member_profile;
	
	// 타입(type) 으로 사용할 문자열을 상수로 제공
	public static final String TYPE_ENTER = "ENTER"; // 입장 메세지
	public static final String TYPE_LEAVE = "LEAVE"; // 퇴장 메세지
	public static final String TYPE_TALK = "TALK";   // 대화 메세지
	public static final String TYPE_INIT = "INIT";   // 채팅 페이지 접속(소켓 초기화)
	public static final String TYPE_START = "START";   // 채팅 시작
	public static final String TYPE_LIST = "LIST";   // 채팅방 목록 표시
	public static final String TYPE_LIST_ADD = "LIST_ADD";   // 채팅방 목록 추가
	public static final String TYPE_REMOVE = "REMOVE";   // 채팅방 제거
	public static final String TYPE_MESSAGE_LIST = "MESSAGE_LIST";   // 채팅방 이전 채팅 내용 표시
	public static final String TYPE_CONFIRM = "CONFIRM";   // 거래수락 버튼 클릭
	public static final String TYPE_PAY_CONFIRM = "PAY_CONFIRM";   // 구매확정 버튼 클릭
	public static final String TYPE_STOP_PAY = "STOP_PAY";   // 거래중 버튼 클릭
	public static final String TYPE_INFO = "INFO";   // 거래중 버튼 클릭
}














