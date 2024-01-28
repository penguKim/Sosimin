package com.itwillbs.c5d2308t1_2.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.MemberMapper;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;

	// 회원 정보 등록
	public int registMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	// 회원 정보 조회
	public MemberVO getMember(MemberVO member) {
		return mapper.selectMember(member);
	}
}
