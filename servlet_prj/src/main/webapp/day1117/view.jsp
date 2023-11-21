<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
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
이전 페이지의 parameter 받기<br>
<c:out value="${ param.name }"/>님
<br/>
scope 객체의 값<br/>
<c:out value="${ name }"/> / <c:out value="${ requestScope.name }"/>
<ul>
<c:forEach var="age" items="${ paramValues.age }" varStatus="i">
<li><c:out value="${ i.count }. ${ age }살"/></li>
</c:forEach>
</ul>
<a href="call_servlet.jsp">다시 입력</a>
</body>
</html>