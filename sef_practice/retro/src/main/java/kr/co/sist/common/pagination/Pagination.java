package kr.co.sist.common.pagination;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
public class Pagination {

	//setter로 원하는 값 설정
	private int pageScale = 10;
	private int paginationScale = 5 / 2; //앞뒤로 표시하게 위해서 2로 나눔
	//현재 페이지의 시작 번호를 저장하는 변수 setStartPageNum method를 사용해서 저장해주세요
	private int currentPage = -1;
	private int startNum, endNum, totalPage, paginationStartNum, paginationEndNum;

	/**
	 * 데이터베이스에서 얻은 전체 레코드 수와 현재 페이지를 매개변수로 입력하면<br>
	 * 전체 페이지 수, 시작 페이지 번호, 끝 페이지 번호, 페이지 내의 보여줄 데이터의 시작과 끝 번호를 설정한다.<br>
	 * 구해진 값은 getter method로 얻을 수 있다.
	 * @param totalCount int
	 * @param pageNum int
	 */
	public PaginationDomain setStartEndPageNum(int totalCount, int pageNum) {
		totalPage = totalCount % pageScale != 0 ? (totalCount / pageScale) + 1 : totalCount / pageScale;
		currentPage = pageNum;
		startNum = currentPage * pageScale - pageScale + 1;		
		endNum = startNum + pageScale - 1; //끝
		paginationStartNum = (pageNum - paginationScale) < 1 ? 1 : (pageNum - paginationScale);
		
		if((paginationStartNum + 4) > totalPage) {
			paginationEndNum = totalPage;
			paginationStartNum = 1;
		} else {
			paginationEndNum = paginationStartNum + 4;
		}
		
		PaginationDomain pd = new PaginationDomain();
		pd.setStartNum(startNum);
		pd.setEndNum(endNum);
		pd.setPaginationStartNum(paginationStartNum);
		pd.setPaginationEndNum(paginationEndNum);
		
		return pd;
	}
	
	/**
	 * 각자가 원하는 한 페이지에 보여질 데이터 수인 pageScale 변수를 설정한다.
	 * @param pageScale int
	 */
	public void setPageScale(int pageScale) {
		this.pageScale = pageScale;
	}

	/**
	 * 한 화면에 보여줄 페이지의 개수
	 * @param paginationScale
	 */
	public void setPaginationScale(int paginationScale) {
		this.paginationScale = paginationScale;
	}
}
