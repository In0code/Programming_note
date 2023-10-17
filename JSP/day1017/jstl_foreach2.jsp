<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSTL - foreach" %>
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
String[] names={"김주민","차준식","홍지성","정민교","김다영" };
//1. scope 객체에 값 할당
pageContext.setAttribute("namesArr", names);
%>
<!-- 2. 사용 -->
<table class="table">
<thead>
<tr>
	<th>번호</th>
	<th>이름</th>
</tr>
</thead>
<tbody>

<c:forEach var="name" items="${ namesArr }" varStatus="i">
<%-- <c:set var="i" value="${ i+1 }"/> 권장하지 않음--%>
	<tr>
	<td>
	<c:out value="${ i.index }"/> / 
	<c:out value="${ i.count }"/> / 
	<c:out value="${ i.first }"/> /
	<c:out value="${ i.last }"/> /
	</td>
	<td><c:out value="${name }"/></td>
	</tr>
</c:forEach>
</tbody>
</table>
<%
List<String> list=new ArrayList<String>();
list.add("장용석");
list.add("오호수");
list.add("서효민");
list.add("김선경");
list.add("박서현");
//scope객체에 할당
pageContext.setAttribute("namesList", list);
%>
<!-- 사용 -->
<table class="table">
<thead>
<tr>
	<th>번호</th>
	<th>이름</th>
</tr>
</thead>
<tbody>

<c:forEach var="name" items="${ namesList }" varStatus="i">
<%-- <c:set var="i" value="${ i+1 }"/> 권장하지 않음--%>
	<tr>
	<td>
	<c:out value="${ i.index }"/> / 
	<c:out value="${ i.count }"/> / 
	<c:out value="${ i.first }"/> /
	<c:out value="${ i.last }"/> /
	</td>
	<td><c:out value="${name }"/></td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>