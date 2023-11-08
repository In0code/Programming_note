<%@page import="admin.dao.NoticeDAO"%>
<%@page import="admin.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="등록/수정된 공지사항을 DB에 저장하는 일을 한다. 결과를 alert로 알려준다."%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String flag = request.getParameter("flag");

String title = request.getParameter("hidTxt");
String context = request.getParameter("context");
String image = request.getParameter("hidImg");

NoticeVO nVO = new NoticeVO();

nVO.setNoticeTitle(title);
nVO.setNoticeText(context);
nVO.setImage(image);

String msg = "성공적으로 저장되었습니다.";

if("1".equals(flag)) {
	NoticeDAO.getInstance().insertNotice(nVO);
} 

if("2".equals(flag)) {
	int ncode = Integer.parseInt(request.getParameter("ncode"));
	nVO.setNcode(ncode);
	int result = NoticeDAO.getInstance().updateNotice(nVO);
	
	if(result != 1) {
		msg = "저장 중 오류 발생!";
	}
}

pageContext.setAttribute("msg", msg);
%>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var msg = "${msg}";
		alert(msg);
		window.location.replace("http://localhost/prj_web_shopping/admin/notice.jsp?no=5");
	});
</script>