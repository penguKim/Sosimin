package com.itwillbs.c5d2308t1_2.controller;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.c5d2308t1_2.service.MemberService;
import com.itwillbs.c5d2308t1_2.service.PaymentService;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private PaymentService paymentService;
	
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
	
	// 회원가입 폼 입력 시 아이디, 닉네임, 이메일, 휴대폰번호 중복검사 실행
	@ResponseBody
	@GetMapping("checkDupMemberInfo")
	public String checkDupMemberInfo(MemberVO member) {
		System.out.println("ajax로 넘긴 파라미터 확인 : " + member); // member_id 잘 넘어옴
		MemberVO dbMember = service.getDupMemberInfo(member);
//		
		if(dbMember == null) { // 중복된 회원정보 없음 = 사용가능
			return "false";
		} else { // 중복
			return "true";
		}
	}
	
	// 휴대폰번호 인증코드 발급 요청 AJAX
	@ResponseBody
	@GetMapping("requestPhoneAuthCode")
	public String requestPhoneAuthCode(String member_phone) {
		System.out.println("raw param from ajax call : " + member_phone); // 잘넘어옴
		member_phone = member_phone.replace("-", "");
		System.out.println("하이픈이 사라졌나요? : " + member_phone);
		
		Random rand = new Random();
		String numStr = "";
		for(int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		System.out.println("수신자 번호 : " + member_phone);
		System.out.println("인증코드 : " + numStr);
		
		service.certifyPhoneNumber(member_phone, numStr);
		
		return numStr;
	}
	
	// 회원가입 폼의 정보를 DB에 저장 후 가입 완료/축하 페이지로 이동
	@PostMapping("MemberJoinPro")
	public String MemberJoinPro(MemberVO member, Model model) {
		System.out.println("vo 파라미터 확인 : " + member); // 잘넘어옴

		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePassword = passwordEncoder.encode(member.getMember_password());
		
		System.out.println("암호화된 패스워드 : " + securePassword);
		
		// 암호화된 비밀번호 MemberVO 객체에 저장
		member.setMember_password(securePassword);
		
		// JoinService - registMember() 메서드 호출하여 회원정보 등록 요청
		// => 파라미터 : MemberVO 객체   리턴타입 : int(insertCount)
		int insertCount = service.registMember(member);
		
		if(insertCount == 0) {
			model.addAttribute("msg", "회원정보 등록 실패!");
			return "fail_back";
		}
		
		return "member/joinComplete";
	}
	
	
	
	
	
	
	
	
	// ************ 로그인 ********************

	// 로그인 메인페이지로 이동
	@GetMapping("MemberLogin")
	public String MemberLogin(HttpServletRequest request, HttpSession session, Model model) {
		// 세션 아이디가 이미 존재할 경우 이전페이지로 튕겨내기
		String sId = (String)session.getAttribute("sId");
		if(sId != null) {
			model.addAttribute("msg", "이미 로그인된 상태입니다!");
			return "fail_back";
		}
		
		// "REFERER" 헤더(현재 요청을 보내는 페이지의 URL) 변수에 저장
		String prevPage  = request.getHeader("REFERER");
		System.out.println("이전페이지 확인 : " + prevPage);
		
		// 이전 페이지가 null이 아닐 경우 서블릿 주소만 잘라내서 세션에 저장한다.
		if(prevPage != null) {
			prevPage = prevPage.substring(prevPage.lastIndexOf("/") + 1);
			System.out.println("델리미터로 구분한 페이지 확인 : " + prevPage);
			session.setAttribute("prevPage", prevPage);			
		}
		
		
		return "member/login";
	}

	// 로그인 작업
	@PostMapping("MemberLoginPro")
	public String MemberLoginPro(MemberVO member, String rememberId, HttpServletResponse response, HttpSession session, Model model) {
		// 세션에 저장된 로그인 화면 이전 페이지를 변수에 저장
		String prevPage = (String)session.getAttribute("prevPage");
		System.out.println("이전 페이지 확인 : " + prevPage);
		
		MemberVO dbMember = service.getMember(member);
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

//	    System.out.println("dbMember 확인 : " + dbMember); // DB에 아이디 일치하는 회원 존재시 VO 출력, 없을 시 null
	    
	    // 입력한 아이디와 일치하는 회원정보가 없는 경우
		if(dbMember == null || !member.getMember_id().equals(dbMember.getMember_id())) {
			System.out.println("dbMember 확인 : " + dbMember);
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			return "fail_back";
		}
	    
		// 회원 상태가 2인 경우(탈퇴 회원)
	   if(dbMember.getMember_status() == 2) {
		   model.addAttribute("msg", "이미 탈퇴한 회원입니다");
		   return "fail_back";
	   }
	   
	   // 일치하는 회원정보가 없거나 패스워드가 일치하지 않는 경우
	   if(dbMember == null || !passwordEncoder.matches(member.getMember_password(), dbMember.getMember_password())) {
		   model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지않습니다");
		   return "fail_back";   
	   } else { // 그 외 = 로그인 성공
		   // 쿠키에 아이디 저장
		   Cookie cookie = new Cookie("cookieId", dbMember.getMember_id());
		   if(rememberId == null) { // 아이디 기억하기 체크 X
			   cookie.setMaxAge(0);
		   } else { // 체크 O
			   cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 기간 1일로 설정
		   }
		   
		   response.addCookie(cookie);
		   model.addAttribute("dbMember", dbMember);
		   session.setAttribute("sId", member.getMember_id());
//		   System.out.println("로그인 성공했나요? : " + dbMember);
		   
		   // -------------------- 페이 인증을 위해 추가 ----------------------------
		   // BankService - getBankUserInfo() 메서드 호출하여 엑세스 토큰 조회 요청
		   // => 파라미터 : 아이디   리턴타입 : Map<String, String>
		   Map<String, Object> token = paymentService.getTokenInfo(member.getMember_id());
		   
		   // 조회된 엑세스 토큰을 "access_token", 사용자번호를 "user_seq_no" 로 세션에 추가
		   // => 단, Map 객체(token) 이 null 이 아닐 경우에만 수행
		   if(token != null) {
			   session.setAttribute("access_token", token.get("access_token"));
			   session.setAttribute("user_seq_no", token.get("user_seq_no"));
		   }
		   // -----------------------------------------------------------------------
		   
		   
		   // 이전 페이지 주소 판별 후 메인페이지로 리다이렉트
		   if(prevPage == null || prevPage.equals("") || prevPage.equals("MemberFindId") || prevPage.equals("MemberJoinPro")) {
			   return "redirect:/";
		   } else {
			   // 메인 페이지로 이동할 필요가 없는 이전페이지인 경우 즉시 리다이렉트
			   return "redirect:/" + prevPage;
		   }
		   
	   }
	    
	}

	// 로그인 아이디 찾기 페이지로 이동
	@GetMapping("MemberFindId")
	public String MemberFindId() {
		return "member/findId";
	}

	// 로그인 아이디 찾기 작업
	@ResponseBody
	@PostMapping("MemberFindIdPro")
	public MemberVO MemberFindIdPro(MemberVO member, Model model) {
//	public String MemberFindIdPro(MemberVO member, Model model) {
//		System.out.println("넘어온 폼 파라미터 확인 : " + member); // 잘 넘어옴
//		System.out.println("현재 가지고있는 아이디는? : " + member.getMember_id()); // null
		MemberVO dbMember = service.findMember(member);
		return dbMember;
//		return "";
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
	
	// 로그아웃
	@GetMapping("MemberLogout")
	public String MemberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
	
	// ********* 관리자페이지 회원관리 *************
	// 관리자페이지 회원관리
	@GetMapping("MemberList")
	public String MemberList() {
		return "admin/memberList";
	}
	
}
