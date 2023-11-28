<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/mvc_prj/common/main/favicon.png">
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
<form action="use_request_param.do">
이름<input type="text" name="name" class="inputBox"/><br/>
나이<input type="text" name="age" class="inputBox"/><br/>
취미	<input type="checkbox" name="hobby" value="독서"/>독서
	<input type="checkbox" name="hobby" value="게임"/>게임
	<input type="checkbox" name="hobby" value="운동"/>운동
	<input type="checkbox" name="hobby" value="음주가무"/>음주가무<br/>
	<input type="submit" value="전송" class="btn btn-info btn-sm"/>
</form>

</body>
</html>