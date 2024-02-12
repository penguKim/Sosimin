package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.AdminMapper;
import com.itwillbs.c5d2308t1_2.mapper.SosimhamMapper;

@Service
public class SosimhamService {
	@Autowired
	SosimhamMapper SosimMapper;
	
	@Autowired
	AdminMapper adminMapper;
	
	// 구랑 동 정보 가져오
	public List<Map<String, Object>> getLocationLocker() {
		return SosimMapper.selectLocation();
	}
	
	// 구정보만 가져오기
	public List<String> getGu() {
		return SosimMapper.selectGu();
	}
	
	// 연관검색어 조회
	public List<String> getRelationKeyWord(String searchKeyWord) {
		return SosimMapper.selectRelationKeyWord(searchKeyWord);
	}
	
	// 마이페이지 판매내역 조회
	public String getMemberid(String q) {
		return SosimMapper.selectMemberId(q);
	}
	
	// 인기검색어 TOP10 조회
	public List<Map<String, String>> getSearchList() {
		return SosimMapper.selectSearchList();
	}
	
	// 메인페이지 인기상품 TOP8 조회
	public List<Map<String, Object>> getPopularList() {
		return SosimMapper.selectPopularList();
	}
	
	// 검색내용 디비에 저장
	public int saveKeyword(String keyword) {
		// 검색한 내용의 존재여부 판별
		int search_count = SosimMapper.selectWord(keyword);
		
		if(search_count>0) {
			int updateCount = SosimMapper.updateSearchCount(keyword);
		}else{
			int insertCount = SosimMapper.insertKeyword(keyword);
		}
		
		return 0;
	}

	// 인기검색어 삭제(delete_status 컬럼 1로 변경)
	public int updateKeyword(String content) {
		return SosimMapper.updateContent(content);
	}
	

}

























