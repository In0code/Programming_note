<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="javax.swing.plaf.synth.SynthOptionPaneUI"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.NoticeDAO"%>
<%@page import="admin.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 임태균 scriptlet 작업장 시작 -->
<%
BoardDAO bDAO = BoardDAO.getInstance();
BoardRangeVO brVO = new BoardRangeVO();

brVO.setTableName("NOTICE");

int totalCount = bDAO.totalCount(brVO);

int pageScale = 10;

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
%>
<!-- 임태균 scriptlet 작업장 끝 -->

<style type="text/css">
/* 태균이가 만든거 */
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
	padding: 20px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

/* 인영 style 시작*/
#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 90px;
	padding-top: 10px;
} 
/* #background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
min-height: 770px;
max-width: 1300px;
position: absolute;
top: 80px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
padding-left: 20px;
padding-right: 20px;
} */
/* 인영 style 끝*/
#num{
  width:170px;
}
#title{
  width: 500px;
}
#writer{
  width:230px;
  text-align: center;
}
#date{
  width:230px;
  text-align: center;
}
#btnAdd{
position: absolute; 
  left: 1340px;
  width: 120px;
  font-size:20px;
  border-radius: 10px;
}
.divCircle {
  background-color : #FFFFFF;
  /* min-width: 1000px; */
  /* min-height: 500px; */
  border-radius: 30px;
  padding: 20px;
  padding-bottom: 2px;
  
}
.ulCenter{
  display: table;
  margin-left: auto;
  margin-right: auto;
}
.ulCenter > li{
  float: left;
}
/* 태균이가 만든거 끝 */
</style>

<script type="text/javascript">
	$(function() {
		$("#btnAdd").click(function() {
			location.href = "notice_wirte.jsp?no=5";
		});
		
		/* $(".styled-table tr").click(function() { //테이블을 열을 클릭하면 번호가 나옴, 추후에는 공지사항 코드가 나옴
			var tr = $(this);
			var td = tr.children();
			alert(td.eq(0).text()+"번째 공지사항 수정하기");
		}); */
		
		$("#btnLogout").click(function() {
			location.href="logout.jsp";
		});
		
		$("#btnAdd").click(function() {
			location.href = "notice_write.jsp?no=5&flag=1";
						
		});
	});
	
	function edit(code) {
		location.href = "notice_detail.jsp?no=5&flag=2&ncode="+code;
	}
	
</script>
</head>
<body>
<%@ include file="sidebar.jsp" %>
<%
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
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
	<div class="text" id="mainTitle">
		<strong>공지사항</strong>
	</div>
<div id="background_box" style="top:90px;">
<table class="table tableList" id="order_list">
    <thead>
        <tr id="top_title" style="text-align: center;">
            <th id="num">No.</th>
            <th id="title">제목</th>
            <th id="writer">작성자</th>
            <th id="date">작성일</th>
        </tr>
    </thead>
    <tbody>
<c:if test="${empty noticeList }">
<tr>
	<td colspan="4" style="text-align: center;">게시물이 없습니다.</td>
</tr>
</c:if>
<c:forEach var="notice" items="${noticeList}" varStatus="i">
        <tr onclick="edit(${notice.ncode})">
            <td style="text-align: center;">
            <c:out value="${startNum + i.index}"/>
            </td>
            <td><c:out value="${notice.noticeTitle}"/></td>
            <td style="text-align: center;">관리자</td>
            <td style="text-align: center;"><c:out value="${notice.noticeDate}"/></td>
        </tr>
        <!-- and so on... -->
</c:forEach>
    </tbody>
</table>
</div>
<div>
<!-- 페이지 이동 -->
<c:if test="${not empty noticeList}">
<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 				<%
 					BoardUtil util = BoardUtil.getInstance();
 					BoardUtilVO buVO = new BoardUtilVO();
 					buVO.setUrl("notice.jsp");
 					buVO.setCurrentPage(currentPage);
 					buVO.setTotalPage(totalPage);
 					
 					out.print(util.pageNation(buVO));
 				%>
			</div>
<input type="button" class="btn btn-outline-success input" value="등록" id="btnAdd" />
		</div>
</c:if>
</div>
	</div>
</div>	
</body>
</html>