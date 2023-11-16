<%@page import="kr.co.sist.domain.DeptEmpDomain"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.co.sist.vo.InsertProcedureVO"%>
<%@page import="day1116.ExamDAO6"%>
<%@page import="kr.co.sist.domain.EmpDomain"%>
<%@page import="java.util.List"%>
<%@page import="day1110.ExamDAO2"%>
<%@page import="kr.co.sist.domain.CpDeptDomain"%>
<%@page import="day1109.ExamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div>
<strong> procedure를 사용한 조회 </strong>
</div>
<div>
<form action="index.jsp">
<input type="hidden" name="page" value="${ param.page }"/>
부서번호 : <input type="text" name="deptno" class="inputBox"/>
<input type="submit" value="검색" class="btn btn-info btn-sm"/><br/>
</form>
</div>

<div>
<c:if test="${ not empty param.deptno }">
<%
int deptno=Integer.parseInt(request.getParameter("deptno"));
Map<String,Object> map=new HashMap<String, Object>();
map.put("deptno", deptno);

List<DeptEmpDomain> list=ExamDAO6.getInstance().selectProcedure(map);
pageContext.setAttribute("empList", list);
%>
<table class="table">
<thead>
<tr>
<th>부서번호</th><th>부서명</th><th>위치</th>
<th>사원번호</th><th>사원명</th><th>연봉</th><th>입사일</th>
</tr>
</thead>
<tbody>
<c:if test="${ empty empList }">
<tr>
<td colspan="7"><c:out value="${ param.deptno }"/>부서가 존재하지 않습니다</td>
</tr>
</c:if>
<c:forEach var="emp" items="${ empList }" >
<tr>
<td><c:out value="${ emp.deptno }"/></td>
<td><c:out value="${ emp.dname}"/></td>
<td><c:out value="${ emp.loc }"/></td>
<td><c:out value="${ emp.empno }"/></td>
<td><c:out value="${ emp.ename }"/></td>
<td><c:out value="${ emp.sal }"/></td>
<td><fmt:formatDate pattern="yyyy-MM-dd"  value="${ emp.hiredate }"/></td>
</tr>
</c:forEach>
</tbody>
</table>


</c:if>
</div>