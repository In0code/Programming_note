<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="지정한 시간동안 페이지를 제공하고, 그 후 지정한 URL로 이동한 meta태그 사용" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="10;http://sist.co.kr"/>
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
요청하신 http://test.com은 2023년 10월 12일까지만 유효합니다<br>
그 후에는 http://sist.co.kr로 만 접근 가능합니다<br>
10초 후에 변경된 URL로 자동 연결합니다<br>
직접 이동하시려면 <a href="http://sist.co.kr">여기</a>를 클릭해주세요
</body>
</html>