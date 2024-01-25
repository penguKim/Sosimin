package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	
	
	@GetMapping("SearchProduct")
	public String searchProduct(@RequestParam(defaultValue = "") String category, Model model ) {
		
		// 회원 조회 후 지역이 있다면 지역 값 넘기기 없으면 검색 및 카테고리 값만 넘기기 
		
		
		return "products/searchProduct";
	}
	
	@GetMapping("ProductDetail")
	public String productDetail() {
		
		return "products/productDetail";
	}
	
	@GetMapping("ProductRegist")
	public String ProductRegist() {
		
		return "products/productRegist";
	}
	@GetMapping("Proposal")
	public String Proposal() {
		
		return"products/Proposal";
	}
	
}
