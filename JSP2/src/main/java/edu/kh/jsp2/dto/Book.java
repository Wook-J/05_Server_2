package edu.kh.jsp2.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// lombok.jar 라이브러리 이용방법
// 1) lombok 기능을 이용하고자 하는 프로젝트의 lib 폴더에 lombok.jar 추가
// 2) lombok 을 이용하는 IDE 설치해주기 (241002 메모장 참고)
// 3) @Data 어노테이션!!

// @Getter, @Setter, @ToString 따로따로도 가능!
@Data				// Getter + Setter + toString을 만들어 줌!!!
@NoArgsConstructor	// 기본 생성자
@AllArgsConstructor // 모든 필드 초기화용 매개변수 생성자
public class Book {
	// 필드
	private String title;
	private String writer;
	private int price;
	
	// 메서드 (생성자, getter/setter, toString ...)
}
