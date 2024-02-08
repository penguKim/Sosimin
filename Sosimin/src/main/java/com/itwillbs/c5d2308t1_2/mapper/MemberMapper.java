package com.itwillbs.c5d2308t1_2.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.ProductLikeVO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

@Mapper
public interface MemberMapper {
	// ============================ 회원가입 & 로그인 작업 ====================================
	// town_id
	int getlocation(MemberVO member);
	
	// 회원정보 등록
	int insertMember(MemberVO member);

	// 회원 정보 조회
	MemberVO selectMember(MemberVO member);
	
	// 회원 정보 조회해 중복 체크
	MemberVO selectDupMemberInfo(MemberVO member);

	// 아이디 찾기
	MemberVO selectMemberForId(MemberVO member);

	// 비밀번호 찾기
	MemberVO selectMemberForPassword(MemberVO member);

	// 비밀번호 찾기 후 비밀번호 수정
	int updateMemberPassword(@Param("member") MemberVO member, @Param("newPassword")String newPassword);

	// 위치 재인증
	List<MemberVO> selectMemberAuthRequired();

	// 동네 인증 상태 초기화
	void updateMemberNeighborAuth(String member_id);
	
	// 탈퇴 회원 조회
	List<MemberVO> selectWithdrawMember();

	// 탈퇴 회원 정보 삭제
	void deleteMemberInfo(String member_id);
	
	// =========================== 마이페이지 작업 =============================
	// 마이페이지 목록 개수 조회
	int selectMyPageListCount(@Param("category")String category, @Param("sId") String sId, @Param("filter") String filter);

	// 마이페이지 프로필 회원 정보 조회
	MemberVO selectMyProfileMember(String sId);

	// 상품판매횟수 조회 
	int selectCountProductSold(String sId);
	
	// 커뮤니티 글 개수 조회
	int selectCountCommunity(String sId);
	
	// 커뮤니티 댓글 개수 조회
	int selectCountCommunityReply(String sId);
	
	// 커뮤니티 좋아요 개수 조회
	int selectCountCommunityLike(String sId);

	// 마이페이지 목록 조회
	List<HashMap<String, Object>> selectMyPageList(@Param("sId")String sId, @Param("category")String category, @Param("page") PageDTO page, @Param("filter") String filter);

	// 마이페이지 모달 내 정보수정
	int updateMyInfo(MemberVO member);

	// 관리자페이지 회원 정보 목록 조회
	List<Map<String, Object>> selectAllMemberList(MemberVO member);

	// 관리자페이지 회원 정보 수정을 위한 회원조회
	Map<String, Object> selectSingleMember(String member_id);

	// 받은 후기 카운트
	List<Map<String, Object>> selectReviewCount(String sId);

	// 관심 가져오기
	List<Map<String, Object>> selectMemberInterest(String sId);

	// 상품 찜 등록, 삭제를 위한 조회
	ProductLikeVO selectLike(@Param("sId")String sId, @Param("product_id")int product_id);

	// 상품 찜 삭제
	void deleteLike(@Param("sId")String sId, @Param("product_id")int product_id);

	// 상품 찜 등록
	void insertLike(@Param("sId")String sId, @Param("product_id")int product_id);













}
