package com.itwillbs.c5d2308t1_2.handler;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.itwillbs.c5d2308t1_2.controller.PaymentController;
import com.itwillbs.c5d2308t1_2.vo.ResponseTokenVO;

@Component
public class BankApiClient {
	
	// 로그 출력을 위한 변수 선언
	private static final Logger log = LoggerFactory.getLogger(BankApiClient.class);

	// 2.1.2. 토큰발급 API - 사용자 토큰 발급 API 요청
	public ResponseTokenVO requestAccessToken(Map<String, String> authResponse) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
