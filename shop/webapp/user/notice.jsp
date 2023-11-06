<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.vo.NoticeVO"%>
<%@page import="admin.dao.NoticeDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#pageTitle {
	font-family: MADE Voyager PERSONAL_USE;
	font-size: 25px;
	text-align: center;
	margin-top: 100px;
}

#contents {
    position: relative;
    margin: 0 auto;
    width: 95%;
    max-width: 1200px;
    min-height: 100px;
}

.ec-base-table.typeList table {
    border-top: 1px solid #d7d5d5;
}

.ec-base-table table {
    position: relative;
    margin: 10px 0 0;
    border: 1px solid #d7d5d5;
    border-top: 0;
}

.board_footer {
    border: 1px solid #ccc;
    border-top: 0;
    padding: 25px 30px;
}

.board_footer .xans-board-search select {
    width: 90px;
}

select {
    height: 28px;
    border: 1px solid #d5d5d5;
    box-sizing: border-box;
}

[class^='btnNormal'],a[class^='btnNormal'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border: 1px solid #ccc;
    font-size: 13px;
    line-height: 22px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #999;
    background-color: #fff;
    -webkit-transition: .3s ease-in-out;
    transition: .3s ease-in-out;
}

thead,
tbody,
tfoot,
tr,
td,
th {
  border-color: inherit;
  border-style: solid;
  border-width: 0;
}

.notice-top-line {
	position: relative;
    /*background-color: #1D1B0C;*/
}

.notice-top-line .inner {
	width: 100%;
	display: flex;
	align-items: center;
}

.notice-top-line .inner .swiper {
	width: 100%;
	height: 42px;
}

.notice-top-line .inner .swiper .swiper-slide {
	height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}

 .notice-top-line .inner .swiper .swiper-slide:nth-child(2){
	height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}
/* 나중에 6번째 추가할 때 복사하기 */
.notice-top-line .inner .swiper .swiper-slide:nth-child(3){
    background-color:#bab8ac;
}
    .notice-top-line .inner .swiper .swiper-slide:nth-child(1){
  height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}

.notice-top-line .inner .swiper .swiper-slide img {    
    height: 42px;
}  

.ec-base-table thead th {
    padding: 15px 0 14px;
    border-bottom: 1px solid #dfdfdf;
    color: #353535;
    vertical-align: middle;
    font-weight: normal;
    color: #888;
}

input,select,textarea {
    color: #000;
    vertical-align: middle;
}

input[type=text],input[type=password] {
    height: 22px;
    line-height: 20px;
    padding: 2px 4px;
    border: 1px solid #d5d5d5;
    color: #353535;
}

