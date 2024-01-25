package com.itwillbs.c5d2308t1_2.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReportController {
	
	@GetMapping("report")
	public String report() {
		
		return "report/report";
	}
	
	@ResponseBody
	@GetMapping("reportRegist")
	public String reportRegist(@RequestParam Map<String, String> map) {
		System.out.println(map);
		
		
		return "true";
	}
}
