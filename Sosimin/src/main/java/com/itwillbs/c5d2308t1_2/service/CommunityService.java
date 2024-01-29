package com.itwillbs.c5d2308t1_2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c5d2308t1_2.mapper.CommunityMapper;
import com.itwillbs.c5d2308t1_2.vo.CommunityReplyVO;
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;

@Service
public class CommunityService {
	@Autowired
	CommunityMapper mapper;
	
	// 게시글 목록
	public int getCommunityListCount(String searchKeyword, String searchType, String category) {
		return mapper.selectCommunityListCount(searchKeyword, searchType, category);
	}
	
	// 한 페이지에 표시할 게시글 목록 조회 작업 요청 
	public List<CommunityVO> getCommunityList(String searchKeyword, String searchType, String category, PageDTO page) {
		return mapper.selectCommunityList(searchKeyword, searchType, category, page);
	}
	
	// 게시글 등록
	public int registCommunity(CommunityVO com) {
		return mapper.insertCommunity(com);
	}

	// 게시글 상세 조회
	public Map<String, Object> getCommunity(CommunityVO com, boolean isIncreaseReadcount) {
		// 게시글 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map = mapper.selectCommunity(com);
		
		// 조회 결과가 존재하고 isIncreaseReadcount 가 true 일 경우 조회수 증가 작업 요청
		if(com != null && isIncreaseReadcount) {
			mapper.updateReadcount(com);
			map.put("community_readcount", (int)map.get("community_readcount") + 1);
		}
		
		return map;
	}

	// 게시글 삭제 작업
	public int removeCommunity(CommunityVO com) {
		return mapper.deleteCommunity(com);
	}

	// 게시글 수정 - 파일 삭제 작업
	public int removeBoardFile(CommunityVO com) {
		return mapper.updateCommunityFile(com);
	}

	// 게시글 수정 작업
	public int modifyCommunity(CommunityVO com) {
		return mapper.updateCommunity(com);
	}

	// 댓글 등록 작업
	public int registReplyCommunity(CommunityReplyVO reply) {
		return mapper.insertReplyCommunity(reply);
	}

	// 댓글 목록 조회
	public List<CommunityReplyVO> getreplyList(CommunityVO com) {
		return mapper.getReplyList(com);
	}

	// 댓글 작성자 조회
	public CommunityReplyVO getReplyWriter(CommunityReplyVO reply) {
		return mapper.selectReplyWriter(reply);
	}

	// 댓글 삭제 작업
	public int removeReply(CommunityReplyVO reply) {
		return mapper.deleteReply(reply);
	}

	// 대댓글 작성 요청
	@Transactional
	public int registReReply(CommunityReplyVO reply) {
		// 기존 대댓글의 순서조정
			mapper.updateReplySeq(reply);
		
		// 대댓글 작성 요청
		return mapper.insertReReply(reply);
	}

	// 상세 게시글 좋아요 갯수
	public int getLikeCount(CommunityVO com) {
		return mapper.selectLikeCount(com);
	}

	// 상세 게시글 좋아요 비즈니스 로직
	public String getLike(Map<String, String> like) {
		Map<String, String> map = new HashMap<String, String>();
		map = mapper.selectLike(like);
		System.out.println("셀렉트한 좋아요 : " + map);
		
		if(map != null) { // 해당 영화를 찜한 경우
			mapper.deleteLike(like); // 찜하기 삭제 수행
			return "true";
		} else { // 찜을 안한 경우
			mapper.insertLike(like); // 찜하기 등록 수행
			return "false";
		}
	}

	// 회원의 게시글 좋아요 가져오기
	public Map<String, String> getmemberLike(Map<String, String> like) {
		
		return mapper.selectLike(like);
	}

	// 게시글 임시저장
	public int registTempCommunity(CommunityVO com) {
		int count = 0;
		
		// 임시저장한 게시글 조회
		Map<String, Object> map = mapper.selectTempCommunity(com);
		System.out.println("map에는 뭐가들었나 : " + map);
		if(map == null) { // 임시저장 게시글이 없을 때
			count = mapper.insertTempCommunity(com);
		} else {
			count = mapper.updateTempCommunity(com);
		}
		
		return count;
	}

	// 임시저장 게시글 판별
	public Map<String, Object> getTempCommunity(CommunityVO com) {
		return mapper.selectTempCommunity(com);
	}


}
