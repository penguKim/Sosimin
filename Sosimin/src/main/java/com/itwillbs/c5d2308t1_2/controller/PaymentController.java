package com.itwillbs.c5d2308t1_2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.c5d2308t1_2.service.PaymentService;
import com.itwillbs.c5d2308t1_2.vo.ResponseTokenVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	// 로그 출력을 위한 변수 선언
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	
// =============================== 메인페이지 =======================================	
	// 계좌인증 페이지로 이동
	@GetMapping("AccountVerification")
	public String accountVerification(HttpSession session, Model model) {
		// 로그인을 하지 않은 사용자는 접근을 제한함
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	
			return "forward";
		}
		
		// stste 값에 사용하기 위한 32바이트 난수 생성
		String rNum = RandomStringUtils.randomNumeric(32);
		log.info("난수 : " + rNum);
		
		// 세션에 난수 저장
		session.setAttribute("state", rNum);
		// 로그아웃 시까지 계속 남아있으므로 사용 후 지워야함!
		
		return "payment/accountVerification";
	}
	
	@GetMapping("callback")
	public String callback(@RequestParam Map<String, String> authResponse, HttpSession session, Model model) {
//		log.info("authResponse : " + authResponse.toString());
		
		// 로그인이 되지 않은 사용자가 접근하면 창 닫기
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			// "fail_back.jsp" 페이지로 포워딩 시 "isClose" 값을 true 로 설정하여 전달
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("isClose", "true"); // 현재 창(서브 윈도우) 닫도록 명령
			model.addAttribute("targetURL", "MemberLogin"); // 로그인 페이지로 이동
			return "forward";
		}
		
//		System.out.println("state 삭제 전 : " + session.getAttribute("state"));
		// 응답데이터의 state값이 올바른 값인지 검증
		// session에 state 값이 없거나 session의 state값과 응답데이터의 state값이 일치하지 않으면 이전페이지로 돌아가기 
		if(session.getAttribute("state") == null 
				|| !session.getAttribute("state").equals(authResponse.get("state"))) {
			model.addAttribute("msg", "잘못된 요청입니다!");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "error");
			return "fail_back";
		}
		
		// state값 확인이 완료되면 session의 state값 삭제
		session.removeAttribute("state");
//		System.out.println("state 삭제 후 : " + session.getAttribute("state"));
		
		ResponseTokenVO responseToken = service.requestAccessToken(authResponse);
		
//		log.info("엑세스토큰 : " + responseToken);
		
		// ResponseTokenVO 객체가 null 이거나 엑세스토큰 값이 null일 경우
		// state값 갱신을 위해 "AccountVerification" 페이지로 이동
		if(responseToken == null || responseToken.getAccess_token() == null) {
			model.addAttribute("msg", "토큰 발급을 실패했습니다!");
			model.addAttribute("msg2", "다시 인증해주세요!");
			model.addAttribute("msg3", "error");
			model.addAttribute("isClose", true); // 현재 창(서브 윈도우) 닫도록 명령		
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		}
		
		// 토큰 관련 정보 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", id); // 세션아이디 저장
		map.put("token", responseToken);
		
		service.registAccessToken(map);
		
		// 세션 객체에 엑세스 토큰(access_token), 사용자번호 저장
		session.setAttribute("access_token", responseToken.getAccess_token());
		session.setAttribute("user_seq_no", responseToken.getUser_seq_no());
		
		// 인증창을 닫고 계좌 등록 페이지로 이동
		model.addAttribute("msg", "계좌 인증이 완료되었습니다!");
		model.addAttribute("isClose", true); // 현재 창(서브 윈도우) 닫도록 명령
		model.addAttribute("targetURL", "PayInfo"); 
		return "forward";
	}
	
	
	// 계좌등록(계좌목록) 페이지로 이동
	// 2.2.1. 사용자정보조회 API
	@GetMapping("AccountRegist")
	public String accountRegist(Model model, HttpSession session) {
		// 세션아이디가 null 일 경우 로그인 페이지 이동 처리
		// 엑세스토큰이 null 일 경우 "계좌 인증 필수!" 메세지 출력 후 "forward.jsp" 페이지 포워딩
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	 // 로그인 페이지로 이동
			return "forward";
		} else if(session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "계좌 인증이 필요합니다!");
			model.addAttribute("msg2", "계좌 인증 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		}

		// Map 객체에 엑세스토큰과 사용자번호 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("access_token", session.getAttribute("access_token"));
		map.put("user_seq_no", session.getAttribute("user_seq_no"));
		
		// 사용자정보조회 API
		Map<String, Object> userInfo = service.requestUserInfo(map);
		log.info("userInfo = " + userInfo);
		
		model.addAttribute("userInfo", userInfo);
		
		return "payment/accountRegist";
	}
	
	// 선택한 계좌를 DB에 등록
	@PostMapping("AccountRegistPro")
	public String accountRegistPro(@RequestParam Map<String, Object> map, HttpSession session, Model model) {
		// 세션아이디가 null 일 경우 로그인 페이지 이동 처리
		// 엑세스토큰이 null 일 경우 "계좌 인증 필수!" 메세지 출력 후 "forward.jsp" 페이지 포워딩
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	 // 로그인 페이지로 이동
			return "forward";
		} else if(session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "계좌 인증이 필요합니다");
			model.addAttribute("msg2", "계좌 인증 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			return "forward";
		}
		
		map.put("userInfo", model.getAttribute("userInfo"));
		map.put("member_id", session.getAttribute("sId")); // map 객체에 아이디 저장
