<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/resources/common/main/favicon.png">
<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQeury CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">


</style>

<script type="text/javascript">
$(function() {
	
	
});//ready
</script>

</head>
<body>

<strong><c:out value="${ msg }"/></strong>
<a href="/add_emp_frm">사원 정보 추가</a>
<table class="table">
<tr>
	<th>번호</th>
	<th>사원번호</th>
	<th>사원명</th>
	<th>직무</th>
	<th>연봉</th>
	<th>입사일</th>
</tr>
<c:if test="${ empty empList }">
<tr>
	<td colspan="6" style="text-align: center">사원 정보가 존재하지 않습니다.</td>
</tr>
</c:if>

<c:forEach var="emp" items="${ empList }" varStatus="i">
<tr>
	<td><c:out value="${ i.count }"/></td>
	<td><c:out value="${ emp.empno }"/></td>
	<td><c:out value="${ emp.ename }"/></td>
	<td><c:out value="${ emp.job }"/></td>
	<td><c:out value="${ emp.sal }"/></td>
	<td><fmt:formatDate value="${ emp.hiredate }" pattern="yyyy-MM-dd"/>
</tr>
</c:forEach>

</table>
</body>
</html>