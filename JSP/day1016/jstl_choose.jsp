<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSTL - choose" %>
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
	   $("form").submit();
   });//click
});//ready
</script>

</head>
<body>
<form action="http://localhost/jsp_prj/day1016/jstl_choose.jsp" method="post">
<select name="blood">
<option>-----혈액형선택-----</option>
<option value="a"${param.blood eq 'a'? " selected='selected'" : "" }>A형</option>
<option value="b"${param.blood eq 'b'? " selected='selected'" : "" }>B형</option>
<option value="ab"${param.blood eq 'ab'? " selected='selected'" : "" }>AB형</option>
<option value="o"${param.blood eq 'o'? " selected='selected'" : "" }>O형</option>
</select>
<br/>
<input type="radio" value="guest" name="type"/>방문자
<input type="radio" value="user" name="type"/>작성자
<input type="radio" value="admin" name="type"/>관리자

<input type="button" value="입력" class="btn btn-info" id="btn"/>
</form>
<c:if test="${ not empty param.blood }">
<div>
<c:choose>
	<c:when test="${ param.blood eq 'a' }">
	<c:set var="img" value="a.png"/>
	</c:when>
	<c:when test="${ param.blood eq 'b' }">
	<c:set var="img" value="b.png"/>
	</c:when>
	<c:when test="${ param.blood eq 'ab' }">
	<c:set var="img" value="ab.png"/>
	</c:when>
	<c:otherwise>
	<c:set var="img" value="o.png"/>
	</c:otherwise>
</c:choose>
<img src="images/${ img }">
</div><br/>
</c:if>
<div>
<!-- 입력된 type이 guest면 "읽기" 출력, user면 "읽기","쓰기"출력
admin이면 "읽기","쓰기","삭제"를 출력. type이 없는 경우에는 "접속형태를 선택해주세요"를 출력-->
<c:choose>
	<c:when test="${ param.type eq 'guest' }">
	${ param.type } : 읽기
	</c:when>
	<c:when test="${ param.type eq 'user' }">
	${ param.type } : 읽기, 쓰기
	</c:when>
	<c:when test="${ param.type eq 'admin' }">
	${ param.type } : 읽기, 쓰기, 삭제
	</c:when>
	<c:otherwise>
	접속형태를 선택해주세요
	</c:otherwise>
</c:choose>
</div>
<div style="width:338px">
<!-- jstl_if.jsp에서 name에 tk가 입력된 후 전송이 눌려지면 scope객체중 하나를 선택하여
값을 넣은 다음, 이동이 눌려졌을 때 아래 리뷰 작성 버튼이 보여질 수 있도록 코딩-->
<c:if test="${ user eq 'tk' }">
<div style="text-align: right">
<input type="button" value="리뷰작성" class="btn btn-warning"/>
</div>
</c:if>
</div>
<img src="../common/images/news_list.png">


</body>
</html>