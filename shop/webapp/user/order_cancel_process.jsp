<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="user.dao.ClientOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info=""%>
<%
String ord_dno = request.getParameter("ord_dno");
String priceStr = request.getParameter("price");
System.out.println(ord_dno);
int price = 0;
if(priceStr != null) {
	price = Integer.parseInt(priceStr);
}
System.out.println(price);

JSONObject json = new JSONObject();
try {
	ClientOrderDAO.getInstance().cancelOrder(ord_dno, price);
	json.put("flag", true);
} catch(SQLException se) {
	se.printStackTrace();
	json.put("flag", false);
}
out.print(json.toJSONString());
%>