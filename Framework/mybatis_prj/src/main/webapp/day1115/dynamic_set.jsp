<%@page import="day1115.ExamDAO5"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
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
   
});//ready
</script>

</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="wmVO" class="kr.co.sist.vo.WebMemberVO" scope="page"/>
<jsp:setProperty property="*" name="wmVO"/>
<c:catch var="e">
<%
wmVO.setEmail(wmVO.getEmail1()+"@"+wmVO.getEmail2());

DataEncrypt de=new DataEncrypt("a12345678901234567");
wmVO.setName(de.encryption(wmVO.getName()));
wmVO.setCell(de.encryption(wmVO.getCell()));
wmVO.setEmail(de.encryption(wmVO.getEmail()));

ExamDAO5 eDAO=ExamDAO5.getInstance();
int cnt=eDAO.updateWebMember(wmVO);
pageContext.setAttribute("cnt", cnt);
%>
<c:choose>
<c:when test="${ cnt eq 1 }">
${ param.id }님의 정보가 변경되었습니다
</c:when>
<c:otherwise>
${ param.id }님의 정보가 변경되지 않았습니다. ID를 확인해주세요.
</c:otherwise>
</c:choose>
</c:catch>
<c:if test="${ not empty e }">
${ e }
ㅈㅅ 문제 발생 ! 잠시 후 다시 시도
</c:if>

</body>
</html>





