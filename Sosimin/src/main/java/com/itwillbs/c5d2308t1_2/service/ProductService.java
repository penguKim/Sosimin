package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c5d2308t1_2.mapper.ProductMapper;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;

@Service
public class ProductService {

	@Autowired
	ProductMapper mapper;
	
	// 미로그인 시 날짜 최신순으로 상목 목록 조회
	public List<Map<String, Object>> selectProductList(Map<String, String> map) {
		
		return mapper.selectProductList(map);
	}
	// ========================================================================================
	
	
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
