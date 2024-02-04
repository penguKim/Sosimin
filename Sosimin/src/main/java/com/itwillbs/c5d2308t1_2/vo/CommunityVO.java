package com.itwillbs.c5d2308t1_2.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommunityVO {
	private int community_id;
	private String community_category;
	private String community_writer;
	private int community_town_id;
	private String community_subject;
	private String community_content;
	private String community_image1;
	private String community_image2;
	private String community_image3;
	private String community_image4;
	private String community_image5;
	private int community_readcount;
	private String community_datetime;
	
	// 실제 파일을 다룰 MulitpartFile 타입
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
}
