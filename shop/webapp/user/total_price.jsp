<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int amount = Integer.parseInt(request.getParameter("amount"));
	int price = Integer.parseInt(request.getParameter("price"));
	DecimalFormat decimalFormat = new DecimalFormat("#,###,###");
%>

<%= decimalFormat.format(amount * price) %>