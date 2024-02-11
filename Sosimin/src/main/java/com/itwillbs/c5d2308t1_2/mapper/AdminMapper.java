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

}
