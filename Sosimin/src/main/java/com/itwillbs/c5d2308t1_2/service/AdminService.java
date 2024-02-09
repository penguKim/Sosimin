package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper mapper;
	
	// 카테고리 점유율 차트
	public List<Map<String, Object>> categoryShare() {
		return mapper.categoryShare();
	}

}
