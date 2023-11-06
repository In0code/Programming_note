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
	   $.ajax({
		   url : "http://localhost:11805/jsp_prj/xml1101/data.xml",
		   type : "get",
		   dataType : "XML",
		   error : function( xhr ){
			   alert("에러");
			   console.log( xhr.status );
		   },
		   success : function ( xml ){
			   var sel = $("#msg")[0];
			   //1. XML parsing할 노드를 찾아서 반복
			   var msg;
			   $(xml).find("msg").each(function(i, msgNode ){
				   //2. 파싱
				   msg= $(msgNode).text();
				  sel.options[i+1] = new Option ( msg,msg);
			   });//each
		   }//success
	   });//ajax
   });//click
   
   $("#btn2").click(function(){
	   var msgArr = ["즐거운 저녁 시간 되세요","오늘도 고생하셨습니다","자기전에 소주 한 잔 어때요?"];
	   var sel = $("#msg")[0];
	   //select을 초기화
	   //sel.length=남길 옵션의 수
	   sel.length=1;
	   
	   $.each( msgArr, function( i, msg ){
		   sel.options[i+1] = new Option ( msg,msg);
	   });//each
	   
   });//click
});//ready
</script>

</head>
<body>
<select id="msg">
	<option>--메시지선택--</option>
</select>
<input type="button" class="btn btn-info btn-sm" value="메시지 설정" id="btn"/>
<input type="button" class="btn btn-info btn-sm" value="메시지 설정2" id="btn2"/>
</body>
</html>