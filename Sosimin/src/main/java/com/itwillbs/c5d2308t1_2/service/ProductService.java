package com.itwillbs.c5d2308t1_2.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c5d2308t1_2.mapper.ProductMapper;
import com.itwillbs.c5d2308t1_2.vo.*;

@Service
public class ProductService {

	@Autowired
	ProductMapper mapper;
	
	// 미로그인 시 날짜 최신순으로 상목 목록 조회
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) {
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
		
		mapper.productBoardInsert();
		// 상품 게시물 테이블
		return mapper.selectProductId();
		
	}

	// 연관상품 조회

	public List<Map<String, Object>> selectRelatedProducts(Map<String, String> product) {
		
		return mapper.selectRelatedProducts(product);
	}
	
	public String getInterst(Map<String, String> interest) {
		Map<String,String> map = new HashMap<String, String>(); 
		map = mapper.selectInterest(interest);
		System.out.println("관심 갯수 : " + map);
		
		if(map != null) { // 관심 누른 경우
			mapper.deleteInterest(interest); // 관심 삭제 수행
			return "true";
		} else {
			mapper.insertInterest(interest); // 관심 등록 수행
			return "false";
		}
	}

	// 관심 갯수 카운트
	public int getInterestCount(ProductVO product) {
		
		return mapper.selectInterestCount(product);
	}

	// 관심 가져오기
	public Map<String, String> getMemberInterest(Map<String, String> interest) {
		
		return mapper.selectMemberInterset(interest);
	}

	
}
