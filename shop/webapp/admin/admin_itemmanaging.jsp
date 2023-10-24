<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.143/servlet_prj/common/main/favicon.png">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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
}

/* 동원 */
#wrapper {
        display: flex;
        justify-content: center;
        background-color:white;
        margin: 0 auto;
        padding: 10px;
        max-width: 1500px;
        font-family: pretendard;
        width:3000px;
        height:800px;
        border-radius: 30px;
        position: relative; top:10px; 
    }
  th {
        background-color:#EEEEEE ;
        color: black;
        border: 1px solid #d3d3d3;
        padding: 20px 50px;
        height:50px;
        
    }
    td{
    	color: black;
           border: 1px solid #d3d3d3;
           padding: 20px 50px;
                  height:50px;
    }
</style>
<!-- 태균이가 만든거 끝-->

<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody"> <!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 -->
<div id="rightBody" style="position:relative;">

		<div style=" position:absolute; top:10px; font:  bold 1.5em/1em Georgia, pretendard ; font-size: 40px; ">상품리스트</div>
		<br>
		<div style="position: absolute; top: 10px ; right:20px; height: 40px; font: bold 1.5em/1em Georgia, pretendard ;" >
		<input type="text" value="내용을 입력해주세요" style=" height: 40px; " size="20"/>
		<input type="button" value="검색" style="padding: 5px 15px ; ">
		<br/>
		</div>
		<div id="wrapper">
		<div style="position: absolute; top: 50px ; left:80px; font:  bold 1.5em/1em Georgia, pretendard ; ">전체 건</div><br/>
		<div style="margin-top: 70px; position: absolute; top: 50px ; left:80px; "  >
		<table>
			
		<tr>
		<th>NO</th><th>이미지</th><th>상품코드</th><th>상품명</th><th>카테고리</th><th>등록일</th><th>판매가</th><th>재고</th><th>비고</th>
		</tr>
		
		<tr><td>1</td><td>1</td><td>12323</td><td>샤인머스켓</td><td>과일</td><td>2023.12.12</td><td>12000</td><td>101</td><td>없음</td>
		</tr>
		
		
		</table>
		</div>
		</div> 
		</div>
	</div> <!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 -->
</div>	
</body>
</html>