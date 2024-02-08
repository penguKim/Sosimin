package com.itwillbs.c5d2308t1_2.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c5d2308t1_2.vo.PageDTO;
import com.itwillbs.c5d2308t1_2.service.CommunityService;
import com.itwillbs.c5d2308t1_2.service.LevelService;
import com.itwillbs.c5d2308t1_2.vo.CommunityReplyVO;
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.PageInfo;
import com.itwillbs.c5d2308t1_2.vo.ReviewVO;

import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

@Controller
public class CommunityController {
	// 로그 출력을 위한 변수 선언
	private static final Logger log = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private LevelService levelService;
	
	// 커뮤니티 게시판으로 이동
	@GetMapping("Community")
	public String community(@RequestParam(defaultValue = "") String searchKeyword, 
						    @RequestParam(defaultValue = "") String searchType,
						    @RequestParam(defaultValue = "") String category,
					        @RequestParam(defaultValue = "1") int pageNum, 
					        HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("sId");
		
		// 회원의 구 정보
		String gu = "";
		
		if (id != null) {
			Map<String, Object> map = communityService.getTownName(id);
			gu = (String)map.get("gu");
		}
		
		
		// 페이지 번호와 글의 개수를 파라미터로 전달
		PageDTO page = new PageDTO(pageNum, 15);
		// 전체 게시글 갯수 조회
		int listCount = communityService.getCommunityListCount(searchKeyword, searchType, category, gu);
//		System.out.println(listCount);
		// 페이징 처리
		PageInfo pageInfo = new PageInfo(page, listCount, 3);
		// 한 페이지에 불러올 게시글 목록 조회
		List<Map<String, Object>> communityList = communityService.getCommunityList(searchKeyword, searchType, category, page, gu);
		
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
//        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
        
        for(Map<String, Object> com : communityList) {
        	LocalDateTime comDateTime;
			if(com.get("community_datetime").toString().split(":").length > 2) {
				comDateTime = LocalDateTime.parse(com.get("community_datetime").toString(), formatter);
			} else {
				comDateTime = LocalDateTime.parse(com.get("community_datetime").toString(), formatter2);
			}
//        	LocalDateTime comDateTime = LocalDateTime.parse(com.get("community_datetime").toString(), formatter);
        	// 시분초 차이 계산
    		Duration duration = Duration.between(comDateTime, now);
    		// 년월일 차이 계산
    		Period period = Period.between(comDateTime.toLocalDate(), now.toLocalDate());
    		
            long minutes = duration.toMinutes() % 60;
            long hours = duration.toHours() % 24;
            long days = duration.toDays() % 7;
            long weeks = duration.toDays() / 7;
            long months = period.getMonths();
            long years = period.getYears();
            
            String timeAgo = "";
            if(years > 0) {
            	timeAgo = years + "년 전";
            } else if(months > 0) {
            	timeAgo = months + "개월 전";
            } else if(weeks > 0 && weeks <= 4) {
            	timeAgo = weeks + "주전";
    		} else if (days > 0 && days < 7) { // 1 ~ 7 차이날 때
                timeAgo = days + "일전";
            } else if (hours > 0 && hours < 24) { // 1 ~ 23시간이 차이날 때
                timeAgo = hours + "시간 전";
            } else if (minutes > 0) { // 1 ~ 59분이 차이날 때
                timeAgo = minutes + "분 전";
            } else {
                timeAgo = "방금 전";
            }
            
            // 계산한 시간 목록
            com.put("community_datetime", timeAgo);
            
        }
        
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("searchType", searchType);
		
		return "community/communityList";
	}
	
	// 게시판 입장 시 지역정보 판별
	@ResponseBody
	@PostMapping("TownCheck")
	public String townCheck(HttpSession session) {
		String id = (String)session.getAttribute("sId");
		
		Map<String, Object> map = communityService.getTownName(id);
		
		JSONObject jo = new JSONObject(map);
		
		return jo.toString();
		
	}
	
