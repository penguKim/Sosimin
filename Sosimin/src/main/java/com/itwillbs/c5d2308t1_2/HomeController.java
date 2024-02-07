package com.itwillbs.c5d2308t1_2;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import com.itwillbs.c5d2308t1_2.service.SosimhamService;

@Controller
public class HomeController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
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
	public String adminMain() {
		return "admin/adminMain";
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
		// 나중에 판매자 상품목록이 구현되면 연결할 부분
		return "";
	}

}
