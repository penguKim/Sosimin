package com.itwillbs.c5d2308t1_2.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_id;
	private String member_id;
	private String target_member_id;
	private int order_id;
	private String review_status;
	private String review_check1;
	private String review_check2;
	private String review_check3;
	private String review_check4;
}
