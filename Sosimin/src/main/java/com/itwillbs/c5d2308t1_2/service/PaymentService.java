package com.itwillbs.c5d2308t1_2.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.handler.BankApiClient;
import com.itwillbs.c5d2308t1_2.vo.ResponseTokenVO;

@Service
public class PaymentService {

	@Autowired
	private BankApiClient bankApiClient;
	
	
	// 엑세스 토큰 발급 요청
	public ResponseTokenVO requestAccessToken(Map<String, String> authResponse) {
		// BankApiClient - requestAccessToken() 메서드 호출하여 엑세스 토큰 발급 요청
		// => 리턴타입 : ResponseTokenVO
		return bankApiClient.requestAccessToken(authResponse);
	}

}
