<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.member.dao.BoardDAO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="리플 삭제" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String num=request.getParameter("num");
JSONObject json=new JSONObject();
json.put("deleteFlag", false);
if( num != null ){
	BoardDAO2 bDAO=BoardDAO2.getInstance();
	json.put("deleteFlag",bDAO.deleteReply(Integer.parseInt(num)) == 1);
}//end if
out.print( json.toJSONString() );
%>