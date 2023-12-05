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
#back:hover, #toMypage:hover{
	background-color: black;
	color: white;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#toMypage").click(function() {
			$("#frm").submit();
		});
		
		$("#back").click(function() {
			history.go(-2);
		});

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
<!-- 코딩 시작 -->
			
<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify" style="text-align: center;">
	<div>
		<p style="font-size: 26px;">${flagMsg }</p>
	</div>
	<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify_btn_box">
	<form id="frm" method="post" action="http://localhost/retro_prj/user_mypage_frm.do">
		<input id="toMypage" value="내 정보로 가기" data-v-0a6aebaa="" data-v-cf6a6ef4="" type="button" class="btn outlinegrey medium" data-v-8b96a82e="">
		<input id="back" value="뒤로가기" data-v-0a6aebaa="" data-v-cf6a6ef4="" type="button" class="btn outlinegrey medium" data-v-8b96a82e="">
	</form>
	</div>
</div>

<!-- 코딩 끝 -->
</div>
</div>
</main>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
<!-- 내 정보 css 파일 -->
<link href="https://kream.co.kr/_nuxt/css/c9eea23.css" rel="stylesheet" type="text/css">
<link href="https://kream.co.kr/_nuxt/css/2e6b79f.css" rel="stylesheet" type="text/css">
</body>
</html>