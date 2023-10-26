<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="admin.dao.BoardManageDAO"%>
<%@page import="admin.vo.BoardManageVO"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../cdn/admin_cdn.jsp"/>

<style type="text/css">
body{
 margin: 0px;
}
#right{
	width: calc(100vw - 240px); height: 100%;float: right;
	background: blue;
}
#left{
	min-width: 240px;height: 100%;float: left;
	padding: 0px;
	background: yellow;
}
#rightHeader{
	min-height: 55px;
	padding-top: 8px;padding-bottom: 5px;
	padding-right: 15px;
	background: #FFFFFF;
}

#rightBody{
	width: 100%; min-height: 500px;float: right;
	padding: 40px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}
</style>

<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
});
</script>
</head>
<body>
<%
	BoardManageDAO bmDAO = BoardManageDAO.getInstance();
	BoardRangeVO brVO = new BoardRangeVO();
	brVO.setTableName("review");
	
	bmDAO.selectAllReview(brVO);

	String field = request.getParameter("field");
	String keyword = request.getParameter("keyword");
	
	/* 페이지가 최초 호출 시에는 field나 keyword가 없다. 
	검색을 하지 않는 경우에도 값이 없다. */
	brVO.setField(field);
	brVO.setKeyword(keyword);
	
	//1.총 레코드의 수 
	int totalCount = BoardDAO.getInstance().totalCount(brVO);
	
	//2.한 화면에 보여줄 게시물의 수
	int pageScale = 10;
	
	//3.총 페이지 수
	int totalPage = totalCount/pageScale;
	
	//총 레코드 수 나누기 한 화면에 보여줄 게시물의 수를 했을 때
	//나머지가 있다면(0이 아니라면) 한 화면에 보여줄 게시물의 수를 초과한 것이므로
	//총 페이지 수를 하나 늘림
	//Math 사용 - 올림
	totalPage = (int)Math.ceil(totalCount/(double)pageScale);
	
	//4.현재 페이지 번호 구하기
	String tempPage = request.getParameter("currentPage");
	int currentPage = 1; //최초 페이지는 1번째 페이지가 보임
	if(tempPage != null){
		currentPage = Integer.parseInt(tempPage);
	}//end if
	
	//5.시작 번호
	int startNum = currentPage*pageScale-pageScale+1;
	pageContext.setAttribute("startNum", startNum);
	
	//6.끝 번호
	int endNum = startNum+pageScale-1;
	
	//Dynamic Query에 의해서 구해진 시작번호와 끝번호를 VO에 넣는다.
	brVO.setStartNum(startNum);
	brVO.setEndNum(endNum);
	
	try{
		List<BoardManageVO> reviewList = bmDAO.selectAllReview(brVO);
		pageContext.setAttribute("reviewList", reviewList);
		
	}catch(SQLException se){
		se.printStackTrace();
	}
%>

<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<!-- 타이틀  -->
		<div class="text" id="mainTitle">		
			<img src="../common/images/back1.png" style="width:27px"/>
			<strong>리뷰</strong>
		</div>

		<div id="background_box">
			<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table id="order_list" class="table tableList">
				<thead>
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
					<th style="width:170px">No</th>
					<th style="width:250px">상품명</th>
					<th style="width:230px">작성자</th>
					<th style="width:230px">작성일</th>
					<th style="width:200px">평점</th>
				</tr>
				</thead>
				
				<tbody>
					<c:forEach var="review" items="${ reviewList }" varStatus="i">
					<tr onclick="boardDetail(${ review.rcode })">
						<td>${ startNum + i.index }</td>
						<td>${ review.gname }</td>
						<td>${ review.id }</td>
						<td>${ review.rev_date }</td>
						<td style="color:#FF923A">
						<c:forEach var="star" begin="1" end="${ review.star }">
							<img src="../common/images/star.png" style="width:16px"/>
						</c:forEach>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
		</div>
	</div>
</div>	
</body>
</html>