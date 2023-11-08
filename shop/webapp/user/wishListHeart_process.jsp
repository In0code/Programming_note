<%@page import="user.dao.WishListDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ page info="사용자 / 장바구니 / 장바구니 리스트에 상품 추가(insert) - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

WishListDAO wlDAO=WishListDAO.getInstance();
boolean flag = false;
try{
	String gcode=request.getParameter("gcode");
	String id=(String)session.getAttribute("sesId");
	 //조회 결과가 있으면 true, 없으면 false
	flag= wlDAO.getGcode(id,gcode);
	
}catch(SQLException se){
	se.printStackTrace();
}//end catch

%>
<%= flag %>