package com.itwillbs.c5d2308t1_2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

@Mapper
public interface ProductMapper {
	
	
	// 상품 목록 조회
	List<Map<String, Object>> selectProductList(Map<String, Object> map);
	
	// 상품 목록 카운트
	int productListCount(Map<String, Object> map);
	
	// 관심 상품 목록 조회
	List<Map<String, Object>> selectLikeList(Map<String, String> map);
	
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

	int selectProductId();

	// 연관 상품 조회
	List<Map<String, Object>> selectRelatedProducts(Map<String, String> product);

	Map<String, String> selectProduct();
	// 관심 갯수 판별
	Map<String, String> selectInterest(Map<String, String> interest);
	// 관심 삭제
	void deleteInterest(Map<String, String> interest);
	// 관심 등록
	void insertInterest(Map<String, String> interest);

	int selectInterestCount(ProductVO product);

	Map<String, String> selectMemberInterset(Map<String, String> interest);

	Map<String, String> selectSellerInfo(Map<String, String> map);

	Map<String, String> selectProductModify(Map<String, String> map);
	// 상품 수정
	int updateProduct(Map<String, String> map);
	
	// 판매자판매 상품 조회
	List<Map<String, String>> selectSellerProductInfo(Map<String, String> sellerInfo);

	// 판매자판매 상품 카운트
	int selectSellerProductCount(String member_id);


//	 판매글 조회수 카운트
	Map<String, Object> selectProductCount(Map<String, String> map);

	void updateReadcount(Map<String, String> map);

	Map<String, String> getProductImage(Map<String, String> map);

	int removeProductBoard(Map<String, String> map);

	int removeProduct(Map<String, String> map);
	
	
	// 관리자 페이지 상품목록
	List<Map<String, Object>> adminProductList();

	Map<String, String> getGuDong(Map<String, String> map);

	int selectPayStatus(Map<String, String> productModify);

	Map<String, Integer> getProductMemberLevel(Map<String, String> sellerInfo);

	Map<String, String> selectProductPayStatus(Map<String, String> product);
	
	// 판매자 중 페이 가입자 조회 요청
	List<Map<String, Object>> selectPayUser();

	int selectReviewCount(Map<String, String> sellerInfo);
	
	 
	
	
}
