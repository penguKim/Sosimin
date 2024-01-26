package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.ComponentMapper;

@Service
public class ComponentService {
	@Autowired
	ComponentMapper ComMapper;
	
	public List<Map<String, Object>> getLocationLocker() {
		return ComMapper.selectLocation();
	}

}
