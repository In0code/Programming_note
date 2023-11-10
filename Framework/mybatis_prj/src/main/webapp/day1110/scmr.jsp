<%@page import="java.util.List"%>
<%@page import="day1110.ExamDAO2"%>
<%@page import="kr.co.sist.domain.CpDeptDomain"%>
<%@page import="day1109.ExamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<strong>컬럼 하나에 ,여러 행 조회</strong>
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

List<String> enameList=ExamDAO2.getInstance().scmr(deptno);

pageContext.setAttribute("enameList", enameList);
if(enameList == null ){
	%>
	문제발생
	<%
}else{
%>
<c:if test="${ empty enameList }">
<c:out value="${ param.deptno }"/>번 부서는 사원이 존재하지 않습니다.
</c:if>
<c:forEach var="ename" items="${ enameList }">
<c:out value="${ ename }"/>
</c:forEach>

<%}//end else %>
</c:if>
</div>