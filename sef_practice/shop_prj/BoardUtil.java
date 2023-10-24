package kr.co.sist.util;

import kr.co.sist.member.vo.BoardUtilVO;

public class BoardUtil {

	private static BoardUtil bUtil;
	private BoardUtil() {
	}//BoardUtil
	
	public static BoardUtil getInstance() {
		if(bUtil == null) {
			bUtil=new BoardUtil();
		}//end if
		return bUtil;
	}//getInstance
	
	public String pageNation( BoardUtilVO buVO ) { 
		StringBuilder pageNation=new StringBuilder();
		
		int currentPage=buVO.getCurrentPage(); //현재페이지
		int totalPage=buVO.getTotalPage(); //총 페이지수
		
		
		
		//화면에 보여줄 페이지 인덱스의 수
		int pageNumber=3;
		//2. 시작 페이지 번호
		int startPage=((currentPage-1)/pageNumber)*pageNumber+1;
		//out.println( "시작번호 : "+startPage );
		//3. 끝 페이지 번호
		int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//out.println( "끝번호 : "+endPage );

		//구해진 끝 페이지 번호가 총 페이집다 작다면 총 페이지수가 끝 페이지 번호가 된다
		if(totalPage <= endPage){
			endPage=totalPage;
		}//end if

		//6. 첫 페이지가 인덱스 화면이 아닌 경우
		int movePage=0;
		if(currentPage > pageNumber ){
			movePage=startPage-1;
			pageNation.append("[ <a href='").append(buVO.getUrl())
			.append("?currentPage=").append(movePage).append("&dataFlag=")
			.append(buVO.getDataFlag()).append("&keyword=")
			.append(buVO.getKeyword()).append("&field=").append(buVO.getField())
			.append("'> &lt;&lt; </a> ] NEXT");
		}//end if

		//7. 시작 번호부터 끝 번호까지 반복
		movePage=startPage;
		while( movePage <= endPage ){
			if(movePage == currentPage ){ //현재 페이지와 이동할 페이지가 같다면 링크 없이 인덱스 리스트를 제공
				pageNation.append("[ <span style='font-size: 20px'>")
				.append( movePage ).append(" </span>  ]");
			} else{
				pageNation.append("[ <a href='").append(buVO.getUrl())
				.append("?currentPage=").append( movePage ).append("&dataFlag=")
				.append(buVO.getDataFlag()).append("&keyword=")
				.append(buVO.getKeyword()).append("&field=")
				.append(buVO.getField()).append("'>").append(movePage).append("</a> ]"); 
			}//end else
			movePage++;
		}//emd while
			//8. 뒤에 페이지가 더 있는 경우
			if( totalPage > endPage ){
				movePage=endPage+1;
		pageNation.append("PRIV  [ <a href='").append(buVO.getUrl())
		.append("?currentPage=").append( movePage ).append("&dataFlag=")
		.append(buVO.getDataFlag()).append("&keyword=").append(buVO.getKeyword())
		.append("&field=").append(buVO.getField()).append("'> &gt;&gt; </a> ]");
			}//end if
		
		return  pageNation.toString();
	}//pageNation
	
	
	
	
}//class
