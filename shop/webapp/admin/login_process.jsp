<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); 
	if(request.getMethod().equals("GET")){
		response.sendRedirect("login.jsp");
	}
%>

<% 
String adminId = request.getParameter("adminId");
String adminPass = request.getParameter("adminPass");

/* 아이디 저장 체크시 쿠키에 아이디 값 저장 */
String adminIdValue = null;

if(request.getParameter("idSave") != null) {
	Cookie cookieId = new Cookie("adminId",adminId);
	response.addCookie(cookieId);
}else {
	/* null이면 쿠키 삭제 */
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("adminId")){
				Cookie cookieId = new Cookie("adminId","");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				break;
			}
		}
	}
}

if(adminId.equals("admin") && adminPass.equals("admin123")){
	session.setAttribute("adminId", adminId);
	response.sendRedirect("dashboard.jsp");
}else {
%>
	<script>alert("로그인에 실패하셨습니다.");</script>
<%
	response.sendRedirect("login.jsp");
}
%>