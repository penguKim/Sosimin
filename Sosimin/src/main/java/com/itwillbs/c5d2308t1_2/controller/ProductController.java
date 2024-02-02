package com.itwillbs.c5d2308t1_2.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
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

import lombok.ToString;

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
		String id = (String)session.getAttribute("sId");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> 저장 전" + map);
		
		map.put("sId", id);
		map.put("pageNum", pageNum);
		// ==========================================================
		// 가격 선택 별 조회
		if(map.get("price").equals("500000") ) {
			System.out.println("50000오십만원");
			map.put("minPrice", map.get("price"));
			map.put("maxPrice", "999999999");
		} else if(map.get("price") != "") {
			map.put("minPrice", ((String)map.get("price")).split("~")[0]); 
			map.put("maxPrice", ((String)map.get("price")).split("~")[1]); 
		}
		
		// ============================================================
		// 상품 상태 선택 시 배열 저장 후 다시 status 에 각각 저장
		String[] statusArr = null;
		if(!map.get("status").equals("")) {
			statusArr = ((String)map.get("status")).split(",");
			for(int i = 0; i < statusArr.length; i++) {
				map.put("status" + (i + 1), statusArr[i]);
			}
		}
		
		// =============================================================
		
		
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> 저장 후" + map);
		System.out.println(">>>>>>>>>>>>>>>>>>>>페이지 넘버 : " + pageNum);
		
		
		List<Map<String, Object>> productList = null;
		 
		// ====================페이징 처리 ===============================================================
		PageDTO page = new PageDTO(pageNum, 16);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 맵 페이지" + page);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 맵 페이지" + map.get("pageNum"));
		int listCount = service.getProductListCount(map); // 상품 목록 갯수조회
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>" + listCount);
		PageInfo pageInfo = new PageInfo(page, listCount, 5);
		map.put("page", page);
		// ===============================================================================================
		// 상품 목록 출력
		productList = service.selectProductList(map);
		
		// 상품 등록 시간 계산 처리 
		// ===============================================================================================
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
		
		for(Map<String, Object> datetime : productList) {
//			System.out.println(datetime);
			
			LocalDateTime comDateTime = LocalDateTime.parse(datetime.get("product_datetime").toString().replace('T', ' '), formatter);
			Duration duration = Duration.between(comDateTime, now);
			
			Period period = Period.between(comDateTime.toLocalDate(), now.toLocalDate());

			
            long minutes = duration.toMinutes() % 60;
            long hours = duration.toHours() % 24;
            long days = duration.toDays() % 7;
            long weeks = duration.toDays() / 7;
            long months = period.getMonths();
            long years = period.getYears();
            
            String timeAgo = "";
            if(years > 0) {
            	timeAgo = years + "년 전";
            } else if(months > 0) {
            	timeAgo = months + "개월 전";
            } else if(weeks > 0 && weeks <= 4) {
            	timeAgo = weeks + "주전";
			} else if (days > 0 && days < 7) { // 1 ~ 7 차이날 때
                timeAgo = days + "일전";
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
		System.out.println(">>>>>>>>>>>>>>>>>>> 페이지넘 라스트" + pageNum);
		// ===============================================================================================
		JSONArray jsonArray = new JSONArray();
		jsonArray.put(productList);
		
		JSONObject jPage = new JSONObject(pageInfo); 
		jsonArray.put(jPage);
		jsonArray.put(pageNum);
//		System.out.println(">>>>>>>>>>>>>>>>>>>>> 리스트" + productList);
//		System.out.println(">>>>>>>>>>>>>>>>>>>> 페이징" + jPage);
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> : " + jsonArray);
		
		return jsonArray.toString();
	}
	
	
	
	// 상품 등록 페이지로 이동
		@GetMapping("ProductRegist")
		public String productRegist(@RequestParam Map<String, String> map, HttpSession session, Model model ) {
			
			String sId = (String)session.getAttribute("sId");
			if(sId == null) {
				model.addAttribute("msg", "로그인이 필요합니다!");
				model.addAttribute("msg2", "로그인 후 판매하기 페이지로 이동합니다");
				model.addAttribute("msg3", "warning");
				// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
				model.addAttribute("targetURL", "MemberLogin");
				return "forward";
			}
			
			return "products/productRegist";
		}
	

		@ResponseBody
		@PostMapping("ProductRegistSuccess")
		public String productRegistSuccess(@RequestParam Map<String, String> map, HttpSession session, Model model, 
											HttpServletRequest request, @RequestParam("product_image") MultipartFile[] files) {
			
//			@PostMapping("ProductRegistSuccess")
//			public ResponseEntity<Map<String, Object>> productRegistSuccess(@RequestParam Map<String, String> map, HttpSession session, Model model, 
//												HttpServletRequest request, @RequestParam("product_image") MultipartFile[] files) {
			
			// C:\wordspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Sosimin\resources\ upload\
			
			System.out.println("뭐 받아와짐 >>>>>>>>>>> :" + map.get("product_status"));
			System.out.println("뭐 받아와쥠 >>>>>>>>>>> :" + map.get("trade_method"));
			
			System.out.println(map);
			
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
		                String key = (i == 0) ? "product_image1" : "product_image" + (i + 1);
		                map.put(key, relativePath); // 파일 경로를 map에 추가
		            }
		        } catch (IllegalStateException | IOException e) {
		            e.printStackTrace();
		        }
		    }
		    
