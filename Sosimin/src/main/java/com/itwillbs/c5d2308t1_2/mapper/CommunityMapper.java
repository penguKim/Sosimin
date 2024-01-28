package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.CommunityReplyVO;
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
	Map<String, Object> selectCommunity(CommunityVO com);

	// 게시글 조회수 증가 작업
	void updateReadcount(CommunityVO com);

	// 게시글 삭제 작업
	int deleteCommunity(CommunityVO com);

	// 게시글 수정 - 파일 삭제 작업
	int updateCommunityFile(CommunityVO com);

	// 게시글 수정 작업
	int updateCommunity(CommunityVO com);
	
	// 댓글 등록 작업
	int insertReplyCommunity(CommunityReplyVO reply);

	// 댓글 목록 조회
	List<CommunityReplyVO> getReplyList(CommunityVO com);

	// 댓글 작성자 조회
	CommunityReplyVO selectReplyWriter(CommunityReplyVO reply);

	// 댓글 삭제 작업
	int deleteReply(CommunityReplyVO reply);

	// 대댓글 작성 시 기존 대댓글 순서 조정
	void updateReplySeq(CommunityReplyVO reply);

	// 대댓글 작성 요청
	int insertReReply(CommunityReplyVO reply);

	// 상세 게시글 좋아요 갯수
	int selectLikeCount(CommunityVO com);

	// 상세 게시글 좋아요 판별
	Map<String, String> selectLike(Map<String, String> like);

	// 좋아요 삭제
	void deleteLike(Map<String, String> like);

	// 좋아요 등록
	void insertLike(Map<String, String> like);

	// 회원의 좋아요 목록
	List<Map<String, String>> selectLikeList(String sId);
	
}
