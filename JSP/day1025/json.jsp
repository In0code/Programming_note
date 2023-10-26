<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String name="김짱구";
int age=34;
String addr="의정부시 의정부동";

%>
{ name : "<%= name %>" ,age : "<%= age %>" , addr : "<%= addr %>"}; 