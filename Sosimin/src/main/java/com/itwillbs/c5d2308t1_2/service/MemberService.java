package com.itwillbs.c5d2308t1_2.service;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.MemberMapper;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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

	// 회원 정보 조회해 중복 체크
	public MemberVO getDupMemberInfo(MemberVO member) {
		return mapper.selectDupMemberInfo(member);
	}

	// 아이디 찾기
	public MemberVO findMember(MemberVO member) {
		MemberVO dbMember = null;
		if(member.getMember_id() == null) {
			dbMember = mapper.selectMemberForId(member); 
		}
		
		return dbMember;
	}

	// 휴대폰번호 인증코드 발급 요청 AJAX
	public void certifyPhoneNumber(String member_phone, String numStr) {
		String api_key = "NCSBOXGTUKZKMHND";
		String api_secret = "1UMZ5TNK5BJSO02JTNIFR6VD2EMZLKFZ";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", member_phone); // 수신자번호
		params.put("from", "01024077916"); // 발신자번호 -> 테스트이므로 내 번호
		params.put("type", "SMS");
		params.put("text", "소시민 휴대폰 인증코드 발송 테스트 : 인증 번호는 [ " + numStr +" ]입니다.");
		params.put("app_version", "test app 1.2");
		
			try {
				JSONObject obj = (JSONObject)coolsms.send(params);
				System.out.println("내용 확인 : " + obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
	}
}
