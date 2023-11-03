<%@page import="admin.vo.ClientInfoVO"%>
<%@page import="admin.dao.ClientInfoDAO"%>
<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.vo.BoardManageVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="admin.dao.BoardManageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="관리자 회원 리스트"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../cdn/admin_cdn.jsp"/>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
td{
	cursor: pointer;
}

</style>
<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
	
	$("#btnSearch").click(function() {
		chkNull();
	});
	
	$("#keyword").keyup(function(evt) {
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keyup
});

function chkNull() {
	var keyword = $("#keyword").val();
	if(keyword.trim() == ""){
		alert("검색 키워드를 입력해주세요.");
		return;
	}//end if
	
	//글자 수 제한
	
	//모두 통과했으면 submit
	$("#frmSearch").submit();
}

function memberDetail(id){
	$("#md").val(id);
	$("#frmDetail").submit();
}
</script>
</head>
<body>
<%
ClientInfoDAO ciDAO=ClientInfoDAO.getInstance();
BoardRangeVO brVO=new BoardRangeVO();

ciDAO.selectAllUser(brVO);

String field=request.getParameter("field");
String keyword=request.getParameter("keyword");
/* 페이지가 최초 호출시에는 field나 keyword가 없다,
검색을 하지 않는 경우에도 값이 없다. */

brVO.setField(field);
brVO.setKeyword(keyword);

//1. 총 레코드의 수 --> 검색키워드에 해당하는 총 레코드의 수
int totalCount=ciDAO.totalCount(brVO);
//2. 한 화면에 보여줄 게시물의 수
int pageScale=10;
//3. 총 페이지 수
int totalPage=(int)Math.ceil(totalCount/(double)pageScale);

//int totalPage=totalCount/pageScale;
//딱 떨어지지 않은 경우 1장 더 추가
//if(totalCount % pageScale != 0){
//	totalPage++;
//}

//현재페이지의 시작번호 구하기
String tempPage=request.getParameter("currentPage");
int currentPage=1;
if(tempPage != null){
	currentPage = Integer.parseInt(tempPage);
}//end if

//시작 페이지 번호 
int startNum=currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);

//끝 페이지 번호 구하기
int endNum=startNum+pageScale-1;

//Dynamic Query에 의해서 구해진 시작번호와 끝번호를 VO에 넣는다
brVO.setStartNum(startNum);
brVO.setEndNum(endNum);

try{
	List<ClientInfoVO> memberlist = ciDAO.selectAllUser(brVO);
	pageContext.setAttribute("memberlist", memberlist);
	
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
			<strong>회원 리스트</strong>
		</div>
		
		<!-- 검색 -->
		<div class="searchDiv">
		<form id="frmSearch">
			<select class="searchList" id="field" name="field">
				<option value="1" ${ param.field eq "1" ? " selected='selected'" : "" }>이름</option>
				<option value="2"${ param.field eq "2" ? " selected='selected'" : "" }>아이디</option>
			</select>
			<input type="text" class="textBox" id="keyword" name="keyword" placeholder="내용을 입력해주세요"
			value = "${ param.keyword ne 'null' ? param.keyword : '' }"/>
			<input type="button" id="btnSearch" value="검색"/>
		</form>
		</div>
		
		<!-- 회원 상세보기 페이지 -->
		<form id="frmDetail" action="member_detail.jsp" method="get">
			<input type="hidden" id="md" name="md" value=""/>
		</form>
		
		<div id="background_box">
			<div style="margin: 8px; text-align: center;">
			<!-- 리스트 시작 -->
			<table class="table tableList">
				<thead>
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
					<th style="width:110px">No</th>
					<th style="width:150px">이름</th>
					<th style="width:220px">아이디</th>
					<th style="width:290px">이메일</th>
					<th style="width:280px">핸드폰 번호</th>
					<th style="width:170px">등급</th>
					<th style="width:200px">가입일</th>
				</tr>
				</thead>
				
				<tbody>
					<!-- list가 존재하지 않을 경우 -->
					<c:if test="${ empty memberlist }">
					<tr>
						<td colspan="7" style="text-align: center;"> 
							회원이 존재하지 않습니다. </td>
					</tr>
					</c:if>
				
				<c:forEach var="member" items="${ memberlist }" varStatus="i">
					<tr onclick="memberDetail('${ member.id }')">
						<td>${ startNum + i.index }</td>
						<td>${ member.name }</td>
						<td>${ member.id }</td>
						<td>${ member.email }</td>
						<td>${ member.phone }</td>
						<td>${ member.membership }</td>
						<td>${ member.joinDate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		
	 	<c:if test="${ not empty memberlist }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 				<%
 					BoardUtil util = BoardUtil.getInstance();
 					BoardUtilVO buVO = new BoardUtilVO("member_list.jsp", keyword, field, currentPage, totalPage);
 					out.println(util.pageNation(buVO));
 				%>
			</div>
		</div>
		</c:if> 
		<% if(request.getParameter("keyword") != null && !"null".equals(request.getParameter("keyword"))) 
			out.print("<a href='member_list.jsp'><input type='button' id='btnList' value='목록'/></a>");
		%>
	</div>
</div>	
</body>
</html>