package com.itwillbs.c5d2308t1_2.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cs_type", 1);
		// 페이지 번호와 글의 개수를 파라미터로 전달
		PageDTO page = new PageDTO(pageNum, 15);
		// 전체 게시글 갯수 조회
		int listCount = service.getCsListCount(searchKeyword, searchType, category, map);
		System.out.println(listCount);
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, listCount, 3);
		// 한 페이지에 불러올 게시글 목록 조회
		List<Map<String, Object>> csNoticeList = service.getCsList(searchKeyword, searchType, category, page, map);
		log.info("csNoticeList : " + csNoticeList);
        
		model.addAttribute("csNoticeList", csNoticeList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
				
		return "cs/csNotice";
	}
	
	// 자주묻는질문 페이지로 이동
	@GetMapping("CsFaq")
	public String csFaq(@RequestParam(defaultValue = "") String searchKeyword, 
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String category,
			@RequestParam(defaultValue = "1") int pageNum, 
			HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cs_type", 2);
		// 페이지 번호와 글의 개수를 파라미터로 전달
		PageDTO page = new PageDTO(pageNum, 15);
		// 전체 게시글 갯수 조회
		int listCount = service.getCsListCount(searchKeyword, searchType, category, map);
		System.out.println(listCount);
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, listCount, 3);
		// 한 페이지에 불러올 게시글 목록 조회
		List<Map<String, Object>> csFaqList = service.getCsList(searchKeyword, searchType, category, page, map);
		log.info("csFaqList : " + csFaqList);
		
		model.addAttribute("csFaqList", csFaqList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
		
		return "cs/csFaq";
	}
	
//	@GetMapping("CsOneOnOne")
//	public String csOneOnOne() {
//		
//		return "cs/csOneOnOne";
//	}
	
	
	// ----------------------- 관리자페이지 ----------------------
	
	
	// 고객센터 공지사항 관리로 이동
	@GetMapping("CsNoticeList")
	public String csNoticeList(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cs_type", 1);
		List<Map<String, Object>> csNoticeList = service.getCsListAdmin(map);
		model.addAttribute("csNoticeList", csNoticeList);
		return "admin/csNoticeList";
	}
	
	// 고객센터 공지사항 글쓰기 페이지로 이동
	@GetMapping("CsNoticeWriteForm")
	public String csNoticeWriteForm(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		return "admin/csNoticeWrite";
	}
	
	// 고객센터 공지사항 글쓰기 작업
	@PostMapping("CsNoticeWritePro")
	public String csNoticeWritePro(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		// cs_type을 공지사항인 1로 설정
		map.put("cs_type", 1);
		
		// 공지사항 등록 
		int insertCount = service.insertCs(map);
		
		if(insertCount > 0) { // 등록성공
			return "redirect:/CsNoticeList";			
		} else { // 등록실패
			model.addAttribute("msg", "글쓰기 실패!");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
		
	}
	
	// 고객센터 공지사항 상세보기 페이지로 이동
	@GetMapping("CsNoticeModifyForm")
	public String csNoticeModifyForm(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cs_type", 1);
		
		return "admin/csNoticeWrite";
	}
	
	// 고객센터 공지사항 수정 작업
	@PostMapping("CsNoticeModifyPro")
	public String csNoticeModifyPro(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		return "redirect:/CsNoticeList";
	}
	
	
	// 고객센터 자주묻는질문 관리로 이동
	@GetMapping("CsFaqList")
	public String csFaqList(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cs_type", 2);
		List<Map<String, Object>> csFaqList = service.getCsListAdmin(map);
		model.addAttribute("csFaqList", csFaqList);
		return "admin/csFaqList";
	}
	
	// 고객센터 자주묻는질문 글쓰기 페이지로 이동
	@GetMapping("CsFaqWriteForm")
	public String csFaqWriteForm(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		return "admin/csFaqWrite";
	}
	
	// 고객센터 자주묻는질문 글쓰기 작업
	@PostMapping("CsFaqWritePro")
	public String csFaqWritePro(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		// cs_type을 자주묻는질문인 2로 설정
		map.put("cs_type", 2);
		
		// 공지사항 등록 
		int insertCount = service.insertCs(map);
		
		if(insertCount > 0) { // 등록성공
			return "redirect:/CsFaqList";			
		} else { // 등록실패
			model.addAttribute("msg", "글쓰기 실패!");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
	}
	
	// 고객센터 자주묻는질문 상세 페이지로 이동
	@GetMapping("CsFaqModifyForm")
	public String csFaqModifyForm(Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cs_type", 2);
		
		return "admin/csFaqWrite";
	}
	
	// 고객센터 자주묻는질문 수정 작업
	@PostMapping("CsFaqModifyPro")
	public String csFaqModifyPro(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		return "redirect:/CsFaqList";
	}
	
	
	@GetMapping("CsOneOnOneList")
	public String csOneOnOneList() {
		
		return "admin/csOneOnOneList";
	}
	
	@GetMapping("CsNoticeDetail")
	public String csDetail(@RequestParam(defaultValue = "0") int cs_id, Model model) {
		// 서블릿 주소로만 들어올 경우 처리
		if(cs_id == 0) {
			return "error/404";
		}
		
		// 게시글 조회
		Map<String, Object> map = service.getCsDetail(cs_id);
		
		model.addAttribute("detail", map);
		
		return "cs/csDetail";
	}
	
}
