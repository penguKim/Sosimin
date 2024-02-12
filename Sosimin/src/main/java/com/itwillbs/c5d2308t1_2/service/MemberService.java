package com.itwillbs.c5d2308t1_2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.MemberMapper;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.ProductLikeVO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

import edu.emory.mathcs.backport.java.util.Arrays;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	// 회원 정보 등록
	public int registMember(MemberVO member) {
		member.setTown_id(mapper.getlocation(member));
		return mapper.insertMember(member);
	}
	
	// 회원 정보 조회
	public MemberVO getMember(MemberVO member) {
		return mapper.selectMember(member);
	}
	
	// 회원 정보 조회해 중복 체크
	public MemberVO getDupMemberInfo(MemberVO member) {
		return mapper.selectDupMemberInfo(member);
	}

	// 아이디, 비밀번호 찾기
	public MemberVO findMember(MemberVO member) {
		MemberVO dbMember = null;
		if(member.getMember_id() == null) {
			dbMember = mapper.selectMemberForId(member); 
		} else if(member.getMember_id() != null && member.getMember_password() == null) {
			dbMember = mapper.selectMemberForPassword(member); 
		}
		
		return dbMember;
	}

	// 휴대폰번호 인증코드 발급 요청 AJAX
	public void certifyPhoneNumber(String member_phone, String numStr) {
		String api_key = "NCS7GFVD5SSVHBW2";
		String api_secret = "V1VSVESA5PGJ2QU5KWVUCV8HQ4MNGA1R";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", member_phone); // 수신자번호
		params.put("from", "01093982536"); // 발신자번호 -> 테스트이므로 내 번호
		params.put("type", "SMS");
		params.put("text", "소시민 휴대폰 인증코드 발송 : 인증 번호는 [ " + numStr +" ]입니다.");
		params.put("app_version", "test app 1.2");
		
			try {
				JSONObject obj = (JSONObject)coolsms.send(params);
				System.out.println("내용 확인 : " + obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
	}

	// 비밀번호 찾기 후 비밀번호 수정
	public int modifyMemberPassword(MemberVO member, String newPassword) {
		return mapper.updateMemberPassword(member, newPassword);
	}

	// ============================== 마이페이지 작업 =====================================
	// 마이페이지 목록 개수 조회
	public int getMyPageListCount(String category, String sId, String filter) {
		return mapper.selectMyPageListCount(category, sId, filter);
	}

	// 회원 정보 조회
	public Map<String, Object> getSingleMember(String member_id) {
		return mapper.selectSingleMember(member_id);
	}
	
	// 마이페이지 프로필 회원 정보 조회
	public MemberVO getMyProfileMember(String sId) {
		return mapper.selectMyProfileMember(sId);
	}
	
	// 상품판매횟수 조회 
	public int getCountProductSold(String sId) {
		return mapper.selectCountProductSold(sId);
	}
	
	// 커뮤니티 글 개수
	public int getCountCommunity(String sId) {
		return mapper.selectCountCommunity(sId);
	}

	// 커뮤니티 댓글 개수
	public int getCountCommunityReply(String sId) {
		return mapper.selectCountCommunityReply(sId);
	}
	
	// 커뮤니티 좋아요 개수
	public int getCountCommunityLike(String sId) {
		return mapper.selectCountCommunityLike(sId);
	}

	// 마이페이지 목록 조회
	public List<HashMap<String, Object>> getMyPageList(String sId, String category, PageDTO page, String filter) {
		return mapper.selectMyPageList(sId, category, page, filter);
	}


	// 마이페이지 모달 내 정보수정
	public int modifyMyInfo(MemberVO member) {
		member.setTown_id(mapper.getlocation(member));
		return mapper.updateMyInfo(member);
	}

	// 관리자페이지 회원 정보 목록 조회
	public List<Map<String, Object>> getAllMemberList(MemberVO member) {
		return mapper.selectAllMemberList(member);
	}

	// 받은 후기 카운트
	public List<Map<String, Object>> getReviewCount(String sId) {
		return mapper.selectReviewCount(sId);
	}
	
	// 후기 별로예요 불러오기
	public Map<String, String> getBadReviews(String sId) {
		return mapper.selectBadReviews(sId);
	}
	
	// 후기 최고예요 불러오기
	public Map<String, String> getGoodReviews(String sId) {
		return mapper.selectGoodReviews(sId);
	}

	// 관심 가져오기
	public List<Map<String, Object>> getMemberInterest(String sId) {
		return mapper.selectMemberInterest(sId);
	}

	// 상품 찜 등록, 삭제
	public String getLike(String sId, int product_id) {
		ProductLikeVO dbLike = mapper.selectLike(sId, product_id);
		if(dbLike != null) {
			mapper.deleteLike(sId, product_id);
			return "true";
		} else {
			mapper.insertLike(sId, product_id);
			return "false";
		}
	}

	// 회원 상태 조회
	public MemberVO getMemberStatus(String member_id) {
		return mapper.selectMemberStatus(member_id);
	}

	// 소심페이 가입한 회원 목록 조회
	public List<MemberVO> getPayUsers() {
		return mapper.selectPayUsers();
	}



	














}
