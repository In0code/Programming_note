<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="EL을 사용한 parameter 받기" %>
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
	//id가 btn인 버튼이 클릭되면 id가 frm폼의 submit을 수행
   $("#btn").click(function(){
	  $("#frm").submit();
   });//click
});//ready
</script>

</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<div>
<!-- EL에서 parameter를 받을 때에는 param객체를 사용한다 -->
name속성의 값이 유일 : <strong>${ param.name }</strong>
name속성의 값이 중복 : 
${ paramValues.age[0] }
${ paramValues.age[1] }
${ paramValues.age[2] } <!-- EL은 null인 경우 출력하지 않는다 -->

</div>
<div>
<a href="el_param.jsp?name=tk&age=20&age=30">요청</a>
<form action="http://localhost/jsp_prj/day1016/el_param.jsp" method="post" id="frm">
<label>이름</label><input type="text" name="name" value="테스트" class="inputBox"/><br/>
<label>나이</label><input type="text" name="age" value="21" class="inputBox"/><br/>
<label>나이</label><input type="text" name="age" value="22" class="inputBox"/><br/>
<label>나이</label><input type="text" name="age" value="23" class="inputBox"/><br/>
<input type="button" value="요청" class="btn btn-success" id="btn"/>
</form>
</div>





</body>
</html>