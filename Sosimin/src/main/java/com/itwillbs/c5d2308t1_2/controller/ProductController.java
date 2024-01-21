package com.itwillbs.c5d2308t1_2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	
	
	@GetMapping("searchProduct")
	public String searchProduct() {
		
		return "products/searchProduct";
	}
	
	@GetMapping("productDetail")
	public String productDetail() {
		
		return "products/productDetail";
	}
	
	
	
}
