<%@page import="org.apache.ibatis.exceptions.PersistenceException"%>
<%@page import="org.apache.catalina.valves.ProxyErrorReportValve"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="day1115.ExamDAO5"%>
<%@page import="java.util.List"%>
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
function setId( id ){
	$("#id").val( id );
	$("#frm").submit();
}//setId
</script>

</head>
<body>
<form action="member_detail.jsp" method="post" id="frm">
<input type="hidden" name="id" id="id"/>
</form>
<table class="table">
<tr>
<th>번호</th>
<th>아이디</th>
</tr>
<%
ExamDAO5 eDAO=ExamDAO5.getInstance();
try{
List<String> memberList=eDAO.selectAllId();
pageContext.setAttribute("memberList", memberList);
%>
<c:if test="${ empty memberList }">
<tr><td colspan="2">회원이 존재하지 않습니다</td></tr>
</c:if>
<c:forEach var="memberId" items="${ memberList }" varStatus="i">
<tr>
<td><c:out value="${ i.count }"/></td>
<td><a href="#void" onclick="setId('${ memberId }')"><c:out value="${ memberId }"/></a></td>
</tr>
</c:forEach>
<%
}catch(PersistenceException pe){
	pe.printStackTrace();
%>
<tr><td colspan="2">문제 발생 잠시 후 다시 시도</td></tr>
<%
}//end catch
%>
</table>
</body>
</html>