//		    product.setWriter_ip(request.getRemoteAddr());
		    
		    map.put("tag_name1", "#" + map.get("tag_name1"));
		    map.put("tag_name2", "#" + map.get("tag_name2"));
		    map.put("tag_name3", "#" + map.get("tag_name3"));
		    map.put("tag_name4", "#" + map.get("tag_name4"));
		    
		    
		    
		    String product_price =  map.get("product_price").replace(",", ""); // 받아온 money값 ,때기
//		    
//		    StringBuilder tagNameBuilder = new StringBuilder(); // 태그 이름을 저장할 StringBuilder 객체 생성
//		    for (int i = 1; i <= 4; i++) {
//		        String tagNameKey = "tag_name" + i; // 태그 이름을 가져올 맵의 키 생성 (예: "tag_name1")
//		        String tagNameValue = map.get(tagNameKey); // 맵에서 태그 이름 값 가져오기
	//
//		        if (tagNameValue != null) {
//		            tagNameBuilder.append("#" + tagNameValue + " "); // 태그 이름이 null이 아닐때 추가 (문자열 결합사용)
//		        }
//		    }
//		    
//		    String tag_name = tagNameBuilder.toString(); // null이 아닐시 받아온 태그값 tag_name에 저장

		    
		    
		    String address = map.get("trade_place"); // 가져온 주소값 
		    String[] addressSplit = address.split(" "); // 공백으로 나눈다
		    String gu = addressSplit[1]; // 구 가져오기
		    String dong = addressSplit[2]; // 동 가져오기

//		    map.put("tag_name", tag_name); 
		    map.put("product_price" , product_price);
		    map.put("gu", gu);
		    map.put("dong", dong);
		    
		    
//		    int productId = sqlSessionTemplate.insert("com.itwillbs.c5d2308t1_2.mapper.ProductMapper.productInsert", map);
//		    if (productId > 0) {
//		        System.out.println("성공");
//		    }

//			Map<String, Object> response = new HashMap<>();
//			response.put("redirect", "ProductDetail");
//			response.put("productId", productId);
	//
