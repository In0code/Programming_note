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
<c:if test="${ empty adminId }">
	<c:redirect url="login.jsp"/>
</c:if>
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

td {
	text-align: left;
}

th {
	height:63px;
	font-size:18.5px;
	background-color: #FAFAFA;
	vertical-align: middle;
	width: 165px;
}

#revContent {
	position: absolute;
	left: 65px;
}

#btnDel {
  position: absolute; 
  top: 820px;
  left: 1310px;
  height: 60px;
  width: 120px;
  font-size:20px;
  border-radius: 10px;
}

</style>

<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
});

function boardDelete(rcode){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			url : "board_delete_process.jsp",
			type : "get",
			data : "rcode="+rcode,
			dataType : "json",
			error : function(xhr){
				alert("서버에서 문제가 발생하였습니다.");
				location.href = "boardManagement.jsp";
			},
			success : function(jsonObj){
				if(jsonObj.result){
					alert("삭제 되었습니다.")
				}else{
					alert("서버에서 문제가 발생하였습니다.");
				}
				location.href = "boardManagement.jsp";
			}
		});
	}
}

</script>
</head>
<body>
<%
	BoardManageDAO bmDAO = BoardManageDAO.getInstance();
	String rcode = request.getParameter("rcode");
	BoardManageVO bmVO = bmDAO.selectOneReview(rcode);
	pageContext.setAttribute("review", bmVO);
	pageContext.setAttribute("rcode", rcode);
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
			<a href="javascript:history.back()">	
				<img src="../common/images/back1.png" style="width:27px"/>
				<strong>리뷰</strong>
			</a>
		</div>

		<div id="background_box" style="width:70%; height: 150%">
			<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table id="order_list" class="table tableList">
				<tr>
					<th style="background-color: #F7F7F7">제목</th>
					<td colspan="5" style="padding-left:20px"><c:out value="${ review.title }"/></td>
				</tr>
				<tr>
					<th style="background-color: #F7F7F7">작성자</th>
					<td colspan="5" style="padding-left:20px"><c:out value="${ review.id }"/></td>
				</tr>
				<tr>
					<th style="background-color: #F7F7F7">작성일</th>
					<td style="width:160px; padding-left:20px"><c:out value="${ review.rev_date }"/></td>
					<th style="width:100px; background-color: #F7F7F7">조회수</th>
					<td style="width:110px; padding-left:20px"><c:out value="${ review.r_view }"/></td>
					<th style="width:100px; background-color: #F7F7F7; ">평점</th>
					<td style="padding-left:20px">
					<c:forEach var="star" begin="1" end="${ review.star }">
						<img src="../common/images/star.png" width="16px"/>
					</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="6" style="border:none; padding: 10px 0px 0px 58px;">
					<span style="font-size:18px; text-align:left;">${ review.rev_cont }</span>
					</td>
				</tr>
			</table>

			</div>
		</div>
	</div>
	
	<form action="board_delete_process.jsp" id="frmDel">
		<input type="button" id="btnDel" class="btn btn-outline-danger input" value="삭제" onclick="boardDelete(${ rcode })"/>
		<%-- <input type="hidden" id="rcode" name="rcode" value="${ rcode }"/> --%>
	</form>
	
	
</div>	
</body>
</html>