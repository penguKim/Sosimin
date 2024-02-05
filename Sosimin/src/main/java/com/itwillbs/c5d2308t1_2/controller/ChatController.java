package com.itwillbs.c5d2308t1_2.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c5d2308t1_2.service.ChatService;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;

@Controller
public class ChatController {
	
	@Autowired
	ChatService service;
	
	@GetMapping("ChatMain")
	public String main(HttpSession session, Model model, @RequestParam Map<String, String> map) {
		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "로그인 후 사용 가능합니다."); // model은 뷰페이지로 들고가서 뿌릴려고
																	// , 뤼케스트파람을 썼을때 뷰페이지 name 속성에 있는 value값 또는 주소값들을 객체로 받기 위해서 쓴다
			model.addAttribute("targetURL", "MemberLogin");
			return "forward";
		}
		
//		member.setMember_id(sId); // member에 sId를 저장을 한것
//		map.put("abc", sId);
		Map<String, String> sellMember = service.getSellMember(map); //판매자 멤버조회 
		//두개의 파라미터값을 들고가기 위해서는 mapper에서 @param을 써서 추가해줘야한다. xml구문에서 selrect를 사용했기때문에 조회를한것이다
		//아니면 map.put("sId",sId)); 이 구문은 sId를 map에 저장된것
		Map<String, String> product = service.getProduct(map); //상품정보 조회
		
		System.out.println(">>>>>>>>>>>>>> 뭐가들었찌? :  " + map);
		System.out.println(">>>>>>>>>>>>>> 뭐가들었찌? :  " + product);
		System.out.println(">>>>>>>>>>>>>> 뭐가들었찌? :  " + sellMember);
		
		model.addAttribute("sellMember", sellMember);
		
		
		return "chat/chat";
	}
	
}
