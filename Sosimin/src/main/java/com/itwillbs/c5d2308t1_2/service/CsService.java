package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.CsMapper;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;

@Service
public class CsService {

	@Autowired
	private CsMapper mapper;

	// 공지사항 목록 불러오기
	public int getCsListCount(String searchKeyword, String searchType, String category) {
		return mapper.selectCsListCount(searchKeyword, searchType, category);
	}
	
	// 한 페이지에 표시할 게시글 목록 조회 작업 요청 
	public List<Map<String, Object>> getCsNotice(String searchKeyword, String searchType, String category, PageDTO page) {
		return mapper.selectCsList(searchKeyword, searchType, category, page);
	}

}
