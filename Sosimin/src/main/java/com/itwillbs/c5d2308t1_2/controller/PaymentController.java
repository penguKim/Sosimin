package com.itwillbs.c5d2308t1_2.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c5d2308t1_2.service.PaymentService;
import com.itwillbs.c5d2308t1_2.vo.ResponseTokenVO;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	// 로그 출력을 위한 변수 선언
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	
	// 계좌인증 페이지로 이동
	@GetMapping("AccountVerification")
	public String accountVerification(HttpSession session, Model model) {
		// 로그인을 하지 않은 사용자는 접근을 제한함
//		if(session.getAttribute("sId") == null) {
//			model.addAttribute("msg", "로그인 필수!");
//			model.addAttribute("targetURL", "MemberLogin");
//			return "forward";
//		}
		
		// stste 값에 사용하기 위한 32바이트 난수 생성
		String rNum = RandomStringUtils.randomNumeric(32);
//		log.info("난수 : " + rNum);
		
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
//		if(id == null) {
//			// "fail_back.jsp" 페이지로 포워딩 시 "isClose" 값을 true 로 설정하여 전달
//			model.addAttribute("msg", "로그인을 해주세요");
//			model.addAttribute("isClose", true); // 현재 창(서브 윈도우) 닫도록 명령
//			model.addAttribute("targetURL", "MemberLogin"); // 로그인 페이지로 이동
//			return "forward";
//		}
		
//		System.out.println("state 삭제 전 : " + session.getAttribute("state"));
		// 응답데이터의 state값이 올바른 값인지 검증
		// session에 state 값이 없거나 session의 state값과 응답데이터의 state값이 일치하지 않으면 이전페이지로 돌아가기 
		if(session.getAttribute("state") == null 
				|| !session.getAttribute("state").equals(authResponse.get("state"))) {
			model.addAttribute("msg", "잘못된 요청입니다!");
			return "fail_back";
		}
		
		// state값 확인이 완료되면 session의 state값 삭제
		session.removeAttribute("state");
//		System.out.println("state 삭제 후 : " + session.getAttribute("state"));
		
		ResponseTokenVO responseToken = service.requestAccessToken(authResponse);
		
		log.info("엑세스토큰 : " + responseToken);
		
		// ResponseTokenVO 객체가 null 이거나 엑세스토큰 값이 null일 경우
		// state값 갱신을 위해 "AccountVerification" 페이지로 이동
		if(responseToken == null || responseToken.getAccess_token() == null) {
			model.addAttribute("msg", "토큰 발급 실패! 다시 인증하세요!");
			model.addAttribute("isClose", true); // 현재 창(서브 윈도우) 닫도록 명령		
			model.addAttribute("targetURL", "AccountVerification");	
			return "forward";
		}
		
		
		
		return "";
	}
	
	
	// 계좌등록(계좌목록) 페이지로 이동
	@GetMapping("AccountRegist")
	public String accountRegist() {
		return "payment/accountRegist";
	}
	
	// 페이정보 페이지로 이동
	@GetMapping("PayInfo")
	public String payInfo() {
		return "payment/payInfo";
	}
	
	// 페이 충전 페이지로 이동
	@GetMapping("PayCharge")
	public String payCharge() {
		return "payment/charge";
	}
	
	// 페이 충전 완료 페이지로 이동
	@GetMapping("PayChargeComplete")
	public String payChargeComplete() {
		return "payment/chargeComplete";
	}
	
	// 페이 환급 페이지로 이동
	@GetMapping("PayRefund")
	public String payRefund() {
		return "payment/refund";
	}
	
	// 페이 환급 완료 페이지로 이동
	@GetMapping("PayRefundComplete")
	public String payRefundComplete() {
		return "payment/refundComplete";
	}
	
	// 페이 사용 페이지로 이동
	@GetMapping("PayUse")
	public String payUse() {
		return "payment/use";
	}
	
	// 페이 사용 완료 페이지로 이동
	@GetMapping("PayUseComplete")
	public String payUseComplete() {
		return "payment/useComplete";
	}
	
	// 계좌 관리 페이지로 이동
	@GetMapping("MemberAccount")
	public String memberAccount() {
		return "admin/memberAccount";
	}
	
	// 계좌 관리 상세 페이지로 이동
	@GetMapping("MemberAccountDetail")
	public String memberAccountDetail() {
		return "admin/memberAccountDetail";
	}
	
	// 충전/환급 관리 페이지로 이동
	@GetMapping("ChargeRefund")
	public String chargeRefund() {
		return "admin/chargeRefund";
	}
	
	// 충전/환급 관리 상세페이지로 이동
	@GetMapping("ChargeRefundDetail")
	public String chargeRefundDetail() {
		return "admin/chargeRefundDetail";
	}
	
	// 사용/수익 관리 페이지로 이동
	@GetMapping("SpentRevenue")
	public String spentRevenue() {
		return "admin/spentRevenue";
	}
	
	// 사용/수익 관리 상세페이지로 이동
	@GetMapping("SpentRevenueDetail")
	public String spentRevenueDetail() {
		return "admin/spentRevenueDetail";
	}
	
	// 거래 내역 관리 페이지로 이동
	@GetMapping("OrderList")
	public String orderList() {
		return "admin/orderList";
	}
	
	// 거래 내역 관리 상세 페이지로 이동
	@GetMapping("OrderListDetail")
	public String orderListDetail() {
		return "admin/orderListDetail";
	}

	
}
