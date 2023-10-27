<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
<%
JSONObject jsonObj=new JSONObject();
jsonObj.put("name", "김짱구");
jsonObj.put("age", "31");
jsonObj.put("addr", "의정부시 의정부동");

out.print(jsonObj.toJSONString() );
%>