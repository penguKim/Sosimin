package com.itwillbs.c5d2308t1_2.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

public class SchedulerService {
	private static final Logger logger = LoggerFactory.getLogger(SchedulerService.class);

	
//	@Scheduled(cron="*/5 * * * * *")
//	public void test() {
//		logger.info("스케쥴러를 실행합니다.");
//	}
	
	// 크론 표현식으로 매일 23시 50분 0초에 실행된다.
//	@Scheduled(cron="0 50 23 * * ?")
}
