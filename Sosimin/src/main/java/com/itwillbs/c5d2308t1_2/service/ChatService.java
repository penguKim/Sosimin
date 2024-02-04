package com.itwillbs.c5d2308t1_2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c5d2308t1_2.mapper.ChatMapper;
import com.itwillbs.c5d2308t1_2.mapper.MemberMapper;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.vo.ProductVO;

import edu.emory.mathcs.backport.java.util.Arrays;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class ChatService {
	@Autowired
	ChatMapper mapper;

	public Map<String, String> getProduct(Map<String, String> map) {
		
		return mapper.getProduct(map);
	}

	public Map<String, String> getSellMember(Map<String, String> map) {
		return mapper.getSellMember(map);
	}
	


}
