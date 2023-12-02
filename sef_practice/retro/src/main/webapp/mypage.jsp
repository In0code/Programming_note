<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQeury CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		$("#user_mypage_frm").click(function() {
			$("#frmMypage").submit();
		});
	});
</script>
</head>
<body>
<div style="text-align: center;font-size: 26px;">
	<p><a href="mypage_enter.do">내 정보</a></p>
	<form id="frmMypage" action="user_mypage_frm.do" method="post">
		<p id="user_mypage_frm" style="cursor: pointer;">마이페이지 메인 화면</p>
	</form>
</div>
</body>
</html>