//			return ResponseEntity.ok(response);
		    
		    
		    int successInsert = service.productRegist(map);
		    
		    System.out.println("너는 ㅜㅁ가 들엇어어어어어어어어어엉 : "  + successInsert);
		    
		    return String.valueOf(successInsert);
		}
	
	
		// 상품 상세페이지
				@GetMapping("ProductDetail")
				public String productDetail(@RequestParam Map<String, String> map , MemberVO member, Model model, HttpSession session, String tag_name, String product_name) {
					
					
					String sId = (String)session.getAttribute("sId");
					
					System.out.println("뭐 받아와짐 >>>>>>>>>>> :" + map.get("product_status"));
					System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>너 프로덕트아이디임?: " + map);
					
					member.setMember_id(sId);
					// 전체상품 조회
//					List<Map<String, String>> allProduct = service.selectAllProduct();
					
//					System.out.println("전체상품엔 뭐가 들었을까: " + allProduct);
					
					// 상품정보 위한 조회
					Map<String, String> Product = service.selectProduct(member);
					// 날짜를 뿌리기 위한 조회
					List<Map<String,Object>> Product2 = service.selectProduct2(member);
					// 연관상품을 뿌리기 위한 조회
					List<Map<String,Object>> RelatedProducts = service.selectRelatedProducts(Product);
					System.out.println("------------------연관상품 : " + RelatedProducts);
			        // 판매자정보 조회
					Map<String,String> SellerInfo = service.selectSellerInfo(map);
					
					System.out.println(" >>>>>>>>>>>>>>>> 판매자정보 : " + SellerInfo);
					
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
					
					// 관심 갯수 불러오기
								ProductVO product = new ProductVO();
								product.setProduct_id(Integer.parseInt(map.get("product_id")));
								int intersetCount = service.getInterestCount(product);
								
								System.out.println(" 몇개가 들었는데ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ " + intersetCount);
								
								System.out.println(Product.get("tag_name"));
								System.out.println(Product.get("product_name"));
								
								System.out.println(">>>>>>>>>>>>> 잘넘어왔는가 : " + Product);
								System.out.println(">>>>>>>>>>>>> 이건 잘잘넘어왔는가 : " + Product2);
								model.addAttribute("Product", Product);
								model.addAttribute("Product2", Product2);
								model.addAttribute("RelatedProducts", RelatedProducts);
								model.addAttribute("intersetCount", intersetCount);
								model.addAttribute("SellerInfo", SellerInfo);
							
					return "products/productDetail";
				}
				
				// 상품 수정 페이지
				@GetMapping("productModify")
				public String productModify(HttpSession session, @RequestParam Map<String, String> map, Model model) {
					
					System.out.println(" ======================> 뭐가들었지 : " + map);
					
					Map<String, String> productModify = service.selectProductModify(map);
					
					System.out.println("<<<<<<<<<<<<<< 뭐가 돌아왔지 " + productModify);
					
					model.addAttribute("productModify", productModify);
					return "products/productModify";
				}
				
				@ResponseBody
				@PostMapping("ProductModifySuccess")
				public String productModifySuccess(@RequestParam Map<String, String> map ,@RequestParam("product_image") MultipartFile[] files, HttpSession session, Model model) {
					
					String sId = (String)session.getAttribute("sId");
					if(sId == null) {
						model.addAttribute("msg", "로그인이 필요합니다!");
						// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
						model.addAttribute("targetURL", "MemberLogin");
						return "forward";
					}
					
					
					for(MultipartFile file : files) {
						System.out.println(" 무엇이 들었을 까 " + file);
					};
				    String uploadDir = "/resources/upload";
				    String saveDir = session.getServletContext().getRealPath(uploadDir);

				    // 서브 디렉토리
			 		String subDir = "";
				    
				    LocalDate now = LocalDate.now();
				    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
				   subDir = now.format(dtf);

				    saveDir += File.separator + subDir;

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
				                String key = (i == 0) ? "product_image1" : "product_image" + (i + 1);
				                map.put(key, relativePath); // 파일 경로를 map에 추가
				            }
				        } catch (IllegalStateException | IOException e) {
				            e.printStackTrace();
				        }
				    }
				    
				    String product_price =  map.get("product_price").replace(",", "");
				    String address = map.get("trade_place"); // 가져온 주소값 
				    String[] addressSplit = address.split(" "); // 공백으로 나눈다
				    String gu = addressSplit[1]; // 구 가져오기
				    String dong = addressSplit[2]; // 동 가져오기
				    map.put("product_price" , product_price);
				    map.put("gu", gu);
				    map.put("dong", dong);
				    
				    
				    int modifyOk = service.updateProduct(map);
				    
				    System.out.println(modifyOk);
					System.out.println("뭔가가 넘어오긴 한걸까? : " + map);
					model.addAttribute("modifyOk", modifyOk);
					
					String product_id = map.get("product_id");
					
					return String.valueOf(product_id);
				}
				
				// 상품 관심 불러오기 AJAX
				@ResponseBody
				@PostMapping("interestShow")
				public String interestShow(@RequestParam Map<String,String> interest, HttpSession session) {
					String sId = (String)session.getAttribute("sId");
					
					if(sId != null) {
						interest.put("member_id", sId);
						interest = service.getMemberInterest(interest);
						System.out.println("회원의 관심은 : " + interest);
						
						JSONObject object = new JSONObject(interest);
						System.out.println("오브젝트는 뭔가요 : " + object);
						
						return object.toString();
					}
					return "{}";
				}
				
				// 관심 체크를 위한 AJAX
				@ResponseBody
				@PostMapping("interestCheck")
				public String interestCheck(@RequestParam Map<String, String> interest, HttpSession session) {
					
					
					System.out.println("여기엔 뭐가 들었나?" + interest);
					
					String sId = (String)session.getAttribute("sId");
					
					if(sId == null) {
						return "login";
					}
					interest.put("member_id", sId);
					
					// 관심 판별 수행 후 문자열 리턴
					String isChecked = service.getInterst(interest);
					
					System.out.println("저장후엔 뭐가 들었나 : " + interest);
					
					// 관심 갯수 불러오기
					ProductVO product = new ProductVO();
					product.setProduct_id(Integer.parseInt(interest.get("product_id")));
					int intersetCount = service.getInterestCount(product);
					
					System.out.println(" 몇개가 들었노 : " + intersetCount);
					JSONObject object = new JSONObject();
					object.put("isChecked", isChecked);
					object.put("intersetCount", intersetCount);
					
					return object.toString();
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



















