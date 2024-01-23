package com.itwillbs.c5d2308t1_2.handler;

import java.net.URI;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.c5d2308t1_2.controller.PaymentController;
import com.itwillbs.c5d2308t1_2.vo.ResponseTokenVO;

@Component
public class BankApiClient {
	
	// 로그 출력을 위한 변수 선언
	private static final Logger log = LoggerFactory.getLogger(BankApiClient.class);

	// 2.1.2. 토큰발급 API - 사용자 토큰 발급 API 요청
	// https://testapi.openbanking.or.kr/oauth/2.0/token	
	public ResponseTokenVO requestAccessToken(Map<String, String> authResponse) {
		// 금융결제원 오픈 API 요청 작업 처리(POST 방식)
		URI uri = UriComponentsBuilder
				.fromUriString("https://testapi.openbanking.or.kr/oauth/2.0/token") // 주소
				.encode() // 인코딩
				.build() // UriComponents 객체 생성
				.toUri();
		
		// POST 방식이므로 LinkedMultiValueMap 객체 사용하여
		// body에 파라미터 포함시켜 전달
		LinkedMultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("code", authResponse.get("code")); // 응답받은 인증코드
		parameters.add("client_id", "4066d795-aa6e-4720-9383-931d1f60d1a9"); // 클라이언트 아이디
		parameters.add("client_secret", "36b4a668-94ba-426d-a291-771405e498e4"); // 클라이언트 시크릿
		parameters.add("redirect_uri", "http://localhost:8081/c5d2308t1_2/callback"); // 리다이렉트 주소
		parameters.add("grant_type", "authorization_code"); // 고정값임
		
		// HttpEntity 객체를 활용하여 요청에 사용될 파라미터를 관리하는 객체를 요청 방식에 맞게 변환
		HttpEntity<LinkedMultiValueMap<String, String>> httpEntity =
				new HttpEntity<LinkedMultiValueMap<String,String>>(parameters);
		
		// REST API 요청을 위해 RestTemplate 객체 활용
		// 1) RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 2) RestTemplate 객체의 exchange() 메서드 호출하여 POST 방식 요청 수행 가능
		//    파라미터 : URL을 관리하는 URI 객체, 요청 메서드(GET/POST),
		//				 요청정보를 관리하는 HttpEntity 객체, 
		//               JSON 타입의 응답 데이터를 자동으로 파싱할 클래스
		//    리턴타입 : 응답 정보를 관리할 ResponseEntity<T> 타입,
		//               제네릭타입은 XXX.class 로 지정한 클래스 타입 지정
		ResponseEntity<ResponseTokenVO> responseEntity
			= restTemplate.exchange(uri, HttpMethod.POST, httpEntity, ResponseTokenVO.class);
		
		// 응답 정보 확인
//		log.info("응답 코드 : " + responseEntity.getStatusCode());
//		log.info("응답 헤더 : " + responseEntity.getHeaders());
//		log.info("응답 본문 : " + responseEntity.getBody());
		
		return responseEntity.getBody();
	}
	
	
	
}
