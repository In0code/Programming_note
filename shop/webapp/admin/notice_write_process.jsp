<%@page import="admin.dao.NoticeDAO"%>
<%@page import="admin.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="등록/수정된 공지사항을 DB에 저장하는 일을 한다. 결과를 alert로 알려준다."%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String flag = request.getParameter("flag");

String title = request.getParameter("title");
String context = request.getParameter("context");

NoticeVO nVO = new NoticeVO();

if("2".equals(flag)) {
	int ncode = Integer.parseInt(request.getParameter("ncode"));
	nVO.setNcode(ncode);
}
nVO.setNoticeTitle(title);
nVO.setNoticeText(context);

String msg = "성공적으로 저장되었습니다.";

if("1".equals(flag)) {
	NoticeDAO.getInstance().insertNotice(nVO);
} 

if("2".equals(flag)) {
	int result = NoticeDAO.getInstance().updateNotice(nVO);
	
	if(result != 1) {
		msg = "저장 중 오류 발생!";
	}
}

pageContext.setAttribute("msg", msg);
%>
<script type="text/javascript">
	$(function() {
		alert("${msg}");
		location.href = "notice.jsp?no=5";
	});
</script>