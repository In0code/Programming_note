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
height: 150%; width: 80%;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
</style>
<!-- 태균이가 만든거 끝-->
<script type="text/javascript">
$(function(){
	
	$("#btnLogouttt2").click(function(){
		alert("1234");
	})
	$("#btnLogouttt").click(function(){
		alert("123123");
	/* 	location.href="admin_logout_process.do"; */
	});
});//ready
</script>



</head>
<body>
 <%@ include file="sidebar.jsp" %> 
<div id="right">

	<div id="rightHeader" align="right">
	<input  type="button" id="btnLogouttt2" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 5px">
		관리자<span style="font-weight: bold;margin-right: 20px"> <c:out value="${sessionScope.id}"/> 님</span>
		<input  type="button" id="btnLogouttt" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="text" id="mainTitle">
			<strong>주문 리스트</strong>
		</div>
		<div id="background_box"> <!-- 각자 원하는데로 사용 -->
<!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 -->
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 
코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!! 코딩는 여기에!!
<!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --> 
		</div>
	</div>	
</div>
</body>
</html>