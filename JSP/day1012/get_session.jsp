<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="세션에 설정된 값을 얻기" %>
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
String name=(String)session.getAttribute("name");
int age=((Integer)session.getAttribute("age")).intValue();
List<String> list=(List<String>)session.getAttribute("hobby");
%>
<label>이름</label> <input type="text" value="<%= name %>" class="inputBox"/><br>
<label>나이</label> <input type="text" value="<%= age %>" class="inputBox"/><br>
<label>취미</label>
<% for(String hobby : list){%>
	<input  type="checkbox" name="hobby" value="<%= hobby %>"><%= hobby %>
<% }//end for %><br>
<a href="set_session.jsp">세션 값 얻기</a>
<a href="remove_session.jsp">세션 값 지우기</a>
</body>
</html>