package com.itwillbs.c5d2308t1_2.mapper;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.CommunityReplyVO;
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.ReviewVO;

@Mapper
public interface CommunityMapper {

	// 게시글 등록
	int insertCommunity(CommunityVO com);
	
	// 페이징 처리를 위한 게시물 개수 조회 작업
	int selectCommunityListCount(@Param("searchKeyword") String searchKeyword, @Param("searchType") String searchType, @Param("category") String category, @Param("gu") String gu);

	// 한 페이지에 표시할 게시글 목록 조회 작업 요청 
	List<Map<String, Object>> selectCommunityList(@Param("searchKeyword") String searchKeyword, @Param("searchType") String searchType, @Param("category") String category, @Param("page") PageDTO page, @Param("gu") String gu);

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

	// 임시저장한 게시글 조회
	Map<String, Object> selectTempCommunity(CommunityVO com);

	// 게시글 임시저장
	int insertTempCommunity(CommunityVO com);

	// 임시저장한 게시글 업데이트
	int updateTempCommunity(CommunityVO com);

	// 임시저장 게시글 삭제
	int deleteTempCommunity(CommunityVO com);

	// 이미지 등록 AJAX
	int insertTempImage(CommunityVO com);

	// 이미지 업데이트 AJAX
	int updateTempImage(CommunityVO com);

	// 이미지 삭제 AJAX의 널스트링 처리
	void removeTempImage(Map<String, Object> map);

	// 이미지 삭제 AJAX의 삭제 이미지 이후의 순서 옮기기
	int moveTempImage(Map<String, Object> map);

	// 글수정 삭제 이미지 널스트링 처리
	void removeCommunityImage(Map<String, Object> map);

	// 글수정 삭제 이미지 이후의 순서 옮기기
	int moveCommunityImage(Map<String, Object> map);

	// 스케쥴러의 임시저장글 조회
	List<Map<String, String>> selectTempList(String yesterday);

	// 스케쥴러가 판별한 임시저장글 삭제
	int removeTempCommunity(String temp_id);

	// 회원의 현재 지역 정보 가져오기
	int selectTownId(CommunityVO com);
	
	// 게시판 입장시 지역정보 판별
	Map<String, Object> getTownName(String id);
	
	// ===================== 관리자 페이지 =====================
	// 커뮤니티 게시판 조회
	List<Map<String, String>> selectAllList();

	// 커뮤니티 댓글 조회
	List<Map<String, String>> selectAllReList();

	


	
}





