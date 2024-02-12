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
	// 멤버아이디 조회(닉네임으로)
	String selectMemberId(String q);
	// 인기검색어 TOP10 조회
	List<Map<String, String>> selectSearchList();
	// 메인 인기상품 TOP8 조회
	List<Map<String, Object>> selectPopularList();
	// 검색 내용 디비에 존재유무 조회
	int selectWord(String keyword);
	// 존재한 검색어 조회수 증가
	int updateSearchCount(String keyword);
	// 검색내용 디비 저장
	int insertKeyword(String keyword);
	// 인기검색어 삭제(delete_status 컬럼 1로 변경)
	int updateContent(String content);
	

}
