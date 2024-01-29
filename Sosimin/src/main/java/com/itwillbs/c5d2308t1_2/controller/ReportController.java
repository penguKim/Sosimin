package com.itwillbs.c5d2308t1_2.controller;

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
	@GetMapping("MemberReport")
	public String reportMember(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		
		
		
		return "admin/reportMember";
	}
	
	@GetMapping("ReportMemberDetail")
	public String reportMember() {
		
		return "admin/reportMemberDetail";
	}
	
	// 게시글 신고 목록
	@GetMapping("BoardReport")
	public String reportBoard(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		
		
		
		return "admin/reportBoard";
	}
	
	
	@GetMapping("ReportDetail")
	public String reportDetail() {
		
		
		
		return "admin/reportBoardDetail";
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


























