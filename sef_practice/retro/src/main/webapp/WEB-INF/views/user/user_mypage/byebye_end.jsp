<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css">
<style type="text/css">
#bye:hover {
	color: #FFF;
	background-color: #000;
}
#bye{
	border: 1px solid #BCBFC5;
	padding: 5px;
	border-radius: 10px;
	padding-left: 50px;
	padding-right: 50px;
}
</style>
<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
<!-- header -->
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp" />
	
<main class="relative flex-grow border-b-2" style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
	<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<!-- mypage sidebar -->
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
		<div class="w-full flex-grow">
		<!-- 마이페이지 header -->
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_info.jsp" />
		
<!-- 탈퇴 최종 화면 -->
<div style="border: 1px solid #333;text-align: center;margin-top: 15px;margin-bottom: 25px;padding-top: 50px;padding-bottom: 50px;">
	<strong><p style="font-size: 24px;">탈퇴 처리가 완료 되었습니다.</p></strong>
	<p style="padding-top: 25px;padding-bottom: 35px;">그동안 RE:TRO를 사용해주셔서 감사합니다.</p>
	<a href="indexdw.do" id="bye">확인</a>
</div>
<!-- 탈퇴 최종 화면 -->
</div>
</div>
</main>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>