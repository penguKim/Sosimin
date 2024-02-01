package com.itwillbs.c5d2308t1_2.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c5d2308t1_2.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
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

}
