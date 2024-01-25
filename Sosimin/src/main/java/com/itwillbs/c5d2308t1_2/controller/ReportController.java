package com.itwillbs.c5d2308t1_2.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String reportRegist(@RequestParam Map<String, String> map) {
		System.out.println(map);
		
		int seccess = service.insertReport(map);
		
		if(seccess > 0) {
			return "true";
		} else {
			return "false";
		}
		
	}
}

























