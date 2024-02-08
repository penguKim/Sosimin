package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.PageDTO;

@Mapper
public interface CsMapper {

	// 고객센터 목록 불러오기
	// 페이징 처리를 위한 게시물 개수 조회 작업
	int selectCsListCount(@Param("searchKeyword") String searchKeyword, @Param("searchType") String searchType, @Param("category") String category, @Param("map") Map<String, Object> map);

	// 한 페이지에 표시할 게시글 목록 조회 작업 요청 
	List<Map<String, Object>> selectCsList(@Param("searchKeyword") String searchKeyword, @Param("searchType") String searchType, @Param("category") String category, @Param("page") PageDTO page, @Param("map") Map<String, Object> map);

	// 고객센터관리
	List<Map<String, Object>> selectCsListAdmin(@Param("map") Map<String, Object> map);

	// 고객센터 상세 조회
	Map<String, Object> selectCsDetail(int cs_id);
	

}
