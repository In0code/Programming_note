<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="쿠키 심기" %>
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
//1. 쿠키 생성
Cookie cookieName=new Cookie("name","김인영");
Cookie cookieAge=new Cookie("age","25");
//2. 생존시간 설정 ( 설정하지 않으면 웹 브라우저가 실행되고 있는 동안만 유지
cookieName.setMaxAge(60*60);
cookieAge.setMaxAge(60*60*1);
//3. 쿠키 심기
response.addCookie(cookieAge);
response.addCookie(cookieName);
%>
</body>
</html>