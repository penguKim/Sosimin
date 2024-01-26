package com.itwillbs.c5d2308t1_2.handler;

import org.apache.commons.lang3.RandomStringUtils;

// 특정 길이의 난수 생성에 사용할 클래스 정의
// => 단, 난수 생성 작업 없이 RandomStringUtils 클래스 활용
public class GenerateRandomCode {
	// 난수 생성하여 문자열로 리턴할 getRandomCode() 메서드 정의
	// => 파라미터 : 난수 길이 (정수)   리턴타입 : String
	// => 인스턴스 생성없이 즉시 호출 가능하도록 static 메서드 활용
	public static String getRandomCode(int length) {
		// RandomStringUtils 클래스의 randomAlphanumeric() 메서드 호출하여
		// 알파벳, 숫자 조합 난수 생성하여 리턴
		// (알파벳, 아스키, 알파벳+숫자 등 다양한 것이 있음)
		// => pom.xml에 commons-lang3 라이브러리 추가 필요
		return RandomStringUtils.randomAlphanumeric(length);
	}
}
