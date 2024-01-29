package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.SosimhamMapper;

@Service
public class SosimhamService {
	@Autowired
	SosimhamMapper SosimMapper;
	// 구랑 동 정보 가져오
	public List<Map<String, Object>> getLocationLocker() {
		return SosimMapper.selectLocation();
	}
	
	// 구정보만 가져오기
	public List<String> getGu() {
		return SosimMapper.selectGu();
	}

}