<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
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

function memberDetail(mDetail){
	$("#mDetail").val(mDetail);
	$("#frmDetail").submit();
}
</script>
</head>
<body>
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
			<select class="searchCat" id="category" name="category">
					<option value="1">전체</option>
				<c:forEach var="cat" items="" varStatus="i">
					<option value="1"></option>
				</c:forEach>
			</select>
			<select class="searchList" id="field" name="field">
				<option value="1">이름</option>
				<option value="2">아이디</option>
			</select>
			<input type="text" class="textBox" id="keyword" name="keyword" placeholder="내용을 입력해주세요"
			value = ""/>
			<input type="button" id="btnSearch" value="검색"/>
		</form>
		</div>
		
		<!-- 회원 상세보기 페이지 -->
		<form id="frmDetail" action="member_detail.jsp">
			<input type="hidden" id="mDetail" name="mDetail"/>
		</form>
		
		<div id="background_box">
			<div style="margin: 10px; text-align: center;">
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
					<th style="width:210px">가입일</th>
				</tr>
				</thead>
				
				<tbody>
					<!-- list가 존재하지 않을 경우 -->
					<c:if test="${ empty memberList }">
					<tr>
						<td colspan="6" style="text-align: center;"> 
							회원이 존재하지 않습니다. </td>
					</tr>
					</c:if>
				
					<c:forEach var="member" items="" varStatus="i">
					<tr onclick="">
						<td>ㅇㅇ</td>
						<td>ㅇㅇ</td>
						<td>ㅇㅇ</td>
						<td>ㅇㅇ</td>
						<td>ㅇㅇ</td>
						<td>ㅇㅇ</td>
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