<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
   <%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/mvc_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.neXt/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">

<script type="text/javascript" src="/resources/js/main.js"></script> 
<script type="text/javascript">
$(function(){
   $("#btn").click(function(){
	   msg();
   });//click
});//ready
</script>

</head>
<body>
안녕하세요 :) hi Spring boot :)<br/>
<input type="text" class="inputBox"/>
<input type="button" value="클릭" id="btn" class="btn btn-info btn-sm"/>
</body>
</html>