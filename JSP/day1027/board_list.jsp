<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.member.vo.BoardUtilVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.BoardListVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.member.vo.BoardRangeVO"%>
<%@page import="kr.co.sist.member.dao.BoardDAO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.160/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	
});//ready

</script>

</head>
<body>
<%
BoardDAO2 bDAO=BoardDAO2.getInstance();
BoardRangeVO brVO=new BoardRangeVO();

String field=request.getParameter("field");
String keyword=request.getParameter("keyword");
//페이지가 최초 호출시에는 field나 key가 없다., 검색을 하지 않는 경우에도 값이 없다.
brVO.setField(field);
brVO.setKeyword(keyword);


//1. 총 레코드의 수 => 검색키워드에 해당하는 총 레코드의 수
int totalCount=bDAO.totalCount( ); 
//2. 한화면에 보여줄 게시물의 수
int pageScale=10;
//3. 총 페이지 수 
int totalPage=0;

totalPage= (int)Math.ceil(totalCount/(double)pageScale);
//totalPage=totalCount/pageScale;
//딱 떨어지지 않은 경우 1장 더 추가
//if(totalCount % pageScale != 0){
//	totalPage++;
//}

//현재페이지의 시작번호 구하기
String tempPage=request.getParameter("currentPage");
int currentPage=1;

if(tempPage != null){
	currentPage=Integer.parseInt(tempPage);
}//end if

int startNum=currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);
//끝페이지 번호 구하기
int endNum=startNum+pageScale-1;

//Dynamic Query에 의해서 구해진 시작번호와 끝번호를 VO 넣는다.
brVO.setStartNum(startNum);
brVO.setEndNum(endNum);
%>

<%
	try{
		List<BoardListVO> list=bDAO.selectBoard(brVO);
		
		pageContext.setAttribute("boardList", list);
	}catch( SQLException se){
		se.printStackTrace();
	}//end catch
	
%>

<div>
<table class="table">
<thead>
<tr>
<th style="width: 80px">번호</th>
<th style="width: 450px">제목</th>
<th style="width: 150px">작성자</th>
<th style="width: 120px">작성일</th>
</tr>
</thead>
<tbody>

<c:if test="${ empty boardList }">
<tr>
<td colspan="8" style="text-align: center;">게시글이 존재하지 않습니다.</td>
</tr>
</c:if>

<c:forEach var="board" items="${ boardList }" varStatus="i">
<tr>
<td><c:out value="${ startNum + i.index }"/></td>
<td><a href="board_detail.jsp?num=${ board.num}"><c:out value="${ board.subject }"/></a></td>
<td><c:out value="${ board.writer  }"/></td>
<td><fmt:formatDate value="${ board.input_date }" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
</c:forEach>

</tbody>
</table>

</div>
<div style="text-align: center">
<%
BoardUtilVO buVO=
	new BoardUtilVO("board_list.jsp","0", keyword, field,currentPage,totalPage);
		
out.println(BoardUtil.getInstance().pageNation(buVO));		
%>
</div>


</body>
</html>














