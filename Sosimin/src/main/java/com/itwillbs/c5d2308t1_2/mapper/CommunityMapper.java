package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;

@Mapper
public interface CommunityMapper {

	// 게시글 등록
	int insertCommunity(CommunityVO com);
	
	// 페이징 처리를 위한 게시물 개수 조회 작업
	int selectCommunityListCount(@Param("searchKeyword") String searchKeyword, @Param("searchType") String searchType);

	// 한 페이지에 표시할 게시글 목록 조회 작업 요청 
	List<CommunityVO> selectCommunityList(@Param("searchKeyword") String searchKeyword, @Param("searchType") String searchType, @Param("page") PageDTO page);

	// 게시글 조회
	CommunityVO selectCommunity(CommunityVO com);

	// 게시글 조회수 증가 작업
	void updateReadcount(CommunityVO com);

	// 게시글 삭제 작업
	int deleteCommunity(CommunityVO com);
	
}
