package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
	// 계좌인증 페이지로 이동
	@GetMapping("AccountVerification")
	public String accountVerification() {
		return "payment/accountVerification";
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
