package com.itwillbs.c5d2308t1_2.handler;

import java.net.URI;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.itwillbs.c5d2308t1_2.vo.ResponseTokenVO;

@Component
public class BankApiClient {
	
	@Autowired
	BankValueGenerator bankValueGenerator;
	
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

	// 2.2. 사용자/서비스 관리 - 2.2.1. 사용자정보조회 API 요청(GET)
	public Map<String, Object> requestUserInfo(Map<String, Object> map) {
//		log.info("map : " + map);
		
		// GET 방식 요청에 대한 헤더 정보와 파라미터 설정
		// 1. 헤더에 정보 추가
		HttpHeaders headers = new HttpHeaders();
		// 헤더명 : "Authorization", 헤더값 : "Bearer" 문자열 뒤에 엑세스 토큰 결합
		headers.add("Authorization", "Bearer " + map.get("access_token"));
		
		// 2. 헤더 정보를 갖는 객체 생성
		HttpEntity<String> httpEntity = new HttpEntity<String>(headers);
		
		// 3. URI 정보 생성
		URI uri = UriComponentsBuilder
				.fromUriString("https://testapi.openbanking.or.kr/v2.0/user/me") // 주소
				.queryParam("user_seq_no", map.get("user_seq_no")) // 사용자번호
				.encode() // 인코딩처리
				.build() // UriComponents 객체 생성
				.toUri(); // URI 타입 객체로 변환
		
		// 4. RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 5. RestTemplate 객체의 exchange() 메서드 호출하여 HTTP 요청 수행
		ResponseEntity<Map<String, Object>> responseEntity
				= restTemplate.exchange(uri, HttpMethod.GET, httpEntity, new ParameterizedTypeReference<Map<String, Object>>() {});
		// 응답데이터를 Map 타입으로 처리할 경우
		// => 응답 처리 클래스 타입을 ParameterizedTypeReference 클래스의 익명 객체 생성 형태로
		//    제네릭타입을 Map<String, Object> 타입 지정
		
		return responseEntity.getBody();
	}

	// 2.3.1. 잔액조회 API 요청(GET)
	// https://testapi.openbanking.or.kr/v2.0/account/balance/fin_num
	public Map<String, Object> reqestAccountDetail(Map<String, Object> map) {
		// 파라미터로 사용할 난수 생성하여 리턴받기
		String bank_tran_id = bankValueGenerator.getBankTranId();
//		log.info("은행거래고유번호 : " + bank_tran_id);
				
		String tran_dtime = bankValueGenerator.getTranDTime(); 
//		log.info("요청일시 : " + tran_dtime);

		// GET 방식 요청에 대한 헤더 정보(엑세스 토큰)와 파라미터 설정
		// 1.  org.springframework.http.HttpHeaders 객체 생성 후 
		//     add() 메서드를 통해 헤더에 정보 추가
		HttpHeaders headers = new HttpHeaders();
		// "Bearer" 문자열 뒤에 엑세스 토큰 결합(공백으로 구분)
		headers.add("Authorization", "Bearer " + map.get("access_token"));
		
		// 2. 헤더 정보를 갖는 HttpEntity 객체 생성
		HttpEntity<String> httpEntity = new HttpEntity<String>(headers);
		
		// 3. 요청에 필요한 URI 정보 생성
		URI uri = UriComponentsBuilder
				.fromUriString("https://testapi.openbanking.or.kr/v2.0/account/balance/fin_num")
				.queryParam("bank_tran_id", bank_tran_id) // 거래고유번호
				.queryParam("fintech_use_num", map.get("fintech_use_num")) // 사용자번호
				.queryParam("tran_dtime", tran_dtime) // 요청일시
				.encode() // 인코딩처리
				.build() // UriComponents 객체 생성
				.toUri(); // URI 타입 객체로 변환
				
		// 4. RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		// 5. RestTemplate 객체의 exchange() 메서드 호출하여 HTTP 요청 수행(GET 방식)
		ResponseEntity<Map<String, Object>> responseEntity
			= restTemplate.exchange(uri, HttpMethod.GET, httpEntity, new ParameterizedTypeReference<Map<String, Object>>() {});
		
		// ResponseEntity 객체의 getBody() 메서드 호출하여 응답 데이터 리턴
		return responseEntity.getBody();
	}

