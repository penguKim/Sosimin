package com.itwillbs.c5d2308t1_2.service;

import java.util.Map;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c5d2308t1_2.mapper.ProductMapper;

@Service
public class ProductService {

	@Autowired
	ProductMapper mapper;
	
	@Mapper
	public int productRegist(Map<String, String> map) {
//	// 상품등록 테이블
	return mapper.productInsert(map);
	}
	
	
	// 상품 등록
//	@Transactional
//	public int productRegist(Map<String, String> map) {
//		// 상품등록 테이블
//		mapper.productInsert(map);
//		
//		// 상품 게시물 테이블
//		return mapper.productBoardInsert(map);
//	}
	
	
}
