package com.itwillbs.c5d2308t1_2.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.handler.BankApiClient;
import com.itwillbs.c5d2308t1_2.mapper.PaymentMapper;
import com.itwillbs.c5d2308t1_2.vo.ResponseTokenVO;

@Service
public class PaymentService {

	@Autowired
	private PaymentMapper mapper;
	
	@Autowired
	private BankApiClient bankApiClient;
	
	
	// 엑세스 토큰 발급 요청
	public ResponseTokenVO requestAccessToken(Map<String, String> authResponse) {
		// BankApiClient - requestAccessToken() 메서드 호출하여 엑세스 토큰 발급 요청
		// => 리턴타입 : ResponseTokenVO
		return bankApiClient.requestAccessToken(authResponse);
	}

	// 엑세스 토큰 저장 요청
	public void registAccessToken(Map<String, Object> map) {
		// 해당 아이디로 저장된 토큰이 있는지 확인
		String id = mapper.selectId(map);
		
		// 아이디가 존재하지 않을 경우 엑세스토큰 INSERT
		// 아이디가 존재할 경우 엑세스토큰 UPDATE
		if(id == null) {
			mapper.insertAccessToken(map);
		} else {
			mapper.updateAccessToken(map);			
		}
			
	}

}
