<%@page import="kr.co.sist.vo.BoardVO"%>
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
<strong> dynamic if 조회 </strong>
</div>
<jsp:useBean id="bVO" class="kr.co.sist.vo.BoardVO" scope="page"/>
<jsp:setProperty name="bVO" property="*"/> <!-- method의 다른 이름 property -->
<div>
<form action="index.jsp">
<input type="hidden" name="page" value="${ param.page }"/>
<select name="fieldName">
<option value="content">내용</option>
<option value="writer">작성자</option>
</select>
부서번호 : <input type="text" name="keyword" class="inputBox"/>
<input type="submit" value="검색" class="btn btn-info btn-sm"/><br/>
</form>
</div>
<%
ExamDAO4 eDAO=ExamDAO4.getInstance();
int totalCnt = eDAO.dynamicIf(bVO);
%>
<div>
총 레코드의 수 : <%= totalCnt %> 건
</div>