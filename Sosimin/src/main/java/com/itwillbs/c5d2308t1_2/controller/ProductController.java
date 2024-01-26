package com.itwillbs.c5d2308t1_2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c5d2308t1_2.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	
	// 메인 상품 목록 페이지
	// ajax 처리 
	@GetMapping("SearchProduct")
	public String searchProduct(@RequestParam(defaultValue = "") Map<String, String> map, Model model ) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> 저장 전" + map);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> 저장 후" + map);
		
		
		// 회원 조회 후 지역이 있다면 지역 값 넘기기 없으면 검색 및 카테고리 값만 넘기기 
		
		
		return "products/searchProduct";
	}
	
	// 상품 등록 페이지로 이동
	@GetMapping("ProductRegist")
	public String productRegist(@RequestParam Map<String, String> map, HttpSession session, Model model ) {
		
		
		
		
		
		return "products/productRegist";
	}
	
	// 상품 등록
//	@PostMapping("ProductRegistSuccess")
//	public String productRegistSuccess(@RequestParam Map<String, String> map, HttpSession session, Model model, @RequestParam("product_image") MultipartFile[] productImages) {
//		
//		System.out.println(map);
//		
//		List<String> fileNames = new ArrayList<>(); // 파일 이름을 저장하는 리스트 생성
//			
//		   for (int i = 0; i < productImages.length; i++) {
//		        MultipartFile productImage = productImages[i];
//		        if (!productImage.isEmpty()) {
//		            // 파일이 존재할 경우 처리
//		            String fileName = productImage.getOriginalFilename();
//		            fileNames.add(fileName); // 리스트에 파일 이름 추가
//		        }
//		    }
//		   // 모든 파일의 이름을 출력
//		   for(String name : fileNames){
//		       System.out.println("파일 이름: " + name);
//		   }
//		   return "ProductDetail";
//	}

	
	@PostMapping("ProductRegistSuccess")
	public String productRegistSuccess(@RequestParam Map<String, String> map, HttpSession session, Model model, @RequestParam("product_image") MultipartFile[] productImages, @RequestParam(value = "product_image_name", required = false) List<String> imageNames) {
	    System.out.println(map);
//	    if (productImages != null) {
//	        for (MultipartFile productImage : productImages) {
//	            System.out.println("파일 이름: " + productImage.getOriginalFilename());
//	        }
//	    }
	    if (imageNames != null) {
	        for (String name : imageNames) {
	            System.out.println("파일 이름: " + name);
	        }
	    }
	    return "ProductDetail";
	}
		
//	    map.put("product_price", map.get("product_price").replace(",", ""));
//		String tag_name =  map.get("tag_name1") + map.get("tag_name2") + map.get("tag_name3")+ map.get("tag_name4");
//		System.out.println(tag_name);
//		map.put("tag_name", tag_name);
//		System.out.println("가격 변경 : " + map.get("product_price"));
		
		
//		int successInsert = service.productRegist(map);
//		if(successInsert > 0 ) {
//			System.out.println("성공");
//		} 
//	}
	
	// 상품 상세페이지
	@GetMapping("ProductDetail")
	public String productDetail() {
		
		return "products/productDetail";
	}
	
	
	// 상품 제안하기 
	@GetMapping("Proposal")
	public String Proposal() {
		
		return"products/Proposal";
	}
	
	// 제안 상품 가격 채팅으로 전달
	
	
	
	
	// =============================== 관리자 페이지
	// 등록 상품 목록
	@GetMapping("ProductList")
	public String productList() {
		
		return "admin/productList";
	}
	
	@GetMapping("ProductListDetail")
	public String productListDetail() {
		
		return "admin/productListDetail";
	}
	
}	



