	// 2.5. 계좌이체 서비스 - 2.5.1. 출금이체 API
	public Map<String, Object> requestWithdraw(Map<String, Object> map) {
		// 1. 헤더에 엑세스토큰 값 담아서 전송
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((String) map.get("access_token"));
		// 컨텐츠타입 JSON으로 변경
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		// 2. URL 생성
		String url = "https://testapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num";
		
		// 3. 요청 파라미터를 JSON 형식 데이터로 생성
		// 출금정보 저장
		JSONObject jo = new JSONObject();
		// 요청 파라미터 저장
		jo.put("bank_tran_id", bankValueGenerator.getBankTranId()); // 거래고유번호(자동생성)
		
		// ----------------- 핀테크 이용기관 정보 ------------------
		jo.put("cntr_account_type", "N"); // 약정 계좌/계정 구분("N" : 계좌, "C" : 계정 => N 고정)
		jo.put("cntr_account_num", "23082100001"); // 약정 계좌/계정 번호(핀테크 서비스 기관의 계좌번호)
		jo.put("dps_print_content", map.get("member_id")); // 입금계좌인자내역(결제 요청 사용자 아이디 활용) = 우리 계좌에 찍힐 이름
		
		// ----------------- 요청 고객(출금 대상) 정보 ------------------
		jo.put("fintech_use_num", map.get("fintech_use_num")); // 출금계좌 핀테크이용번호
		jo.put("wd_print_content", "소시민"); // 출금계좌인자내역 = 사용자 통장에 찍힐 이름
		jo.put("tran_amt", map.get("tran_amt")); // 거래금액 
		jo.put("tran_dtime", bankValueGenerator.getTranDTime()); // 요청일시(자동생성)
		jo.put("req_client_name", map.get("user_name")); // 요청고객 성명(출금계좌 예금주명)
		jo.put("req_client_fintech_use_num", map.get("fintech_use_num")); // 요청고객 핀테크이용번호(출금계좌)
		// => 주의! 은행기관코드&계좌번호 또는 핀테크이용번호 둘 중 하나만 설정
		jo.put("req_client_num", map.get("member_id").toString().toUpperCase()); // 요청고객회원번호(아이디 활용) = AN이니까 영어랑 숫자로 된 아이디 사용하면 됨
		// => 단, 영문자는 모두 대문자로 변환
		jo.put("transfer_purpose", "ST"); // 이체용도(송금(TR), 결제(ST), 충전(RC) 등) 
		
		// --------------- 수취 고객(실제 최종 입금 대상) 정보 ------------
		// 최종적으로 이 돈을 수신하는 계좌에 대한 정보
		// 이 정보(3개)는 피싱 등의 사고가 발생 시 지금 정지를 위한 정보(현재 검증 수행은 X)
		// => 일단 값 비워놓음
		jo.put("recv_client_name", "박가영");
		jo.put("recv_client_bank_code", "002");
		jo.put("recv_client_account_num", "23082100001");
		
		log.info("출금 이체 요청 json 데이터 : " + jo.toString());
		
		// 4. HttpEntity 객체 생성
		HttpEntity<String> httpEntity = new HttpEntity<String>(jo.toString(), headers);
		
		// 5. RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<Map<String, Object>> responseEntity
				= restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<Map<String, Object>>() {});
		
