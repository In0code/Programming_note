<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리-주문</title>
<link rel="icon" href="http://192.168.10.137/servlet_prj/common/main/favicon.png">
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
	position: relative;
}

/* 인영 - 주문관리 style  시작*/
#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 55px;
} 
#background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
height: 130%; width: 90%;
position: absolute;
top: 100px; left: 40px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
#order_list{
width: 95%;
border : 1px solid #CCCCCC;
position: relative;
}
#top_title th{
border-left:1px solid #CCCCCC;
padding: 15px; padding-left: 20px; padding-right: 20px;
background-color: #EAEAEA;
}
th{
border-left:1px solid #CCCCCC;
border-top:1px solid #CCCCCC;
padding: 15px; 
}
#btnChange{
 position: fixed;
 right:150px;
 bottom: 80px;
    height: 50px;
width: 150px;
  background-color: #FFFFFF;
  border: 1px solid #BEBEBE;
  font-size:20px;
  outline: 1px;
  border-radius: 4px;
}
#btnSearch{
position: absolute; left: 550px;
  background-color: #FFFFFF;
  border: 1px solid #BEBEBE;
  height: 40px;
width: 100px;
  font-size:15px;
  outline: 1px;
  border-radius: 4px;
}
#searchList{
height: 38px;
width: 112px;
border: 1px solid  #CCCCCC;
position: absolute; left: 200px;
transform: none;
outline: 1px;
box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px 0px inset;
border--radius: 4px;
font-size: 16px;
}

#inputText{
height: 40px; width: 180px;
border: 1px solid  #CCCCCC;
position: absolute; left: 330px;
transform: none;
outline: 1px;
box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px 0px inset;
border--radius: 5px;
font-size: 17px;
color:  #CCCCCC;
}
#orderCondi{
height: 38px;
width: 100px;
border: 1px solid  #CCCCCC;
transform: none;
outline: 1px;
box-shadow: rgba(0, 0, 0, 0.075) 0px 1px 1px 0px inset;
border--radius: 4px;
font-size: 17px;
}

/* 인영 - 주문관리 style 끝 */
</style>

<script type="text/javascript">
	$(function() {
			$("#inputText").click(function(){
				$(this).val('');
				$(this).css('color', 'black');
			});//click
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
<div id="rightBody">
			<div class="text" id="mainTitle">
			
			<strong>주문 리스트</strong>
			<select id="searchList">
				<option>주문번호</option>
				<option>주문자명</option>
				<option>아이디</option>
			</select>
			
			<input type="text" class="textBox" id="inputText" value="내용을 입력해주세요"/>
			<input type="button" class="btn" id="btnSearch" value="검색"/>
			</div>
			<div id="background_box">
			<div style="margin-top : 50px; margin-left: 50px">
		<table id="order_list">
		<thead>
				<tr id="top_title">
					<th></th>
					<th>No</th>
					<th >주문일시</th>
					<th>주문번호</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격정보</th>
					<th>배송비</th>
					<th>주문상태</th>
					<th>주문자명</th>
					<th>총주문액</th>
				</tr>
				</thead>
				<tbody>
				
				<c:forEach var="member" items="${ memberList }" varStatus="i">
				<tr>
				<%-- <td><c:out value="<%= startNum++ %>"/></td> --%>
				<td><c:out value="${ member.id }"/></td>
				<td><a href="#void" onclick="memberDetail('${ member.id }')"><c:out value="${ member.name }"/></a></td>
				<td><c:out value="${ member.birthday }"/></td>
				<td><c:out value="${ member.cell }"/></td>
				<td><c:out value="${ member.email }"/></td>
				<td><c:out value="${ member.gender eq 1?'남자':'여자' }"/></td>
				<td><fmt:formatDate value="${ member.inputDate }" pattern="yyyy-MM-dd HH:mm"/></td>
				</tr>
				</c:forEach>
				<!-- 
				<th>
					<select id="orderCondi">
					<option>결제완료</option>
					<option>주문확인</option>
					<option>배송준비</option>
					<option>배송중</option>
					</select>
					</th>
				 -->
				</tbody>
				
			</table>
			
			</div>
			</div>
			<input type="button" class="btn" id="btnChange" value="변경"/>
		</div>
</div>	
</body>
</html>