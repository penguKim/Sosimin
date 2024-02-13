package com.itwillbs.c5d2308t1_2.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.c5d2308t1_2.HomeController;
import com.itwillbs.c5d2308t1_2.service.SosimhamService;

@Controller
public class MainPageController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SosimhamService service; 
	
	@ResponseBody
	@GetMapping("RelationSearchKeyWord")
	public List<String> relationSearchKeyWord(@RequestParam String searchKeyWord) {
		
		searchKeyWord = searchKeyWord.trim();
		
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
		if(member_id == null) {
			return "sosimham/NoSearchResult";
		}
		return "redirect:/SellerInfo?member_id="+member_id;
	}
	
	@GetMapping("TotalSearchList")
	public String nowSearchList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		List<Map<String,String>> searchList = service.getSearchList();
		
		model.addAttribute("searchList",searchList);
		log.info("실시간 인기검색어 TOP20 : " + searchList);
		return "admin/totalSearchList";
	}
	
	@GetMapping("DaySearchList")
	public String daySearchList() {
		return "admin/daySearchList";
	}

	@GetMapping("TimeSearchList")
	public String timeSearchList() {
		return "admin/timeSearchList";
	}
	
	@ResponseBody
	@GetMapping("SaveSearchKeyword")
	public String saveSearchKeyword(@RequestParam String keyword) {
		keyword = keyword.trim();
		int insertCount = service.saveKeyword(keyword);
		
		return"";
		
	}
	
	@ResponseBody
	@GetMapping("deleteKeyword")
	public String deleteKeyword(@RequestParam String content) {
		int updateCount = service.updateKeyword(content);
		return "";
	}
	
	@ResponseBody
	@GetMapping("popularSearchKeywordList")
	public JSONArray popularSearchKeywordList() {
		
		List<Map<String,String>> searchList = service.getSearchList();
		System.out.println("조회한 인기검색어 20개 : " + searchList);
		List<String> contentArr = new ArrayList<>();
		for(Map<String, String> i:searchList) {
			System.out.println(i.get("search_content"));
			contentArr.add("'"+i.get("search_content")+"'");
		}
		
		JSONArray psl = new JSONArray(contentArr);
		
		return psl;
	}
	
	
}
