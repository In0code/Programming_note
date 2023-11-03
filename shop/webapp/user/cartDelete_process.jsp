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
	String bcode=request.getParameter("bcode");
	String id="tuna5127";
	
	System.out.println( bcode+" / "+id);

	cDAO.deleteCart(id, bcode);
	
}catch(SQLException se){
	se.printStackTrace();
}//end catch

%>