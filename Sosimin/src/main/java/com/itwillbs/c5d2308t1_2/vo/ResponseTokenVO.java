package com.itwillbs.c5d2308t1_2.vo;

import lombok.Data;

// 2.1.2. 토큰발급 API 
// - 사용자 토큰발급 API (3-legged) 응답 데이터를 파싱할 클래스
@Data
public class ResponseTokenVO {
	private String access_token;
	private String token_type;
	private String expires_in;
	private String refresh_token;
	private String scope;
	private String user_seq_no;
}
