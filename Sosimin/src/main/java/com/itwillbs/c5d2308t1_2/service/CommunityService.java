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
	public int getCommunityListCount(String searchKeyword, String searchType) {
		return mapper.selectCommunityListCount(searchKeyword, searchType);
	}
	
	// 한 페이지에 표시할 게시글 목록 조회 작업 요청 
	public List<CommunityVO> getCommunityList(String searchKeyword, String searchType, PageDTO page) {
		return mapper.selectCommunityList(searchKeyword, searchType, page);
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
			// 전달한 객체와 리턴할 객체가 동일하기에 sql 구문 실행후 증가한 조회수도 객체에 저장되어 반영된다.
			mapper.updateReadcount(com);
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
//		if(reply.getReply_re_lev() > 0) {
			mapper.updateReplySeq(reply);
//		}
		
		// 대댓글 작성 요청
		return mapper.insertReReply(reply);
	}


}
