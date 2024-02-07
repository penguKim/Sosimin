package com.itwillbs.c5d2308t1_2.service;

import java.io.IOException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c5d2308t1_2.mapper.CommunityMapper;
import com.itwillbs.c5d2308t1_2.mapper.LevelMapper;
import com.itwillbs.c5d2308t1_2.vo.CommunityReplyVO;
import com.itwillbs.c5d2308t1_2.vo.CommunityVO;
import com.itwillbs.c5d2308t1_2.vo.PageDTO;

import edu.emory.mathcs.backport.java.util.Arrays;

@Service
public class CommunityService {
	private static final Logger logger = LoggerFactory.getLogger(CommunityService.class);
	
	@Autowired
	CommunityMapper mapper;
	
	@Autowired
	LevelMapper levelMapper;
	
	@Autowired
	private ServletContext servletContext; // 세션 대신 컨텍스트 경로찾기
	
	// 게시글 목록
	public int getCommunityListCount(String searchKeyword, String searchType, String category, String gu) {
		return mapper.selectCommunityListCount(searchKeyword, searchType, category, gu);
	}
	
	// 게시판 입장시 지역정보 판별
	public Map<String, Object> getTownName(String id) {
		CommunityVO com = new CommunityVO();
		com.setCommunity_writer(id);
		return mapper.getTownName(id);
	}
	
	// 한 페이지에 표시할 게시글 목록 조회 작업 요청 
	public List<Map<String, Object>> getCommunityList(String searchKeyword, String searchType, String category, PageDTO page, String gu) {
		return mapper.selectCommunityList(searchKeyword, searchType, category, page, gu);
	}
	
