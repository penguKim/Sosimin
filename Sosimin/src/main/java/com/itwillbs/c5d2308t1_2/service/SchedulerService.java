package com.itwillbs.c5d2308t1_2.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.itwillbs.c5d2308t1_2.mapper.CommunityMapper;
import com.itwillbs.c5d2308t1_2.mapper.MemberMapper;
import com.itwillbs.c5d2308t1_2.vo.MemberVO;

public class SchedulerService {
	private static final Logger logger = LoggerFactory.getLogger(SchedulerService.class);

	@Autowired
	private ServletContext servletContext; // 세션 대신 컨텍스트 경로찾기
	
	@Autowired
	private CommunityMapper communityMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	
//	@Scheduled(cron="*/5 * * * * *")
//	public void test() {
//		logger.info("스케쥴러를 실행합니다.");
//	}
	
	// 크론 표현식으로 매일 새벽 1시 10분 0초에 실행된다.
	@Scheduled(cron="00 10 10 * * ?")
	public void RemoveTempCommunity() {
		logger.info("임시 커뮤니티 삭제를 실행합니다.");
		
		LocalDate today = LocalDate.now(); // 오늘 날짜
		LocalDate yesterday = today.minusDays(1); // 어제 날짜
		
		
		
		List<Map<String, String>> tempList = communityMapper.selectTempList(yesterday.toString());
		
		for(Map<String, String> temp : tempList) {
			logger.info("임시저장글" + String.valueOf(temp.get("temp_id"))+ "번을 삭제합니다.");
			int deleteCount = communityMapper.removeTempCommunity(String.valueOf(temp.get("temp_id")));
		
			if(deleteCount > 0) {
				try {
					// -------------------------------------------------------------
					// [ 서버에서 파일 삭제 ]
					// 실제 업로드 경로 알아내기
					String uploadDir = "/resources/upload"; // 가상의 경로(이클립스 프로젝트 상에 생성한 경로)
					String saveDir = servletContext.getRealPath(uploadDir);
					// -----------------------------------------------------------
					
					// 파일명 배열 생성
					String[] arrFileNames = {temp.get("temp_image1").toString(), temp.get("temp_image2").toString(), 
							temp.get("temp_image3").toString(), temp.get("temp_image4").toString(), temp.get("temp_image5").toString()}; 
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
			}
			
		}
		
	}
	
	// 위치 재인증
//	@Scheduled(cron="*/10 * * * * *")
	public void neighbor() {
		List<MemberVO> memberList = memberMapper.selectMemberAuthRequired();
		LocalDateTime now = LocalDateTime.now();
		for(MemberVO member : memberList) {
//			System.out.println(member.getMember_neighbor_time());
			// 2. Date -> LocalDate        
//			LocalDate localDate = member.getMember_neighbor_time().toInstant()   // Date -> Instant                
//					.atZone(ZoneId.systemDefault())  // Instant -> ZonedDateTime                
//					.toLocalDate(); // ZonedDateTime -> LocalDate         
//			System.out.println("변환 " + localDate);
//			 3. Date -> LocalDateTime        
//			LocalDateTime localDateTime = member.getMember_neighbor_time().toInstant() // Date -> Instant                
//					.atZone(ZoneId.systemDefault()) // Instant -> ZonedDateTime                
//					.toLocalDateTime(); // ZonedDateTime -> LocalDateTime         
//			System.out.println("변환 " + localDateTime);
			
			Duration duration =  Duration.between(member.getMember_neighbor_time(), now);			
			System.out.println("날짜 차이 " + duration.toHours());
			
			if(duration.toHours() >= 24) {
				member.setMember_neighbor_auth(0);
				memberMapper.updateMemberNeighborAuth(member.getMember_id());
			}
		}
	}
	
}
