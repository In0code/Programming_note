<%@page import="kr.co.sist.domain.EmpDomain"%>
<%@page import="java.util.List"%>
<%@page import="day1110.ExamDAO2"%>
<%@page import="kr.co.sist.domain.CpDeptDomain"%>
<%@page import="day1109.ExamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<strong>컬럼 여러 개에 ,여러 행 조회</strong>
</div>
<div>
<%
List<EmpDomain> empList=ExamDAO2.getInstance().mcmr();
pageContext.setAttribute("empList", empList);
%>
<table class="table">
<tr>
	<th>번호</th>
	<th>사원번호</th>
	<th>사원명</th>
	<th>연봉</th>
	<th>입사일</th>
</tr>
<c:if test="${ empty empList }">
<tr>
	<td colspan="5">사원정보가 존재하지 않습니다</td>
</tr>
</c:if>

<c:forEach var="ed" items="${ empList }" varStatus="i">
<tr>
	<td><c:out value="${ i.count }"/></td>
	<td><c:out value="${ ed.empno }"/></td>
	<td><c:out value="${ ed.ename }"/></td>
	<td><c:out value="${ ed.sal }"/></td>
	<td><c:out value="${ ed.hiredate }"/></td>
</tr>
</c:forEach>
</table>
</div>