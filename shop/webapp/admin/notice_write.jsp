<%@page import="admin.dao.NoticeDAO"%>
<%@page import="admin.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="공지사항 작성 화면, 등록/수정은 화면이 모두 같다."%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<%@ include file="../cdn/admin_cdn.jsp"%>
<meta charset="UTF-8">
<!-- sidebar.jsp start -->
<style type="text/css">
	@import url('//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css');
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 300;
  font-stretch: normal;
  src: url(https://fonts.gstatic.com/s/opensans/v36/memSYaGs126MiZpBA-UvWbX2vVnXBbObj2OVZyOOSr4dVJWUgsiH0B4gaVc.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 400;
  font-stretch: normal;
  src: url(https://fonts.gstatic.com/s/opensans/v36/memSYaGs126MiZpBA-UvWbX2vVnXBbObj2OVZyOOSr4dVJWUgsjZ0B4gaVc.ttf) format('truetype');
}
@font-face {
  font-family: 'Open Sans';
  font-style: normal;
  font-weight: 700;
  font-stretch: normal;
  src: url(https://fonts.gstatic.com/s/opensans/v36/memSYaGs126MiZpBA-UvWbX2vVnXBbObj2OVZyOOSr4dVJWUgsg-1x4gaVc.ttf) format('truetype');
}
body {
  color: #5D5F63;
  background: #EEEEEE;
  font-family: 'Open Sans', sans-serif;
  padding: 0;
  margin: 0;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
}
.sidebar-toggle {
  margin-left: -240px;
}
.sidebar {
  width: 240px;
  height: 100%;
  background: #353535;
  position: fixed;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  z-index: 100;
}
.sidebar #leftside-navigation ul,
.sidebar #leftside-navigation ul ul {
  margin: -2px 0 0;
  padding: 0;
}
.sidebar #leftside-navigation ul li {
  list-style-type: none;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
.sidebar #leftside-navigation ul li.active > a {
  color: #1abc9c;
}
.sidebar #leftside-navigation ul li.active ul {
  display: block;
}
.sidebar #leftside-navigation ul li a {
  color: #FFFFFF; /* #aeb2b7; */
  text-decoration: none;
  display: block;
  padding: 18px 0 18px 25px;
  font-size: 12px;
  outline: 0;
  -webkit-transition: all 200ms ease-in;
  -moz-transition: all 200ms ease-in;
  -o-transition: all 200ms ease-in;
  -ms-transition: all 200ms ease-in;
  transition: all 200ms ease-in;
}
.sidebar #leftside-navigation ul li a:hover {
  color: #1abc9c;
}
.sidebar #leftside-navigation ul li a span {
  display: inline-block;
}
.sidebar #leftside-navigation ul li a i {
  width: 20px;
}
.sidebar #leftside-navigation ul li a i .fa-angle-left,
.sidebar #leftside-navigation ul li a i .fa-angle-right {
  padding-top: 3px;
}
.sidebar #leftside-navigation ul ul {
  display: none;
}
.sidebar #leftside-navigation ul ul li {
  background: #23313f;
  margin-bottom: 0;
  margin-left: 0;
  margin-right: 0;
  border-bottom: none;
}
.sidebar #leftside-navigation ul ul li a {
  font-size: 12px;
  padding-top: 13px;
  padding-bottom: 13px;
  color: #aeb2b7;
}

/* 임태균이 만든 거 시작 */
#down{
  position: fixed;
  top: 92%;
  height: 78px;
  width: 240px;
  color: #FFFFFF;
  background: #282828;/* #2D2D2D; */
  font-weight: bold;

  align-items: center;
  display: flex;
  padding-bottom: 6px;
  padding-right: 10px;
  padding-left: 65px;
}
/* 임태균이 만든 거 끝 */

#left{
	min-width: 240px;height: 100%;float: left;
	padding: 0px;
	background: yellow;
}
</style>
<!-- sidebar.jsp end -->
<style type="text/css">
body{
 margin: 0px;
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
top: 10px;
}
#info{
padding-left: 30px;
padding-right: 30px;
position: absolute;
width: 100%;
top: 80px;
height: 624px;
}
.pad{
padding-top: 10px;
padding-bottom: 10px;
padding-left: 30px;
padding-right: 30px;
}
textarea {
position: absolute;
/* top: 112px; */
width: 1240px;
height: 570px;
border: 1px solid #CED4DA;
font-size: 18px;
resize: none;
}
#btnEdit{
position: absolute; 
top: 690px;
  left: 1170px;
height: 50px;
  width: 100px;
  font-size:20px;
  border-radius: 10px;
  padding: 0px;
}
#content{
position: absolute;
top: 200px;
}

