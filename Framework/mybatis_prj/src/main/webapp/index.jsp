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
<table class="table">
<tr>
<td><a href="index.jsp?page=day1109/scsr">컬럼하나, 행 하나 조회</a></td>
<td><a href="index.jsp?page=day1110/mcsr">컬럼여러개, 행 하나 조회</a></td>
<td><a href="index.jsp?page=day1110/scmr">컬럼하나, 행 여러 개 조회</a></td>
<td><a href="index.jsp?page=day1110/exam">부서별 사원번호 조회</a></td>
<td><a href="index.jsp?page=day1110/mcmr">컬럼 여러 개, 행 여러 개 조회</a></td>
</tr>
</table>
<c:if test="${ not empty param.page }">
<jsp:include page="${ param.page }.jsp"/>
</c:if>
</body>
</html>