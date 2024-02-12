package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper mapper;
	
	// 카테고리 점유율 차트
	public List<Map<String, Object>> categoryShare() {
		return mapper.categoryShare();
	}

	// 커뮤니티 구 카운트
	public List<Map<String, Object>> communityGuCount() {
		return mapper.communityGuCount();
	}

	// 일일 상품 카운트 차트
	public Map<String, String> getDailyProductCount() {
		return mapper.selectDailyProductCount();
	}

	// 일일 결제 카운트 차트
	public Map<String, String> getDailyOrderCount() {
		return mapper.selectDailyOrderCount();
	}

	// 일일 결제 금액 차트
	public Map<String, String> getDailyPriceCount() {
		return mapper.selectDailyPriceCount();
	}
	
	// 일일 신고 카운트 차트
	public Map<String, String> getDailyReportCount() {
		return mapper.selectDailyReportCount();
	}

	// 메인 7일 통계 차트
	public List<Map<String, Object>> getReports() {
		return mapper.selectReports();
	}
	
	// 최신 거래 상품 목록
	public List<Map<String, Object>> getRecentProduct() {
		return mapper.selectRecentProduct();
	}


}
