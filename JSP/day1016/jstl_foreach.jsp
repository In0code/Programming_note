<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSTL - for" %>
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
   
});//ready
</script>

</head>
<body>
<select>
<c:forEach var="i" begin="1" end="100" step="1">
<option value="${ i }"><c:out value="${ i }"/></option>
</c:forEach>
</select>
<br/>
<%
Calendar c=Calendar.getInstance();
int year=c.get(Calendar.YEAR);

pageContext.setAttribute("nowYear", year);
pageContext.setAttribute("endYear", year+20);
pageContext.setAttribute("flagYear", 2033);
%>
<!-- 현재 년도부터 20년 후까지의 년도를 출력 (43년까지) JSTL을 사용  -->
<!--2033년이 선택되어 보여질 수 있게 코딩  -->
<select>
<c:forEach var="year" begin="${nowYear}" end="${ endYear}" step="1">
<option value="${ year }"${ year eq flagYear?" selected='selected'":"" }><c:out value="${ year }"/></option>
</c:forEach>
</select>


</body>
</html>