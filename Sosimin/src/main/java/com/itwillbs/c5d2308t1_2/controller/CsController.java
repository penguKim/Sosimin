package com.itwillbs.c5d2308t1_2.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c5d2308t1_2.service.CsService;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.PageInfo;

@Controller
public class CsController {
	@Autowired
	private CsService service;
	
	// 로그 출력을 위한 변수 선언
	private static final Logger log = LoggerFactory.getLogger(CsController.class);
	
	@GetMapping("CsMain")
	public String csMain() {
		
		return "cs/csMain";
	}
	
	// 공지사항 페이지로 이동
	@GetMapping("CsNotice")
	public String csNotice(@RequestParam(defaultValue = "") String searchKeyword, 
						   @RequestParam(defaultValue = "") String searchType,
						   @RequestParam(defaultValue = "") String category,
					       @RequestParam(defaultValue = "1") int pageNum, 
					       HttpSession session, Model model) {
		
		// 페이지 번호와 글의 개수를 파라미터로 전달
		PageDTO page = new PageDTO(pageNum, 15);
		// 전체 게시글 갯수 조회
		int listCount = service.getCsListCount(searchKeyword, searchType, category);
		System.out.println(listCount);
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, listCount, 3);
		// 한 페이지에 불러올 게시글 목록 조회
		List<Map<String, Object>> csNoticeList = service.getCsNotice(searchKeyword, searchType, category, page);
		log.info("csNoticeList : " + csNoticeList);
        
		model.addAttribute("csNoticeList", csNoticeList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
				
		return "cs/csNotice";
	}
	
	
	@GetMapping("CsFaq")
	public String csFaq() {
		
		return "cs/csFaq";
	}
//	@GetMapping("CsOneOnOne")
//	public String csOneOnOne() {
//		
//		return "cs/csOneOnOne";
//	}
	
	@GetMapping("CsNoticeList")
	public String csNoticeList() {
		
		return "admin/csNoticeList";
	}
	
	@GetMapping("CsFaqList")
	public String csFaqList() {
		
		return "admin/csFaqList";
	}
	
	@GetMapping("CsOneOnOneList")
	public String csOneOnOneList() {
		
		return "admin/csOneOnOneList";
	}
	
	
	
}
