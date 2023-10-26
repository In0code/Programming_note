<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSONObject을 생성하는 외부 library 사용" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String name="김짱구";
int age=32;
String addr="의정부시 의정부동 우주마루6차 15층";

//1. JSONObject 생성
JSONObject jsonObj=new JSONObject();

//2. 값 할당
jsonObj.put("name", name);
jsonObj.put("age", age);
jsonObj.put("addr", addr);
//같은 이름이 입력되면 이전의 값에 덮어 쓴다
jsonObj.put("addr","경기도 의정부시 신곡동");
%>
<%= jsonObj.toJSONString() %>