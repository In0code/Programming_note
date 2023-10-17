<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1013.ForwardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSTL에서 VO의 사용" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/jsp_prj/common/main/favicon.png">
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
<%
//1. 객체 생성
ForwardVO fVO=new ForwardVO("홍지성","인천시",26);
//2.scope객체 할당
pageContext.setAttribute("fVO", fVO);
%>
<!-- 사용 get을 제외한 method명을 소문자로 기술하고, method 기호를 붙이지 않는다-->
<ul>
<li>이름 : <strong><c:out value="${ fVO.name }"/></strong></li>
<li>지역 : <strong><c:out value="${ fVO.area }"/></strong></li>
<li>나이 : <strong><c:out value="${ fVO.age }"/></strong></li>
</ul>
<!-- useBean action tag 사용 -->
<jsp:useBean id="fVO2" class="day1013.ForwardVO" scope="page"/>
<jsp:setProperty property="name" name="fVO2" value="김인영"/>
<jsp:setProperty property="age" name="fVO2" value="25"/>
<jsp:setProperty property="area" name="fVO2" value="서울시 강남구 역삼동"/>
<ul>
<li>이름 : <strong><c:out value="${ fVO2.name }"/></strong></li>
<li>지역 : <strong><c:out value="${ fVO2.area }"/></strong></li>
<li>나이 : <strong><c:out value="${ fVO2.age }"/></strong></li>
</ul>
<%
List<ForwardVO> list=new ArrayList<ForwardVO>();
list.add( new ForwardVO("김인영","의정부시",25));
list.add( new ForwardVO("김영재","서울시",29));
list.add( new ForwardVO("김다영","서울시",25));
list.add( new ForwardVO("이동원","수원시",26));

//scope객체에 할당
pageContext.setAttribute("data", list);
%>
<!-- 사용 -->
<table class="table">
<thead>
<tr>
	<th>번호</th>
	<th>이름</th>
	<th>거주지</th>
	<th>나이</th>
</tr>
</thead>
<tbody>

<c:forEach var="member" items="${ data }" varStatus="i">
	<tr>
	<td><c:out value="${ i.count }"/></td>
	<td><c:out value="${ member.name }"/></td>
	<td><c:out value="${ member.area }"/></td>
	<td><c:out value="${ member.age }"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

</body>
</html>