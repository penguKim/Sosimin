package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

@Mapper
public interface ProductMapper {
	
	
	// 미로그인 상품 목록 조회
	List<Map<String, Object>> selectProductList(Map<String, Object> map);
	
	// 상품 목록 카운트
	int productListCount(Map<String, Object> map);
	
	// =============================================================================
	// 상품 등록 
	int productInsert(Map<String, String> map);

	// 상품 게시글 등록

	int insertProduct(ProductVO product);
	
	// 상품 조회<Map>
	Map<String, String> selectProduct(MemberVO member);

	// 상품 조회<List>
	List<Map<String, Object>> selectProduct2(MemberVO member);
	
	int productBoardInsert();

	int productBoardInsert(Map<String, String> map);


	
	

}
