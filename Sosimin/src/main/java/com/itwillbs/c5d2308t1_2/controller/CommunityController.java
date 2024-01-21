package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
}
