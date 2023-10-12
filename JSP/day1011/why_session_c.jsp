<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info = "세션을 사용해야 하는 이유 - 이전페이지의 값을 사용해야 하는 페이지" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.134/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- bootstrap CDN-->
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	
})//ready
</script>


</head>
<body>
<%
// jsp파일이 다르면 다른 jsp에 존재하는 변수를 사용할 수 없다.
String name = request.getParameter("name");// 이전 페이지에서 받았던 name web parameter는 받을 수 없다.
%>
<%= name %> 님의 작업페이지
</body>
</html>