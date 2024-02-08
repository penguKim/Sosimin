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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c5d2308t1_2.service.LevelService;
import com.itwillbs.c5d2308t1_2.service.ProductService;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.PageInfo;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;


@Controller
public class ProductController {
    
	@Autowired
	ProductService service;
	@Autowired
	LevelService levelService;
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
		
		DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
		
		for(Map<String, Object> datetime : productList) {
			LocalDateTime comDateTime;
//			System.out.println(datetime);
			// datetime 초가 00초인 경우 오류 판별을 위한 if문
			if(datetime.get("product_datetime").toString().split(":").length > 2) {
				comDateTime = LocalDateTime.parse(datetime.get("product_datetime").toString().replace('T', ' '), formatter1);
			} else {
				comDateTime = LocalDateTime.parse(datetime.get("product_datetime").toString().replace('T', ' '), formatter2);
			}
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
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>> 리스트" + productList);
//		System.out.println(">>>>>>>>>>>>>>>>>>>> 페이징" + jPage);
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> : " + jsonArray);
		
		return jsonArray.toString();
	}
	
	// 좋아요 상품 목록
	@ResponseBody
	@GetMapping("ProductLikeList")
	public String productLikeList(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		map.put("member_id", sId);
		System.out.println(">>>>>>>>>>>>>>>>> 저장 후 맵 : " + map);
		if(sId != null) {
			List<Map<String, Object>> likeList = service.getLikeList(map);
			System.out.println(">>>>>>>>>>>>>>>>> 관심 목록 : " + likeList);
			JSONArray jo = new JSONArray(likeList);
			System.out.println(">>>>>>>>>>>>>>>>>>>> : jo " + jo);
			return jo.toString();
		}
		System.out.println("관심 목록이 없습니다!");
		return "[]";
	}
	
	
	// 상품 좋아요 
	@ResponseBody
	@GetMapping("ProductLikeRegist")
	public String productLikeRegist(@RequestParam Map<String, String> interest, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		System.out.println("상품 아이디 : " + interest);
		System.out.println("세션 아이디 : " + sId);
		if(sId == null) {
			System.out.println("아이디가 없습니다!");
			return "login";
		} 
		System.out.println("널이면 안나와야지 씨ㅏ");
		interest.put("member_id", sId);
		String isChecked = service.getInterst(interest);
		JSONObject object = new JSONObject();
		System.out.println(">>>>>>>>>>>>>> : " + isChecked);
		object.put("isChecked", isChecked);
		
		return object.toString();
	}
	
	
	// =============================== 관리자 페이지
	// 등록 상품 목록
	@GetMapping("ProductList")
	public String productList(HttpSession session, Model model) {
		List<Map<String, Object>> productList = service.adminProductList();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>" + productList);
		
		model.addAttribute("productList", productList);
		
		return "admin/productList";
	}
	
	@GetMapping("ProductListDetail")
	public String productListDetail() {
		
		return "admin/productListDetail";
	}
	
	// ======================================================================================================
	
	// 상품 등록 페이지로 이동
		@GetMapping("ProductRegist")
		public String productRegist(@RequestParam Map<String, String> map, HttpSession session, Model model) {
			
			String sId = (String)session.getAttribute("sId");
			if(sId == null) {
				model.addAttribute("msg", "로그인이 필요합니다!");
				model.addAttribute("msg2", "로그인 후 판매하기 페이지로 이동합니다");
				model.addAttribute("msg3", "warning");
				// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
				model.addAttribute("targetURL", "MemberLogin");
				return "forward";
			}
			
				map.put("sId", sId);
				int payStatus = service.selectPayStatus(map);
				model.addAttribute("payStatus", payStatus);
				
				System.out.println("payStatus : " + payStatus);
			return "products/productRegist";
		}


