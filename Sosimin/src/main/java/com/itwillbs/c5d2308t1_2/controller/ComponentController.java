package com.itwillbs.c5d2308t1_2.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ComponentController {
	private static final int MAX_KEYWORDS = 10;
	private static final String SEARCH_COOKIE_NAME = "searchKeywords";
	
	@GetMapping("searchKeyword")
	public String searchKeyword(@RequestParam String keyword, Model model,HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("searchKeyword", keyword);
		System.out.println("저장한 쿠키 : " + cookie);
		response.addCookie(cookie);
		
		
		
		return "products/searchProduct";
	}
}
