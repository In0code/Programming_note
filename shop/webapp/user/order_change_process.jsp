<%@page import="java.sql.SQLException"%>
<%@page import="user.dao.ClientOrderDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%
String ord_dno = request.getParameter("ord_dno");
System.out.println(ord_dno);
JSONObject json = new JSONObject();
try {
	ClientOrderDAO.getInstance().changeOrder(ord_dno);
	json.put("flag", true);
} catch(SQLException se) {
	se.printStackTrace();
	json.put("flag", false);
}
out.print(json.toJSONString());
%>