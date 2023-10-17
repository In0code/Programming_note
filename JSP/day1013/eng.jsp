<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="영어 페이지" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
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
<jsp:useBean id="fVO" class="day1013.ForwardVO" scope="page"/>

welcome to this page<br/>
name : <jsp:getProperty property="name" name="fVO"/><br>
age : <jsp:getProperty property="age" name="fVO"/><br>
area : <jsp:getProperty property="area" name="fVO"/><br>
<a href="javascript:history.back()">back</a>


</body>
</html>