	// 게시글 등록
	@Transactional
	public int registCommunity(CommunityVO com) {
		
		// 임시게시글 조회
		Map<String, Object> map = mapper.selectTempCommunity(com);
		System.out.println("임시게시글 조회 : " + map); 
		if(map != null) { // 임시게시글이 있다면
			com.setCommunity_image1((String)map.get("temp_image1"));
			com.setCommunity_image2((String)map.get("temp_image2"));
			com.setCommunity_image3((String)map.get("temp_image3"));
			com.setCommunity_image4((String)map.get("temp_image4"));
			com.setCommunity_image5((String)map.get("temp_image5"));
			
			String[] imageKeys = {com.getCommunity_image1(), com.getCommunity_image2(), 
					com.getCommunity_image3(), com.getCommunity_image4(), com.getCommunity_image5() };
			
			// 임시게시글 삭제
			int deleteCount = mapper.deleteTempCommunity(com);
			if(deleteCount > 0) {
				String tempSaveDir = servletContext.getRealPath("/resources/tempUpload");
				String saveDir = servletContext.getRealPath("/resources/upload");
				
				for(int i = 0; i < 5; i++) {
					if(!imageKeys[i].equals("")) {
						try {
							Path tempPath = Paths.get(tempSaveDir, imageKeys[i]);
							Path path = Paths.get(saveDir, imageKeys[i]);
							Files.createDirectories(path.getParent()); // 실제 업로드 폴더 생성
							
							Files.move(tempPath, path, StandardCopyOption.REPLACE_EXISTING); // 파일 이동
							// => move() 메서드는 디렉토리가 존재해야 이동이 가능하다.
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
				
			}
		}
		
		// 회원의 현재 지역 정보 가져오기
		com.setCommunity_town_id(mapper.selectTownId(com));
		
		// 게시글 등록
		return mapper.insertCommunity(com);
	}

	// 게시글 상세 조회
	public Map<String, Object> getCommunity(CommunityVO com, boolean isIncreaseReadcount) {
		// 게시글 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map = mapper.selectCommunity(com);
		
		// 조회 결과가 존재하고 isIncreaseReadcount 가 true 일 경우 조회수 증가 작업 요청
		if(map != null && isIncreaseReadcount) {
			mapper.updateReadcount(com);
			map.put("community_readcount", (int)map.get("community_readcount") + 1);
		}
		
		return map;
	}
	
	// 회원 레벨과 경험치 조회
	public Map<String, Integer> getMemberLevel(String targetId) {
		return levelMapper.selectMemberLevel(targetId);
	}

	// 게시글 삭제 작업
	public int removeCommunity(CommunityVO com) {
		return mapper.deleteCommunity(com);
	}

	// 게시글 수정 - 파일 삭제 작업
	public int removeBoardFile(CommunityVO com) {
		return mapper.updateCommunityFile(com);
	}

	// 게시글 수정 작업
	public int modifyCommunity(CommunityVO com) {
		return mapper.updateCommunity(com);
	}

	// 댓글 등록 작업
	public int registReplyCommunity(CommunityReplyVO reply) {
		return mapper.insertReplyCommunity(reply);
	}

	// 댓글 목록 조회
	public List<CommunityReplyVO> getreplyList(CommunityVO com) {
		return mapper.getReplyList(com);
	}

	// 댓글 작성자 조회
	public CommunityReplyVO getReplyWriter(CommunityReplyVO reply) {
		return mapper.selectReplyWriter(reply);
	}

	// 댓글 삭제 작업
	public int removeReply(CommunityReplyVO reply) {
		return mapper.deleteReply(reply);
	}

	// 대댓글 작성 요청
	@Transactional
	public int registReReply(CommunityReplyVO reply) {
		// 기존 대댓글의 순서조정
			mapper.updateReplySeq(reply);
		
		// 대댓글 작성 요청
		return mapper.insertReReply(reply);
	}

	// 상세 게시글 좋아요 갯수
	public int getLikeCount(CommunityVO com) {
		return mapper.selectLikeCount(com);
	}

	// 상세 게시글 좋아요 비즈니스 로직
	public String getLike(Map<String, String> like) {
		Map<String, String> map = new HashMap<String, String>();
		map = mapper.selectLike(like);
		System.out.println("셀렉트한 좋아요 : " + map);
		
		if(map != null) { // 해당 영화를 찜한 경우
			mapper.deleteLike(like); // 찜하기 삭제 수행
			return "true";
		} else { // 찜을 안한 경우
			mapper.insertLike(like); // 찜하기 등록 수행
			return "false";
		}
	}

	// 회원의 게시글 좋아요 가져오기
	public Map<String, String> getmemberLike(Map<String, String> like) {
		
		return mapper.selectLike(like);
	}

	// 게시글 임시저장
	public int registTempCommunity(CommunityVO com) {
		int count = 0;
		
		// 임시저장한 게시글 조회
		Map<String, Object> map = mapper.selectTempCommunity(com);
		System.out.println("map에는 뭐가들었나 : " + map);
		if(map == null) { // 임시저장 게시글이 없을 때
			count = mapper.insertTempCommunity(com);
		} else {
			count = mapper.updateTempCommunity(com);
		}
		
		return count;
	}

	// 임시저장 게시글 판별
	public Map<String, Object> getTempCommunity(CommunityVO com) {
		return mapper.selectTempCommunity(com);
	}

	// 임시저장 게시글 삭제
	public int removeTempCommunity(CommunityVO com, HttpSession session) {
		Map<String, Object> map = mapper.selectTempCommunity(com);
		// 임시저장 게시글이 있는 경우
		if(map != null) {
			try {
				String uploadDir = "/resources/tempUpload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				
				String[] imageKeys = {"temp_image1", "temp_image2", "temp_image3", "temp_image4", "temp_image5"};
				
				for(int i = 0; i < imageKeys.length; i++) {
					if(!map.get(imageKeys[i]).equals("")) {
						Path path = Paths.get(saveDir + "/" + map.get(imageKeys[i]));
						logger.info(saveDir + "/" + map.get(imageKeys[i]) + " : 삭제합니다.");
						Files.deleteIfExists(path);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return mapper.deleteTempCommunity(com);
	}
	
	// 사진 업로드 ajax 처리
	public int registTempImage(CommunityVO com) {
		int count = 0;
		
		// 임시저장한 게시글 조회
		Map<String, Object> map = mapper.selectTempCommunity(com);
		
		if(map == null) {
			count = mapper.insertTempImage(com);
		} else {
			count = mapper.updateTempImage(com);
		}
		
		return count;
	}

	// 임시저장 사진 삭제 ajax 처리
	@Transactional
	public int removeTempImage(CommunityVO com, HttpSession session) {
//	public int removeTempImage(String imageNum, String sId, HttpSession session) {
		
		int count = 0;
		
		int index = com.getCommunity_readcount();
		System.out.println("삭제하려는 인덱스는 : " + index);
		
		// 삭제하려는 파일 지정
//		List<MultipartFile> mFiles = new ArrayList<MultipartFile>();
//		mFiles.add(com.getFile1());
//		mFiles.add(com.getFile2());
//		mFiles.add(com.getFile3());
//		mFiles.add(com.getFile4());
//		mFiles.add(com.getFile5());
//		
//		for(MultipartFile file : mFiles) {
//			if(file != null) {
//				index = Integer.parseInt(file.getName().substring(4));
//			}
//		}
		
		// 임시저장한 게시글 조회
		Map<String, Object> map = mapper.selectTempCommunity(com);
		System.out.println("땡길려고 가져온 임시테이블 : " + map);
		
		String[] imageNames = {map.get("temp_image1").toString(), map.get("temp_image2").toString(), 
				map.get("temp_image3").toString(), map.get("temp_image4").toString(), map.get("temp_image5").toString()}; 
		
		map.put("index", index);
		
		// 삭제 이미지 널스트링 처리
		mapper.removeTempImage(map);
		
		try {
			String uploadDir = "/resources/tempUpload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			Path path = Paths.get(saveDir + "/" + imageNames[index-1]);
			logger.info(saveDir + "/" + imageNames[index-1] + " : 삭제합니다.");
			Files.deleteIfExists(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 삭제 이미지 이후의 이미지 옮기기
		for(int i = index; i < imageNames.length; i++) {
			map.put("temp_image" + (i), imageNames[i]);
			System.out.println("삭제할 파일 다음의 파일 : " + imageNames[i]);
		}
		map.put("temp_image5", "");
		
		System.out.println("삭제하고 난 이후의 임시테이블 : " + map);
		
		count = mapper.moveTempImage(map);
		
		return count;
	}

	// 게시글 파일 삭제 ajax
	@Transactional
	public int removeCommunityImage(CommunityVO com, HttpSession session) {
		
		int index = 0;
		
		List<String> imageList = new ArrayList<String>();
		imageList.add(com.getCommunity_image1());
		imageList.add(com.getCommunity_image2());
		imageList.add(com.getCommunity_image3());
		imageList.add(com.getCommunity_image4());
		imageList.add(com.getCommunity_image5());
		
		for(int i = 0; i < imageList.size(); i++) {
			if(imageList.get(i) != null) {
				index = i + 1;
			}
		}
		
		// 게시글 조회
		Map<String, Object> map = mapper.selectCommunity(com);
		map.put("index", index);
		
		String[] imageNames = {map.get("community_image1").toString(), map.get("community_image2").toString(), 
				map.get("community_image3").toString(), map.get("community_image4").toString(), map.get("community_image5").toString()};
		
		// 삭제 이미지 널스트링 처리
		mapper.removeCommunityImage(map);
		
		try {
			String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
			String saveDir = session.getServletContext().getRealPath(uploadDir);
			
			Path path = Paths.get(saveDir + "/" + imageNames[index-1]);
			logger.info(saveDir + "/" + imageNames[index-1] + " : 삭제합니다.");
			Files.deleteIfExists(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 삭제 이미지 이후의 이미지 옮기기
		for(int i = index; i < imageNames.length; i++) {
			System.out.println("삭제한 파일 다음의 파일 : " + imageNames[i]);
			map.put("community_image" + (i), imageNames[i]);
		}
		map.put("community_image5", "");
		
		System.out.println("삭제하고 난 이후의 게시글 : " + map);
		
		return mapper.moveCommunityImage(map);
	}

	
	
	
	
	
	
	// ===================== 관리자 페이지 =====================
	
	// 커뮤니티 관리 게시판 
	public List<Map<String, String>> getAllList() {
		return mapper.selectAllList();
	}

	// 커뮤니티 댓글 관리 게시판
	public List<Map<String, String>> getAllReList() {
		return mapper.selectAllReList();
	}







}
