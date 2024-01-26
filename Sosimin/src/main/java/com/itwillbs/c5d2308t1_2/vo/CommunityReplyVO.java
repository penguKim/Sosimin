package com.itwillbs.c5d2308t1_2.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommunityReplyVO {
	private int reply_id;
	private int community_id;
	private String reply_writer; 
	private String reply_content;
	private String reply_image;
	private int reply_re_ref;
	private int reply_re_lev;
	private int reply_re_seq;
	private String reply_datetime;
	
	private MultipartFile mFile;
}
