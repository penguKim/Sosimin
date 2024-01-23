package com.itwillbs.c5d2308t1_2.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommunityController {

	
	@GetMapping("Community")
	public String community() {
		return "community/communityList";
	}
	
	@GetMapping("CommunityWrite")
	public String communityWrite() {
		return "community/communityWrite";
	}
	
	@GetMapping("CommunityDetail")
	public String communityDetail() {
		return "community/communityDetail";
	}
	
	
	
	
	
	
	
	
	@ResponseBody
	@PostMapping("reviewRegist")
	public String reviewRegist(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		
//		if(map.get("options").equals("good")) {
//			System.out.println("좋은 후기입니다.");
//		} else if(map.get("options").equals("bas")) {
//			System.out.println("나쁜 후기입니다.");
//		}
		
		return "true";
	}
}
