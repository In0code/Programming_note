<%@page import="user.dao.WishListDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

WishListDAO wlDAO=WishListDAO.getInstance();
try{
	String wcode=request.getParameter("wcode");
	String id="tuna5127";
	
	System.out.println( wcode+" / "+id);

	 wlDAO.deleteWishList(id, wcode);
	
}catch(SQLException se){
	se.printStackTrace();
}//end catch

%>