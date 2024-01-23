package com.itwillbs.c5d2308t1_2.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ComponentController {
	
	@GetMapping("searchKeyword")
	public String searchKeyword(Model model, HttpServletResponse response) {
		Cookie cookie = new Cookie("RecentWord","최근검색어");
		cookie.setMaxAge(60*60*24*1); // 초 분 시 일 => @@하루동안 쿠키가 유지됨@@
		response.addCookie(cookie);
		return "products/searchProduct";
	}
}
