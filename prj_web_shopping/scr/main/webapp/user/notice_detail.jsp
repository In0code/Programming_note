<%@page import="java.sql.SQLException"%>
<%@page import="admin.vo.NoticeVO"%>
<%@page import="admin.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#pageTitle {
	font-family: MADE Voyager PERSONAL_USE;
	font-size: 25px;
	text-align: center;
	margin-top: 100px;
	color: #212121;
}

#container {
    position: relative;
    margin-top: 10px;
}

#contents {
    position: relative;
    margin: 0 auto;
    width: 95%;
    max-width: 1200px;
    min-height: 700px;
}

body, code {
    font-size: 13px;
    line-height: 1.5;
    font-family: Pretendard Medium;
    color: #000;
}

.xans-board-read {
    border: 1px solid #ddd;
}

.xans-board-read .board_top {
    position: relative;
    border-bottom: 1px solid #ddd;
    padding: 40px 58px;
    min-height: 85px;
}

.xans-board-read .board_top li.subject {
    font-size: 16px;
    margin-bottom: 30px;
}

.xans-board-read .detail {
    position: relative;
    padding: 100px 58px;
    border-bottom: 1px solid #ddd;
}

.xans-board-read .ec-base-button {
    padding: 25px 58px;
}

.ec-base-button {
    padding: 20px 0;
    text-align: center;
}

.ec-base-button .gLeft {
    float: left;
    text-align: left;
}

[class^='btn'].sizeS {
    padding: 6px 8px;
}

[class^='btnSubmit'], a[class^='btnSubmit'] {
    display: inline-block;
    box-sizing: border-box;
    border: 1px solid #000;
    font-size: 13px;
    line-height: 22px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    transition: .3s ease-in-out;
    color: #000;
    background-color: white;
}

.btnMore {
    min-width: 120px;
    padding: 10px;
}

</style>

<script type="text/javascript">
$(function() {
	
	
});//ready
</script>

</head>
<body>
<%@ include file="layout/header.jsp"%>
<div id="pageTitle">Notice</div><br>

<div id="container">
<div id="contents">

<div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
<form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self" enctype="multipart/form-data" >
<input id="no" name="no" value="1468" type="hidden"  />
<input id="bulletin_no" name="bulletin_no" value="2242" type="hidden"  />
<input id="board_no" name="board_no" value="1" type="hidden"  />
<input id="member_id" name="member_id" value="afterblow" type="hidden"  />
<input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden"  />
<input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=1468&amp;board_no=1" type="hidden"  />
<input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden"  />
<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"  />

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

<!-- 게시글 전체 영역 -->
<div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
<!-- 제목 영역 -->
<div class="board_top ">
	<ul>
		<!-- 제목 -->
		<li class="subject" style="font-size:18px"><%=title %></li>
		
		<li class="name" style="font-size:15px">
			<!-- <span style="margin-right:20px">작성자</span> <span style="color:gray;">Afterblow | </span> --> 
			<!-- 작성일 -->
			<span style="color:gray;">
				<span style="color:#353535">DATE&nbsp;</span><%=date %><%=editDate == null?"":"("+editDate+")" %>&nbsp;|&nbsp; 
			</span>
			<!-- 조회수 -->
			<span style="color:gray;">
				<span style="color:#353535">HIT&nbsp;</span><%=view %>
			</span>
		</li>
<!-- 		<li><hr></li>
		<li class="date" style="font-size:14px">
			<span style="margin-right:17px">작성일</span>
			<span style="color:gray;">2023-10-04</span>
			<span style="margin-right:20px; margin-left: 50px">조회수</span>
			<span style="color:gray;">124</span>
		</li> -->
<!-- 		<li class="hit">
			<span style="margin-right:50px">조회수</span> 124
		</li> -->
	</ul>
</div>
<!-- 제목 영역 끝 -->

<!-- 본문 사진 영역 -->
<div class="detail">
	<div class="fr-view fr-view-article">
		<p style="text-align: center;margin-right: 10px;">
			<img src="http://localhost/prj_web_shopping/upload/notice/<%=image %>" onerror="this.style.display='none'">
		</p>
	</div>
	<div style="font-size:20px; text-align:left">
		<span><%=context%></span>
	</div>
</div>
<!-- 본문 글 영역 끝 -->
<!-- 하단 영역 -->
<div class="ec-base-button xans-element- xans-product xans-product-listmore more ">
	<span>
		<a href="javascript:history.back()" class="btnMore">목록</a>   
	</span>
</div>
<!-- 하단 영역 끝 --> 
</div>
<!-- 게시글 전체 영역 -->
</form>
</div>
</div>   
<!-- contents -->
</div>  
<!-- container -->

<%@ include file="layout/footer.jsp"%>
</body>
</html>