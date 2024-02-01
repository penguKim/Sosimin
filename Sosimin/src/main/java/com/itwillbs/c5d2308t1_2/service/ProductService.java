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
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) {
		System.out.println(">>>>>>>>>>>>>>>>>아이유 나와줘" + map.get("keyword"));
		return mapper.selectProductList(map);
	}
	
	// 페이지 카운트 조회
	public int getProductListCount(Map<String, Object> map) {
		return mapper.productListCount(map);
	}

	// ========================================================================================
	
	
	// 상품 조회를 위한 select
	public Map<String, String> selectProduct(MemberVO member) {
		
		return mapper.selectProduct(member);
	}

	// 상품 조회를 List 형식으로 뿌린방법
	public List<Map<String, Object>> selectProduct2(MemberVO member) {
	
		return mapper.selectProduct2(member);
	}

	// 상품 등록
	@Transactional
	public int productRegist(Map<String, String> map) {
		// 상품등록 테이블
		
		int product_id = mapper.productInsert(map);
		
		// 상품 게시물 테이블
		
		return mapper.productBoardInsert();
	}
	// 연관상품을 조회하기 위한 select
//	public List<Map<String, String>> selectRelatedProducts(Map<String, String> map, String sId) {
//		
//		return mapper.selectRelatedProducts(map, sId);
//	}




	

	
}
