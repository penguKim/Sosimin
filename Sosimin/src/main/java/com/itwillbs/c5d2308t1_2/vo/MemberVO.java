package com.itwillbs.c5d2308t1_2.vo;

import java.sql.Date;

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
	private String member_address;
	private Date member_withdraw_time;
	private int phone_auth;
	private int neighbor_auth;
	private Date neighbor_time;
	private int pay_auth;
	private int member_level;
	private int member_exp;
	private String dong;
	private int report_real_count;
	private String product_id;
	
	
	
	
}
