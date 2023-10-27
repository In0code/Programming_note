<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
<%
JSONObject jsonObj=new JSONObject();
jsonObj.put("name", "김짱구");
jsonObj.put("age", "31");
jsonObj.put("addr", "의정부시 의정부동");

JSONObject jsonObj2=new JSONObject();
jsonObj2.put("name", "김영재");
jsonObj2.put("age", "29");
jsonObj2.put("addr", "서울시 광진구 자양동");

JSONObject jsonObj3=new JSONObject();
jsonObj3.put("name", "김아영");
jsonObj3.put("age", "27");
jsonObj3.put("addr", "서울시 성동구 성수동");

JSONArray jsonArr=new JSONArray();
jsonArr.add(jsonObj);
jsonArr.add(jsonObj2);
jsonArr.add(jsonObj3);

out.print(jsonArr.toJSONString() );
%>