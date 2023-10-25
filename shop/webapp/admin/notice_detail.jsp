<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">
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
	padding: 40px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

/* 인영 - 주문관리 style  시작*/
#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 
#background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
min-height: 760px;
max-width: 1300px;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
#divTable{
position: absolute;
width: 100%;
height: 120px;
}
#info{
padding: 10px;
position: absolute;
width: 100%;
top:126px;
height: 624px;
}
.pad{
padding-top: 10px;
padding-bottom: 10px;
padding-left: 30px;
padding-right: 30px;
}
textarea {
width: 100%;
height: 560px;
border: none;
}
#btnEdit{
margin-top: 10px;
float: right;
height: 30px;
width: 50px;
padding: 0px;
}
#btnCel{
margin-top: 10px;
float: right;
height: 30px;
width: 50px;
padding: 0px;
}
</style>
<!-- 태균이가 만든거 끝-->
<script type="text/javascript">
	$(function() {
		$("#btnLogout").click(function() {
			location.href="logout.jsp";
		});
		
		$("#btnEdit").click(function() {
			alert("수정");
		});
		
		$("#btnCel").click(function() {
			alert("삭제");
		});
		
	});
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
		<div class="text" id="mainTitle">
			<a href="notice.jsp?no=5" style="text-decoration: none;color: #222;"><strong>&lt; 공지사항</strong></a>
		</div>
		<div id="background_box"> <!-- 각자 원하는데로 사용 -->
<!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 -->
<div id="divTable" class="pad">
<table class="table">
	<tr style="border-bottom: 2px solid #A5A5A5;">
		<td style="background: #F1F1F1;"><strong>제목</strong></td>
		<td colspan="3">공지사항 제목 나오는 곳</td>
		<td style="background: #F1F1F1;"><strong>작성자</strong></td>
		<td>관리자</td>
	</tr>
	<tr style="border-bottom: 2px solid #A5A5A5;">
		<td style="background: #F1F1F1;"><strong>작성일</strong></td>
		<td colspan="3">2023-10-10</td>
		<td style="background: #F1F1F1;"><strong>조회수</strong></td>
		<td>2023</td>
	</tr>
</table>
</div>
<div id="info">
<textarea id="note" readonly="readonly" style="padding-top: 30px;padding-left: 40px;resize: none;border: 1px solid #333;margin-left: 20px;width: 1240px;">
</textarea>
<div>
	<input type="button" class="btn btn-outline-danger input" value="삭제" id="btnCel" style="margin-right: 30px;"/>
	<input type="button" class="btn btn-outline-success input" value="수정" id="btnEdit" style="margin-right: 15px;"/>
</div>
</div>
<!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --> 
		</div>
	</div>	
</div>
</body>
</html>