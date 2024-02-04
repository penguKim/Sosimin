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

	public List<Map<String, Object>> memberReportList() {
		
		return mapper.memberReportList();
	}

	public List<Map<String, Object>> boardReportList() {
		
		return mapper.boardReportList();
	}
	
	
}
