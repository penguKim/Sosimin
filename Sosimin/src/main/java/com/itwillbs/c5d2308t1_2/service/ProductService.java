package com.itwillbs.c5d2308t1_2.service;

import java.util.Map;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c5d2308t1_2.mapper.ProductMapper;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	ProductMapper mapper;
	
//	public int productRegist(Map<String, String> map) {
////	// 상품등록 테이블
//	return mapper.productInsert(map);
//	}
	
	public int registProduct(ProductVO product) {
		
		return mapper.insertProduct(product);
	}
	
	// 상품 조회를 위한 select
	public Map<String, String> selectProduct(MemberVO member) {
		
		return mapper.selectProduct(member);
	}


	
	
	// 상품 등록
	@Transactional
	public int productRegist(Map<String, String> map) {
		// 상품등록 테이블
		
		int product_id = mapper.productInsert(map);
		
		// 상품 게시물 테이블
		
		return mapper.productBoardInsert();
	}

	public Map<String, String> selectProduct() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
