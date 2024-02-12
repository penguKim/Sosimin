package com.itwillbs.c5d2308t1_2;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.c5d2308t1_2.service.AdminService;
import com.itwillbs.c5d2308t1_2.service.SosimhamService;

import lombok.Getter;

@Controller
public class HomeController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "main";
	}
	
	@GetMapping("AdminMain")
	public String adminMain(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		
		// 최근 상품 목록
		List<Map<String, Object>> recentProductList = adminService.getRecentProduct();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>> recentProductList : " + recentProductList);
		model.addAttribute("recentProductList", recentProductList);
		
		
		return "admin/adminMain";
	}
	
	
	// 카테고리 점유율 차트
	@ResponseBody
	@GetMapping("Chart")
	public String chartList() {
		System.out.println("111111111111111111111111111111111111111111");
		// 점유율 차트
		List<Map<String, Object>> categoryShareChart = adminService.categoryShare();
		
		JSONArray ja = new JSONArray();
		ja.put(categoryShareChart);
		log.info(" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> :  차트 목록" + ja);
		
		return ja.toString();
	}
	

	
	@ResponseBody
	@GetMapping("CommunityChart")
	public String comChart() {
		// 점유율 차트
		List<Map<String, Object>> communityGuCount = adminService.communityGuCount();

		JSONArray array = new JSONArray();
		array.put(communityGuCount);
		
		return array.toString();
	}
	
	// 일일 상품 카운트 차트
	@ResponseBody
	@GetMapping("ProductCount")
	public String productCount() {
		Map<String, String> map = adminService.getDailyProductCount();
		
		JSONObject object = new JSONObject(map);
		
		return object.toString();
	}
	
	// 일일 결제 카운트 차트
	@ResponseBody
	@GetMapping("OrderCount")
	public String orderCount() {
		Map<String, String> map = adminService.getDailyOrderCount();
		
		JSONObject object = new JSONObject(map);
		
		return object.toString();
	}
	
	// 일일 결제 금액 차트
	@ResponseBody
	@GetMapping("PriceCount")
	public String priceCount() {
		Map<String, String> map = adminService.getDailyPriceCount();
		
		JSONObject object = new JSONObject(map);
		
		return object.toString();
	}
	
	// 일일 신고 카운트 차트
	@ResponseBody
	@GetMapping("ReportCount")
	public String reportCount() {
		Map<String, String> map = adminService.getDailyReportCount();
		
		JSONObject object = new JSONObject(map);
		
		return object.toString();
	}
	
	// 메인 7일 통계 차트
	@ResponseBody
	@GetMapping("MainReports")
	public String mainReports() {
		
		List<Map<String, Object>> reportList = adminService.getReports();
		
		List<String> dates = new ArrayList<String>(); // 날짜 리스트
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<String> productCounts = new ArrayList<String>(); // 상품등록 리스트
		List<String> orderCounts = new ArrayList<String>(); // 결제횟수 리스트
		List<String> reportCounts = new ArrayList<String>(); // 신고횟수 리스트
		
		for(Map<String, Object> list : reportList) {
			Date date = (Date)list.get("date");
			dates.add(sdf.format(date));
			productCounts.add(String.valueOf(list.get("product_count")));
			orderCounts.add(String.valueOf(list.get("order_count")));
			reportCounts.add(String.valueOf(list.get("report_count")));
		}
		
//		JSONArray array = new JSONArray();
//		array.put(dates);
//		array.put(productCounts);
//		array.put(orderCounts);
//		array.put(reportCounts);
		JSONObject object = new JSONObject();
		object.put("dates", dates);
		object.put("productCounts", productCounts);
		object.put("orderCounts", orderCounts);
		object.put("reportCounts", reportCounts);
		
		
		return object.toString();
		
	}
	
	
	
	
	
}
