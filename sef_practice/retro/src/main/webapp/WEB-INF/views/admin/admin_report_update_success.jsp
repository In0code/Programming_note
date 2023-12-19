<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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

 


.btn{
	height: 46px;
    width: 100px;
    
    border: 1px solid #BEBEBE;
    font-size: 18px;
    border-radius: 2px;
    color: white;
}
</style>
<!-- 태균이가 만든거 끝-->

<script type="text/javascript">
$(function() {

	
});//ready

//로그아웃
function logOut() {
	location.href="admin_logout_process.do";
}

//목록가기
function moveInquery() {
	
	location.href="admin_inquiry_frm.do";

}

</script>
</head>
<body>
 <%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" onclick="logOut()" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		신고리스트
		
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		신고 상세
		</div>
		
		<div class="text" id="mainTitle">
			<strong>문의 상세</strong>
			<a href="http://localhost/retro_prj/event.do">
				<svg style="margin-bottom: 5px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-up-right" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M8.636 3.5a.5.5 0 0 0-.5-.5H1.5A1.5 1.5 0 0 0 0 4.5v10A1.5 1.5 0 0 0 1.5 16h10a1.5 1.5 0 0 0 1.5-1.5V7.864a.5.5 0 0 0-1 0V14.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
  					<path fill-rule="evenodd" d="M16 .5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h3.793L6.146 9.146a.5.5 0 1 0 .708.708L15 1.707V5.5a.5.5 0 0 0 1 0v-5z"/>
				</svg>
			</a>
		</div>
		
		<!-- 검색 -->
	
		<!---->
		
		<!-- 상세보기 페이지로 -->
	
			

		
		<!-- 테이블 -->
		
		
		<div id="background_box" style="overflow:hidden; border-radius: 12px">
		<div style="text-align:center; margin-top: 300px; font-size: 30px"><c:out value="${result eq 1 ? '신고 상품 삭제가 완료되었습니다.':'신고 상품 삭제가 실패했습니다. 다시 시도해주세요.'}"/></div>
		
		
    	
    	<!-- 버튼 쓸 사람 -->
    	<div class="btnDiv">
			<input type="button" class="btn" value="돌아가기" onclick="moveInquery() " id="listbtn1" name="listbtn" style=" margin:0px auto; margin-left:100px; margin-top: -600px; background-color: #333333; color: white" >	
		</div>
		<!---->
	
	</div>	
</div>
</body>
</html>