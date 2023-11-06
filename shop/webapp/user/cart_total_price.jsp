<%@page import="java.text.DecimalFormat"%>
<%@page import="user.dao.CartDAO"%>
<%@page import="user.vo.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String bcode = request.getParameter("bcode");
    int amount = Integer.parseInt(request.getParameter("amount"));
    int price = Integer.parseInt(request.getParameter("price"));

    int total = amount * price;

    DecimalFormat decimalFormat = new DecimalFormat("#,###,###");
    String formattedTotal = decimalFormat.format(total);
%>

<%= formattedTotal %>원