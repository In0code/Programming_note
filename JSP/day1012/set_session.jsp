<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 지시자 설정 --%>
<%@ page info="세션에 값을 설정" %>
<%@ page session= "true" %>
<!-- session은 true가 기본이라 안 써도 무방 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://localhost/jsp_prj/common/images/favicon.ico">
<!-- bootstrap CDN시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Jquery CDN시작 -->
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
//세션 생존시간(interval: 요청이 끝난 후 다음 요청이 들어오기까지의 시간)설정
session.setMaxInactiveInterval(60*60*1); //초 단위. 해당 계산은 1시간
//분은 계산하기 헷갈리기 때문에 초(60)*분(60)*시(24)*일(30)*월(12)*년(12).
//단, 일 월 년 단위는 잘 안 씀. 분 단위를 많이 사용함

//세션(내장객체)의 값 설정
session.setAttribute("name", "김다영");
session.setAttribute("age", 24);
List<String> list=new ArrayList<String>();
list.add("유튜브 감상");
list.add("게임");
list.add("낚시");
session.setAttribute("hobby", list);
%>
세션에 값 설정<br>

<a href="get_session.jsp">값 얻기</a>

</body>
</html>