<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="쿠키 심기" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.144/jsp_prj/common/images/favicon.ico">
<!-- bootstrap CDN시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Jquery CDN시작 -->
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
//1. 쿠키 생성
Cookie cookieName=new Cookie("name", "김다영");
Cookie cookieAge=new Cookie("age", "24");
//2. 생존시간 설정 (설정 안 하면, 브라우저가 켜져있는 동안만 동작함)
cookieName.setMaxAge(60*60);
cookieAge.setMaxAge(60);
//3. 쿠키 심기
response.addCookie(cookieName);
response.addCookie(cookieAge);
%>
<a href = "get_cookie.jsp">쿠키 읽기</a>
</body>
</html>