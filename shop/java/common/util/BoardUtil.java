package common.util;

public class BoardUtil {

	private static BoardUtil bUtil;
	
	private BoardUtil() {
		
	}
	
	public static BoardUtil getInstance() {
		if(bUtil==null) {
			bUtil = new BoardUtil();
		}
		return bUtil;
	}//getInstance
	
	public String pageNation(BoardUtilVO buVO) {
		StringBuilder pageNation = new StringBuilder();
		int currentPage = buVO.getCurrentPage();
		int totalPage = buVO.getTotalPage();
		
		//1.화면에 보여줄 페이지 인덱스 수
		int pageNumber = 3;

		//2.시작 페이지 번호
		int startPage = ((currentPage-1)/pageNumber)*pageNumber+1;
		//out.print("시작 번호 : " + startPage);

		//3.끝 페이지 번호 
		int endPage = (((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//out.print("끝 번호 : " + endPage);

		//4.구해진 끝 페이지 번호가 총 페이지보다 작다면 총 페이지수가 끝 페이지 번호가 된다.
		if(totalPage <= endPage){
			endPage = totalPage;
		}

		//[ << ]
		//5.첫 페이지의 인덱스가(1,2,3) 아닌 경우 이전으로 가기
		//  4번 인덱스부터 << 가 활성화
		int movePage = 0;
		if(currentPage > pageNumber) { //시작페이지보다 1 적은 페이지로 이동
			movePage = startPage-1;
		
			pageNation.append("<a href = '").append(buVO.getUrl()).append("?currentPage=").append(movePage)
			.append("&keyword=").append(buVO.getKeyword()).append("&field=")
			.append(buVO.getField()).append("'>&laquo;</a>");
		}else{
			pageNation.append("<span>&laquo;</span>");
		}

		//6.시작번호부터 끝번호까지 출력
		movePage = startPage;
		while(movePage <= endPage){
			if(movePage == currentPage){ 
			//현재 페이지 인덱스는 링크 없이 인덱스 리스트 제공
			pageNation.append("<span class='active'>").append(movePage).append("</span>"); 
		
			}else{
			//나머지 인덱스는 링크 있는 인덱스 제공
			pageNation.append("<a href='")
			.append(buVO.getUrl()).append("?currentPage=").append(movePage).append("&keyword=").append(buVO.getKeyword())
			.append("&field=").append(buVO.getField()).append("'>").append(movePage).append("</a>");
		
			}//end else
			
			movePage++;
		}//end while

		//[ >> ]
		//8.뒤에 페이지가 더 있는 경우
		if(totalPage>endPage){
			movePage = endPage+1; //현재 페이지의 마지막 인덱스에 +1
		
			pageNation.append("<a href = '").append(buVO.getUrl())
			.append("?currentPage=").append(movePage).append("&keyword=")
			.append(buVO.getKeyword()).append("&field=").append(buVO.getField())
			.append("'>&raquo;</a>");   
			
		}else{
			//없으면 링크 비활성화
			pageNation.append("<span>&raquo;</span>");
		}
		
		return pageNation.toString();
	}//pageNation
	
	/**
	 * 승연이만 쓰는 페이지네이션
	 * @param buVO
	 * @return
	 */
	public String pageNationBM(BoardUtilVO buVO) {
		StringBuilder pageNation = new StringBuilder();
		int currentPage = buVO.getCurrentPage();
		int totalPage = buVO.getTotalPage();
		
		//1.화면에 보여줄 페이지 인덱스 수
		int pageNumber = 3;

		//2.시작 페이지 번호
		int startPage = ((currentPage-1)/pageNumber)*pageNumber+1;
		//out.print("시작 번호 : " + startPage);

		//3.끝 페이지 번호 
		int endPage = (((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//out.print("끝 번호 : " + endPage);

		//4.구해진 끝 페이지 번호가 총 페이지보다 작다면 총 페이지수가 끝 페이지 번호가 된다.
		if(totalPage <= endPage){
			endPage = totalPage;
		}

		//[ << ]
		//5.첫 페이지의 인덱스가(1,2,3) 아닌 경우 이전으로 가기
		//  4번 인덱스부터 << 가 활성화
		int movePage = 0;
		if(currentPage > pageNumber) { //시작페이지보다 1 적은 페이지로 이동
			movePage = startPage-1;
		
			pageNation.append("<a href = '").append(buVO.getUrl()).append("?currentPage=").append(movePage).append("&category=")
			.append(buVO.getCategory()).append("&keyword=").append(buVO.getKeyword()).append("&field=")
			.append(buVO.getField()).append("'>&laquo;</a>");
		}else{
			pageNation.append("<span>&laquo;</span>");
		}

		//6.시작번호부터 끝번호까지 출력
		movePage = startPage;
		while(movePage <= endPage){
			if(movePage == currentPage){ 
			//현재 페이지 인덱스는 링크 없이 인덱스 리스트 제공
			pageNation.append("<span class='active'>").append(movePage).append("</span>"); 
		
			}else{
			//나머지 인덱스는 링크 있는 인덱스 제공
			pageNation.append("<a href='")
			.append(buVO.getUrl()).append("?currentPage=").append(movePage).append("&category=")
			.append(buVO.getCategory()).append("&keyword=").append(buVO.getKeyword())
			.append("&field=").append(buVO.getField()).append("'>").append(movePage).append("</a>");
		
			}//end else
			
			movePage++;
		}//end while

		//[ >> ]
		//8.뒤에 페이지가 더 있는 경우
		if(totalPage>endPage){
			movePage = endPage+1; //현재 페이지의 마지막 인덱스에 +1
		
			pageNation.append("<a href = '").append(buVO.getUrl())
			.append("?currentPage=").append(movePage).append("&category=")
			.append(buVO.getCategory()).append("&keyword=")
			.append(buVO.getKeyword()).append("&field=").append(buVO.getField())
			.append("'>&raquo;</a>");   
			
		}else{
			//없으면 링크 비활성화
			pageNation.append("<span>&raquo;</span>");
		}
		
		return pageNation.toString();
	}//pageNation
}
