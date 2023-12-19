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
textarea{

border:3px solid #EEEEEE;
 margin-top: 15px;
  border-radius: 5px
 }
 
 textarea:focus {
  outline: none;
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
	$("#removebtn").click(function(){
		$("#frm").submit();
	
	})
	
	
	
	
	
});//ready

//로그아웃
function logOut() {
	location.href="admin_logout_process.do";
}

//목록가기
function moveReport() {
	
	location.href="admin_report_frm.do";

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
		<a href="admin_report_frm.do">신고내역</a>
		
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		신고 상세
		</div>
		
		<div class="text" id="mainTitle">
			<strong>신고 상세</strong>
			
		</div>
		
		<!-- 검색 -->
	
		<!---->
		
		<!-- 상세보기 페이지로 -->
	
			

		
		<!-- 테이블 -->
		<form id="frm" action="admin_report_update_success.do" method="get">
		
		<input type="hidden" name="rcode" value="${param.rcode}"/>
		<div id="background_box" style=" height: 130%;">
		<div style="margin-top: 0px;margin-left: 50px; font-size: 25px">
		<br><br>
		<img src="http://localhost/retro_prj/upload/<c:out value="${ img }"/>" style="width:400px; height:400px"/>
		<div style="margin-top: 15px; padding:15px">
		신고 물품 : <c:out value="${ard.pname}"/><br><br>
		신고일 : <c:out value="${ard.inputDate }"/>
		</div>
		</div>
		<div style="margin-left: 550px; margin-top: -550px; font-size: 25px"><strong>신고유형 : <c:out value="${ard.type}"/></strong><br><br>
		신고자 ID : <c:out value="${ard.id}"/><br><br>
		피신고자 ID : <c:out value="${ard.reportId}"/>
		</div>
		
		</div>    	
    	<!-- 버튼 쓸 사람 -->
    	<div class="btnDiv">
			<input type="button" class="btn" value="목록" onclick="moveReport()" id="listbtn" name="listbtn" style="margin-left:550px; margin-top: -540px; background-color: #333333; color: white; " >	
			<input type="button" class="btn" value="신고상품삭제"  id="removebtn" name="removebtn" style="margin-left:300px; margin-top: -586px; background-color: #333333; color: white; width:120px">	
		</div>
		<!---->
		</form>
	</div>	
</div>
</body>
</html>