<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSONArray" %>


<%

//1. jsonarray 생성
JSONArray jsonArr=new JSONArray();

//2. JSONOBJECT 생성
JSONObject jsonObj = new JSONObject();

jsonObj.put("name", "박상준");
jsonObj.put("age", 20);


JSONObject jsonObj2 = new JSONObject();

jsonObj2.put("name", "송지하");
jsonObj2.put("age", 30);

JSONObject jsonObj3 = new JSONObject();

jsonObj3.put("name", "홍찬영");
jsonObj3.put("age", 40);

//3. jsonobj을 jsonarray에 할당
jsonArr.add(jsonObj);
jsonArr.add(jsonObj2);
jsonArr.add(jsonObj3); //generic을 쓰지 않아서 Warning but generic 지원하지 않음.

//4. 출력
%>


<%= jsonArr.toJSONString()%>