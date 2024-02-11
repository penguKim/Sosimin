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
	@Transactional
	public int registPay(Map<String, Object> map) {
		int count = 0;
		
		// 해당 아이디로 가입된 정보가 있는지 확인
		int idCount = mapper.selectPay(map);
		
		// 아이디가 존재하지 않을 경우 pay정보 insert
		if(idCount == 0) {
			count = mapper.insertPay(map);
			mapper.insertPayHistoryFirst(map);
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

	// 페이 탈퇴하기
	@Transactional
	public int withdrawPay(Map<String, Object> map) {
		// 계좌 인증 정보(토큰)를 삭제
		mapper.deleteToken(map);
		
		// 페이 이용 내역을 삭제
		mapper.deletePayHistory(map);
		
		// 페이 상태를 탈퇴로 변경하고 정보 삭제
		return mapper.updatePayStatus(map);
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

	// 페이 충전/환급 및 내역 저장 요청
	// 약정 계좌 내역 저장 요청
	@Transactional
	public int updatePayBalance(Map<String, Object> map) {
		mapper.insertPayHistory(map);
		mapper.insertSosiminAccount(map);
		
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

	// 거래 수락 전에 이미 수락한 적이 있는 지확인
	public int orderCheck(Map<String, Object> map) {
		return mapper.selectOrderCheck(map);
	}
	
	// 거래수락
	@Transactional
	public int orderProduct(Map<String, Object> map) {
		mapper.updateTradeStatus1(map);
		
		return mapper.insertOrder(map);
	}
	
	// 구매하고 구매 기록 저장
	@Transactional
	public int paymentBuyer(Map<String, Object> map) {
		mapper.insertbuyHistory(map);
		mapper.updateOrderBuyer(map);
		
		return mapper.updatePayBalance(map);
	}

	// 구매자 확인
	public Map<String, Object> getOrderInfo(Map<String, Object> map) {
		return mapper.selectOrderInfo(map);
	}

	// 구매확정처리(현금결제용)
	@Transactional
	public int modifyStatus(Map<String, Object> map) {
		mapper.updateTradeStatus2(map);
		
		return mapper.updateOrderStatus(map);
	}

	// 구매확정처리(페이결제용)
	@Transactional
	public int confirmPayment(Map<String, Object> map) {
		mapper.updateTradeStatus2(map); // Product 테이블 상품상태 변경
		mapper.insertsellHistory(map); // 페이 기록 넣기
		mapper.updateOrderSeller(map); // Orders테이블 결제상태 1로, seller_pay_history_id, 거래완료시간
		
		return mapper.updatePayBalance(map); // 페이 잔액 올리기
	}
	
	// 거래중단(결제가 이루어진 경우)
	@Transactional
	public int getdeleteAllCount(Map<String, Object> map) {
		// 판매글 상태 변경하고 Orders 컬럼 삭제
		// 페이 돌려주고 payhistory에 쓰기
		// [Pay] 테이블 전체금액도 다시 돌려놓기
		mapper.insertPayHistory(map);
		mapper.updatePayBalance(map);
		mapper.updateTradeStatus0(map);
		
		return mapper.deleteOrders(map);
	}

	// 거래중단(결제 이루어지지 않은 경우)
	@Transactional
	public int getdeleteCount(Map<String, Object> map) {
		// 판매글 상태 판매중으로 변경하고 Orders 컬럼 삭제
		mapper.updateTradeStatus0(map);
	
		return mapper.deleteOrders(map);
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
	
	// 페이 정보 변경
	@Transactional
	public int updatePayInfo(Map<String, Object> map) {
		if(map.get("pay_balance") != null && !map.get("pay_balance").toString().equals("")) {
			mapper.insertPayHistory2(map);			
		}
		return mapper.updatePayInfo(map);
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

	// 약정계좌 내역 불러오기
	public List<Map<String, Object>> getSosiminAccount() {
		return mapper.selectSosiminAccount();
	}

	// 구매 내역 삭제
	public int deleteOrderList(Map<String, Object> map) {
		return mapper.deleteOrderList(map);
	}

}
