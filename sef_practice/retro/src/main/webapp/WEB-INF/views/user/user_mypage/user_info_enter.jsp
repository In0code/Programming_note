<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>
<style type="text/css">

</style>
<%
String str = request.getParameter("flag");
int flag = -1;
if(str != null && !"".equals(str)) {
	flag = Integer.parseInt(str);
}
%>
<script type="text/javascript">
	$(function() {
		if(<%=flag%> == 0) {
			$("#pwErr").show();
		}
		
		$("#pw").keydown(function(keyNum){
			if(keyNum.keyCode == 13){ 
				$("#frm").submit()	
			}
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
		<c:import url="/common/cdn/mypage_info.jsp" />
		
<!-- 코딩 시작 -->
<div class="px-0 max-lg:mt-10">
	
	<p class="py-12 text-center" style="font-size: 28px;color: #000000;font-weight: bold;padding-bottom: 20px;">비밀번호 입력</p>
	<div style="text-align: center;margin-bottom: 300px;">
		<form id="frm" name="frm" method="post" action="mypage_info.do">
			<input type="password" id="pw" name="pw" style="padding-left: 10px;padding-top: 7px;padding-bottom: 5px;border: 1px solid #D1D1D1;border-radius: 5px;" placeholder="비밀번호 입력">
			<p id="pwErr" style="display: none;color: red;font-size: 13px;">비밀번호를 다시 입력해주세요</p>
			<input type="hidden" name="id" value="${sessionScope.id }">
		</form>
	</div>
</div>
<!-- 코딩 끝 -->
</div>
</div>
</main>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>