		// ResponseEntity 객체의 getBody() 메서드 호출하여 응답 데이터 리턴
		return responseEntity.getBody();
	}

	// 관리자 엑세스토큰(oob) 발급 요청
	public ResponseTokenVO requestAdminAccessToken() {
		// 금융결제원 오픈 API 요청 작업 처리(POST 방식)
		URI uri = UriComponentsBuilder
				.fromUriString("https://testapi.openbanking.or.kr/oauth/2.0/token") // 주소
				.encode() // 인코딩
				.build() // UriComponents 객체 생성
				.toUri();
		
		// POST 방식이므로 LinkedMultiValueMap 객체 사용하여
		// body에 파라미터 포함시켜 전달
		LinkedMultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("client_id", "4066d795-aa6e-4720-9383-931d1f60d1a9"); // 클라이언트 아이디
		parameters.add("client_secret", "36b4a668-94ba-426d-a291-771405e498e4"); // 클라이언트 시크릿
		parameters.add("scope", "oob"); // oob 발급 요청
		parameters.add("grant_type", "client_credentials"); // 고정값임
		
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
		
		return responseEntity.getBody();
	}

	// 2.5.2. 입금이체 API
	public Map<String, Object> requestDeposit(Map<String, Object> map) {
		// 1. 헤더에 엑세스토큰 값 담아서 전송
		HttpHeaders headers = new HttpHeaders();
		headers.setBearerAuth((String) map.get("access_token"));
		// 컨텐츠타입 JSON으로 변경
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		// 2. 요청에 필요한 URL 정보 생성 => 문자열로 바로 지정
		String url = "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/fin_num";
		
		// 3. 요청 파라미터를 JSON 형식 데이터로 생성
		// 3-1) 단건이체(1건의 입금 이체) 정보를 저장할 JSONObject 객체 생성
		JSONObject joReq = new JSONObject();
		joReq.put("tran_no", "1"); // 거래순번(단건이므로 무조건 1, 과거에 다건이 가능했어서 남아있음)
		joReq.put("bank_tran_id", bankValueGenerator.getBankTranId()); // 거래고유번호(자동생성)
		joReq.put("fintech_use_num", map.get("fintech_use_num")); // 입금계좌 핀테크 이용번호
		joReq.put("print_content", "소시민_환급"); // 입금계좌인자내역
		joReq.put("tran_amt", map.get("tran_amt")); // 거래금액
		joReq.put("req_client_name", map.get("user_name")); // 요청고객 성명(출금계좌 예금주명)
		joReq.put("req_client_fintech_use_num",  map.get("fintech_use_num")); // 요청고객 핀테크이용번호(출금계좌)
		joReq.put("req_client_num", map.get("member_id").toString().toUpperCase()); // 요청고객회원번호(아이디 활용)
		joReq.put("transfer_purpose", "TR"); // 이체용도(송금(TR), 결제(ST), 충전(RC) 등) 
		
		// 3-2) 입금 이체 1건의 정보를 배열(리스트)로 관리할 JSONArray 객체 생성
		JSONArray jaReqList = new JSONArray();
		jaReqList.put(joReq); // 1건 정보(JSONObject)를 목록(JSONArray)에 추가
		
		// 3-3) 기본 입금 이체 정보를 저장할 JSONObject 객체 생성
		JSONObject jo = new JSONObject();
		// 요청 파라미터 저장
		
		// 3-4) JSONObject 객체의 put() 메서드 호출하여 요청 파라미터 저장
		// ----------------- 핀테크 이용기관 정보 ------------------
		jo.put("cntr_account_type", "N"); // 약정 계좌/계정 구분("N" : 계좌, "C" : 계정 => N 고정)
		jo.put("cntr_account_num", "23082100001"); // 약정 계좌/계정 번호(핀테크 서비스 기관의 계좌번호)
		jo.put("wd_pass_phrase", "NONE"); // 입금이체용 암호문구(테스트 시 "NONE" 설정)
		jo.put("wd_print_content", map.get("member_id") + "_환급"); // 출금계좌인자내역(결제 요청 사용자 아이디 활용) = 우리 계좌에 찍힐 이름
		jo.put("name_check_option", "on"); // 수취인 성명 검증 여부(on 또는 생략 : 검증, off : 미검증)
		jo.put("tran_dtime", bankValueGenerator.getTranDTime()); // 요청일시(자동생성)
		jo.put("req_cnt", "1"); // 입금요청건수(단건이므로 무조건 1)
		
		// ----------------------- 기본 입금 이체 정보 () -----------------------
		jo.put("req_list", jaReqList); // 요청일시(자동생성)
		
		log.info(">>>>> 입금 이체 요청 JSON 데이터 : " + jo.toString());
		
		// 4. HttpEntity 객체 생성
		HttpEntity<String> httpEntity = new HttpEntity<String>(jo.toString(), headers);
		
		// 5. RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<Map<String, Object>> responseEntity
				= restTemplate.exchange(url, HttpMethod.POST, httpEntity, new ParameterizedTypeReference<Map<String, Object>>() {});
		
		// ResponseEntity 객체의 getBody() 메서드 호출하여 응답 데이터 리턴
		return responseEntity.getBody();
	}
	
	
	
}
