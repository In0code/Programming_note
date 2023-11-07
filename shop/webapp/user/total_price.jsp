<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	int price = Integer.parseInt(request.getParameter("price"));
	DecimalFormat decimalFormat = new DecimalFormat("#,###,###");
%>

<%= decimalFormat.format(quantity * price) %>