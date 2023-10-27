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
   $("#btn").click(function(){
	   //ajax 사용
	$.ajax({
		url:"msg1.jsp",
      type : "GET",
      async : "true",
      dataType : "text",
      error : function(xhr){
         alert("서버에서 문제가 발생하였습니다."+xhr.status+" / "+xhr.statusText );
      },
      success : function(data){
         //alert(data);
         $("#msgDiv").html("<marquee>"+data+"</marquee>");
      }
	}); //ajax
   });//click
   
});//ready
</script>

</head>
<body>
<div>
<input type="button" value="click" class="btn btn-success" id="btn"/>
</div>
<div id="msgDiv">

</div>
</body>
</html>










