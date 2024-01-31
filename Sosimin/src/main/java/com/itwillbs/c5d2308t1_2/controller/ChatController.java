package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	
	@GetMapping("Chat2")
	public String chat() {
		return "chat/chat2";
	}
	
}
