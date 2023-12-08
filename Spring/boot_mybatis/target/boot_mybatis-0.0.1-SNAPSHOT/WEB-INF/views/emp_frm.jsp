<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<form action="/add_emp_process">

<label>사원번호</label>
<input type="text" name="empno" class="inputBox"/><br>

<label>사원명</label>
<input type="text" name="ename" class="inputBox"/><br>

<label>연봉</label>
<input type="text" name="sal" class="inputBox"/><br>

<label>직무</label>
<input type="text" name="job" class="inputBox"/><br>

<input type="submit" value="입력" class="btn btn-info btn-sm"/>

</form>

</body>
</html>