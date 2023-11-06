<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ page info="사용자 / 장바구니 /  상품 수량 마이너스 버튼을 누르면 수량 감소 - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String bcode=request.getParameter("bcode");
int amount=Integer.parseInt(request.getParameter("amount"));

%>
<%= --amount %>