</style>
<%
String flag = request.getParameter("flag");
NoticeVO nVO = null;
String title = "";
String context = "";
String image = "";

if("2".equals(flag)) {
	String ncode = request.getParameter("ncode");
	nVO = NoticeDAO.getInstance().selectOneNotice(Integer.parseInt(ncode));
	title = nVO.getNoticeTitle();
	context = nVO.getNoticeText();
	image = nVO.getImage();
	
	pageContext.setAttribute("title", title);
	pageContext.setAttribute("ncode", ncode);
	pageContext.setAttribute("image", image);
}

%>
<script type="text/javascript">
$(function() {
	document.getElementById("${param.no}").classList.add("active");
	/* 클릭된 sidebar 표시 */
    $("#leftside-navigation .sub-menu > a").click(function(e) {
        e.preventDefault(); // 앵커 태그의 기본 동작 방지
        
        var subMenu = $(this).next();
        if (subMenu.is(":visible")) {
            subMenu.slideUp();
        } else {
            subMenu.slideDown();
        }
        e.stopPropagation();
    });
	
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
	
	$("#btnEdit").click(function() {
		let title = $("#title").val();
		let context = $("#context").val();
		
		if(title != "" && context != "") {
			$("#hidTxt").val(title);
			$("#sfrm").submit();
		} else {
			alert("내용을 입력하세요.");
		}
	});
	
	$("#btnDelImg").click(function() {
		if(confirm("삭제 하시겠습니까?")) {
			var img = "${image}";
			var ncode = "${ncode}";
			
			$.ajax({
				url:"notice_file_delete.jsp",
				type:"get",
				data:"ncode="+ncode+"&image="+img,
				dataType:"json",
				error: function(xhr) {
					alert("서버 오류!");
					console.log(xhr.status);
				},
				success: function(json) {
					if(json.flag) {
						$("#uploadImg").val("");
						$("#hidImg").val("");
						$("#displayImg").val("");
						$("#displayImgName").val("");
					}
				}
			});
		}
	});
	
	$("#btnUplaod").click(function() {
		//유효성 검증
		if($("#uploadImg").val() == "") {
			alert("이미지를 선택해주세요.");
			return;
		}
		
		var blockExt = ["jpg", "png", "bmp", "gif"];
		var fileName = $("#uploadImg").val();
		var flag = false;
		
		var fileExt = fileName.substring(fileName.lastIndexOf(".")+1);
		for(var i = 0; i < blockExt.length; i++) {
			if(fileExt.toLowerCase() == blockExt[i]) {
				flag = true;
			}
		}
		if(!flag) {
			alert("이미지 파일만 업로드만 가능합니다.");
			return;
		}
		
		//1.form 얻기
		var frm = $("#imgFrm")[0];
		//2.ajax으로 전송할 form 객체 생성
		var formData = new FormData(frm);
		
		$.ajax({
			url:"notice_file_process.jsp",
			type:"post",
			data:formData,
			dataType:"json",
			processData: false,
			contentType: false,
			async:false,
			error: function(xhr) {
				alert("업로드에 실패하였습니다."+xhr.status);
			},
			success: function(json) {
				alert(json.msg);
				$("#hidImg").val(json.image);
				
				$("#displayImg").attr("src", "http://localhost/prj_web_shopping/upload/notice/"+json.image);
				$("#displayImg").attr("alt", json.image);
				$("#displayImgName").html(json.image);
			}
		});
	});
});
</script>
<!-- 태균이가 만든거 끝-->
</head>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<body>
<%-- <jsp:include page="sidebar.jsp" /> --%>
<!-- sidebar html start -->
<div id="left">
<aside class="sidebar">
  <div id="leftside-navigation" class="nano">
    <ul class="nano-content">
      <li style="height: 100px;padding: 0px;background: #353535;">
        <!-- <a style="padding: 0px;height: 100px" href="http://192.168.10.143/jsp_prj/prj_admin/admin_design.jsp"> -->
        <img src="../common/images/logo_dark.png" style="display: block; margin: 0px auto;padding-top: 1px;">
<!-- <span style="font-size: 16px;font-weight: bold;">&ensp;이미지</span> --><!-- </a> -->
      </li>
      
      <li class="sub-menu" id="0">
        <a href="dashboard.jsp">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-grid-fill" viewBox="0 0 16 16">
  <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zm8 0A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm-8 8A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm8 0A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3z"/>
</svg><!-- <i class="fa fa-table"></i> -->
<span>&ensp;대시보드</span></a>
     </li>
      <li class="sub-menu" id="1">
        <a href="#void">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
