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
	$("#addbtn").click(function(){
		$("#frm").submit();
	
	})
	
	$("#searchBtn").click(function(){
		
			$("#frmSearch").submit();	
	});
	
	$("#answer").keyup(function (e) {
		let content = $("#answer").val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 200) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 200));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 200자까지 입력 가능합니다.');
	    };
	});
	
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
		<a href="admin_inquiry_frm.do">1:1문의 관리</a>
		
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		문의 상세
		</div>
		
		<div class="text" id="mainTitle">
			<strong>문의 상세</strong>
			
		</div>
		
		<!-- 검색 -->
	
		<!---->
		
		<!-- 상세보기 페이지로 -->
	
			

		
		<!-- 테이블 -->
		<form id="frm" action="admin_inquiry_update_success.do" method="post">
		
		<input type="hidden" name="inquiryCode" value="${param.inquiryCode}"/>
		<div id="background_box" style=" height: 150%;">
		<div style="margin-top: 30px;margin-left: 50px; font-size: 25px"><strong>문의자 ID: <c:out value="${aid.id}"/></strong><br><br>문의 유형 : <c:out value="${aid.type}"/></div>
		<div style="margin-left: 50px; margin-top: 20px">문의 내용</div>
		<textarea style="width:800px; height:220px; margin-left: 50px; margin-top:5px; resize:none;" readonly="readonly" id="context"><c:out value="${aid.context}"/></textarea>
		
		<div style="margin-left: 50px; margin-top: 20px">문의 답변</div>
		<textarea style="width:800px; height:220px; margin-left: 50px; margin-top:5px; resize:none;"  id="answer" name="answer" ><c:out value="${aid.answer eq null ? '' : aid.answer}"/></textarea>
		<p class="textCount" id="text_size" style="margin-left:750px; margin-top:-35px; color: #AAAAAA ; ">0자 </p>
    	<p class="textTotal" style="margin-left: 770px; margin-top: -40px; color: #AAAAAA; padding-left: 23px">/200자</p>
		
		<!-- <textarea id="admintext"></textarea> -->
		
    	</div>
    	
    	<!-- 버튼 쓸 사람 -->
    	<div class="btnDiv">
			<input type="button" class="btn" value="목록" onclick="moveInquery() " id="listbtn1" name="listbtn" style="margin-left:950px; margin-top: -140px; background-color: #333333; color: white" >	
			<input type="button" class="btn" value="답변완료"  id="addbtn" name="addbtn" style="margin-left:700px; margin-top: -186px; background-color: #333333; color: white">	
		</div>
		<!---->
		</form>
	</div>	
</div>
</body>
</html>