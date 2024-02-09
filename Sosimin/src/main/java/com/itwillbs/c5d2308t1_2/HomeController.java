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
		
		List<Map<String,String>> searchList = service.getSearchList();
		System.out.println("조회한 인기검색어 20개 : " + searchList);
		//조회한 인기검색어 20개 :
		//[{search_content=고야드, search_count=179}, {search_content=스투시, search_count=123}, {search_content=질스튜어트, search_count=120}, {search_content=뉴발란스, search_count=110}, {search_content=닥터마틴, search_count=103}, {search_content=꼼데가르송, search_count=101}, {search_content=나이키, search_count=100}, {search_content=아식스, search_count=30}, {search_content=아이앱, search_count=30}, {search_content=아디다스, search_count=20}, {search_content=아식스 젤 카야노, search_count=10}, {search_content=아디다스 슈퍼스타, search_count=3}, {search_content=아디다스 웨일즈보너, search_count=2}, {search_content=아디다스 트랙탑, search_count=1}, {search_content=아디다스 스페지알, search_count=0}, {search_content=아크테릭스, search_count=0}, {search_content=아디다스 져지, search_count=0}, {search_content=아디다스 가젤, search_count=0}, {search_content=아디다스 삼바, search_count=0}]
		List<String> contentArr = new ArrayList<>();
		for(Map<String, String> i:searchList) {
			System.out.println(i.get("search_content"));
			contentArr.add("'"+i.get("search_content")+"'");
		}
		System.out.println("새로만든 리스트 : " + contentArr);
		model.addAttribute("contentArr",contentArr);
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
	
	@Autowired
	private SosimhamService service; 
	
	@ResponseBody
	@GetMapping("RelationSearchKeyWord")
	public List<String> relationSearchKeyWord(@RequestParam String searchKeyWord) {
		log.info("입력한 검색어 : " + searchKeyWord);
		List<String> relationKeyWord = service.getRelationKeyWord(searchKeyWord);
		log.info("조회한 연관검색어 : " + relationKeyWord);
		
		return relationKeyWord;
	}
	
	@GetMapping("FindMyPage")
	public String findStore(@RequestParam String q) {
		log.info("조회할 닉네임 : " + q);
		String member_id = service.getMemberid(q);
		log.info("조회한 멤버아이디 : " + member_id);
		return "redirect:/SellerInfo?member_id="+member_id;
	}
	
	@GetMapping("NowSearchList")
	public String nowSearchList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		List<Map<String,String>> searchList = service.getSearchList();
		model.addAttribute("searchList",searchList);
		log.info("실시간 인기검색어 TOP20 : " + searchList);
		return "admin/nowSearchList";
	}

}
