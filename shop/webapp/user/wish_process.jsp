<%@page import="user.dao.WishListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
WishListDAO wlDAO=WishListDAO.getInstance();

	String gcode=request.getParameter("gcode");
	System.out.println(gcode);


%>