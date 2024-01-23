package com.itwillbs.c5d2308t1_2.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {

	// 토큰 중복 처리를 위한 아이디 조회
	String selectId(Map<String, Object> map);

	// 엑세스토큰 저장
	void insertAccessToken(Map<String, Object> map);

	// 엑세스토큰 업데이트
	void updateAccessToken(Map<String, Object> map);

}
