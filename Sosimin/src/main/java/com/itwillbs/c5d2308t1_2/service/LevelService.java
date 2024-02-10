package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c5d2308t1_2.controller.CommunityController;
import com.itwillbs.c5d2308t1_2.mapper.LevelMapper;
import com.itwillbs.c5d2308t1_2.vo.CommunityReplyVO;
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.ReviewVO;

@Service
public class LevelService {
	// 로그 출력을 위한 변수 선언
	private static final Logger log = LoggerFactory.getLogger(LevelService.class);
	
	@Autowired
	LevelMapper mapper;
	
	// 회원 게시글 등록
	public void updateComExp(CommunityVO com) {
		Map<String, Integer> map = mapper.selectMemberLevel(com.getCommunity_writer());
		
		// 현재레벨
		int level = map.get("member_level");
		// 현재경험치
		int currentExp = map.get("member_exp");
		// 계산경험치
		int exp = 5;
		// 최대 레벨
		int maxLevel = mapper.selectMaxLevel();
		
		currentExp += exp;
		
		if(currentExp >= map.get("level_max_exp")) { // 경험치 초과 시 레벨 업
		    if(level < maxLevel) { // 최대 레벨 미만인 경우
		    	log.info("레벨을 올릴거에요");
		        map.put("member_level", level + 1);
		        map.put("member_exp", currentExp - map.get("level_max_exp"));
		    } else { // 최대 레벨인 경우
		    	log.info("경험치를 최대로 유지할거에요");
		        map.put("member_exp", map.get("level_max_exp"));
		    }
		} else { // 경험치만 증가
			log.info("경험치만 올릴거에요");
			map.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(map);
		
	}

	// 회원 댓글 등록
	public void updateComReExp(CommunityReplyVO reply, boolean isDeleted) {
		// 회원 정보 조회
		Map<String, Integer> map = mapper.selectMemberLevel(reply.getReply_writer());
		// 이전 레벨정보 가져오기
		Map<String, Integer> prevLevel = mapper.selectLevel((int)map.get("member_level") - 1);
		// 현재레벨
		int level = map.get("member_level");
		// 현재경험치
		int currentExp = map.get("member_exp");
		// 계산경험치
		int exp = 0;
		if(isDeleted) {
			exp = 3;
		} else {
			exp = -3;
		}
		// 최대 레벨
		int maxLevel = mapper.selectMaxLevel();
		
		currentExp += exp;
		
		if(currentExp >= (int)map.get("level_max_exp")) { // 경험치 초과 시 레벨 업
		    if(level < maxLevel) { // 최대 레벨 미만인 경우
		    	log.info("레벨을 올릴거에요");
		        map.put("member_level", level + 1);
		        map.put("member_exp", currentExp - (int)map.get("level_max_exp"));
		    } else { // 최대 레벨인 경우
		        System.out.println("경험치를 최대로 유지할거에요");
		        map.put("member_exp", (int)map.get("level_max_exp"));
		    }
		} else if(currentExp <= (int)map.get("level_min_exp")) { // 레벨 다운
		    if(level > 1) { // 레벨이 2이상인 경우
		    	log.info("레벨을 내릴거에요");
		        map.put("member_level", level - 1);
		        map.put("member_exp", (int)prevLevel.get("level_max_exp") + currentExp);
		    } else { // 레벨이 1인 경우
		    	log.info("경험치를 0으로 만들거에요");
		        map.put("member_exp", 0);
		    }
		} else { // 경험치만 증가
			log.info("경험치만 올릴거에요");
			map.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(map);
	}
	
	// 회원 리뷰 등록 - 상대방만 경험치 획득
	@Transactional
	public int registReview(ReviewVO re) {

		// 상대방 아이디 가져오기
		String idList = mapper.selectTargetId(re);
		// 나와 상대방 아이디를 배열로 자르기
		String[] ids = idList.split(",");
		
		// 상대방 아이디 저장
		for(String id : ids) {
			if(!re.getMember_id().equals(id)) {
				re.setTarget_member_id(id);
			}
		}
		
		
		// 상대방 정보 조회
		Map<String, Integer> map = mapper.selectMemberLevel(re.getTarget_member_id());
		// 이전 레벨정보 가져오기
		Map<String, Integer> prevLevel = mapper.selectLevel((int)map.get("member_level") - 1);
		
		// 현재레벨
		int level = (int)map.get("member_level");
		// 현재경험치
		int currentExp = (int)map.get("member_exp");
		// 계산경험치
		int exp = 0;
		// 최대 레벨
		int maxLevel = mapper.selectMaxLevel();
		
		// 경험치 누적
		if(re.getReview_check1() != null && re.getReview_check1().equals("on")) exp += 5;
		if(re.getReview_check2() != null && re.getReview_check2().equals("on")) exp += 5;
		if(re.getReview_check3() != null && re.getReview_check3().equals("on")) exp += 5;
		if(re.getReview_check4() != null && re.getReview_check4().equals("on")) exp += 5;
		
		if(re.getReview_status().equals("good")) { // 최고예요
			log.info("경험치를 올릴거에요");
			currentExp += exp;
			System.out.println("계산된 경험치는 : " + currentExp);
		} else if(re.getReview_status().equals("bad")) { // 별로예요
			log.info("경험치를 내릴거에요");
			currentExp -= exp;
			log.info("계산된 경험치는 : " + currentExp);
		}
		
		if(currentExp >= (int)map.get("level_max_exp")) { // 경험치 초과 시 레벨 업
		    if(level < maxLevel) { // 최대 레벨 미만인 경우
		    	log.info("레벨을 올릴거에요");
		        map.put("member_level", level + 1);
		        map.put("member_exp", currentExp - (int)map.get("level_max_exp"));
		    } else { // 최대 레벨인 경우
		    	log.info("경험치를 최대로 유지할거에요");
		        map.put("member_exp", (int)map.get("level_max_exp"));
		    }
		} else if(currentExp <= (int)map.get("level_min_exp")) { // 레벨 다운
		    if(level > 1) { // 레벨이 2이상인 경우
		    	log.info("레벨을 내릴거에요");
		        map.put("member_level", level - 1);
		        map.put("member_exp", (int)prevLevel.get("level_max_exp") + currentExp);
		    } else { // 레벨이 1인 경우
		    	log.info("경험치를 0으로 만들거에요");
		        map.put("member_exp", 0);
		    }
		} else { // 경험치만 증가
			log.info("경험치만 올릴거에요");
			map.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(map);
		
		return mapper.insertReview(re);
	}

	// 회원의 리뷰정보 가져오기
	public ReviewVO getReview(ReviewVO re) {
		return mapper.selectReview(re);
	}


	// 회원의 리뷰 목록 ajax
	public List<ReviewVO> getReviewList(String sId) {
		return mapper.selectReviewList(sId);
	}
	
	// 회원의 리뷰 삭제
	@Transactional
	public int deleteReview(ReviewVO re) {
		
		// 회원 정보 조회
		Map<String, Integer> map = mapper.selectMemberLevel(re.getMember_id());
		// 이전 레벨정보 가져오기
		Map<String, Integer> prevLevel = mapper.selectLevel((int)map.get("member_level") - 1);
		// 현재레벨
		int level = map.get("member_level");
		// 현재경험치
		int currentExp = map.get("member_exp");
		// 계산경험치
		int exp = 10;
		
		currentExp -= exp;
		if(currentExp <= (int)map.get("level_min_exp")) { // 레벨 다운
		    if(level > 1) { // 레벨이 2이상인 경우
		    	log.info("레벨을 내릴거에요");
		        map.put("member_level", level - 1);
		        map.put("member_exp", (int)prevLevel.get("level_max_exp") + currentExp);
		    } else { // 레벨이 1인 경우
		    	log.info("경험치를 0으로 만들거에요");
		        map.put("member_exp", 0);
		    }
		} else { // 경험치만 감소
			log.info("경험치만 내릴거에요");
			map.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(map);
		
		return mapper.deleteReview(re);
	}
	
	// 회원 상품 등록
	// levelService.updateProExp(map); // 경험치 증가
	public void updateProExp(Map<String, String> map) {
//		System.out.println(map);
		
		Map<String, Integer> member = mapper.selectMemberLevel(map.get("sId"));
		System.out.println("회원 레벨 정보 : " + member);
		
		// 현재레벨
		int level = member.get("member_level");
		// 현재경험치
		int currentExp = member.get("member_exp");
		// 계산경험치
		int exp = 20;
		// 최대 레벨
		int maxLevel = mapper.selectMaxLevel();
		
		currentExp += exp;
		
		if(currentExp >= member.get("level_max_exp")) { // 경험치 초과 시 레벨 업
		    if(level < maxLevel) { // 최대 레벨 미만인 경우
		    	log.info("레벨을 올릴거에요");
		        member.put("member_level", level + 1);
		        member.put("member_exp", currentExp - member.get("level_max_exp"));
		    } else { // 최대 레벨인 경우
		    	log.info("경험치를 최대로 유지할거에요");
		        map.put("member_exp", map.get("level_max_exp"));
		    }
		} else { // 경험치만 증가
			log.info("경험치만 올릴거에요");
			member.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(member);
		
	}

	// 회원 결제 - 구매자, 판매자 모두 경험치 획득
	// levelService.updatePaymentExp(map, 10);
	public void updatePaymentExp(Map<String, Object> map, int point) {
		System.out.println(map);
		// 구매자 : product_buyer
		// 판매자 : product_seller
		String[] memberList = {(String)map.get("product_buyer") , (String)map.get("product_seller")};
		
		for(String member : memberList) {
			Map<String, Integer> memberLevel = mapper.selectMemberLevel(member);
//			System.out.println("회원 레벨 정보 : " + memberLevel);
			
			// 현재레벨
			int level = memberLevel.get("member_level");
			// 현재경험치
			int currentExp = memberLevel.get("member_exp");
			// 계산경험치
			int exp = point;
			// 최대 레벨
			int maxLevel = mapper.selectMaxLevel();
			
			currentExp += exp;
			
			if(currentExp >= memberLevel.get("level_max_exp")) { // 경험치 초과 시 레벨 업
			    if(level < maxLevel) { // 최대 레벨 미만인 경우
			    	log.info("레벨을 올릴거에요");
			        memberLevel.put("member_level", level + 1);
			        memberLevel.put("member_exp", currentExp - memberLevel.get("level_max_exp"));
			    } else { // 최대 레벨인 경우
			    	log.info("경험치를 최대로 유지할거에요");
			        map.put("member_exp", map.get("level_max_exp"));
			    }
			} else { // 경험치만 증가
				log.info("경험치만 올릴거에요");
				memberLevel.put("member_exp", currentExp);
			}
			
			// 회원 레벨 업데이트
			mapper.updateMemberLevel(memberLevel);
		}
		
	}

	// 회원 신고 처리
	@Transactional
	public void updateReportExp(String reportee_id) {
		
		// 회원 정보 조회
		Map<String, Integer> map = mapper.selectMemberLevel(reportee_id);
		// 이전 레벨정보 가져오기
		Map<String, Integer> prevLevel = mapper.selectLevel((int)map.get("member_level") - 1);
		// 현재레벨
		int level = map.get("member_level");
		// 현재경험치
		int currentExp = map.get("member_exp");
		// 계산경험치
		int exp = 50;
		
		currentExp -= exp;
		if(currentExp <= (int)map.get("level_min_exp")) { // 레벨 다운
		    if(level > 1) { // 레벨이 2이상인 경우
		    	log.info("레벨을 내릴거에요");
		        map.put("member_level", level - 1);
		        map.put("member_exp", (int)prevLevel.get("level_max_exp") + currentExp);
		    } else { // 레벨이 1인 경우
		    	log.info("경험치를 0으로 만들거에요");
		        map.put("member_exp", 0);
		    }
		} else { // 경험치만 감소
			log.info("경험치만 내릴거에요");
			map.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(map);
		
	}

	// ============ 관리자 페이지 ==============
	// 리뷰 목록 가져오기
	public List<Map<String, String>> getAllReviewList() {
		return mapper.selectAllReviewList();
	}

	// 회원의 리뷰 조회
	public ReviewVO adminReviewView(ReviewVO re) {
		return mapper.selectAdminReviewView(re);
	}
	
	// 회원의 리뷰 삭제
	public int adminRemoveReview(ReviewVO re) {
		return mapper.deleteAdminReview(re);
	}






}
