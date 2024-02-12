package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	
	// 카테고리 점유율 차트
	List<Map<String, Object>> categoryShare();

	// 커뮤니티 구 카운트
	List<Map<String, Object>> communityGuCount();

	// 일일 상품 등록 카운트
	Map<String, String> selectDailyProductCount();

	// 일일 결제 카운트 차트
	Map<String, String> selectDailyOrderCount();

	// 일일 결제 금액 차트
	Map<String, String> selectDailyPriceCount();
	
	// 일일 신고 카운트 차트
	Map<String, String> selectDailyReportCount();

	// 메인 7일 통계 차트
	List<Map<String, Object>> selectReports();


}
