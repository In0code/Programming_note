<%@page import="user.dao.CartDAO"%>
<%@page import="user.dao.WishListDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="사용자 / 장바구니 / 리스트에서 상품 삭제(delete) - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

CartDAO cDAO=CartDAO.getInstance();
try{
	String bcode=request.getParameter("bcode");
	String id=(String)session.getAttribute("sesId");

	cDAO.deleteCart(id, bcode);
	
}catch(SQLException se){
	se.printStackTrace();
}//end catch

%>