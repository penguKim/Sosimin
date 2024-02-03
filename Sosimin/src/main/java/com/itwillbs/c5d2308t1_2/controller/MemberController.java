package com.itwillbs.c5d2308t1_2.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
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
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.PageInfo;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

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
		
		// 동네인증을 위해 문자열 가공
		System.out.println("주소 파라미터 확인 : " + member.getMember_address());
		// 파라미터 확인 : MemberVO(member_id=eri666, member_name=육은령, member_email=eri666@gmail.com, member_birth=2010-02-02, member_nickname=육육육, member_phone=010-6666-6666, member_status=0, member_password=$2a$10$5n8aqx9o3F4FCHzXXqpK0.NXj/JoA0c20wesoY6qV8SpqHJkZQokq, member_profile=null, member_address=부산광역시 부산진구 부전동, member_withdraw_time=null, phone_auth=0, neighbor_auth=0, neighbor_time=null, pay_auth=0, member_level=0, member_exp=0, dong=null, report_real_count=0, product_id=null)
		String str = member.getMember_address();
		String[] strArr = str.split("\\s");
		String result = strArr[1] + " " + strArr[2];
		System.out.println("문자열 결합 확인 : " + result);
		member.setMember_address(result);
		System.out.println(member.getMember_address());
		
		// JoinService - registMember() 메서드 호출하여 회원정보 등록 요청
		// => 파라미터 : MemberVO 객체   리턴타입 : int(insertCount)
		int insertCount = service.registMember(member);
		
		if(insertCount == 0) {
			model.addAttribute("msg", "회원정보 등록 실패!");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "error");
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
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "error");
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
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "error");
			return "fail_back";
		}
	    
		// 회원 상태가 2인 경우(탈퇴 회원)
	   if(dbMember.getMember_status() == 2) {
		   model.addAttribute("msg", "이미 탈퇴한 회원입니다");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "error");
			return "fail_back";
	   }
	   
	   // 일치하는 회원정보가 없거나 패스워드가 일치하지 않는 경우
	   if(dbMember == null || !passwordEncoder.matches(member.getMember_password(), dbMember.getMember_password())) {
		   model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지않습니다");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "error");
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
		   // -------------------- 동네 재인증을 위해 추가 ----------------------------
		   if(member.getMember_neighbor_auth() == 0) {
			   model.addAttribute("msg", "위치 재인증 필요!");
			   model.addAttribute("msg2", "내 정보 수정에서 동네 인증을 다시 해주세요!");
			   model.addAttribute("msg3", "error");
			   model.addAttribute("targetURL", "MyPage");
			   return "forward";
		   }
		   
		   
		   // 이전 페이지 주소 판별 후 메인페이지로 리다이렉트
		   if(prevPage == null || prevPage.equals("") || prevPage.equals("MemberFindId") || prevPage.equals("MemberResetPasswd") || prevPage.equals("MemberJoinPro")) {
			   return "redirect:/";
		   } else {
			   // 메인 페이지로 이동할 필요가 없는 이전페이지인 경우 즉시 리다이렉트
			   return "redirect:/" + prevPage;
		   }
		   
	   }
	    
	}

	// 로그인 아이디 찾기 페이지로 이동
	@GetMapping("MemberFindId")
	public String MemberFindId(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null) { // 로그인한 경우
			model.addAttribute("msg", "이미 로그인된 계정입니다");
			model.addAttribute("msg2", "메인페이지로 이동합니다!");
			model.addAttribute("msg3", "warning");
			model.addAttribute("targetURL", "./");
			return "forward";
		}
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
	public String MemberFindPasswd(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null) { // 로그인한 경우
			model.addAttribute("msg", "이미 로그인된 계정입니다");
			model.addAttribute("msg2", "메인페이지로 이동합니다!");
			model.addAttribute("msg3", "warning");
			model.addAttribute("targetURL", "./");
			return "forward";
		}
		return "member/findPasswd";
	}

	// 로그인 비밀번호 찾기를 위한 회원정보 조회 ajax 요청
	@ResponseBody
	@GetMapping("MemberCheck")
	public boolean memberCheck(MemberVO member) {
		System.out.println("파라미터 확인 : " + member);
		MemberVO dbMember = service.findMember(member);
		if(dbMember == null || !dbMember.getMember_name().equals(member.getMember_name())) {
			return false;
		} else {
			return true;
		}
	}
	
	// 로그인 비밀번호 재설정 페이지로 이동
	@PostMapping("MemberResetPasswd")
	public String MemberResetPasswd(MemberVO member, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId != null) { // 로그인한 경우
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("msg2", "메인페이지로 이동합니다!");
			model.addAttribute("msg3", "warning");
			model.addAttribute("targetURL", "./");
			return "forward";
		}
		model.addAttribute("member", member);
		return "member/resetPasswd";
	}
	
	// 로그인 비밀번호 재설정 작업
	@ResponseBody
	@PostMapping("MemberResetPasswdPro")
	public boolean MemberResetPasswdPro(MemberVO member, String newPassword) {
		System.out.println("새 비밀번호 확인 : " + newPassword);
		
		// 새 비밀번호 암호화 처리
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if(newPassword != null && !newPassword.equals("")) {
			newPassword = passwordEncoder.encode(newPassword);
		}
		
		// 새 비밀번호로 회원 정보 업데이트
		int updateCount = service.modifyMemberPassword(member, newPassword);
		
		if(updateCount > 0) {
			return true;
		} else {
			return false;
		}
		
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
	public String MyPage(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "0") String category) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) { // 로그인 안 한 경우
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("msg2", "로그인 후 마이페이지로 이동합니다!");
			model.addAttribute("msg3", "warning");
			model.addAttribute("targetURL", "MemberLogin");
			return "forward";
		}
		System.out.println("카테고리 : " + category);
		System.out.println("세션 아이디 확인 : " + sId);
		
		// 페이지 번호와 글의 개수를 파라미터로 전달
		PageDTO page = new PageDTO(pageNum, 15);
		// 전체 게시글 갯수 조회
		int listCount = service.getMyPageListCount(category, sId);
		System.out.println(listCount);
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, listCount, 3);
		
		// 한 페이지에 불러올 게시글 목록 조회
		List<HashMap<String, Object>> MyPageList = service.getMyPageList(sId, category, page);
		System.out.println("컨트롤러에서 넘긴 마이페이지 리스트 확인 : " + MyPageList);
		
		
		// 시간 변환
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
        
        LocalDateTime datetime = null;
        for(HashMap<String, Object> map : MyPageList) {
//        	System.out.println(map.get("product_datetime").getClass().getName());
//        	System.out.println();
        	if(category.equals("1") || category.equals("3")) {
        		datetime = (LocalDateTime)map.get("product_datetime");
        	} else if(category.equals("2")) {
        		datetime = (LocalDateTime)map.get("order_date");
        	} else if(category.equals("4")) {
        		datetime = (LocalDateTime)map.get("community_datetime");
        	} else if(category.equals("5")) {
        		datetime = (LocalDateTime)map.get("reply_datetime");
        	}
//        	productMap.put("product_datetime", productDatetime.format(formatter));
//        	
//        	
//        	// 시분초 차이 계산
    		Duration duration = Duration.between(datetime, now);
//    		// 년월일 차이 계산
    		Period period = Period.between(datetime.toLocalDate(), now.toLocalDate());
    		
            long minutes = duration.toMinutes() % 60;
            long hours = duration.toHours() % 24;
            long days = duration.toDays() % 7;
            long weeks = duration.toDays() / 7;
            long months = period.getMonths();
            long years = period.getYears();
            
            String timeAgo = "";
            if(years > 0) {
            	timeAgo = years + "년 전";
            } else if(months > 0) {
            	timeAgo = months + "개월 전";
            } else if(weeks > 0 && weeks <= 4) {
            	timeAgo = weeks + "주전";
    		} else if (days > 0 && days < 7) { // 1 ~ 7 차이날 때
                timeAgo = days + "일전";
            } else if (hours > 0 && hours < 24) { // 1 ~ 23시간이 차이날 때
                timeAgo = hours + "시간 전";
            } else if (minutes > 0) { // 1 ~ 59분이 차이날 때
                timeAgo = minutes + "분 전";
            } else {
                timeAgo = "방금 전";
            }
        	
            map.put("product_datetime", timeAgo);
            map.put("order_date", timeAgo);
            map.put("community_datetime", timeAgo);
            map.put("reply_datetime", timeAgo);
        	
    	}
		
        model.addAttribute("MyPageList", MyPageList);
		
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
