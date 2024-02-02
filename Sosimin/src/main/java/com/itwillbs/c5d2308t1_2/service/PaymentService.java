package com.itwillbs.c5d2308t1_2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		Map<String, Object> token = mapper.selectAccessToken(map);
		
		// 아이디에 해당하는 토큰이 존재하지 않을 경우 엑세스토큰 INSERT
		// 토큰이 존재할 경우 엑세스토큰 UPDATE
		if(token == null) {
			mapper.insertAccessToken(map);
		} else {
			mapper.updateAccessToken(map);			
		}
			
	}

	// 2.2.1. 사용자정보조회 API 요청(GET)
	public Map<String, Object> requestUserInfo(Map<String, Object> map) {
		// BankApiClient - requestUserInfo() 메서드 호출
		return bankApiClient.requestUserInfo(map);
	}
	
	// 엑세스 토큰 조회 요청
	public Map<String, Object> getTokenInfo(String member_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		return mapper.selectAccessToken(map);
	}

	// 페이 가입 정보 저장 요청(계좌 등록 / 수정)
	public int registPay(Map<String, Object> map) {
		int count = 0;
		
		// 해당 아이디로 가입된 정보가 있는지 확인
		int idCount = mapper.selectPay(map);
		
		// 아이디가 존재하지 않을 경우 pay정보 insert
		if(idCount == 0) {
			count = mapper.insertPay(map);
		} else { // 아이디가 존재할 경우 pay정보 update
			count = mapper.updatePay(map);			
		}
		
		return count;
		
	}	

	// 사용자 페이 가입 정보 불러오기
	public Map<String, Object> getPayInfo(String member_id) {
		
		return mapper.selectPayInfo(member_id);
	}

	// 페이 이용 내역 불러오기
	public List<Map<String, Object>> getPayHistory(Map<String, Object> map) {
//		
//		return mapper.selectPayHistoryByYear(map);
		return mapper.selectPayHistory(map);
	}

	// 페이 내역 개수 세기(페이징)
	public int getPayHistoryCount(Map<String, Object> map) {
		
		return mapper.selectPayHistoryCount(map);
	}

	// 계좌 상세정보 조회 요청
	public Map<String, Object> requestAccountDetail(Map<String, Object> map) {
		// BankApiClient - requestAccountDetail()
		return bankApiClient.reqestAccountDetail(map);
	}

	// 출금 이체 요청
	public Map<String, Object> requestWithdraw(Map<String, Object> map) {
		return bankApiClient.requestWithdraw(map);
	}

	// 페이 충전/환급 및 충전/환급 내역 저장 요청
	@Transactional
	public int updatePayBalance(Map<String, Object> map) {
		mapper.insertPayHistory(map);
		
		return mapper.updatePayBalance(map);
	}
	
	// 관리자 엑세스토큰(oob) 발급 요청
	public ResponseTokenVO requestAdminAccessToken() {
		return bankApiClient.requestAdminAccessToken();
	}
	
	// 관리자 엑세스토큰 조회 요청
	public String getAdminAccessToken() {
		return mapper.selectAdminAccessToken();
	}
	
	// 입금 이체 요청
	public Map<String, Object> requestDeposit(Map<String, Object> map) {
		return bankApiClient.requestDeposit(map);
	}

	// 거래고유번호 조회 요청
	public int getTranIdCount(Map<String, Object> map) {
		return mapper.selectTranId(map);
	}
	
	// 결제하려는 상품 정보 조회
	public Map<String, Object> getProductInfo(Map<String, Object> map) {
		return mapper.selectProductInfo(map);
	}

	// 구매하고 구매 기록 저장
	@Transactional
	public int orderProduct(Map<String, Object> map) {
		mapper.insertOrder(map);
		mapper.insertOrderHistory(map);
		
		return mapper.updatePayBalance(map);
	}

	
	
	// ============= 관리자 페이지 ======================
	
	// 페이 가입 내역 불러오기
	public List<Map<String, Object>> getPayListAll() {
		return mapper.selectPayListAll();
	}
	
	// 회원의 페이 정보 불러오기
	public Map<String, Object> getPayList(Map<String, Object> map) {
		return mapper.selectPayList(map);
	}
	
	// 페이 이용 내역 불러오기(충전/환급)
	public List<Map<String, Object>> getPayHistoryChargeRefund() {	
		return mapper.selectPayChargeRefund();
	}

	// 페이 이용 내역 불러오기(사용/수익)
	public List<Map<String, Object>> getPayHistorySpentRevenue() {
		return mapper.selectPaySpentRevenue();
	}

	// 거래 내역 불러오기
	public List<Map<String, Object>> getOrderList() {
		return mapper.selectOrderList();
	}


}
