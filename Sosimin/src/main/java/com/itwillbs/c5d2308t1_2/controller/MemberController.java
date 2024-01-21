package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
	// 관리자페이지 회원관리(충돌예방을 위해 임시로 MemberController에 매핑)
	@GetMapping("MemberList")
	public String MemberList() {
		return "admin/memberList";
	}

	// 회원가입 메인페이지로 이동
	@GetMapping("MemberJoin")
	public String MemberJoin() {
		return "member/join";
	}

	// 회원가입 약관동의 페이지로 이동
	@GetMapping("MemberJoinAgree")
	public String MemberJoinAgree() {
		return "member/joinAgree";
	}

	// 회원가입 정보입력(가입폼) 페이지로 이동
	@PostMapping("MemberJoinForm")
	public String MemberJoinForm() {
		return "member/joinForm";
	}
	
	// 회원가입 작업 처리 후 회원가입 완료/축하 페이지로 이동
	@PostMapping("MemberJoinComplete")
	public String MemberJoinComplete() {
		return "member/joinComplete";
	}
	

	// 로그인 메인페이지로 이동
	@GetMapping("MemberLogin")
	public String MemberLogin() {
		return "member/login";
	}

	// 로그인 작업
	@PostMapping("MemberLoginPro")
	public String MemberLoginPro() {
		return "";
	}

	// 로그인 아이디 찾기 페이지로 이동
	@GetMapping("MemberFindId")
	public String MemberFindId() {
		return "member/findId";
	}

	// 로그인 아이디 찾기 작업
	@PostMapping("MemberFindIdPro")
	public String MemberFindIdPro() {
		return "";
	}

	// 로그인 비밀번호 찾기 페이지로 이동
	@GetMapping("MemberFindPasswd")
	public String MemberFindPasswd() {
		return "member/findPasswd";
	}

	// 로그인 비밀번호 찾기 작업
	@PostMapping("MemberFindPasswdPro")
	public String MemberFindPasswdPro() {
		return "";
	}
	
	// 로그인 비밀번호 재설정 페이지로 이동
	@GetMapping("MemberResetPasswd")
	public String MemberResetPasswd() {
		return "member/resetPasswd";
	}
	
	// 로그인 비밀번호 재설정 작업
	@PostMapping("MemberResetPasswdPro")
	public String MemberResetPasswdPro() {
		return "";
	}
	
	
	// 마이페이지 예시
//	@GetMapping("Mypage")
//	public String Mypage() {
//		return "member/mypage";
//	}
	
}
