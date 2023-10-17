<%@page import="day1013.TestUseBeanVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="useBean 액션태그의 사용" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.148/jsp_prj/common/main/favicon.png">
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
<!-- useBean은 클래스의 기본생성자를 사용하여 객체화한다. -->
<jsp:useBean id="tubVO" class="day1013.TestUseBeanVO" scope="page"/>
<!-- 생성된 객체에 값을 설정 -->
<jsp:setProperty property="name" name="tubVO" value="임태균"/>
<jsp:setProperty property="age" name="tubVO" value="25"/>
<!-- 객체에 저장된 값을 확인 -->
이름: <jsp:getProperty property="name" name="tubVO"/><br/>
나이: <jsp:getProperty property="age" name="tubVO"/><br/>
<%
TestUseBeanVO tVO=new TestUseBeanVO();
tVO.setName("홍지성");
tVO.setAge(20);
%>
이름: <%=tVO.getName() %><br/>
나이: <%=tVO.getAge() %><br/>

<%
//useBean액션태그의 id는 객체명이고 scriptlet에서 객체로 사용할 수 있다.
tubVO.setName("테스트");
tubVO.setAge(30);
%>
이름: <%=tVO.getName() %><br/>
나이: <%=tVO.getAge() %><br/>
</body>
</html>



