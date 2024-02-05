package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

	// 토큰 중복 처리를 위한 아이디 조회
	Map<String, Object> selectAccessToken(Map<String, Object> map);

	// 엑세스토큰 저장
	void insertAccessToken(Map<String, Object> map);

	// 엑세스토큰 업데이트
	void updateAccessToken(Map<String, Object> map);

	// 페이 가입 중복 처리를 위한 아이디 조회
	int selectPay(Map<String, Object> map);

	// 페이 가입(계좌 insert)
	int insertPay(Map<String, Object> map);

	// 페이 수정(계좌 update)
	int updatePay(Map<String, Object> map);
	
	// 사용자 페이 가입 정보 불러오기
	Map<String, Object> selectPayInfo(String member_id);

	// 페이 사용 내역 연도별로 불러오기
//	List<Map<String, Object>> selectPayHistoryByYear(Map<String, Object> map);
	List<Map<String, Object>> selectPayHistory(Map<String, Object> map);

	// 페이 내역 개수 세기(페이징)
	int selectPayHistoryCount(Map<String, Object> map);

	// 페이 충전/환급 요청
	int updatePayBalance(Map<String, Object> map);

	// 페이 충전/환급 내역 저장 요청
	void insertPayHistory(Map<String, Object> map);
	
	// 관리자 엑세스토큰 조회 요청
	String selectAdminAccessToken();

	// 거래고유번호 조회 요청
	int selectTranId(Map<String, Object> map);
	
	// 구매하려는 상품 정보 조회
	Map<String, Object> selectProductInfo(Map<String, Object> map);
	
	// 거래 수락 전에 중복이 없는지 체크
	int selectOrderCheck(Map<String, Object> map);

	// 거래수락 시 거래 정보 생성
	int insertOrder(Map<String, Object> map);
	
	// 상품 거래 상태 1로 변경
	void updateTradeStatus1(Map<String, Object> map);

	// 페이 사용 내역
	void insertbuyHistory(Map<String, Object> map);
	
	// 구매자 지불 정보 넣기
	void updateOrderBuyer(Map<String, Object> map);
	
	// 구매자 정보 불러오기
	Map<String, Object> selectOrderInfo(Map<String, Object> map);
	
	// 상품 거래 상태 2로 변경
	void updateTradeStatus2(Map<String, Object> map);
	
	// 상품 결제 상태를 1로 변경
	int updateOrderStatus(Map<String, Object> map);
	
	// 페이 수익 내역
	void insertsellHistory(Map<String, Object> map);
	
	// 판매자 수익 정보 넣기
	void updateOrderSeller(Map<String, Object> map);
	
	// ====================== 관리자페이지 ==================
	
	// 페이 가입 내역 불러오기
	List<Map<String, Object>> selectPayListAll();
	
	// 회원의 페이 정보 불러오기
	Map<String, Object> selectPayList(Map<String, Object> map);
	
	// 페이 정보 수정하기
	int updatePayInfo(Map<String, Object> map);
	
	// 페이 잔액 변경 내역 저장
	void insertPayHistory2(Map<String, Object> map);
	
	// 페이 사용 내역 불러오기(충전/환급)
	List<Map<String, Object>> selectPayChargeRefund();

	// 페이 사용 내역 불러오기(사용/수익)
	List<Map<String, Object>> selectPaySpentRevenue();

	List<Map<String, Object>> selectOrderList();












}
