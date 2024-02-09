package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.ReportMapper;

@Service
public class ReportService {
	
	@Autowired
	ReportMapper mapper;
	
	// 신고된 내용 등록 - INSERT
	public int insertReport(Map<String, String> map) {
		return mapper.insertReport(map);
	}
	
	// 회원 신고 목록 요청
	public List<Map<String, Object>> memberReportList() {
		return mapper.memberReportList();
	}

	// 상품 신고 목록 요청
	public List<Map<String, Object>> boardReportList() {
		return mapper.boardReportList();
	}

	// 커뮤니티 신고 목록 요청
	public List<Map<String, Object>> communityReportList() {
		return mapper.communityReportList();
	}

	// 댓글 신고 목록 요청
	public List<Map<String, Object>> replyReportList() {
		return mapper.replyReportList();
	}
	
	// 신고 상태 변경
	public void reportStatusUpt(Map<String, String> map) {
		mapper.reportStatusUpt(map);
	}
	
	
}
