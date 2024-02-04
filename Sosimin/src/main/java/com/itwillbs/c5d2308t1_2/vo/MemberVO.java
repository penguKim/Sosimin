package com.itwillbs.c5d2308t1_2.vo;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	// MemberVO 임시정의
	private String member_id;
	private String member_name;
	private String member_email;
	private String member_birth;
	private String member_nickname;
	private String member_phone;
	private int member_status;
	private String member_password;
	private String member_profile;
	private String member_intro;
	private String member_address;
	private LocalDateTime member_withdraw_time;
	private int member_phone_auth;
	private int member_neighbor_auth;
	private LocalDateTime member_neighbor_time;
	private int member_pay_auth;
	private int member_level;
	private int member_exp;
	private int town_id;
	private int report_real_count;
	private String product_id;
	
	private MultipartFile file;

	
	
	
}
