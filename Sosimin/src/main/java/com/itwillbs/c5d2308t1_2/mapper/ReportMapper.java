package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {

	int insertReport(Map<String, String> map);
	
	// 회원 신고 목록
	List<Map<String, Object>> memberReportList();

	// 상품 신고 목록
	List<Map<String, Object>> boardReportList();

	// 커뮤 신고 목록
	List<Map<String, Object>> communityReportList();

	// 댓글 신고 목록
	List<Map<String, Object>> replyReportList();
	
}
