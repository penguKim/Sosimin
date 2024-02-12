package com.itwillbs.c5d2308t1_2;

import java.text.DateFormat;
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
		
		
		return "admin/adminMain";
	}
	
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
		System.out.println("111111111111111111111111111111111111111111");
		// 점유율 차트
		List<Map<String, Object>> communityGuCount = adminService.communityGuCount();
		
		JSONArray array = new JSONArray();
		array.put(communityGuCount);
		log.info(" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> :  커뮤니티 목록 : " + array);
		
		return array.toString();
	}

}
