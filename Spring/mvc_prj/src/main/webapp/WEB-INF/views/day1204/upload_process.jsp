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
<c:out value="${ requestScope.uploader }"/>님 께서 업로드 한
<strong><c:out value="${ requestScope.fileName }"/></strong>파일의 업로드 결과입니다<br/>
<c:choose>
<c:when test="${ requestScope.fileResultFlag }">
파일 업로드 성공<br/>
<img src="http://localhost/mvc_prj/common/images/JJanggu.png">
</c:when>
<c:otherwise>
<c:out value="${ requestScope.fileSize }"/>는 10Mbyte를 초과합니다.
</c:otherwise>
</c:choose>
</body>
</html>