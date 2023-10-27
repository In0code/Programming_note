<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name=request.getParameter("name");
	String age=request.getParameter("a");
	String addr=request.getParameter("addr");
	
	System.out.println(name+" / "+age+" / "+addr);
	System.out.println(request.getMethod());
	
%>
<%= name %>,<%= age %>,<%= addr %>