package com.itwillbs.c5d2308t1_2.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itwillbs.c5d2308t1_2.service.ProductService;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.PageInfo;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	// 메인 상품 목록 페이지 이동
	@GetMapping("SearchProduct")
	public String searchProduct() {
		return "products/searchProduct";
	}
	
	// 상품 목록 출력 ajax
	@ResponseBody
	@GetMapping("StoreProductList")
	public String productList(@RequestParam(defaultValue = "") Map<String, Object> map, HttpSession session,  Model model
			, @RequestParam(defaultValue = "1") int pageNum) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> 저장 전" + map);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> 저장 후" + map);
		String id = (String)session.getAttribute("sId");
		System.out.println(">>>>>>>>>>>>>>>>>>>> : " + id);
		List<Map<String, Object>> productList = null;
		// 미로그인 시 상품 목록 날짜 최신순으로 나열
		map.put("sId", id);
		
		// ====================페이징 처리 ===============================================================
		PageDTO page = new PageDTO(pageNum, 20);
		map.put("pageNum", pageNum);
		int listCount = service.getProductListCount(map);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>" + listCount);
		PageInfo pageInfo = new PageInfo(page, listCount, 3);
		map.put("page", page);
		// ===============================================================================================
		
		productList = service.selectProductList(map); 
		
		// 상품 등록 시간 계산 처리 
		// ===============================================================================================
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
		
		for(Map<String, Object> datetime : productList) {
			LocalDateTime comDateTime = LocalDateTime.parse(datetime.get("product_datetime").toString().replace('T', ' '), formatter);
        	
            long minutes = Duration.between(comDateTime, now).toMinutes();
            long hours = minutes / 60;
            long days = hours / 24;
            hours %= 24;
            minutes %= 60;
            String timeAgo = "";
            if (days > 0) { // 하루이상 차이날 때
                if (comDateTime.getYear() == now.getYear()) {
                    timeAgo = comDateTime.format(formatterMonthDay);
                } else {
                    timeAgo = comDateTime.format(formatterDate);
                }
            } else if (hours > 0 && hours < 24) { // 1 ~ 23시간이 차이날 때
                timeAgo = hours + "시간 전";
            } else if (minutes > 0) { // 1 ~ 59분이 차이날 때
                timeAgo = minutes + "분 전";
            } else {
                timeAgo = "방금 전";
            }
            // 계산한 시간 목록
            datetime.put("product_datetime", timeAgo);
		}
		
		// ===============================================================================================
		JSONArray jsonArray = new JSONArray();
		jsonArray.put(productList);
		
		JSONObject jPage = new JSONObject(pageInfo); 
		jsonArray.put(jPage);
		jsonArray.put(pageNum);
		
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>> 리스트" + productList);
		System.out.println(">>>>>>>>>>>>>>>>>>>> 페이징" + jPage);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> : " + jsonArray);
		
		// 로그인 시 사용자 지역, 날짜 최신순으로 나열
		
		return jsonArray.toString();
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

	  
	
	// 상품 등록