//		log.info("map : " + map);
		
		// 아이디, 은행명, 계좌번호, 핀테크번호, 페이비밀번호 db에 저장하기
		// 페이비밀번호는 암호화하기
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(map.get("pay_password").toString());
		
		map.put("pay_password", securePasswd);
		
		log.info("map : " + map);
		
		int count = service.registPay(map);
		
		if(count > 0) { // 페이 가입이 되면
			return "redirect:/PayInfo";
		} else {
			model.addAttribute("msg", "계좌 등록을 실패하였습니다!");
			model.addAttribute("msg2", "계좌 목록으로 돌아갑니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountRegist"); // 계좌 목록 페이지로 이동
			return "forward";
		}

	}
	
	
	// 페이정보 페이지로 이동
	@GetMapping("PayInfo")
	public String payInfo(HttpSession session, Model model) {
		// 세션아이디가 null 일 경우 로그인 페이지 이동 처리
		// 엑세스토큰이 null 일 경우 "계좌 인증 필수!" 메세지 출력 후 "forward.jsp" 페이지 포워딩
		String member_id = (String)session.getAttribute("sId");
		
		if(member_id == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	 // 로그인 페이지로 이동
			return "forward";
		}
		
		// DB에서 페이 가입 여부 조회하고 정보 가져오기
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		log.info("payInfo = " + payInfo);
		
		if(session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "계좌 인증이 필요합니다");
			model.addAttribute("msg2", "계좌 인증 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		} else if(payInfo == null) {
			model.addAttribute("msg", "계좌 등록이 필요합니다");
			model.addAttribute("msg2", "계좌 등록 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountRegist"); // 계좌 등록 페이지로 이동
			return "forward";
		}
		
		model.addAttribute("payInfo", payInfo);
		
		return "payment/payInfo";
	}
	
	@ResponseBody
	@GetMapping("PayHistoryJson")
	public String historyJson(Model model, @RequestParam Map<String, Object> map) {

		// --------------------------------------------------
		// 페이징
		// 한 페이지에서 표시할 글 목록 갯수 지정 (테스트)
		int listLimit = 10;
		
		int pageNum = Integer.parseInt(map.get("pageNum").toString());
		
		System.out.println("pageNum = " + pageNum);
		// 조회 시작 행번호
		int startRow = (pageNum - 1) * listLimit;
		
		map.put("listLimit", listLimit);
		map.put("startRow", startRow);
		
		log.info("map객체는 >>>>" + map);
		
		List<Map<String, Object>> payHistoryList = service.getPayHistory(map);
		log.info(payHistoryList.toString());
		
		// ======================================================
		int listCount = service.getPayHistoryCount(map);
		
		int maxPage = listCount / listLimit + ((listCount % listLimit) > 0 ? 1 : 0);
		
		// 게시물 목록 조회 결과 Map 객체에 추가
		Map<String, Object> historyMap = new HashMap<String, Object>();
		historyMap.put("payHistoryList", payHistoryList);
//		System.out.println(map);
		
		// 마지막 페이지 번호 Map 객체에 추가
		historyMap.put("maxPage", maxPage);
		historyMap.put("listCount", listCount);
		
		JSONObject jsonObject = new JSONObject(historyMap);
		System.out.println("jsonObject = " + jsonObject);
		
		return jsonObject.toString();
	}
	
	
	
	// ----------- 페이충전 ---------------
	// 페이 충전 페이지로 이동
	@GetMapping("PayCharge")
	public String payCharge(HttpSession session, Model model) {
		// 세션아이디가 null 일 경우 로그인 페이지 이동 처리
		// 엑세스토큰이 null 일 경우 "계좌 인증 필수!" 메세지 출력 후 "forward.jsp" 페이지 포워딩
		String member_id = (String)session.getAttribute("sId");
		
		// DB에서 페이 가입 여부 조회하고 정보 가져오기
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		if(member_id == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	 // 로그인 페이지로 이동
			return "forward";
		} else if(session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "계좌 인증이 필요합니다");
			model.addAttribute("msg2", "계좌 인증 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		} else if(payInfo == null) {
			model.addAttribute("msg", "계좌 등록이 필요합니다");
			model.addAttribute("msg2", "계좌 등록 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountRegist"); // 계좌 등록 페이지로 이동
			return "forward";
		}
		
		model.addAttribute("payInfo", payInfo);
		
		return "payment/charge";
	}

	// 페이 충전 처리
	// 2.3.1. 잔액조회 API
	// 2.5. 계좌이체 서비스 - 2.5.1. 출금이체 API
	@PostMapping("PayChargePro")
	public String payChargePro(@RequestParam Map<String, Object> map, HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("sId");
		
		if(member_id == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	// 로그인 페이지로 이동
			return "forward";
		} else if(session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "계좌 인증이 필요합니다");
			model.addAttribute("msg2", "계좌 인증 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		}
		
//		log.info(map.toString());

		// 잔액을 조회 -> 입력금액과 잔액 비교 -> 잔액이 입력금액보다 많으면 충전, 아니면 거부
		// 충전 = 잔액 인출 후 성공 뷰페이지, 거절 = 거절페이지
		map.put("access_token", (String)session.getAttribute("access_token"));
		map.put("member_id", (String)session.getAttribute("sId"));
		
//		log.info("페이잔액 파라미터 : " + map.toString());
		
		// Service - requestAccountDetail() 메서드 호출하여 계좌 상세정보 조회 요청
		// => 파라미터 : Map 객체    리턴타입 : Map<String, Object>(accountDetail)
		Map<String, Object> accountDetail = service.requestAccountDetail(map);
		log.info("accountDetail 잔액조회 = " + accountDetail);
		
		// 파라미터로 입력받은 값을 숫자로 변환
		String pay_amountString = (String) map.get("pay_amount");
		pay_amountString = pay_amountString.replace(",", "");
		int pay_amount = Integer.parseInt(pay_amountString);
		
		// 계좌 출금가능금액을 숫자로 변환
		String available_amtString = (String) accountDetail.get("available_amt");
		int available_amt = Integer.parseInt(available_amtString);

//		System.out.println("pay_amount + " + pay_amount);
//		System.out.println("available_amt + " + available_amt);
		
		// 입력 금액과 잔액을 비교
		if((available_amt - pay_amount) < 0) { // 출금 가능금액에서 입력값을 뺀 값이 마이너스일 때
			System.out.println("출금불가");
			return "redirect:/PayChargeRefused"; // 출금 실패 페이지로 이동
		} else { // 출금 가능금액에서 입력값을 뺀 값이 0이상일 때
			System.out.println("출금가능");
			map.put("tran_amt", pay_amount);
			session.setAttribute("pay_amount", pay_amount);
			
			// 2.5. 계좌이체 서비스 - 2.5.1. 출금이체 API
			Map<String, Object> withdrawResult = service.requestWithdraw(map);
			log.info(">>>>>>>>>>>>>>>>>withdrawResult : " + withdrawResult);
//			log.info(">>>>>>>>>>>>>>>>>출금?? : " + withdrawResult.get("rsp_code"));
			
			// 요청 결과를 Model 객체에 저장
			model.addAttribute("withdrawResult", withdrawResult);
			
			// pay_history_type을 충전으로 지정
			map.put("pay_history_type", 1);
			
			if(withdrawResult.get("rsp_code").equals("A0000")) {
				log.info("이거임 >>>>>>>>>>>>>>>" + map.toString());
//				System.out.println("출금됨");
				// 페이 잔액을 업데이트
				int updateCount = service.updatePayBalance(map);
				
				
				if(updateCount > 0) {
					return "redirect:/PayChargeComplete";					
				} else {
					return "redirect:/PayChargeRefused"; // 출금 실패 페이지로 이동				
				}

			} else {
//				System.out.println("출금안됨!!!!!!!!!!!!!!!!!!");				
				return "redirect:/PayChargeRefused"; // 출금 실패 페이지로 이동
			}
			
		}
		
	}
	
	// 페이 충전 완료 페이지로 이동
	@GetMapping("PayChargeComplete")
	public String payChargeComplete(HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("sId");
		
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		log.info("payInfo = " + payInfo);
		
		payInfo.put("pay_amount", session.getAttribute("pay_amount"));
		payInfo.put("result", "charge_success");
		
		model.addAttribute("payInfo", payInfo);
		
		return "payment/payModifyComplete";
	}
	
	// 페이 충전 실패 페이지로 이동
	@GetMapping("PayChargeRefused")
	public String payChargeRefused(HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("sId");
		
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		log.info("payInfo = " + payInfo);
		
		payInfo.put("pay_amount", session.getAttribute("pay_amount"));
		payInfo.put("result", "charge_refused");
		
		model.addAttribute("payInfo", payInfo);
		
		return "payment/payModifyComplete";
	}
	
	// ----------- 페이환급 ---------------	
	// 이용기관의 계좌에 접근 가능한 엑세스토큰 발급
	// 관리자페이지에서 관리자 아이디로 등록
	@GetMapping("AdminAccountRegist")
	public String adminAccountRegist(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		// 세션아이디가 null 일 경우 로그인 페이지 이동 처리
		// 관리자가 아닐 경우 "잘못된 접근입니다!" 처리
		if(id == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");		
			return "forward";
		} else if(!id.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "./");	
			return "forward";
		}
		
		// 관리자 엑세스토큰 발급 요청
		ResponseTokenVO responseToken = service.requestAdminAccessToken();
		log.info("관리자 엑세스토큰 : " + responseToken);
		
		// refresh_token 과 user_seq_no 값은 널스트링("")으로 설정
		responseToken.setRefresh_token("");
		responseToken.setUser_seq_no("");
		
		// 토큰 관련 정보 저장 요청
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", id); // 세션아이디 저장
		map.put("token", responseToken);
		
		service.registAccessToken(map);
		
		model.addAttribute("msg", "토큰 발급 완료!");
		model.addAttribute("msg3", "success");
		model.addAttribute("targetURL", "MemberAccount");
		return "forward";
	}
	
	// 페이 환급 페이지로 이동
	@GetMapping("PayRefund")
	public String payRefund(HttpSession session, Model model) {
		// 세션아이디가 null 일 경우 로그인 페이지 이동 처리
		// 엑세스토큰이 null 일 경우 "계좌 인증 필수!" 메세지 출력 후 "forward.jsp" 페이지 포워딩
		String member_id = (String)session.getAttribute("sId");
		
		// DB에서 페이 가입 여부 조회하고 정보 가져오기
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		if(member_id == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	 // 로그인 페이지로 이동
			return "forward";
		} else if(session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "계좌 인증이 필요합니다");
			model.addAttribute("msg2", "계좌 인증 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		} else if(payInfo == null) {
			model.addAttribute("msg", "계좌 등록이 필요합니다");
			model.addAttribute("msg2", "계좌 등록 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountRegist"); // 계좌 등록 페이지로 이동
			return "forward";
		}
		
		model.addAttribute("payInfo", payInfo);
	
		return "payment/refund";
	}
	
	// 페이 환급 처리
	// 2.5.2. 입금이체 API
	@PostMapping("PayRefundPro")
	public String payRefundPro(@RequestParam Map<String, Object> map, HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("sId");
		
		if(member_id == null) {
			model.addAttribute("msg", "로그인을 해주세요!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다!");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "MemberLogin");	// 로그인 페이지로 이동
			return "forward";
		} else if(session.getAttribute("access_token") == null) {
			model.addAttribute("msg", "계좌 인증이 필요합니다");
			model.addAttribute("msg2", "계좌 인증 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		}
		
		// 저장된 "admin" 계정의 엑세스토큰(oob) 조회 필요
		map.put("access_token", service.getAdminAccessToken());
		map.put("member_id", member_id);
		
		// 파라미터로 입력받은 값을 숫자로 변환
		String pay_amountString = (String) map.get("pay_amount");
		pay_amountString = pay_amountString.replace(",", "");
		int pay_amount = Integer.parseInt(pay_amountString);
		
		map.put("tran_amt", pay_amount);
		session.setAttribute("pay_amount", pay_amount);
		log.info(">>>>>>>>>>>>> 입금이체 map 데이터 " + map);
		
		// BankService - requestDeposit() 메서드 호출하여 상품에 대한 환불(입금이체) 요청
		// => 파라미터 : Map 객체   리턴타입 : Map<String, Object>(depositResult)
		Map<String, Object> depositResult = service.requestDeposit(map);
		log.info(">>>>>>>>>>>>>>>>>depositResult : " + depositResult);
		
		// 요청 결과를 Model 객체에 저장
		model.addAttribute("depositResult", depositResult);
		
		// pay_history_type을 환급으로 지정
		map.put("pay_history_type", 2);
		
		if(depositResult.get("rsp_code").equals("A0000")) {
//			log.info("이거임 >>>>>>>>>>>>>>>" + map.toString());
//			System.out.println("입금됨");
			// 페이 잔액을 업데이트
			int updateCount = service.updatePayBalance(map);
			
			if(updateCount > 0) {
				return "redirect:/PayRefundComplete";					
			} else {
				return "redirect:/PayRefundRefused"; // 입금 실패 페이지로 이동				
			}

		} else {
//			System.out.println("입금안됨!!!!!!!!!!!!!!!!!!");				
			return "redirect:/PayRefundRefused"; // 입금 실패 페이지로 이동
		}

		
	}

	// 페이 환급 완료 페이지로 이동
	@GetMapping("PayRefundComplete")
	public String payRefundComplete(HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("sId");
		
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		log.info("payInfo = " + payInfo);
		
		payInfo.put("pay_amount", session.getAttribute("pay_amount"));
		payInfo.put("result", "refund_success");
		
		model.addAttribute("payInfo", payInfo);
		
		return "payment/payModifyComplete";
	}
	
	// 페이 환급 실패 페이지로 이동
	@GetMapping("PayRefundRefused")
	public String payRefundRefused(HttpSession session, Model model) {
		String member_id = (String)session.getAttribute("sId");
		
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		log.info("payInfo = " + payInfo);
		
		payInfo.put("pay_amount", session.getAttribute("pay_amount"));
		payInfo.put("result", "refund_refused");
		
		model.addAttribute("payInfo", payInfo);
		
		return "payment/payModifyComplete";
	}
	
	
	
	// ----------- 페이사용 ---------------
	// 페이 사용 페이지로 이동
	@GetMapping("PayUse")
	public String payUse() {
		return "payment/use";
	}
	
	// 페이 사용 처리
	@PostMapping("PayUsePro")
	public String payUsePro(@RequestParam Map<String, String> map) {
		log.info(map.toString());
		
		return "redirect:/PayUseComplete";
	}
	
	// 페이 사용 완료 페이지로 이동
	@GetMapping("PayUseComplete")
	public String payUseComplete() {
		return "payment/useComplete";
	}
	
	
	// ---------- 페이 비밀번호 체크 ---------------
	@ResponseBody
	@GetMapping("PasswdCheck")
	public String passwdCheck(@RequestParam String input_passwd, HttpSession session) {
		// 페이 정보 가져오기(재사용)
		String member_id = (String)session.getAttribute("sId");
		Map<String, Object> payInfo = service.getPayInfo(member_id);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(payInfo == null || !passwordEncoder.matches(input_passwd, payInfo.get("pay_password").toString())) {
			return "false";
		} else {
			return "true";			
		}
		
	}
	
	
	
	
// =============================== 관리자페이지 =======================================	
	
	// 계좌 관리 페이지로 이동
	@GetMapping("MemberAccount")
	public String memberAccount(Model model) {
		List<Map<String, Object>> payList = service.getPayListAll();
		log.info(payList.toString());
		
		model.addAttribute("payList", payList);
		
		return "admin/memberAccount";
	}
	
	// 계좌 관리 상세 페이지로 이동
	@GetMapping("MemberAccountDetail")
	public String memberAccountDetail() {
		return "admin/memberAccountDetail";
	}
	
	// 충전/환급 관리 페이지로 이동
	@GetMapping("ChargeRefund")
	public String chargeRefund(Model model) {
		List<Map<String, Object>> payHistoryList = service.getPayHistoryChargeRefund();
		log.info(payHistoryList.toString());
		
		model.addAttribute("payHistoryList", payHistoryList);
		
		return "admin/chargeRefund";
	}

	// 사용/수익 관리 페이지로 이동
	@GetMapping("SpentRevenue")
	public String spentRevenue(Model model) {
		List<Map<String, Object>> payHistoryList = service.getPayHistorySpentRevenue();
		log.info(payHistoryList.toString());
		
		model.addAttribute("payHistoryList", payHistoryList);
		
		return "admin/spentRevenue";
	}
	
	// 거래 내역 관리 페이지로 이동
	@GetMapping("OrderList")
	public String orderList() {
		return "admin/orderList";
	}


}
