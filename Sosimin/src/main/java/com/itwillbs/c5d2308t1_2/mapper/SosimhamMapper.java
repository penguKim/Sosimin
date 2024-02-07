package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SosimhamMapper {
	// 구랑 동 정보 가져오기
	List<Map<String, Object>> selectLocation();
	// 구정보만 가져오기
	List<String> selectGu();
	// 연관검색어 조회
	List<String> selectRelationKeyWord(String searchKeyWord);

}
