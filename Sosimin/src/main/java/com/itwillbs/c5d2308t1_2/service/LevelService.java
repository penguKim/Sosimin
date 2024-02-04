package com.itwillbs.c5d2308t1_2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c5d2308t1_2.mapper.LevelMapper;
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.ReviewVO;

@Service
public class LevelService {
	
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
		        System.out.println("레벨을 올릴거에요");
		        map.put("member_level", level + 1);
		        map.put("member_exp", currentExp - map.get("level_max_exp"));
		    } else { // 최대 레벨인 경우
		        System.out.println("경험치를 최대로 유지할거에요");
		        map.put("member_exp", map.get("level_max_exp"));
		    }
		} else { // 경험치만 증가
			System.out.println("경험치만 올릴거에요");
			map.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(map);
		
	}
	
	// 회원 리뷰 등록
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
			System.out.println("경험치를 올릴거에요");
			currentExp += exp;
			System.out.println("계산된 경험치는 : " + currentExp);
		} else if(re.getReview_status().equals("bad")) { // 별로예요
			System.out.println("경험치를 내릴거에요");
			currentExp -= exp;
			System.out.println("계산된 경험치는 : " + currentExp);
		}
		
		if(currentExp >= (int)map.get("level_max_exp")) { // 경험치 초과 시 레벨 업
		    if(level < maxLevel) { // 최대 레벨 미만인 경우
		        System.out.println("레벨을 올릴거에요");
		        map.put("member_level", level + 1);
		        map.put("member_exp", currentExp - (int)map.get("level_max_exp"));
		    } else { // 최대 레벨인 경우
		        System.out.println("경험치를 최대로 유지할거에요");
		        map.put("member_exp", (int)map.get("level_max_exp"));
		    }
		} else if(currentExp <= (int)map.get("level_min_exp")) { // 레벨 다운
		    if(level > 1) { // 레벨이 2이상인 경우
		        System.out.println("레벨을 내릴거에요");
		        map.put("member_level", level - 1);
		        map.put("member_exp", (int)prevLevel.get("level_max_exp") + currentExp);
		    } else { // 레벨이 1인 경우
		        System.out.println("경험치를 0으로 만들거에요");
		        map.put("member_exp", 0);
		    }
		} else { // 경험치만 증가
			System.out.println("경험치만 올릴거에요");
			map.put("member_exp", currentExp);
		}
		
		// 회원 레벨 업데이트
		mapper.updateMemberLevel(map);
		
		return mapper.insertReview(re);
	}



}
