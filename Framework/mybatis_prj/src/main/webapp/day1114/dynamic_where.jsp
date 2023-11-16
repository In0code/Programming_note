<%@page import="day1114.ExamDAO4"%>
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
<strong> dynamic where 조회 </strong>
</div>
<div>
<form action="index.jsp">
<input type="hidden" name="page" value="${ param.page }"/>
부서번호 : <input type="text" name="deptno" class="inputBox"/>
<input type="submit" value="조회" class="btn btn-info btn-sm"/><br/>
</form>
</div>

<div>
<c:if test="${ not empty param.deptno }">
<%
int deptno=Integer.parseInt(request.getParameter("deptno"));

List<EmpDomain> empList=ExamDAO4.getInstance().dynamicWhere(deptno);
pageContext.setAttribute("empList", empList);
%>
<table class="table">
<tr>
	<th>번호</th>
	<th>사원번호</th>
	<th>사원명</th>
	<th>부서번호</th>
</tr>
<c:if test="${ empty empList }">
<tr>
	<td colspan="4">사원정보가 존재하지 않습니다</td>
</tr>
</c:if>

<c:forEach var="ed" items="${ empList }" varStatus="i">
<tr>
	<td><c:out value="${ i.count }"/></td>
	<td><c:out value="${ ed.empno }"/></td>
	<td><c:out value="${ ed.ename }"/></td>
	<td><c:out value="${ ed.deptno }"/></td>
</tr>
</c:forEach>
</table>
</c:if>
</div>