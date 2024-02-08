package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c5d2308t1_2.vo.ReviewVO;

@Mapper
public interface LevelMapper {

	// 상대방 아이디 조회
	String selectTargetId(ReviewVO re);
	
	// 회원 정보 조회
	Map<String, Integer> selectMemberLevel(String targetId);
	
	// 회원 리뷰 등록
	int insertReview(ReviewVO re);

	// 회원의 리뷰 정보 가져오기
	ReviewVO selectReview(ReviewVO re);
	
	// 회원 리뷰 삭제
	int deleteReview(ReviewVO re);

	// 이전 레벨정보 가져오기
	Map<String, Integer> selectLevel(int level);

	// 최대 레벨 조회
	int selectMaxLevel();
	
	// 회원 레벨 업데이트
	void updateMemberLevel(Map<String, Integer> map);
	





}