</svg><!-- <i class="fa fa-table"></i> -->
<span>&ensp;회원 관리</span></a>
     </li>
      <li class="sub-menu" id="2">
        <a href="javascript:void(0);">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-seam-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15.528 2.973a.75.75 0 0 1 .472.696v8.662a.75.75 0 0 1-.472.696l-7.25 2.9a.75.75 0 0 1-.557 0l-7.25-2.9A.75.75 0 0 1 0 12.331V3.669a.75.75 0 0 1 .471-.696L7.443.184l.01-.003.268-.108a.75.75 0 0 1 .558 0l.269.108.01.003 6.97 2.789ZM10.404 2 4.25 4.461 1.846 3.5 1 3.839v.4l6.5 2.6v7.922l.5.2.5-.2V6.84l6.5-2.6v-.4l-.846-.339L8 5.961 5.596 5l6.154-2.461L10.404 2Z"/>
</svg><!-- <i class="fa fa fa-tasks"></i> -->
        <span>&ensp;상품 관리</span><i class="arrow fa fa-angle-right pull-right"></i></a>
        <ul>
          <li><a href="forms-components.html">&ensp;&ensp;조회</a>
          </li>
          <li><a href="forms-validation.html">&ensp;&ensp;등록</a>
          </li>
        </ul>
      </li>
      <li class="sub-menu" id="3">
        <a href="orderManagement_order.jsp?no=3">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg><!-- <i class="fa fa-envelope"></i> -->
        <span>&ensp;주문 관리</span><i class="arrow fa fa-angle-right pull-right"></i></a>
        <ul>
          <li><a href="orderManagement_order.jsp?no=3">&ensp;&ensp;주문</a>
          </li>
          <li><a href="orderManagement_edit.jsp?no=3">&ensp;&ensp;교환/반품</a>
          </li>
        </ul>
      </li>
      <li class="sub-menu"  id="4">
        <a href="boardManagement.jsp">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
</svg><!-- <i class="fa fa-bar-chart-o"></i> -->
        <span>&ensp;게시글 관리</span></a>
      </li>
      <li class="sub-menu" id="5">
        <a href="notice.jsp?no=5">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-megaphone-fill" viewBox="0 0 16 16">
  <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z"/>
</svg><!-- <i class="fa fa-map-marker"></i> -->
        <span>&ensp;공지사항</span></a>
      </li>
    </ul>
  </div>
  	<span id="down">
		<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-person-fill-check" viewBox="0 0 18 18">
		<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.708l.547.548 1.17-1.951a.5.5 0 1 1 .858.514ZM11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
		<path d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
		</svg>
		<strong style="font-size: 20px; font-family:Pretendard">&ensp;관리자</strong>
  </span>
</aside>
</div>
<!-- sidebar html end -->
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
	<div>
		<div class="input-group mb-3">
		  	<span class="input-group-text" id="basic-addon3" style="min-width: 76px;font-size: 16px;">제목</span>
			<input type="text" class="form-control" id="title" name="title" aria-describedby="basic-addon3" value="${title}" style="font-size: 16px;font-weight: bold;">
		</div>
		<form id="imgFrm" name="imgFrm" method="post" enctype="multipart/form-data">
		<div class="input-group mb-3">
			<input type="file" class="form-control" id="uploadImg" name="uploadImg" aria-label="Upload" style="font-size: 16px;">
			<input class="btn btn-outline-secondary" type="button" id="btnUplaod" name="btnUplaod" value="업로드" style="font-size: 16px;width: 80px;">
		</div>
		</form>
<div>
	<form id="sfrm" method="post" action="notice_write_process.jsp?no=5&flag=${param.flag}&ncode=${ncode}">
		<div>
			<textarea id="context" name="context"><%=context%></textarea>
			<input type="button" class="btn btn-outline-success input" value="등록" id="btnEdit" style="margin-right: 5px;"/>
			<input type="hidden" id="hidTxt" name="hidTxt">
			<input type="hidden" id="hidImg" name="hidImg" value="${image}">
		</div>
	</form>
</div>
	</div>
</div>
<!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --> 
		</div>
<div class="card" style="position: absolute;left: 1380px;top: 100px;width: 240px;">
	<div class="card-body">
		<img id="displayImg" src="http://localhost/prj_web_shopping/upload/notice/${image}" class="card-img-top" alt="${image}">
	    <h4 id="displayImgName" class="card-title" style="margin-top: 10px;">${image}</h4>
	    <input type="button" id="btnDelImg" class="btn btn-primary" value="이미지 제거" style="margin-top: 5px;width: 117px;font-size: 14px;height: 30px;">
	</div>
</div>		

	</div>	
</div>
</body>
</html>