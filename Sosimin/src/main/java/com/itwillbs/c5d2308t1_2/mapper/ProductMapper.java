package com.itwillbs.c5d2308t1_2.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
	// 상품 등록 
	int productInsert(Map<String, String> map);

	// 상품 게시글 등록
	int productBoardInsert(Map<String, String> map);

}