//		@PostMapping("ProductRegistSuccess")
//		public String productRegistSuccess(@RequestParam Map<String, String> map, HttpSession session, Model model, @RequestParam("product_image") MultipartFile[] productImages) {
//			
//			System.out.println(map);
//			
//			List<String> fileNames = new ArrayList<>(); // 파일 이름을 저장하는 리스트 생성
//				
//			   for (int i = 0; i < productImages.length; i++) {
//			        MultipartFile productImage = productImages[i];
//			        if (!productImage.isEmpty()) {
//			            // 파일이 존재할 경우 처리
//			            String fileName = productImage.getOriginalFilename();
//			            fileNames.add(fileName); // 리스트에 파일 이름 추가
//			        }
//			    }
//			   // 모든 파일의 이름을 출력
//			   for(String name : fileNames){
//			       System.out.println("파일 이름: " + name);
//			   }
//			   return "ProductDetail";
//		}

		
		
		@PostMapping("ProductRegistSuccess")
		public String productRegistSuccess(@RequestParam Map<String, String> map, HttpSession session, Model model, HttpServletRequest request, @RequestParam("product_image") MultipartFile[] files) {
			
			
			
		    for (MultipartFile file : files) {
		    	
		      System.out.println("뭐가 넘어왔어..?" + file);
		    }
		    
			
		    String uploadDir = "/resources/upload";
		    String saveDir = session.getServletContext().getRealPath(uploadDir);

		 // 서브 디렉토리
	 		String subDir = "";
		    
		    LocalDate now = LocalDate.now();
		    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		   subDir = now.format(dtf);

		    saveDir += File.separator + subDir;

		    try {
		        Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
		        Files.createDirectories(path); // 파라미터로 Path 객체 전달
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    
		    
		    
		    for (int i = 0; i < files.length; i++) {
		        MultipartFile file = files[i];
		        String originalName = file.getOriginalFilename(); // 원래 파일명
		        String fileName = UUID.randomUUID().toString().substring(0,8) + "_" + originalName; // 고유한 파일명 생성
		        String filePath = saveDir + File.separator + fileName;
		        try {
		            file.transferTo(new File(filePath)); // 파일 저장
		            
		            // 파일 경로에서 'upload' 이후의 부분만 추출
		            int uploadIndex = filePath.indexOf("upload");
		            if (uploadIndex != -1) {
		                String relativePath = filePath.substring(uploadIndex + "upload".length() + 1);
		                map.put("product_image" + (i + 1), relativePath); // 파일 경로를 map에 추가
		            }
		        } catch (IllegalStateException | IOException e) {
		            e.printStackTrace();
		        }
		    }
		    
//		    product.setWriter_ip(request.getRemoteAddr());

		    String product_price =  map.get("product_price").replace(",", ""); // 받아온 money값 ,때기

		    StringBuilder tagNameBuilder = new StringBuilder(); // 태그 이름을 저장할 StringBuilder 객체 생성
		    for (int i = 1; i <= 4; i++) {
		        String tagNameKey = "tag_name" + i; // 태그 이름을 가져올 맵의 키 생성 (예: "tag_name1")
		        String tagNameValue = map.get(tagNameKey); // 맵에서 태그 이름 값 가져오기

		        if (tagNameValue != null) {
		            tagNameBuilder.append("#" + tagNameValue + " "); // 태그 이름이 null이 아닐때 추가 (문자열 결합사용)
		        }
		    }
		    String tag_name = tagNameBuilder.toString(); // null이 아닐시 받아온 태그값 tag_name에 저장

		    String address = map.get("trade_place"); // 가져온 주소값 
		    String[] addressSplit = address.split(" "); // 공백으로 나눈다
		    String gu = addressSplit[1]; // 구 가져오기
		    String dong = addressSplit[2]; // 동 가져오기

		    map.put("tag_name", tag_name); 
		    map.put("product_price" , product_price);
		    map.put("gu", gu);
		    map.put("dong", dong);
		    
		    
		    int successInsert = service.productRegist(map);

		    if (successInsert > 0) {
		        System.out.println("성공");
		    }

		    return "products/productDetail";
		}
	
	
	// 상품 상세페이지
	@GetMapping("ProductDetail")
	public String productDetail(@RequestParam Map<String, String> map , MemberVO member, Model model) {
		
		System.out.println(">>>>>>>>>>> 무엇이 넘어 왔는가!! : " + map);
		
		
		Map<String, String> Product = service.selectProduct(member);
		List<Map<String,Object>> Product2 = service.selectProduct2(member);
		


        
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
		
		for(Map<String, Object> datetime : Product2) {
			LocalDateTime comDateTime = LocalDateTime.parse(datetime.get("product_datetime").toString().replace('T', ' '), formatter);
        	
            long minutes = Duration.between(comDateTime, now).toMinutes();
            long hours = minutes / 60;
            long days = hours / 24;
            hours %= 24;
            minutes %= 60;
            String timeAgo = "";
            if (days > 0) { // 하루이상 차이날 때
                if (comDateTime.getYear() == now.getYear()) {
                    timeAgo = comDateTime.format(formatterMonthDay);
                } else {
                    timeAgo = comDateTime.format(formatterDate);
                }
            } else if (hours > 0 && hours < 24) { // 1 ~ 23시간이 차이날 때
                timeAgo = hours + "시간 전";
            } else if (minutes > 0) { // 1 ~ 59분이 차이날 때
                timeAgo = minutes + "분 전";
            } else {
                timeAgo = "방금 전";
            }
            // 계산한 시간 목록
            datetime.put("product_datetime", timeAgo);
		}
		
		
		
		System.out.println(">>>>>>>>>>>>> 잘넘어왔는가 : " + Product);
		System.out.println(">>>>>>>>>>>>> 이건 잘잘넘어왔는가 : " + Product2);
		model.addAttribute("Product", Product);
		model.addAttribute("Product2", Product2);
	
		return "products/productDetail";
	}
	
	
	// 상품 제안하기 
	@GetMapping("Proposal")
	public String Proposal() {
		
		return"products/Proposal";
	}
	
	// 제안 상품 가격 채팅으로 전달
	
	// 지도로 찾기
	@GetMapping("AddressMap")
	public String AddressMap() {
	
		return"products/AddressMap";
	}
	
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



