.pagenationDiv{
	position: absolute;
	width: 1480px;
	text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a{
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  background-color: white;
}

.pagination span{
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  background-color: white;
}

.pagination a.active {
  background-color: black;
  color: white;
  border: 1px solid #333;
}

.pagination span.active {
  background-color: black;
  color: white;
  border: 1px solid #333;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

a {
	text-decoration: none;
	color: #333;
}

a:hover {
	color: #333;
}
</style>




<script type="text/javascript">
$(function() {
	$("#searchBtn").click(function() {
		chkNull();
	});
	
	$("#searchInput").keyup(function(evt){
		if(evt.which == 13) chkNull();
	});
	
});//ready

function chkNull() {
	var keyword = $("#searchInput").val();
	if(keyword.trim() == "") {
		alert("검색어를 입력해주세요.");
		return;
	}
	$("#boardSearchForm").submit();
}

</script>

</head>
<body>
<%@ include file="layout/header.jsp"%>
<div id="pageTitle">Notice</div><br>

<div id="wrap" style="font-family:Pretendard Medium;">    
	<div id="wrap_inner">     
		<div id="container">
			<div id="contents" style="margin-bottom: 30px">
				<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
					<div class="boardSort">
                		<span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
   					 </div>
					<div class="ec-base-table typeList gBorder">
        				<table border="1" summary="" style="text-align:center; font-size:13px">
							<caption>게시판 목록</caption>
							<!-- 컬럼 사이즈 -->
           					<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
           						<col style="width:70px;"/>
								<col style="width:auto;"/>
								<col style="width:140px;"/>
								<col style="width:140px;" class=""/>
							</colgroup>
							
							<!-- thead(컬럼명) -->
							<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							  <tr style=" ">
								<th scope="col"> NO.</th>
                    			<th scope="col"> SUBJECT</th>
                    			<th scope="col"> NAME</th>
                    			<th scope="col" class="">DATE</th>
                			  </tr>
                			</thead>
                			
                			<!-- tbody(게시글 목록) -->
							<tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
							<%
							BoardDAO bDAO = BoardDAO.getInstance();
							BoardRangeVO brVO = new BoardRangeVO();
							String keyword = request.getParameter("keyword");
							String field = request.getParameter("field");
							
							brVO.setKeyword(keyword);
							brVO.setField(field);

							int totalCount = bDAO.totalCountNotice(brVO);

							int pageScale = 15;

							int totalPage = (int)Math.ceil(totalCount / (double)pageScale); //페이지 수 가져오기

							String tempPage = request.getParameter("currentPage"); //현재 페이지 가져오기
							int currentPage = 1;
							if(tempPage != null) {
								currentPage = Integer.parseInt(tempPage);
							}

							pageContext.setAttribute("totalPage", totalPage);
							pageContext.setAttribute("currentPage", currentPage);

							//5.시작 번호
							int startNum = currentPage*pageScale-pageScale+1;
							pageContext.setAttribute("startNum", startNum);

							//6.끝 번호
							int endNum = startNum+pageScale-1;

							//Dynamic Query에 의해서 구해진 시작번호와 끝번호를 VO에 넣는다.
							brVO.setStartNum(startNum);
							brVO.setEndNum(endNum);
							
							try{
								NoticeDAO nDAO = NoticeDAO.getInstance();
								List<NoticeVO> list = null;
								
								if(brVO != null) {
							    	list = nDAO.selectNotice(brVO);
								}

							    String id = (String)session.getAttribute("sesId");
							    
							    pageContext.setAttribute("noticeList", list);
							    
							 }catch (SQLException se) {
							    se.printStackTrace();
							 }//end catch
							%>
							<!-- 게시글 시작 -->
							<c:if test="${empty noticeList }">
								<tr>
									<td colspan="4" style="text-align: center;">게시물이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="notice" items="${noticeList}" varStatus="i">
							<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
								<td><c:out value="${startNum + i.index}"/></td>
                    			<td class="displaynone"></td>
                    			<td class="subject left txtBreak">
                        			<!-- 제목 -->
                        			<a href="http://localhost/prj_web_shopping/user/notice_detail.jsp?ncode=${notice.ncode}">
                        				<c:out value="${notice.noticeTitle}"/>
                        			</a>                     
                        		</td>
                        		<!-- 작성자 -->
                    			<td>관리자</td>
                    			<!-- 작성일 -->
                    			<td class=""><c:out value="${notice.noticeDate}"/></td>
                			</tr>
                			</c:forEach>
                			<!-- 게시글 끝 -->
                			
							</tbody>
					</table>

<p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone ">　
</p>
    </div>
    
    <!-- 하단 검색 영역 -->
    <div class="board_footer">
		<form id="boardSearchForm" method="get" target="_top" enctype="multipart/form-data">
			<div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
				<fieldset class="boardSearch">
					<legend>게시물 검색</legend>
					<p class="category displaynone"></p>
						<p>
						<select id="search_key" name="field" style="font-family:Pretendard Medium" fw-filter="" fw-label="" fw-msg="">
							<option value="subject"${ param.field eq "subject" ? "selected='selected'" : ""}>제목</option>
							<option value="content"${ param.field eq "content" ? "selected='selected'" : ""}>내용</option>
						</select> 
						<input id="searchInput" name="keyword" class="inputTypeText" 
								placeholder="" type="text" style="padding: 13px; font-family:Pretendard Medium"
								value="${ param.keyword ne 'null' ? param.keyword : '' }"> 
						<input type="button" class="btnNormalFix" id="searchBtn" value="SEARCH" style="border:0; padding:10px"/>
						</p>
				</fieldset>
			</div>
		</form>
	</div>
	<!-- 하단 검색 영역 끝 -->

            <!-- 페이지 네이션 -->
            <!-- <div class="xans-element- xans-product xans-product-reviewpaging ec-base-paginate typeList">
            	<a href="#none" class="first">첫 페이지</a>
				<a href="#none">이전 페이지</a>
				<ol>
					<li class="xans-record-"><a href="?page_4=1#use_review" class="this">1</a></li>
                    <li class="xans-record-"><a href="?page_4=2#use_review" class="other">2</a></li>
                    <li class="xans-record-"><a href="?page_4=3#use_review" class="other">3</a></li>
                    <li class="xans-record-"><a href="?page_4=4#use_review" class="other">4</a></li>
                    <li class="xans-record-"><a href="?page_4=5#use_review" class="other">5</a></li>
                </ol>
				<a href="?page_4=2#use_review">다음 페이지</a>
				<a href="?page_4=228#use_review" class="last">마지막 페이지</a>
			</div> -->

</div>
</div>
</div>
</div>
</div>
			<div class="pagenationDiv" style="width: 100%;margin: 0px auto;text-align: center;">
			<div class="pagination">
 				<%
 					BoardUtil util = BoardUtil.getInstance();
 					BoardUtilVO buVO = new BoardUtilVO();
					buVO.setKeyword(keyword);
					buVO.setField(field);
 					buVO.setUrl("notice.jsp");
 					buVO.setCurrentPage(currentPage);
 					buVO.setTotalPage(totalPage);
 					
 					out.print(util.pageNation(buVO));
 				%>
			</div>
			</div>
			
			<p style="height:100px"></p>

<%@ include file="layout/footer.jsp"%>
</body>
</html>