<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.NoticeDAO"%>
<%@page import="admin.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="common.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.143/servlet_prj/common/main/favicon.png">
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
pageContext.setAttribute("totalPage", totalPage);

String tempPage = request.getParameter("page"); //현재 페이지 가져오기
int currentPage = 1;
if(tempPage != null) {
	currentPage = Integer.parseInt(tempPage);
}

int startNum = currentPage * pageScale - pageScale + 1; //페이지 게시물 시작 번호
int endNum = startNum + pageScale -1; //페이지 게시물 마지막 번호

pageContext.setAttribute("startNum", startNum);

brVO.setStartNum(startNum);
brVO.setEndNum(endNum);
%>
<!-- 임태균 scriptlet 작업장 끝 -->

<style type="text/css">
/* table Style 시작 */
.styled-table {
    border-collapse: collapse;
    margin: 25px;
    margin-left: 35px;margin-right: 35px;margin-bottom: 15px;
    font-family: sans-serif;
    min-width: 1200px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}

.styled-table th, .styled-table td {
    padding: 12px 15px;
}

.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}

.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
/* table Style 끝 */

/* 태균이가 만든거 */
td{
  color: #000000;
}
body{
 margin: 0px;
}
#wrap{
	
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
#background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
min-height: 700px;
max-width: 1300px;
position: absolute;
top: 80px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
/* 인영 style 끝*/
#num{
  width:170px;
}
#title{
  min-width: 500px;
}
#writer{
  width:230px;
}
#date{
  width:230px;
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
			location.href = "notice_wirte.jsp";
		});
		
		$(".styled-table tr").click(function() { //테이블을 열을 클릭하면 번호가 나옴, 추후에는 공지사항 코드가 나옴
			var tr = $(this);
			var td = tr.children();
			alert(td.eq(0).text()+"번째 공지사항 수정하기");
		});
		
		$("#btnLogout").click(function() {
	        alert("로그아웃..??");
	    });
		
		$("#btnAdd").click(function() {
			location.href = "notice_write.jsp?flag=1";
						
		});
	});
	
	function edit(code) {
		location.href = "notice_write.jsp?code="+code+"&flag=2";
	}
	
</script>
</head>
<body>
<%@ include file="sidebar.jsp" %>
<%
try{
	NoticeDAO nDAO = NoticeDAO.getInstance();
    List<NoticeVO> list = nDAO.selectNotice(brVO);

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
<div id="background_box">
<table class="styled-table" id="keyword">
    <thead>
        <tr style="text-align: center;">
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
        <tr onclick="edit(${notice.code})">
            <td>
            <c:out value="${i.index}"/>
            </td>
            <td><c:out value="${notice.noticeTitle}"/></td>
            <td style="text-align: center;">관리자</td>
            <td style="text-align: center;"><c:out value="${notice.noticeDate}"/></td>
        </tr>
        <!-- and so on... -->
</c:forEach>
    </tbody>
</table>
<!-- <div style="width: 100%;margin-top: 20px;padding-left: 50%;"> -->
<div style="padding-left: 1165px;padding-bottom: 10px;">
<input type="button" class="btn btn-outline-success" value="등록" id="btnAdd"/>
</div>
<div>
<!-- 페이지 이동 -->
<c:if test="${totalPage != 0}">
<nav aria-label="Page navigation example">
  <ul class="pagination ulCenter">
    <li class="page-item">
      <a class="page-link" href="#void_previous" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach var="i" begin="1" end="<%=totalPage %>" step="1">
    <li class="page-item"><a class="page-link" href="#void${i}">${i}</a></li>
    </c:forEach>
    <li class="page-item">
      <a class="page-link" href="#void_next" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</c:if>
</div>
</div>
	</div>
</div>	
</body>
</html>