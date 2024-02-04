package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CsController {
	
	
	@GetMapping("CsMain")
	public String csMain() {
		
		return "cs/csMain";
	}
	
	@GetMapping("CsNotice")
	public String csNotice() {
		
		return "cs/csNotice";
	}
	@GetMapping("CsFaq")
	public String csFaq() {
		
		return "cs/csFaq";
	}
//	@GetMapping("CsOneOnOne")
//	public String csOneOnOne() {
//		
//		return "cs/csOneOnOne";
//	}
	
	@GetMapping("CsNoticeList")
	public String csNoticeList() {
		
		return "admin/csNoticeList";
	}
	
	@GetMapping("CsFaqList")
	public String csFaqList() {
		
		return "admin/csFaqList";
	}
	
	@GetMapping("CsOneOnOneList")
	public String csOneOnOneList() {
		
		return "admin/csOneOnOneList";
	}
	
	
	
}
