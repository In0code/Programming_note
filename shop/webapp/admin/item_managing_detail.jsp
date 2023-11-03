<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
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
		<a href="member_list.jsp">	
			<img src="../common/images/back.png" style="width:27px;"/>
			<strong>회원 리스트</strong>
		</a>
		
		<form action="member_delete.jsp" id="del" name="del">
		<input type="button" id=delbtn name="delbtn" value="사용자 삭제" class="btn btn-outline-dark" onclick="memberDelete('${ id }')"/>
		</form>
		
		</div>
		<div id="background_box" style="width:60%; height:160%"> <!-- 코딩 -->
		<h6 style="padding:15px 25px; font-weight: bold; font-size:20px; color: navy; ">회원 상세정보</h6>
		<img src="../common/images/default_user.jpg" alt="user_image"/>
	<table class="m_list">
  <tr>
    <th scope="row">이름</th>
    <td><c:out value="${ member.name }"/></td>
  </tr>
   <tr>
    <th scope="row">아이디</th>
    <td><c:out value="${ member.id }"/></td>
  </tr>
  <tr>
    <th scope="row">핸드폰번호</th>
    <td><c:out value="${ member.phone }"/></td>
  </tr>
  <tr>
    <th scope="row">이메일</th>
    <td><c:out value="${ member.email }"/></td>
  </tr>
  <tr>
    <th scope="row">주소</th>
    <td>
    <input type="text" id="zipcode" name="zipcode" value="<c:out value="${ member.zipcode }"/>"  
    readonly="readonly" style="border:none">
    <input type="text" id="addr" name="addr" value="<c:out value="${ member.addr }"/>" 
    readonly="readonly" style="border:none ">
    <input type="text" id="detailAddr" name="detailAddr" value="<c:out value="${ member.detailAddr }"/>" 
    readonly="readonly" style="border:none">
    </td>
    
  </tr>
  
  <tr>
    <th scope="row">가입일</th>
    <td><c:out value="${ member.joinDate }"/></td>
  </tr>
  <tr>
    <th scope="row">등급</th>
    <td><c:out value="${ member.membership }"/></td>
  </tr>
  <tr>
    <th scope="row">총 구매건수</th>
    <td>0</td>
  </tr>
  <tr>
    <th scope="row">총 구매금액</th>
    <td>0</td>
  </tr>
</table>
		</div>
	</div>	
</div>
</body>
</html>