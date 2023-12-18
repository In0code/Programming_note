package kr.co.sist.common;

import lombok.Data;

@Data
public class PageVO {
	//페이지 크기를 상수로 선언
	public static int pageSize = 10; 
	
	//현재 페이지 번호
	int pageNo;
	
	//현재 페이지의 시작 인덱스와 끝 인덱스
	int start;
	int end;
	
	//전체 항목 수와 전체 페이지 수
	int totalCnt;
	int totalPageNo;
	
	//5페이지 이상 일때 전 페이지, 다음페이지
	boolean prev;
	boolean next;
	
	//검색 카테고리와 검색 텍스트
	String category;
	String searchText;
	
	//생성자: 페이지 번호를 받아서 현재 페이지의 시작과 끝을 계산
	public PageVO(int pageNo) {
		this.pageNo = pageNo;
		this.start = (pageNo-1) * PageVO.pageSize +1;
		this.end = pageNo * PageVO.pageSize; 
	}
	
	//전체 항목 수를 설정하면서 전체 페이지 수를 계산
    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;

     // 전체 페이지 수는 전체 항목 수를 페이지 크기로 나눈 값의 올림
        this.totalPageNo = (int) Math.ceil((double) totalCnt / (double) PageVO.pageSize);

        // 현재 페이지가 1페이지부터 5페이지까지는 이전 버튼을 숨기고, 
        // 6페이지 이상부터는 다음 버튼을 누를 때마다 5페이지씩 증가하는 페이지로 변경
        if (this.pageNo <= 5) {
            this.prev = false;
            this.next = this.totalPageNo > 5;  // 5페이지 이상이면 다음 버튼 표시
        } else {
            this.prev = true;
            this.next = this.pageNo + 4 < this.totalPageNo;  //다음 버튼을 누를 때마다 5페이지씩 증가
        }
    }
}
