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

function detail(rcode){
	$("#rcode").val(rcode);
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
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		이벤트 관리
		</div>
		
		<div class="text" id="mainTitle">
			<strong>이벤트 리스트</strong>
			<a href="http://localhost/retro_prj/event.do">
				<svg stroke="currentColor" fill="#5D5F63" stroke-width="0" viewBox="0 0 24 24" 
				height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" 
				style="color: white; width: 18px; height: 18px; margin-bottom:5px"><g>
				<path fill="none" d="M0 0h24v24H0z"></path>
				<path d="M10 3v2H5v14h14v-5h2v6a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h6zm7.586 2H13V3h8v8h-2V6.414l-7 7L10.586 12l7-7z"></path></g></svg>
			
			</a>
		</div>
		
		<!-- 검색 -->
		<div class="searchDiv">
		<div class="allBox">
		<form id="frmSearch">
			<select class="searchList" id="field" name="field">
				<option value="1"${ param.field eq "1" ? " selected='selected'" : "" }>아이디</option>
				<option value="2"${ param.field eq "2" ? " selected='selected'" : "" }>상품명</option>
				<option value="3"${ param.field eq "3" ? " selected='selected'" : "" }>카테고리명</option>
			</select>
			<span class="textBox" style="vertical-align: middle">
			<input type="text" id="keyword" name="keyword" class="keywordBox" placeholder="내용을 입력해주세요"
			value = "${ param.keyword ne 'null' ? param.keyword : ''}"/>
			</span>
			<button class="searchBtn">
			<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#858585" class="bi bi-search" viewBox="0 0 16 16">
  			<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
			</button>
		</form>
		</div>
		</div>
		<!---->
		
		<!-- 상세보기 페이지로 -->
		<form id="frmDetail" action="">
			<input type="hidden" id="" name=""/>
		</form>
		
		<!-- 테이블 -->
		<div id="background_box">
		<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table class="table tableList">
				<thead>
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
					<th style="width:100px; border-bottom: 1px solid #E5E5E5;">No</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">제목</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">작성자</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">작성일</th>
				</tr>
				</thead>
				
				<tbody>
					<!-- list가 존재하지 않을 경우 -->
					<c:if test="${ empty reviewList }">
					<tr onclick="detail(10)">
						<td colspan="6" style="text-align: center; border:none;"> 
							이벤트가 존재하지 않습니다. </td>
					</tr>
					</c:if>
				
					<c:forEach var="var" items="${ items }" varStatus="i">
					<tr onclick="detail(10)">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<!---->
		
		<div class="pagenationDiv">
    	<div class="pagination">
      		<a href="#"><</a>
        	<span class="active">1</span>
        	<a href="#">2</a>
        	<a href="#">3</a>
        	<a href="#">></a>
    	</div>
    	</div>
    	
    	<!-- 버튼 쓸 사람 -->
    	<div class="btnDiv">
			<input type="button" class="btnCss" value="목록">	
		</div>
		<!---->
			
	</div>	
</div>
</body>
</html>