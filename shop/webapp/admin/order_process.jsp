<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="admin.dao.OrderProcessDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String dlvyPro = request.getParameter("DLVY_PRO");
int orderNo = Integer.parseInt(request.getParameter("orderNo"));

OrderProcessDAO opDAO = OrderProcessDAO.getInstance();
int updateResult = 0; // int 형태로 결과를 받습니다

try {
    updateResult = opDAO.updateShippingProgress(orderNo, dlvyPro);
} catch (SQLException se) {
    se.printStackTrace();
    updateResult = 0; // 업데이트에 실패한 경우 0으로 설정
}

JSONObject jsonObj = new JSONObject();
jsonObj.put("result", updateResult); // 결과 값을 JSON 객체에 넣습니다

out.print(jsonObj.toJSONString());
%>





