<%@page import="admin.dao.NoticeDAO"%>
<%@page import="admin.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="공지사항 작성 화면, 등록/수정은 화면이 모두 같다."%>
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
margin-top: 20px;
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
			var title = $("#basic-url").val();
			var context = $("#context").val();
			
			if($("#basic-url").val() != "" && $("#context").val() != "") {
				$("#sfrm").submit();
			} else {
				alert("내용을 입력하세요.");
			}
		});
		
	});
</script>
</head>
<body>
<jsp:include page="sidebar.jsp" />

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
<%
String flag = request.getParameter("flag");
NoticeVO nVO = null;
String title = "";
String context = "";

if("2".equals(flag)) {
	String ncode = request.getParameter("ncode");
	nVO = NoticeDAO.getInstance().selectOneNotice(Integer.parseInt(ncode));
	title = nVO.getNoticeTitle();
	context = nVO.getNoticeText();
	
	pageContext.setAttribute("title", title);
	pageContext.setAttribute("ncode", ncode);
}

%>
<form id="sfrm" method="post" action="notice_write_process.jsp?flag=${param.flag}&ncode=${ncode}">
<div id="divTable" class="pad">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon3" style="min-width: 100px;">제목</span>
  <input type="text" class="form-control" id="basic-url" name="title" aria-describedby="basic-addon3" value="${title}">
</div>
</div>
<div id="info">
<textarea id="context" name="context"><%=context%></textarea>
<div>
	<input type="button" class="btn btn-outline-success input" value="등록" id="btnEdit" style="margin-right: 30px;"/>
</div>
</div>
</form>
<!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --> 
		</div>
	</div>	
</div>
</body>
</html>