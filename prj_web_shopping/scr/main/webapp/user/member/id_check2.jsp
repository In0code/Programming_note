<%@page import="org.json.simple.JSONObject"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String id = request.getParameter("id");

MemberDAO mDAO = MemberDAO.getInstance();
boolean flag = false;
try{
	flag = mDAO.selectId(id);
}catch(SQLException se){
	se.printStackTrace();
}

JSONObject jsonObj = new JSONObject();
jsonObj.put("result",flag);
out.print(jsonObj.toJSONString());
%>