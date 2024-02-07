package com.itwillbs.c5d2308t1_2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	// 단일 전체 채팅방
	@GetMapping("ChatMain")
	public String main(HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			model.addAttribute("targetURL", "MemberLoginForm");
			return "forward";
		}
		
		return "chat/main";
	}
	
	// 다중 1:1 채팅방
	@GetMapping("ChatMain2")
	public String main2(HttpSession session, Model model) {
		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			model.addAttribute("targetURL", "MemberLoginForm");
			return "forward";
		}
		
		return "chat/main2";
	}
	
}