	// 커뮤니티 글쓰기로 이동
	@GetMapping("CommunityWrite")
	public String communityWrite(HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("msg2", "로그인 후 글쓰기 페이지로 이동합니다");
			model.addAttribute("msg3", "warning");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "MemberLogin");
			return "forward";
		}
		
		return "community/communityWrite";
	}
	
	// 커뮤니티 글쓰기 비즈니스 로직
	@PostMapping("CommunityWritePro")
	public String communityWritePro(CommunityVO com, HttpSession session, Model model) {

		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("msg2", "로그인 후 글쓰기 페이지로 이동합니다");
			model.addAttribute("msg3", "warning");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "MemberLogin");
			return "forward";
		}
		
		com.setCommunity_writer(sId);
		
		com.setCommunity_image1("");
		com.setCommunity_image2("");
		com.setCommunity_image3("");
		com.setCommunity_image4("");
		com.setCommunity_image5("");
		
		// 게시글 등록 작업
		int insertCount = communityService.registCommunity(com);
		
		// 게시물 등록 작업 요청 결과 판별
		if(insertCount > 0) {
			// 회원 경험치 증가
			levelService. updateComExp(com);
			// 글목록(BoardList) 서블릿 리다이렉트
			return "redirect:/Community";
		} else {
			// "글쓰기 실패!" 메세지 처리
			model.addAttribute("msg", "글쓰기 실패!");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
	}
	
	// 커뮤니티 상세글로 이동
	@GetMapping("CommunityDetail")
	public String communityDetail(CommunityVO com, Model model) {
		
		log.info("파라미터로 넘어온 com은 : " + com);
		if(com == null || com.getCommunity_id() == 0) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다.");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
		
		// 게시글 상세정보 조회
		// 조회수 증가 여부 true
		Map<String, Object> map = new HashMap<String, Object>();
		map = communityService.getCommunity(com, true);
		
		
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatterMonthDay = DateTimeFormatter.ofPattern("MM-dd");
        
        // 게시시간 가져오기
    	LocalDateTime comDateTime;
		if(map.get("community_datetime").toString().split(":").length > 2) {
			comDateTime = LocalDateTime.parse(map.get("community_datetime").toString(), formatter);
		} else {
			comDateTime = LocalDateTime.parse(map.get("community_datetime").toString(), formatter2);
		}
    	// 시분초 차이 계산
		Duration duration = Duration.between(comDateTime, now);
		// 년월일 차이 계산
		Period period = Period.between(comDateTime.toLocalDate(), now.toLocalDate());
		
        long minutes = duration.toMinutes() % 60;
        long hours = duration.toHours() % 24;
        long days = duration.toDays() % 7;
        long weeks = duration.toDays() / 7;
        long months = period.getMonths();
        long years = period.getYears();
        
        String timeAgo = "";
        if(years > 0) {
        	timeAgo = years + "년 전";
        } else if(months > 0) {
        	timeAgo = months + "개월 전";
        } else if(weeks > 0 && weeks <= 4) {
        	timeAgo = weeks + "주전";
		} else if (days > 0 && days < 7) { // 1 ~ 7 차이날 때
            timeAgo = days + "일전";
        } else if (hours > 0 && hours < 24) { // 1 ~ 23시간이 차이날 때
            timeAgo = hours + "시간 전";
        } else if (minutes > 0) { // 1 ~ 59분이 차이날 때
            timeAgo = minutes + "분 전";
        } else {
            timeAgo = "방금 전";
        }

        map.put("community_datetime", timeAgo);
        
        // 좋아요 갯수 불러오기
        int likeCount = communityService.getLikeCount(com);
        
        // 댓글 불러오기
        List<Map<String, Object>> replyList = communityService.getReplyList(com);
        
        formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        
        for(Map<String, Object> datetime : replyList) {
        	LocalDateTime reDateTime;
    		if(datetime.get("reply_datetime").toString().split(":").length > 2) {
    			reDateTime = LocalDateTime.parse(datetime.get("reply_datetime").toString(), formatter);
    		} else {
    			reDateTime = LocalDateTime.parse(datetime.get("reply_datetime").toString(), formatter2);
    		}
        	duration = Duration.between(reDateTime, now);
    		period = Period.between(reDateTime.toLocalDate(), now.toLocalDate());
        	
            minutes = duration.toMinutes() % 60;
            hours = duration.toHours() % 24;
            days = duration.toDays() % 7;
            weeks = duration.toDays() / 7;
            months = period.getMonths();
            years = period.getYears();
            
            timeAgo = "";
            if(years > 0) {
            	timeAgo = years + "년 전";
            } else if(months > 0) {
            	timeAgo = months + "개월 전";
            } else if(weeks > 0 && weeks <= 4) {
            	timeAgo = weeks + "주전";
    		} else if (days > 0 && days < 7) { // 1 ~ 7 차이날 때
                timeAgo = days + "일전";
            } else if (hours > 0 && hours < 24) { // 1 ~ 23시간이 차이날 때
                timeAgo = hours + "시간 전";
            } else if (minutes > 0) { // 1 ~ 59분이 차이날 때
                timeAgo = minutes + "분 전";
            } else {
                timeAgo = "방금 전";
            }

            datetime.put("reply_datetime", timeAgo);
            
        }
        
        // 회원 경험치 조회
        Map<String, Integer> levelExp = communityService.getMemberLevel((String)map.get("community_writer")); 
        // 경험치 퍼센트 계산
        float percentage = (float)levelExp.get("member_exp") / levelExp.get("level_max_exp") * 100;
        percentage = Math.round(percentage * 10) / 10;
//        System.out.println("회원의 경험치는 : " + (float)levelExp.get("member_exp"));
//        System.out.println("최대 경험치는 : " + levelExp.get("level_max_exp"));
//        System.out.println("퍼센트는 : " + percentage);
        
		model.addAttribute("com", map);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("replyList", replyList);
		model.addAttribute("percentage", percentage);
		
		return "community/communityDetail";
	}
	
	// 커뮤니티 글 삭제 비즈니스 로직
	@GetMapping("CommunityDelete")
	public String communityDelete(@RequestParam(defaultValue = "1") String pageNum,
								  CommunityVO com, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "비정상적인 접근입니다!");
			model.addAttribute("msg", "메인 페이지로 이동합니다");
			model.addAttribute("msg3", "error");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "./");
			return "forward";
		}
		
		// 게시글 상세정보 조회
		// 조회수 증가 여부 false
		Map<String, Object> map = new HashMap<String, Object>();
		map = communityService.getCommunity(com, false);
		log.info("삭제하려고 조회한 게시글입니다 : " + map);
		
		// 게시글이 없거나 작성자와 관리자가 아닐 경우 fail_back
		if(map == null || !sId.equals(map.get("community_writer")) && !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
		
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
				
				String[] arrFileNames = {map.get("community_image1").toString(), map.get("community_image2").toString(), 
						map.get("community_image3").toString(), map.get("community_image4").toString(), map.get("community_image5").toString()}; 
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
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
		
	}
	
	// 커뮤니티 글수정으로 이동
	@GetMapping("CommunityModify")
	public String communityModify(CommunityVO com, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "비정상적인 접근입니다!");
			model.addAttribute("msg2", "메인 페이지로 이동합니다");
			model.addAttribute("msg3", "error");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "./");
			return "forward";
		}
		
		// 게시글 상세정보 조회
		// 조회수 증가 여부 false
		Map<String, Object> map = new HashMap<String, Object>();
		map = communityService.getCommunity(com, false);
		
		// 게시글이 없거나 작성자와 관리자가 아닐 경우 fail_back
		if(map == null || !sId.equals(map.get("community_writer")) && !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("msg2", "이전 페이지로 이동합니다");
			model.addAttribute("msg3", "error");
			return "fail_back";
		}
		
		// jstl 반복문을 위한 리스트 생성
		List<String> imageList = new ArrayList<String>();
		imageList.add((String)map.get("community_image1"));
		imageList.add((String)map.get("community_image2"));
		imageList.add((String)map.get("community_image3"));
		imageList.add((String)map.get("community_image4"));
		imageList.add((String)map.get("community_image5"));
		
		model.addAttribute("com", map);
		model.addAttribute("imageList", imageList);
		
		return "community/communityModify";
	}
	
	// 글수정에서 사진 삭제 AJAX
	@ResponseBody
	@PostMapping("CommunityDeleteFile")
	public String communityDeleteFile(CommunityVO com, HttpSession session) {
		
		// 파일 삭제 작업
		int removeCount = communityService.removeBoardFile(com);
		
		try {
			if(removeCount > 0) {
				String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				
				// 파일명이 널스트링이 아닐 경우에만 삭제 작업 수행
				if(!com.getCommunity_image1().equals("")) {
					Path path = Paths.get(saveDir + "/" + com.getCommunity_image1());
					Files.deleteIfExists(path);
					
					return "true";
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "false";
		
	}
	
	@PostMapping("CommunityModifyPro")
	public String communityModifyPro(CommunityVO com, HttpSession session, Model model, 
									 @RequestParam(defaultValue = "1") String pageNum) {
		String sId = (String)session.getAttribute("sId");
		com.setCommunity_writer(sId);
		if(sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("msg2", "로그인 페이지로 이동합니다.");
			model.addAttribute("msg3", "warning");
			model.addAttribute("targetURL", "MemberLogin");
			return "forward";
		} else if(!sId.equals(com.getCommunity_writer()) && !sId.equals("admin")) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			model.addAttribute("msg2", "메인 페이지로 이동합니다.");
			model.addAttribute("msg3", "error");
			model.addAttribute("targetURL", "./");
			return "forward";
		}
		
		String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		// 서브디렉토리 만들기
		String subDir = "";
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		
		saveDir += File.separator + subDir; // File.separator 대신 / 또는 \ 지정도 가능

		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// input 타입이 아닌 경우(기존 업로드된 파일)는 null 값이 들어감
		List<MultipartFile> mFiles = new ArrayList<MultipartFile>();
		mFiles.add(com.getFile1());
		mFiles.add(com.getFile2());
		mFiles.add(com.getFile3());
		mFiles.add(com.getFile4());
		mFiles.add(com.getFile5());
		
		// 파일명 컬럼에 들어갈 List
		List<String> fileNames = new ArrayList<String>();
		fileNames.add("");
		fileNames.add("");
		fileNames.add("");
		fileNames.add("");
		fileNames.add("");
		
		
		// 파일이 존재할 경우 파일명 변경
		for(int i = 0; i < 5; i++) {
			MultipartFile mFile = mFiles.get(i);
			if(mFile != null && !mFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile.getOriginalFilename();
				fileNames.set(i, subDir + "/" + fileName);
			}
		}
		
//		System.out.println("파일 수정후 파일명 : " + fileNames);
		
		// 파일명넣기
		com.setCommunity_image1(fileNames.get(0));
		com.setCommunity_image2(fileNames.get(1));
		com.setCommunity_image3(fileNames.get(2));
		com.setCommunity_image4(fileNames.get(3));
		com.setCommunity_image5(fileNames.get(4));
		
		int updateCount = communityService.modifyCommunity(com);
		
		// DB 작업 요청 처리 결과 판별
		if(updateCount > 0) {
			try {
				// 파일명이 존재하는 파일만 이동 처리 작업 수행
				for(int i = 0; i < 5; i++) {
					MultipartFile mFile = mFiles.get(i);
					String fileName = fileNames.get(i);
					if(!fileName.equals("")) {
						// 년월일 다음의 '/'를 인덱스로 지정 
						fileName = fileName.substring(fileName.indexOf("/", 9));
						mFile.transferTo(new File(saveDir, fileName));
					}
					
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 글 상세정보 조회 페이지 리다이렉트(파라미터 : 글번호, 페이지번호)
			return "redirect:/CommunityDetail?community_id=" + com.getCommunity_id() + "&pageNum" + pageNum;
		} else {
			// "글 수정 실패!" 처리
			model.addAttribute("msg", "글 수정 실패!");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
		
	}
	
	// 게시글 좋아요 AJAX
	@ResponseBody
	@PostMapping("likeCheck")
	public String likeCheck(@RequestParam Map<String, String> like, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null) {
			return "login"; // ajax의 리턴타입이 json이므로 해당 문자열 리턴시 error 발생
		}
		
		like.put("member_id", sId);
		
		// 좋아요 판별 수행 후 문자열 리턴
		String isChecked = communityService.getLike(like);
		
        // 좋아요 갯수 불러오기
		CommunityVO com = new CommunityVO();
		com.setCommunity_id(Integer.parseInt(like.get("community_num")));
        int likeCount = communityService.getLikeCount(com);
        
        JSONObject object = new JSONObject();
        object.put("isChecked", isChecked);
        object.put("likeCount", likeCount);
		
		return object.toString();
	}
	
	// 상세 게시글 좋아요 불러오기 AJAX
	@ResponseBody
	@PostMapping("likeShow")
	public String likeShow(@RequestParam Map<String, String> like, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		if(sId != null) {
			
			like.put("member_id", sId);
			like = communityService.getmemberLike(like);
			log.info("회원의 좋아요는 : " + like);
			
			JSONObject object = new JSONObject(like);
			log.info("오브젝트는 뭔가요 : " + object);
			
			return object.toString();
		}
		return "{}";
	}
	
	// 게시글 댓글 쓰기
	@PostMapping("CommunityReplyWrite")
	public String communityReplyWrite(CommunityReplyVO reply , HttpSession session, Model model,
									  @RequestParam(defaultValue = "1") String pageNum) {
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다!");
			model.addAttribute("msg2", "메인 페이지로 이동합니다");
			model.addAttribute("msg3", "error");
			// targetURL 속성명으로 로그인 폼 페이지 서블릿 주소 저장
			model.addAttribute("targetURL", "./");
			return "forward";
		}
		
		reply.setReply_writer(sId);
		
		// 댓글 등록작업
		int insertCount = communityService.registReplyCommunity(reply);
		
		// 댓글 등록 요청 결과 판별
		if(insertCount > 0) {
			// 댓글 등록 시 경험치 증가
			levelService.updateComReExp(reply, true);
			return "redirect:/CommunityDetail?community_id="
					+ reply.getCommunity_id() + "&pageNum=" + pageNum;
		} else 	{
			model.addAttribute("msg", "댓글 작성 실패!");
			model.addAttribute("msg2", "이전 페이지로 돌아갑니다.");
			model.addAttribute("msg3", "warning");
			return "fail_back";
		}
		
	}
	
	// 댓글 삭제 AJAX
	@ResponseBody
	@GetMapping("CommunityReplyDelete")
	public String communityReplyDelete(CommunityReplyVO reply, HttpSession session) {
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "invalidSession";
		}
		
		// 댓글 작성자 조회
		reply = communityService.getReplyWriter(reply);
		
		if(sId.equals(reply.getReply_writer()) || sId.equals("admin")) {
			// 댓글 삭제 요청
			int deleteCount = communityService.removeReply(reply);
			
			if(deleteCount > 0) {
				// 댓글 삭제 시 경험치 감소
				levelService.updateComReExp(reply, false);
				return "true";
			} else {
				return "false";
			}
		} else {
			return "invalidSession";
		}	
	}
	
	// 대댓글 작성 AJAX
	@ResponseBody
	@PostMapping("CommunityReReplyWrite")
	public String communityRereplyWrite(CommunityReplyVO reply, HttpSession session) {
		
//		System.out.println("대댓글 작성 시 넘어온 값은 : " + reply);
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "invalidSession";
		}
		
		reply.setReply_writer(sId);
		
		int insertCount = communityService.registReReply(reply);
		// 댓글 등록 시 경험치 증가
		levelService.updateComReExp(reply, true);
		
		if(insertCount > 0) {
			return "true";
		} else {
			return "false";
		}
		
	}
	
	// 게시글 임시저장
	@ResponseBody
	@PostMapping("TempRegist")
	public String tempRegist(CommunityVO com, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "false";
		}
		
		com.setCommunity_writer(sId);
		if(com.getCommunity_category() == null) {
			com.setCommunity_category("0");
		}
		
		int insertCount = communityService.registTempCommunity(com);
		
		if(insertCount > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	// 글쓰기 페이지 로딩 시 임시저장 판별
	@ResponseBody
	@PostMapping("TempCheck")
	public String tempCheck(CommunityVO com, HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "[]";
		}
		com.setCommunity_writer(sId);
		Map<String, Object> map = communityService.getTempCommunity(com);
		log.info("임시저장한 게시글 : " + map);
		
		if(map == null) {
			return "[]";
		}
		
		JSONObject jo = new JSONObject(map);
		
		return jo.toString();
	}
	
	// 임시저장 등록 취소 시 삭제 AJAX
	@ResponseBody
	@PostMapping("TempDelete")
	public String tempDelete(CommunityVO com, HttpSession session) {
		
		log.info("임시저장 젤 처음 넘어온거 : " + com); 
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "false";
		}
		
		com.setCommunity_writer(sId);
		
		int deleteCount = communityService.removeTempCommunity(com, session);
		
		if(deleteCount > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@ResponseBody
	@PostMapping("ImageUpload")
	public String imageUpload(CommunityVO com, HttpSession session, Model model) {
//		System.out.println("내가 받은 파일은 : " + com);
		
		String image = ""; // 리턴할 이미지 경로
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "login";
		}
		com.setCommunity_writer(sId);
		
		String uploadDir = "/resources/tempUpload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		// 서브 디렉토리
		String subDir = "";
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		subDir = now.format(dtf);
		
		saveDir += File.separator + subDir; // File.separator 대신 / 또는 \ 지정도 가능
//		System.out.println(saveDir);
		try {
			Path path = Paths.get(saveDir); // 파라미터로 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		// -------------------
		// BoardVO 객체에 전달(저장)된 실제 파일 정보가 관리되는 MultipartFile 타입 객체 꺼내기
		List<MultipartFile> mFiles = new ArrayList<MultipartFile>();
		mFiles.add(com.getFile1());
		mFiles.add(com.getFile2());
		mFiles.add(com.getFile3());
		mFiles.add(com.getFile4());
		mFiles.add(com.getFile5());
		
		// 실제 파일명 리스트
		List<String> fileNames = new ArrayList<String>();
		fileNames.add("");
		fileNames.add("");
		fileNames.add("");
		fileNames.add("");
		fileNames.add("");
		
		// 썸네일 파일명 리스트
		List<String> thumbnailNames = new ArrayList<String>();
		thumbnailNames.add("");
		thumbnailNames.add("");
		thumbnailNames.add("");
		thumbnailNames.add("");
		thumbnailNames.add("");
		
		// UUID 를 변수에 저장해서 똑같은 난수를 넣어주는것보다 매번 호출하여
		// 다른 난수를 파일마다 붙여주면 한번에 파일명이 같은 파일이 업로드되도 중복되지 않는다.
		for(int i = 0; i < 5; i++) {
			MultipartFile mFile = mFiles.get(i);
			if(mFile != null && !mFile.getOriginalFilename().equals("")) {
				String fileName = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile.getOriginalFilename();
				fileNames.set(i, subDir + "/" + fileName);
				thumbnailNames.set(i, subDir + "/s_" + fileName);
			}
		}
		
		// 서브디렉토리 + 파일명을 저장
		com.setCommunity_image1(fileNames.get(0));
		com.setCommunity_image2(fileNames.get(1));
		com.setCommunity_image3(fileNames.get(2));
		com.setCommunity_image4(fileNames.get(3));
		com.setCommunity_image5(fileNames.get(4));
		
//		System.out.println("실제 업로드 파일명1 : " + com.getCommunity_image1());
//		System.out.println("실제 업로드 파일명2 : " + com.getCommunity_image2());
//		System.out.println("실제 업로드 파일명3 : " + com.getCommunity_image3());
//		System.out.println("실제 업로드 파일명4 : " + com.getCommunity_image4());
//		System.out.println("실제 업로드 파일명5 : " + com.getCommunity_image5());
		
		int insertCount = communityService.registTempImage(com);
		
		if(insertCount > 0) {
			try {
				// 파일명이 존재하는 파일만 이동 처리 작업 수행
				for(int i = 0; i < 5; i++) {
					MultipartFile mFile = mFiles.get(i);
					String fileName = fileNames.get(i);
					String thumbnail = thumbnailNames.get(i);
					if(!fileName.equals("")) {
						image = fileName; // 경로의 이미지를 저장
						// 년월일 다음의 '/'를 인덱스로 지정 
						fileName = fileName.substring(fileName.indexOf("/", 9));
						File file = new File(saveDir, fileName);
						mFile.transferTo(file);
						thumbnail = thumbnail.substring(11);
						
						// 썸네일 생성
//						File thumbnailFile = new File(saveDir, thumbnail);
//						Thumbnails.of(file)
////			                    .width(200) // 원본비율로 너비를 100px로 조절
//			                    .crop(Positions.CENTER) // 중앙을 기준으로
//			                    .size(200, 200) // 200 x 200으로 자름
//			                    .toFile(thumbnailFile);
					}
					
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return image;
		
		} else {
			return "false";
		}
	}
	
	@ResponseBody
	@PostMapping("ImageDelete")
	public String imageDelete (CommunityVO com, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "login";
		}
		log.info("내가 삭제하려는 파일은 : " + com);
		
		com.setCommunity_writer(sId);
		
		int removeCount = communityService.removeTempImage(com, session);
		
		if(removeCount > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	@ResponseBody
	@PostMapping("CommunityImageDelete")
	public String communityImageDelete(CommunityVO com, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "login";
		}
		
		com.setCommunity_writer(sId);
		
		log.info("내가 삭제하려는 파일은 : " + com);
		
		int removeCount = communityService.removeCommunityImage(com, session);
		
		if(removeCount > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	// 후기 등록
	@ResponseBody
	@PostMapping("ReviewRegist")
	public String reviewRegist(ReviewVO re, HttpSession session) {
//		System.out.println(re);
		
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "login";
		}

		re.setMember_id(sId);
		
		// 임시로 결제번호 등록 =========================================================================
//		re.setOrder_id(16);
		
		
		// 리뷰 등록
		int insertCount = levelService.registReview(re);
		
		if(insertCount > 0) {
			return "true";
		}
		
		return "false";
	}
	
	// 후기 보기
	@ResponseBody
	@PostMapping("ReviewView")
	public String reviewView(ReviewVO re, HttpSession session) {
//		System.out.println("보려는 후기 : " + re);
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "login"; // dataType json이므로 응답은 error로 발생
		}

		re.setMember_id(sId);
		
		ReviewVO review = levelService.getReview(re);
		
		JSONObject object = new JSONObject(review);
		
		return object.toString();
	}
	
	// 후기 삭제
	@ResponseBody
	@PostMapping("ReviewDelete")
	public String reviewDelete(ReviewVO re, HttpSession session) {
		log.info("삭제하려는 후기 : " + re);
		String sId = (String)session.getAttribute("sId");
		if(sId == null) {
			return "login"; // dataType json이므로 응답은 error로 발생
		}
		
		re.setMember_id(sId);
		
		int deleteCount = levelService.deleteReview(re);
		
		if(deleteCount > 0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	// ===================== 관리자 페이지 =====================
	
	@GetMapping("CommunityList")
	public String adminCommunityList(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		List<Map<String, String>> comList = communityService.getAllList();
		
		model.addAttribute("comList", comList);
		return "admin/communityList";
	}
	
	@GetMapping("CommunityReplyList")
	public String adminCommunityReply(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		if(sId == null || !sId.equals("admin")) {
			return "error/404";
		}
		
		List<Map<String, String>> comReList = communityService.getAllReList();
		
		model.addAttribute("comReList", comReList);
		
		return "admin/communityReplyList";
	}
	
}
