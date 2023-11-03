<%@page import="user.dao.CartDAO"%>
<%@page import="user.dao.WishListDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

CartDAO cDAO=CartDAO.getInstance();
try{
	String gcode=request.getParameter("gcode");
	int amount=Integer.parseInt(request.getParameter("amount"));
	String id="tuna5127";
	

	cDAO.intsertAddCart(id, gcode,amount);
	
}catch(SQLException se){
	se.printStackTrace();
}//end catch

%>