		@ResponseBody
		@PostMapping("ProductRegistSuccess")
		public String productRegistSuccess(@RequestParam Map<String, String> map, HttpSession session, Model model, 
											HttpServletRequest request, @RequestParam("product_image") MultipartFile[] files) {
			
			
			
			
			String sId = (String)session.getAttribute("sId");
			map.put("sId", sId);
			
			System.out.println(" 뭐 들었어 " );
			
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
		    
		    levelService.updateProExp(map); // 경험치 증가
		    
		    
		    System.out.println("너는 ㅜㅁ가 들엇어어어어어어어어어엉 : "  + successInsert);
		    
		    return String.valueOf(successInsert);
		}


		// 상품 상세페이지
				@GetMapping("ProductDetail")
				public String productDetail(@RequestParam Map<String, String> map , MemberVO member, Model model, HttpSession session, String tag_name, String product_name) {
					
					
//					System.out.println(" 나는 프로 덕트다 " + product);
					
					String sId = (String)session.getAttribute("sId");
					
					System.out.println(">>>>>>>>>>>>>>>>너 프로덕트아이디임?: " + map);
					
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
					// 판매자판매 상품 조회
					List<Map<String,String>> SellerProductInfo = service.selectSellerProductInfo(SellerInfo);
					// 판매자상품 상품 갯수 조회
					String member_id = SellerInfo.get("member_id");
					int SellerProductCount = service.selectSellerProductCount(member_id);
					// 조회수 증가 여부
					Map<String, Object> count = new HashMap<String, Object>();
					count = service.getCount(map,true);
					// 페이 미가입자 판별 여부
					int payStatus = service.selectPayStatus(map);
					
					Map<String,String> guDong = service.getGuDong(map);
					
					System.out.println(" >>>>>>>>>>>>>>>> 몇개 들었노: " + SellerProductCount);
					System.out.println(" >>>>>>>>>>>>>>>> 판매자정보 : " + SellerInfo);
					System.out.println(" >>>>>>>>>>>>>>>> 판매자상품정보 : " + SellerProductInfo);
					LocalDateTime now = LocalDateTime.now();
			        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
					
					for(Map<String, Object> datetime : Product2) {
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
//								model.addAttribute("RelatedProducts", RelatedProducts);
								model.addAttribute("intersetCount", intersetCount);
								model.addAttribute("SellerInfo", SellerInfo);
//								model.addAttribute("SellerProductInfo", SellerProductInfo);
								model.addAttribute("SellerProductCount", SellerProductCount);
								model.addAttribute("count", count);
								model.addAttribute("guDong", guDong);
								model.addAttribute("payStatus", payStatus);
								// 리스트를 무작위로 섞어 조회한 상품중 랜덤한 값 뿌리기
								
								RelatedProducts = service.selectRelatedProducts(Product);
								Collections.shuffle(RelatedProducts); // 
								if (RelatedProducts.size() > 5) {
								    RelatedProducts = RelatedProducts.subList(0, 5); // 5개의 요소만 남긴다.
								}
								model.addAttribute("RelatedProducts", RelatedProducts);
								
								System.out.println("카운트엔 뭐가 들었지! :" + count);
								System.out.println("구 동 들어있니 ? : " + guDong);
								System.out.println("payStatus : " + payStatus);
								// 랜덤한 값의 이미지 뿌리기
								Collections.shuffle(SellerProductInfo); 
								if (SellerProductInfo.size() > 2) {
								    SellerProductInfo = SellerProductInfo.subList(0, 2); // 첫 두 개의 요소만 남긴다.
								}
								model.addAttribute("SellerProductInfo", SellerProductInfo);
								
								
					return "products/productDetail";
				}
				
				// 상품 수정 페이지
				@GetMapping("ProductModify")
				public String productModify(HttpSession session, @RequestParam Map<String, String> map, Model model) {
					
					System.out.println(" ======================> 뭐가들었지 : " + map);
					String sId = (String)session.getAttribute("sId");
					if(sId == null) {
						model.addAttribute("msg", "로그인이 필요합니다!");
						model.addAttribute("msg2", "로그인 후 판매하기 페이지로 이동합니다");
						model.addAttribute("msg3", "warning");
						// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
						model.addAttribute("targetURL", "MemberLogin");
						return "forward";
					}
				    map.put("tag_name1", "#" + map.get("tag_name1"));
				    map.put("tag_name2", "#" + map.get("tag_name2"));
				    map.put("tag_name3", "#" + map.get("tag_name3"));
				    map.put("tag_name4", "#" + map.get("tag_name4"));
				    
					Map<String, String> productModify = service.selectProductModify(map);
					Map<String,String> guDong = service.getGuDong(map);
					
					productModify.put("sId", productModify.get("member_id"));
					System.out.println("productModify 아이디 : " + productModify.get("member_id"));
					
					int payStatus = service.selectPayStatus(productModify);
					
					model.addAttribute("payStatus", payStatus);
					System.out.println("payStatus : " + payStatus);
					System.out.println("<<<<<<<<<<<<<< 뭐가 돌아왔지 " + productModify);
					model.addAttribute("guDong", guDong);
					model.addAttribute("productModify", productModify);
					return "products/productModify";
				}
				
				// 상품 삭제 페이지
				@PostMapping("ProductDelete")
				public String productDelete(HttpSession session, Model model, @RequestParam Map<String,String> map, MemberVO member) {
					// C:\wordspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Sosimin\resources\ upload\2024\02\04
					// D:\workspace_sts\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Sosimin\resources\ upload\
					String sId = (String)session.getAttribute("sId");
					if(sId == null) {
						model.addAttribute("msg", "로그인이 필요합니다!");
						// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
						model.addAttribute("targetURL", "MemberLogin");
						return "forward";
					}
					
					map = service.selectProduct(member);
					
					int deleteCount = service.removeProduct(map);
					
					System.out.println("여기엔 뭐가 들었지? 삭제하기전에는?" + map);
					System.out.println(" 삭제에 성공했니? " + deleteCount);
					if(deleteCount > 0) {
//						String[] arrFileNames = {map.get("product_image1").toString(), map.get("product_image2").toString(), 
//								map.get("product_image3").toString(), map.get("product_image4").toString(), map.get("product_image5").toString()};
						
						// for 문을 활용하여 배열 반복
						String[] arrFileNames = new String[5];
						System.out.println("이미지가 안에 저장되있는건가 ??" + arrFileNames);
						for (int i = 0; i < 5; i++) {
							String key = "product_image" + (i + 1);
							if (map.get(key) != null) {
								arrFileNames[i] = map.get(key).toString();
							} else {
								arrFileNames[i] = "";
							}
						}
						try {
							// -------------------------------------------------------------
							// [ 서버에서 파일 삭제 ]
							// 실제 업로드 경로 알아내기
							String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
							String saveDir = session.getServletContext().getRealPath(uploadDir);
							// -----------------------------------------------------------
							
							for(String fileName : arrFileNames) {
								if(!fileName.equals("") || fileName != null) {
									Path path = Paths.get(saveDir + "/" + fileName);
									Files.deleteIfExists(path);
								}
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
						return "redirect:/";
					}else {
						return "";
					}
				}
				
				@PostMapping("ProductModifySuccess")
				@ResponseBody
				public String productModifySuccess(@RequestParam Map<String, String> map ,@RequestParam(value = "product_image", required = false) MultipartFile[] files, @RequestParam(value = "delete_image", required = false) String deleteImageStr, HttpSession session, Model model) {
				    Map<String,String> product = service.getProductimage(map);

				    String sId = (String)session.getAttribute("sId");
				    if(sId == null) {
				        model.addAttribute("msg", "로그인이 필요합니다!");
				        model.addAttribute("targetURL", "MemberLogin");
				        return "forward";
				    }
				    
				    
				    String uploadDir = "/resources/upload";
				    String saveDir = session.getServletContext().getRealPath(uploadDir);
				    String subDir = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
				    saveDir += File.separator + subDir;

				    List<String> images = new ArrayList<>();
				    for (int i = 1; i <= 5; i++) {
				        if (product.get("product_image" + i) != null) {
				            images.add(product.get("product_image" + i));
				        }
				    }
				    
				    System.out.println("뭐가 받아와졌죠?  " + map );
				    System.out.println("삭제 할때 뭐가넘어왔노! : " + deleteImageStr);
				    System.out.println("삭제 할때 뭐가넘어왔노2! : " + files);

				    int[] deleteImages = null;
				    if (deleteImageStr != null && !deleteImageStr.isEmpty()) {
				        deleteImages = Arrays.stream(deleteImageStr.split(","))
				                                .mapToInt(Integer::parseInt)
				                                .toArray();
				    }
				    if (deleteImages != null && deleteImages.length > 0) {
				        Arrays.sort(deleteImages);
				        for (int i = deleteImages.length - 1; i >= 0; i--) {
				            if (deleteImages[i] - 1 < images.size() && deleteImages[i] - 1 >= 0) {
				                String imagePath = images.remove(deleteImages[i] - 1);

				                saveDir = session.getServletContext().getRealPath("/resources/upload");
				                Path path = Paths.get(saveDir + "/" + imagePath);
				                try {
				                    Files.deleteIfExists(path);
				                } catch (IOException e) {
				                    e.printStackTrace();
				                }
				            }
				        }
				    }
				    if (files != null) {
				        for (MultipartFile file : files) {
				            if (!file.isEmpty()) {
				                String originalName = file.getOriginalFilename();
				                String fileName = UUID.randomUUID().toString().substring(0,8) + "_" + originalName;
				                String filePath = saveDir + File.separator + fileName;
				                try {
				                    file.transferTo(new File(filePath));
				                    int uploadIndex = filePath.indexOf("upload");
				                    if (uploadIndex != -1) {
				                        String relativePath = filePath.substring(uploadIndex + "upload".length() + 1);
				                        images.add(relativePath);  // 이 부분이 이미지를 추가하는 부분입니다.
				                    }
				                } catch (IllegalStateException | IOException e) {
				                    e.printStackTrace();
				                }
				            }
				        }
				    }

				    for (int i = 0; i < 5; i++) {
				        if (i < images.size()) {
				            map.put("product_image" + (i + 1), images.get(i));
				        } else {
				            map.put("product_image" + (i + 1), null);
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
				    
				    if (map.get("tag_name1") != null) {
				    	  map.put("tag_name1", "#" + map.get("tag_name1"));
				    	}
				    	if (map.get("tag_name2") != null) {
				    	  map.put("tag_name2", "#" + map.get("tag_name2"));
				    	}
				    	if (map.get("tag_name3") != null) {
				    	  map.put("tag_name3", "#" + map.get("tag_name3"));
				    	}
				    	if (map.get("tag_name4") != null) {
				    	  map.put("tag_name4", "#" + map.get("tag_name4"));
				    	}
				    
					System.out.println("태그네임은 뭐가들었어 : " + map.get("tag_name1"));
					System.out.println(map.get("tag_name2"));
					System.out.println(map.get("tag_name3"));
					System.out.println(map.get("tag_name4"));
					
				    int modifyOk = service.updateProduct(map);
				    
				    System.out.println(modifyOk);
					System.out.println("뭔가가 넘어오긴 한걸까? : " + map);
					model.addAttribute("modifyOk", modifyOk);
					System.out.println("여긴 뭐가 넘어왔을까!!!!!!!!!!!!! : " + product);
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
	// 가격 제안하기 
	@GetMapping("Proposal")
	public String Proposal(@RequestParam Map<String,String> map, MemberVO member, Model model, HttpSession session) {
	// 상품 조회

	String sId = (String)session.getAttribute("sId");
	if(sId == null) {
	    model.addAttribute("msg", "로그인 후 사용 가능합니다.");
	    model.addAttribute("targetURL", "MemberLogin");
	    return "forward";
	}

	Map<String,String> Product = service.selectProduct(member);
	model.addAttribute("Product", Product);
	return"products/Proposal";
	}

	// 제안 상품 가격 채팅으로 전달

	// 지도로 찾기
	@GetMapping("AddressMap")
	public String AddressMap() {

	return"products/AddressMap";
	}



	}	