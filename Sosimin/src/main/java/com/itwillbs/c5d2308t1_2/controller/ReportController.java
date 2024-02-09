package com.itwillbs.c5d2308t1_2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.c5d2308t1_2.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService service;
	
	@GetMapping("Report")
	public String report() {
		
		return "report/report";
	}
	
	@ResponseBody
	@GetMapping("ReportRegist")
	public String reportRegist(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		System.out.println(map);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 신고데이터 " + map);
		
		int seccess = service.insertReport(map);
		
		if(seccess > 0) {
			return "true";
		} else {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("targetURL", "SearchProduct");
			
			return "forward";
		}
		
	}
	
	// *================================= adminReport
	// 회원 신고 목록 
	@GetMapping("ReportMember")
	public String reportMember(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		List<Map<String, Object>> memberReportList = service.memberReportList();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>" + memberReportList);
		model.addAttribute("memberReportList", memberReportList);
		return "admin/reportMember";
	}
	
	// 상품 신고 목록
	@GetMapping("ReportProduct")
	public String reportProduct(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		List<Map<String, Object>> boardReportList = service.boardReportList();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>" + boardReportList);
		model.addAttribute("boardReportList", boardReportList);
		return "admin/reportProduct";
	}
	
	// 커뮤니티 신고 목록
	@GetMapping("ReportCommunity")
	public String reportCommunity(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		List<Map<String, Object>> communityReportList = service.communityReportList();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>" + communityReportList);
		model.addAttribute("communityReportList", communityReportList);
		return "admin/reportCommunity";
	} 
	
	// 댓글 신고 목록
	@GetMapping("ReportReply")
	public String reportReply(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		List<Map<String, Object>> replyReportList = service.replyReportList();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>" + replyReportList);
		model.addAttribute("replyReportList", replyReportList);
		return "admin/reportReply";
	}
	
	// 신고 상태 변경
	@ResponseBody
	@GetMapping("ReportModify")
	public String reportModify(@RequestParam Map<String, String> map, HttpSession session) {
		
		service.reportStatusUpt(map);
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


























