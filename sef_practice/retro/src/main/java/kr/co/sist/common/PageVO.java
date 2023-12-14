package kr.co.sist.common;

import lombok.Data;

@Data
public class PageVO {
	// 페이지 크기를 상수로 선언
	public static int pageSize = 10; 
	
	// 현재 페이지 번호
	int pageNo;
	
	// 현재 페이지의 시작 인덱스와 끝 인덱스
	int start;
	int end;
	
	// 전체 항목 수와 전체 페이지 수
	int totalCnt;
	int totalPageNo;
	
	// 검색 카테고리와 검색 텍스트
	String category;
	String searchText;
	
	// 생성자: 페이지 번호를 받아서 현재 페이지의 시작과 끝을 계산
	public PageVO(int pageNo) {
		this.pageNo = pageNo;
		this.start = (pageNo-1) * PageVO.pageSize +1;
		this.end = pageNo * PageVO.pageSize; 
	}
	
	// 전체 항목 수를 설정하면서 전체 페이지 수를 계산
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
		
		// 전체 페이지 수는 전체 항목 수를 페이지 크기로 나눈 값의 올림
		this.totalPageNo = (int) Math.ceil((double)totalCnt / (double)pageSize);
	}
}
