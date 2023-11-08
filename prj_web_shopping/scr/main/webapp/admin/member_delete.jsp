<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="admin.dao.ClientInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

String id = request.getParameter("id");

ClientInfoDAO ciDAO=ClientInfoDAO.getInstance();
JSONObject jsonObj=new JSONObject();
try{
	jsonObj.put("result", ciDAO.deleteUser(id) == 0 ? false:true);
}catch(SQLException se){
	se.printStackTrace();
}

out.print(jsonObj.toJSONString());

%>
