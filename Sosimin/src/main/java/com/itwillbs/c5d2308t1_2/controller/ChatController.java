package com.itwillbs.c5d2308t1_2.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.c5d2308t1_2.service.*;

@Controller
public class ChatController {
	
	@Autowired
	ChatService service;
	
	@GetMapping("ChatMain2")
	public String main2(HttpSession session, Model model, @RequestParam Map<String, String> map) {
		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "로그인 후 사용 가능합니다.");
			model.addAttribute("targetURL", "MemberLoginForm");
			return "forward";
		}
		System.out.println(">>>>>>> 뭐가 들긴 들었니? : " + map);
		Map<String,String> productChat = service.selectSellInfo(map);
		
		System.out.println(">>>>>>> 뭐를 들고 돌아왔어? : " + productChat);
		model.addAttribute("productChat", productChat);
		return "chat/main2";
	}
	
}














