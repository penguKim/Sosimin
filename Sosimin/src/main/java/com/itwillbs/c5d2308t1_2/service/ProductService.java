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
	
	// 판매자 정보 조회
	public Map<String, String> selectSellerInfo(Map<String, String> map) {
		
		return mapper.selectSellerInfo(map);
	}
	
	// 상품 수정을 위한 조회
	public Map<String, String> selectProductModify(Map<String, String> map) {
		
		return mapper.selectProductModify(map);
	}
	// 상품 업데이트
	public int updateProduct(Map<String, String> map) {
		
		return mapper.updateProduct(map);
	}

	public List<Map<String, String>> selectSellerProductInfo(Map<String, String> sellerInfo) {
		
		return mapper.selectSellerProductInfo(sellerInfo);
	}

	public int selectSellerProductCount(String member_id) {
		
		return mapper.selectSellerProductCount(member_id);
	}


	public Map<String, Object> getCount(Map<String, String> map, boolean isReadcount) {
		// 상품 글 조회
		Map<String,Object> map2 = new HashMap<String, Object>();
		map2 = mapper.selectProductCount(map);
		
		System.out.println("상품 글 조회 : " + map2);
		
		if(map2 != null && isReadcount) {
			mapper.updateReadcount(map);
			map2.put("product_readcount", (int)map2.get("product_readcount") + 1);
		}
		return map2;
	}

	public Map<String, String> getProductimage(Map<String, String> map) {
		
		return mapper.getProductImage(map);
	}
	@Transactional
	public boolean removeProduct(Map<String, String> map) {
		
//		int result = mapper.removeProduct(map); 
		 try {
		        // 먼저 Product_board를 삭제한다.
		        int result = mapper.removeProductBoard(map); 
		        if (result <= 0) {
		            // 삭제 실패 시 롤백
		            return false;
		        }
		        // 그 다음 Product를 삭제한다.
		        int result2 = mapper.removeProduct(map);
		        if (result2 <= 0) {
		            // 삭제 실패 시 롤백
		            return false;
		        }
		    } catch (Exception e) {
		        // 예외 발생 시 롤백
		        return false;
		    }

		    // 모든 삭제 작업이 성공적으로 완료됨
		    return true;
		
	}
	
}
