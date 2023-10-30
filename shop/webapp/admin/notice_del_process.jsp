<%@page import="admin.dao.NoticeDAO"%>
<%@page import="admin.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info="삭제하는 일을 하는 jsp"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String flag = request.getParameter("flag");
String temp = request.getParameter("ncode");

if(!"2".equals(flag) || "".equals(temp) || "null".equals(temp) || temp == null) {
	response.sendRedirect("notice.jsp?no=5");
}

int ncode = Integer.parseInt(temp);

String msg = "삭제 되었습니다.";
boolean result = NoticeDAO.getInstance().updateDelete(ncode);
if(!result) {
	msg = "서버 오류! 잠시 후 다시 시도해주세요.";
}
out.print(msg);
%>