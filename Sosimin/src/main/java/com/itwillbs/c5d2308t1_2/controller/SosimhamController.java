package com.itwillbs.c5d2308t1_2.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
import com.itwillbs.c5d2308t1_2.service.SosimhamService;

@Controller
public class SosimhamController {
	@Autowired
	SosimhamService SosimService;
	
	@GetMapping("SosimLocker")
	public String sosimLocker(Model model) {
		List<Map<String,Object>> LockerList = SosimService.getLocationLocker();
		System.out.println("LockerList : " + LockerList);
		
		Map<String, List<String>> resultMap = new HashMap<>();
		for(Map<String, Object> map : LockerList) {
			String gu = (String) map.get("gu");
            String dong = (String) map.get("dong");
            if (resultMap.containsKey(gu)) {
                resultMap.get(gu).add(dong);
            } else {
                List<String> dongList = new ArrayList<>();
                dongList.add(dong);
                resultMap.put(gu, dongList);
            }
		}
		
		JSONObject object = new JSONObject(resultMap);
		System.out.println("json object 변경 : " + object);
		
		model.addAttribute("object", object);
		model.addAttribute("resultMap",resultMap);
		System.out.println("resultMap : " + resultMap);
		model.addAttribute("LockerList",LockerList);
		 
		return "sosimham/sosimLocker";
		
	}
	
	@GetMapping("AboutUs")
	public String aboutUs() {
		return"sosimham/AboutUs";
	}
	
	@GetMapping("ProhibitionOnsale")
	public String noSale() {
		return "sosimham/ProhibitionOnsale";
	}
}



























