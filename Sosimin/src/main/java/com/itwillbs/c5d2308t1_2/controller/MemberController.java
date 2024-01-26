package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
	// ********* 관리자페이지 회원관리 *************
	// 관리자페이지 회원관리
	@GetMapping("MemberList")
	public String MemberList() {
		return "admin/memberList";
	}
	
	// ****************** 회원가입 ****************
	
	// 회원가입 메인페이지로 이동
	@GetMapping("MemberJoin")
	public String MemberJoin() {
		return "member/join";
	}

	// 회원가입 정보입력(가입폼) 페이지로 이동
	@GetMapping("MemberJoinForm")
	public String MemberJoinForm() {
		return "member/joinForm";
	}
	
	// 회원가입 작업 처리 후 회원가입 완료/축하 페이지로 이동
	@PostMapping("MemberJoinComplete")
	public String MemberJoinComplete() {
		return "member/joinComplete";
	}

	// ************ 로그인 ********************

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
	
	// *********** 마이페이지 **************
	// 뷰 제작 작업의 편의성을 위해 마이페이지는 임시로 서블릿 나눠서 매핑
	// 마이페이지 상품 관련 탭(판매내역, 구매내역, 관심목록)
	@GetMapping("MyPage")
	public String MyPage() {
		return "member/myPage";
	}

	// 마이페이지 커뮤니티 관련 탭(커뮤니티 작성글, 커뮤니티 작성 댓글)
	@GetMapping("MyPage2")
	public String MyPage2() {
		return "member/myPage2";
	}

	// *********** 판매자 페이지 **************
	// 뷰 제작 작업의 편의성을 위해 판매자 페이지는 임시로 서블릿 나눠서 매핑
	// 판매자 페이지 상품 관련 탭(판매내역, 구매내역, 관심목록)
	@GetMapping("SellerInfo")
	public String SellerInfo() {
		return "member/sellerInfo";
	}
	
	// 판매자 페이지 커뮤니티 관련 탭(커뮤니티 작성글, 커뮤니티 작성 댓글)
	@GetMapping("SellerInfo2")
	public String SellerInfo2() {
		return "member/sellerInfo2";
	}
	
	
}
