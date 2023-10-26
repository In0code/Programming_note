<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="admin.dao.BoardManageDAO"%>
<%@page import="admin.vo.BoardManageVO"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../cdn/admin_cdn.jsp"/>


<script type="text/javascript">
$(function() {

});
</script>
</head>
<body>

<c:catch var="se">
<%
int rcode = Integer.parseInt(request.getParameter("rcode"));

BoardManageDAO bmDAO = BoardManageDAO.getInstance();

%>



<%

%>
</c:catch>
<c:if test="${ not empty se }">
	<script> 
		alert("잠시 후 다시 시도해주세요.");
		window.location = "boardManagement.jsp";
	</script>
</c:if>

</body>
</html>