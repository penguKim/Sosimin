package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CsController {
	
	
	@GetMapping("csMain")
	public String csMain() {
		
		return "cs/csMain";
	}
	
	@GetMapping("csNotice")
	public String csNotice() {
		
		return "cs/csNotice";
	}
	@GetMapping("csFaq")
	public String csFaq() {
		
		return "cs/csFaq";
	}
	@GetMapping("csOneOnOne")
	public String csOneOnOne() {
		
		return "cs/csOneOnOne";
	}
	
	
}
