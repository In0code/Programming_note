<%@page import="user.dao.WishListDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="사용자 / 장바구니 / 장바구니 리스트에 상품 추가(insert) - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

WishListDAO wlDAO=WishListDAO.getInstance();
try{
	String gcode=request.getParameter("gcode");
	String id=(String)session.getAttribute("sesId");
	 wlDAO.intsertWishList(id, gcode);
	
}catch(SQLException se){
	se.printStackTrace();
}//end catch

%>