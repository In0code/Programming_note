<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.member.vo.UserDataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 지시자 설정 --%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/jsp_prj/common/images/favicon.ico">
<!-- bootstrap CDN시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Jquery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

#wrap{ 
width: 1012px;height: 678px; position: relative; margin: 0px auto;
background: #FFF url('images/main_bg.png') no-repeat; }

#loginBox { 
position: absolute; top: 256px; left: 770px; }

a{ 
text-decoration: none; color: #333 }

</style>

<script type="text/javascript">

$(function(){
   
});//ready
</script>

</head>
<body>
<div id="wrap">
<div id="loginBox">
<c:choose>
<c:when test="${ empty sesId }">
<a href="login_frm.jsp">로그인</a>
</c:when>
<c:otherwise>
<%
UserDataVO udVO=(UserDataVO)session.getAttribute("userData");
DataDecrypt dd=new DataDecrypt("a12345678901234567");
String name=dd.decryption(udVO.getName());
pageContext.setAttribute("name", name);
%>
      
<c:out value="${name }"/>님 어서오세요 <br/>
<a href="member_list.jsp">회원리스트</a>
<a href="logout.jsp">로그아웃</a>
</c:otherwise>
</c:choose>

</div>
</div>
</body>
</html>