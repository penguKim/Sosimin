package com.itwillbs.c5d2308t1_2.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.service.CommunityService;
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.PageInfo;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService communityService;

	// 커뮤니티 게시판으로 이동
	@GetMapping("Community")
	public String community(@RequestParam(defaultValue = "") String searchKeyword, 
						    @RequestParam(defaultValue = "release") String searchType,
					        @RequestParam(defaultValue = "1") int pageNum, 
					        CommunityVO com, HttpSession session, Model model) {
		
		// 페이지 번호와 글의 개수를 파라미터로 전달
		PageDTO page = new PageDTO(pageNum, 15);
		// 전체 게시글 갯수 조회
		int listCount = communityService.getCommunityListCount(searchKeyword, searchType);
		System.out.println(listCount);
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, listCount, 3);
		// 한 페이지에 불러올 게시글 목록 조회
		List<CommunityVO> communityList = communityService.getCommunityList(searchKeyword, searchType, page);
		
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        for(CommunityVO datetime : communityList) {
        	LocalDateTime comDateTime = LocalDateTime.parse(datetime.getCommunity_datetime().toString(), formatter);
        	
            long minutes = Duration.between(comDateTime, now).toMinutes();
            long hours = minutes / 60;
            minutes %= 60;

            String timeAgo = "";
            if (hours > 0) {
                timeAgo = hours + "시간 전";
            } else if (minutes > 0) {
                timeAgo = minutes + "분 전";
            } else {
                timeAgo = "방금 전";
            }

            datetime.setCommunity_datetime(timeAgo);
            
        }
        
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
		
		return "community/communityList";
	}
	
	// 커뮤니티 글쓰기로 이동
	@GetMapping("CommunityWrite")
	public String communityWrite(HttpSession session, Model model) {
		
		// >>>>>>>>>>>>>>>>>>> 로그인 처리 필요
		
		return "community/communityWrite";
	}
	
	// 커뮤니니 글쓰기 비즈니스 로직
	@PostMapping("CommunityWritePro")
	public String communityWritePro(CommunityVO com, HttpSession session, Model model) {

		// >>>>>>>>>>>>>>>>>>> 로그인 처리 필요
		
		com.setCommunity_writer("leess");
		
		String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		// 서브 디렉토리
		String subDir = "";
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		
		saveDir += File.separator + subDir; // File.separator 대신 / 또는 \ 지정도 가능
		System.out.println(saveDir);
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		// -------------------
		// BoardVO 객체에 전달(저장)된 실제 파일 정보가 관리되는 MultipartFile 타입 객체 꺼내기
		MultipartFile mFile1 = com.getFile1();
		MultipartFile mFile2 = com.getFile2();
		MultipartFile mFile3 = com.getFile3();
		MultipartFile mFile4 = com.getFile4();
		MultipartFile mFile5 = com.getFile5();
		
		// MultipartFile 객체의 getOriginalFilename() 메서드 호출 시 업로드 된 파일명 리턴
		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
		System.out.println("원본파일명2 : " + mFile2.getOriginalFilename());
		System.out.println("원본파일명3 : " + mFile3.getOriginalFilename());
		System.out.println("원본파일명4 : " + mFile4.getOriginalFilename());
		System.out.println("원본파일명5 : " + mFile5.getOriginalFilename());
		
		com.setCommunity_image1("");
		com.setCommunity_image2("");
		com.setCommunity_image3("");
		com.setCommunity_image4("");
		com.setCommunity_image5("");
		
		// UUID 를 변수에 저장해서 똑같은 난수를 넣어주는것보다 매번 호출하여
		// 다른 난수를 파일마다 붙여주면 한번에 파일명이 같은 파일이 업로드되도 중복되지 않는다.
		String fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
		String fileName2 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile2.getOriginalFilename();
		String fileName3 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile3.getOriginalFilename();
		String fileName4 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile4.getOriginalFilename();
		String fileName5 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile5.getOriginalFilename();
		System.out.println(fileName1);
		System.out.println(fileName2);
		System.out.println(fileName3);
		System.out.println(fileName4);
		System.out.println(fileName5);
		
		// 파일이 존재할 경우 BoardVO 객체에 서브디렉토리명(subDir)과 함께 파일명 저장
		// ex) 2023/12/19/ef3e51e8_1.jpg
		if(!mFile1.getOriginalFilename().equals("")) {
			com.setCommunity_image1(subDir + "/" + fileName1);
		}
		
		if(!mFile2.getOriginalFilename().equals("")) {
			com.setCommunity_image2(subDir + "/" + fileName2);
		}
		
		if(!mFile3.getOriginalFilename().equals("")) {
			com.setCommunity_image3(subDir + "/" + fileName3);
		}
		
		if(!mFile4.getOriginalFilename().equals("")) {
			com.setCommunity_image4(subDir + "/" + fileName3);
		}
		
		if(!mFile5.getOriginalFilename().equals("")) {
			com.setCommunity_image5(subDir + "/" + fileName3);
		}
		
		System.out.println("실제 업로드 파일명1 : " + com.getCommunity_image1());
		System.out.println("실제 업로드 파일명2 : " + com.getCommunity_image2());
		System.out.println("실제 업로드 파일명3 : " + com.getCommunity_image3());
		System.out.println("실제 업로드 파일명4 : " + com.getCommunity_image4());
		System.out.println("실제 업로드 파일명5 : " + com.getCommunity_image5());
		
		// ----------------------------------------------------------------------

		// 게시글 등록 작업
		int insertCount = communityService.registCommunity(com);
		
		// 게시물 등록 작업 요철 결과 판별
		if(insertCount > 0) {
			try {
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}
				
				if(!mFile2.getOriginalFilename().equals("")) {
					mFile2.transferTo(new File(saveDir, fileName2));
				}
				
				if(!mFile3.getOriginalFilename().equals("")) {
					mFile3.transferTo(new File(saveDir, fileName3));
				}
				
				if(!mFile4.getOriginalFilename().equals("")) {
					mFile4.transferTo(new File(saveDir, fileName4));
				}
				
				if(!mFile5.getOriginalFilename().equals("")) {
					mFile5.transferTo(new File(saveDir, fileName5));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글목록(BoardList) 서블릿 리다이렉트
			return "redirect:/Community";
		} else {
			// "글쓰기 실패!" 메세지 처리
			model.addAttribute("msg", "글쓰기 실패!");
			return "fail_back";
		}
	}
	
	// 커뮤니티 상세글로 이동
	@GetMapping("CommunityDetail")
	public String communityDetail(CommunityVO com, Model model) {
		
		// 게시글 상세정보 조회
		// 조회수 증가 여부 true
		com = communityService.getCommunity(com, true);
		
		if(com == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다.");
			return "fail_back";
		}
		
		model.addAttribute("com", com);
		
		// >>>>>>>>>>>>>>>>>>> 댓글 처리
		
		return "community/communityDetail";
	}
	
	// 커뮤니티 글 삭제 비즈니스 로직
	@GetMapping("CommunityDelete")
	public String communityDelete(@RequestParam(defaultValue = "1") String pageNum,
								  CommunityVO com, HttpSession session, Model model) {
		
		// >>>>>>>>>>>>>>>>>>> 로그인 처리
		
		// 게시글 상세정보 조회
		// 조회수 증가 여부 false
		com = communityService.getCommunity(com, false);
		
		// 게시글이 없거나 작성자와 관리자가 아닐 경우 fail_back
//		if(com == null || !sId.equals(com.getCommunity_writer()) && !sId.equals("admin")) {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			return "fail_back";
//		}
		
		// 게시글 삭제 작업
		int deleteCount = communityService.removeCommunity(com);
		
		if(deleteCount > 0) {
			try {
				// -------------------------------------------------------------
				// [ 서버에서 파일 삭제 ]
				// 실제 업로드 경로 알아내기
				String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				// -----------------------------------------------------------
				// 파일 삭제에 사용된 중복 코드 제거를 위해 배열 + 반복문 활용
				// 배열 arrFileNames 에 파일명 3개 저장
				String[] arrFileNames = {com.getCommunity_image1(), com.getCommunity_image2(), 
						com.getCommunity_image3(), com.getCommunity_image4(), com.getCommunity_image5()}; 
				// for 문을 활용하여 배열 반복
				for(String fileName : arrFileNames) {
					if(!fileName.equals("")) {
						Path path = Paths.get(saveDir + "/" + fileName);
						Files.deleteIfExists(path);
					}
				}
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			// ----------------------------------------------------------
			// 글 목록 페이지 리다이렉트(페이지번호 파라미터 전달)
			return "redirect:/Community?pageNum=" + pageNum;
		} else {
			model.addAttribute("msg", "글 삭제 실패!");
			return "fail_back";
		}
		
	}
	
	// 커뮤니티 글수정으로 이동
	@GetMapping("CommunityModify")
	public String communityModify() {
		return "community/communityModify";
	}
	
	
	
	
	
	
	
	@ResponseBody
	@PostMapping("reviewRegist")
	public String reviewRegist(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		
//		if(map.get("options").equals("good")) {
//			System.out.println("좋은 후기입니다.");
//		} else if(map.get("options").equals("bas")) {
//			System.out.println("나쁜 후기입니다.");
//		}
		
		return "true";
	}
}
