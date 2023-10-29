<%@page import="java.text.NumberFormat"%>
<%@page import="admin.vo.NoticeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="공지사항 상세한 내용을 표시하고 수정/삭제가 가능한 화면"%>
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
position: absolute; 
  top: 855px;
  left: 1470px;
  height: 50px;
  width: 100px;
  font-size:20px;
  border-radius: 10px;
  padding: 0px;
}
#btnCel{
position: absolute; 
  top: 855px;
  left: 1355px;
  height: 50px;
  width: 100px;
  font-size:20px;
  border-radius: 10px;
  padding: 0px;
}
#revContent {
	position: absolute;
	left: 65px;
}
</style>
<!-- 태균이가 만든거 끝-->
<script type="text/javascript">
	$(function() {
		$("#btnLogout").click(function() {
			location.href="logout.jsp";
		});
		
		$("#btnEdit").click(function() {
			location.href = "notice_write.jsp?ncode="+${param.ncode}+"&flag=2";
		});
		
		$("#btnCel").click(function() {
			if(confirm("삭제 하시겠습니까?")) {
				/* location.href = "notice_del_process.jsp?ncode="+${param.ncode}+"&flag=2"; */
				var queryString = "ncode="+${param.ncode}+"&flag=2";
				
				$.ajax({
					url:"notice_del_process.jsp",
					type:"get",
					data:queryString,
					dataType:"text",
					error: function(xhr) {
						alert("서버 오류! 잠시 후 다시 시도해주세요."+xhr.status);
					},
					success: function(msg) {
						alert(msg);
						window.location = "notice.jsp?no=5";
					}
				});//ajax
			}
		});//click end
		
	});
</script>
</head>
<body>
<%@ include file="sidebar.jsp" %>
<%
NoticeDAO nDAO = NoticeDAO.getInstance();
String title = "";
String context = "";
String date = "";
String editDate = "";
String image = "";
int view = -1;

try {
	int ncode = Integer.parseInt(request.getParameter("ncode"));
	NoticeVO nVO = nDAO.selectOneNotice(ncode);
	
	title = nVO.getNoticeTitle();
	context = nVO.getNoticeText();
	date = nVO.getNoticeDate();
	view = nVO.getViewNum();
	editDate = nVO.getEditDate();
	image = nVO.getImage();
	
	pageContext.setAttribute("editDate", editDate);
	pageContext.setAttribute("image", image);
	
} catch(SQLException se) {
	se.printStackTrace();
} catch(NumberFormatException nfe) {
	nfe.printStackTrace();
}
%>

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
<div style="margin: 10px; text-align: center;">
<table class="table tableList" id="order_list">
	<tr style="border-bottom: 2px solid #A5A5A5;">
		<td style="background: #F1F1F1;"><strong>제목</strong></td>
		<td colspan="3"><%=title %></td>
		<td style="background: #F1F1F1;"><strong>작성자</strong></td>
		<td>관리자</td>
	</tr>
	<tr style="border-bottom: 2px solid #A5A5A5;">
		<td style="background: #F1F1F1;"><strong>작성일</strong></td>
		<td colspan="3"><%=date %><%=editDate == null?"":"("+editDate+")" %></td>
		<td style="background: #F1F1F1;"><strong>조회수</strong></td>
		<td><%=view %></td>
	</tr>
</table>
<div id="revContent">
	<div style="margin: 0px auto;">
		<img src="http://192.168.10.143/prj_web_shopping/upload/notice/${image}" alt="${image}">
	</div>
	<span style="font-size:20px; text-align:left"><%=context%></span>
</div>
</div>
</div>
<!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --> 
		</div>
		</div>
<div>
	<input type="button" class="btn btn-outline-danger input" value="삭제" id="btnCel"/>
	<input type="button" class="btn btn-outline-success input" value="수정" id="btnEdit"/>
</div>
</body>
</html>