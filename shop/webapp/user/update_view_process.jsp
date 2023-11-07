<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int rcode = Integer.parseInt(request.getParameter("rcode"));

UserReviewDAO urDAO = UserReviewDAO.getInstance();

JSONObject jsonObj = new JSONObject();

try{
	jsonObj.put("result",urDAO.updateView(rcode)==0?false:true);
}catch(SQLException se){
	se.printStackTrace();
}

out.print(jsonObj.toJSONString());

%>