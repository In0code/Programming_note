<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 태균이가 만든거 -->
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
	padding: 20px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 

/* #background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
height: 150%; width: 80%;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
} */
</style>
<!-- 태균이가 만든거 끝-->

<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
});
</script>
</head>
<body>
<%@ include file="../sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		이벤트 관리
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		이벤트 상세
		</div>
		
		<div class="text" id="mainTitle">
			<strong>이벤트 상세</strong>
		</div>
		
		<!-- 테이블 -->
		<div id="background_box">
		<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table class="table tableList">
				
				<tbody>
					<!-- list가 존재하지 않을 경우 -->
					<c:if test="${ empty reviewList }">
					<tr>

							
					</tr>
					</c:if>
				
					<c:forEach var="review" items="${ reviewList }" varStatus="i">
					<tr onclick="boardDetail(${ review.rcode })">
						<td>${ startNum + i.index }</td>
						<td>${ review.cat_name }</td>
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
		<!---->
		
	</div>	
</div>
</body>
</html>