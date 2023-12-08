<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
#mainA{
	display: inline-block;
	width: 354px;
	height: 36px;
	background-color: #333;
	color: #FFF;
	border-radius: 10px;
	margin-top: 60px;
	line-height:36px;
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

<div style="margin-top: 170px;text-align: center;">
	<div style="font-size: 26px;color: #000000;">
		<p>
			<span style="padding-left: 100px;padding-right: 100px;border-bottom: 2px solid #000000;padding-bottom: 50px;">
				<strong>회원 가입 완료!</strong>
			</span>
		</p>
		<br>
	</div>
	<div style="color: #6F6965;margin-top: 65px;font-size: 14px;">
		<p><span>회원 가입이 완료되었습니다.</span></p>
		<p style="margin-top: 30px;font-weight: bold;color: #333"><span>${param.id }(${param.nickname })님 방갑습니다.</span></p>
<%-- 		<p style="margin-top: 30px;"><span>${param.id }(${param.nickname })님 방갑습니다.</span></p> --%>
		<a id="mainA" href="indexdw.do">메인으로</a>
	</div>
</div>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>