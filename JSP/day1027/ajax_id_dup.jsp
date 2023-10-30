<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ page info="ajax를 사용한 id중복 확인" %>
<%
String id = request.getParameter("id");
MemberDAO mDAO=MemberDAO.getInstane();
boolean flag=false;
try{
flag= mDAO.selectId(id);
}catch(SQLException se){
	se.printStackTrace();
}//end catch

JSONObject jsonObj=new JSONObject();
jsonObj.put("resultData",flag);
out.print( jsonObj.toJSONString() );

%>