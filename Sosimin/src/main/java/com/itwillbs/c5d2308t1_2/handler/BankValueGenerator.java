package com.itwillbs.c5d2308t1_2.handler;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Component;

// 핀테크 요청 작업에 사용할 다양한 값을 생성하는 클래스
// => 스프링 빈으로 관리하기 위해 @Component 어노테이션 적용
@Component
public class BankValueGenerator {
	// 거래고유번호 자동생성할 getBankTranId() 메서드 정의
	// => 파라미터 : 없음    리턴타입 : String
	// => 생성규칙(3.11. 거래고유번호(참가기관) 생성 안내)
	//    이용기관코드(10자리) + 생성주체구분코드(“U”) + 이용기관 부여번호(9자리)
	public String getBankTranId() {
		String bank_tran_id = "";
		
		// GenerateRandomCode - getRandomCode() 메서드 사용 => 파라미터로 난수 길이 전달
		// => 리턴받은 알파벳숫자 난수를 모두 대문자로 변환 시 toUpperCase() 메서드 활용
		bank_tran_id = "M202113854" + "U" + GenerateRandomCode.getRandomCode(9).toUpperCase();
		
		return bank_tran_id;
	}

	// 작업 요청일시(거래시간 등) 자동 생성할 getTranDTime() 메서드 정의
	// => 파라미터 : 없음    리턴타입 : String
	// => 현재 시스템의 날짜 및 시각을 기준으로 14자리 문자열 생성(yyyyMMddHHmmss 형식 활용)
	// => java.time.LocalDateTime 클래스와 java.time.DateTimeFormatter 활용
	public String getTranDTime() {
		// 현재 시스템의 날짜 및 시각 정보 가져오기
		LocalDateTime localDateTime = LocalDateTime.now();
		
		// DateTimeFormatter 클래스의 ofPattern() 메서드 활용하여 표시할 날짜 포맷 지정
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		
		// LocalDateTime 객체에 포맷을 적용하여 문자열로 리턴되는 날짜 및 시각 정보 리턴
		return localDateTime.format(dateTimeFormatter);
	}
	
}
