<%@page import="admin.vo.OrderVO"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="admin.dao.OrderProcessDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
BufferedReader reader = request.getReader();
StringBuilder jsonInput = new StringBuilder();
String line;

OrderProcessDAO opDAO = OrderProcessDAO.getInstance();

while((line = reader.readLine()) != null) {
    jsonInput.append(line);
}//end while

String jsonString = jsonInput.toString();

try {
    JSONArray jsonArr = (JSONArray) JSONValue.parse(jsonString);

    for (Object obj : jsonArr) {
        JSONObject jsonObj = (JSONObject) obj;
        String ord_dno = (String)jsonObj.get("ord_dno").toString();
        String newStatus = (String) jsonObj.get("newStatus");

        
        int updatedRows = opDAO.updateShippingProgress(newStatus,ord_dno);

        if (updatedRows > 0) {
            // 성공
        } else {
            // 실패
        }//end else
    }//end for
} catch (SQLException se) {
    se.printStackTrace();
}//end catch
%>