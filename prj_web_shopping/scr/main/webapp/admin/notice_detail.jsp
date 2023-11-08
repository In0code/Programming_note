<%@page import="java.text.NumberFormat"%>
<%@page import="admin.vo.NoticeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="공지사항 상세한 내용을 표시하고 수정/삭제가 가능한 화면"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty adminId }">
    <c:redirect url="login.jsp"/>
    </c:if> 
<!DOCTYPE html>
<html>
<head>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<jsp:include page="../cdn/admin_cdn.jsp"/>
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
#btnDel{
position: absolute; 
  top: 855px;
  left: 1355px;
  height: 50px;
  width: 100px;
  font-size:20px;
  border-radius: 10px;
  padding: 0px;
}

td {
	text-align: left;
}

th {
	height:50px;
	font-size:18.5px;
	background-color: #FAFAFA;
	vertical-align: middle;
	width: 165px;
}

</style>
<!-- 태균이가 만든거 끝-->
<script type="text/javascript">
	$(function() {
		$("#btnLogout").click(function() {
			location.href="logout.jsp";
		});
		
		$("#btnEdit").click(function() {
			location.href = "notice_write.jsp?no=5&ncode="+${param.ncode}+"&flag=2";
		});
		
		$("#btnDel").click(function() {
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
			<a href="javascript:history.back()">	
				<img src="../common/images/back.png" style="width:27px"/>
				<strong>공지사항</strong>
			</a>
		</div>
<div id="background_box"> <!-- 각자 원하는데로 사용 -->
<!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 -->
<div style="margin: 10px; text-align: center;">
<table class="table tableList" id="boardList">
	<tr>
		<th style="background: #F7F7F7;max-width: 100px;">제목</th>
		<td colspan="6" style="padding-left:20px"><%=title %></td>
	</tr>
	<tr>
		<th style="background: #F7F7F7;max-width: 100px;">작성자</th>
		<td style="padding-left:20px; width:180px">관리자</td>
		<th style="background: #F7F7F7;max-width: 100px;">작성일</th>
		<td style="width:190px; padding-left:20px"><%=date %><%=editDate == null?"":"("+editDate+")" %></td>
		<th style="width:100px; background-color: #F7F7F7">조회수</th>
		<td style="width:120px; padding-left:20px"><%=view %></td>
	</tr>
</table>
<div style="width: 100%;">
	<div style="text-align: center;margin-right: 10px;">
		<img src="http://localhost/prj_web_shopping/upload/notice/<%=image %>" onerror="this.style.display='none'">
	</div>
	<div style="border:none; padding: 10px 58px 10px 58px; font-size: 18px; text-align:left">
		<span><%=context%></span>
	</div>
</div>
</div>
</div>
<!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --> 
		</div>
		</div>
<div>
	<input type="button" class="btn btn-outline-danger input" value="삭제" id="btnDel"/>
	<input type="button" class="btn btn-outline-success input" value="수정" id="btnEdit"/>
</div>
</body>
</html>