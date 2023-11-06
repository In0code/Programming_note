<%@page import="java.sql.SQLException"%>
<%@page import="user.vo.WishListVO"%>
<%@page import="user.dao.CartDAO"%>
<%@page import="user.dao.WishListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="사용자 / 관심상품 / '장바구니 추가'버튼 누르면 리스트에 상품 추가(insert) - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
CartDAO cDAO=CartDAO.getInstance();

try{
	String gcode=request.getParameter("gcode");
	String id="tuna5127";

	 cDAO.intsertAddCart(id, gcode,1); 
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>