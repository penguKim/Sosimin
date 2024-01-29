package com.itwillbs.c5d2308t1_2.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

@Mapper
public interface ProductMapper {
	
	// 상품 등록 
	int productInsert(Map<String, String> map);

	// 상품 게시글 등록
	int productBoardInsert(Map<String, String> map);

	int insertProduct(ProductVO product);
	
	
	Map<String, String> selectProduct(MemberVO member);


}
