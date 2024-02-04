package com.itwillbs.c5d2308t1_2.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

@Mapper
public interface ChatMapper {

	Map<String, String> getProduct(Map<String, String> map); //두개이상 받기위해서는 @param("map") Map<String,String> map, @param("member") Map<String,String> member

	Map<String, String> getSellMember(Map<String, String> map);


}
