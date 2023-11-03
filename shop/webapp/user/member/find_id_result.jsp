<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../cdn/cdn.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733"  />
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer_user.php?filename=tdRJbkMhDADQfei257BU9SY9gQHnYxUwwtDh9iHtVw4QYMmgZzDGECQRkDNdqSrgtVG1Ub6hdBvZmdBSBPVkPCkfGfST8zs4VUjieyRIlCxVuHL2hr2ppD22l7HhFZ6iI_5Kb2BR2f3FcZKS5JXi_8RKkdxlDOjSeYfaRGLjsoMOFLe4pY7qcFtyXPDgjI22ZBrtDtb21taW8EOWn015iFsSPHa5CfdOeWrIcQnyNqmgHbc0RUrf8onGAtXJI55d-oyRRm9mDVI-ApfC-ViqO8lfA2DJZfaRA6GfvvvZhIwSVhfu2A0&type=css&k=78f0afff0ea37d2d20206f5724686713838e28ef&t=1641537240&user=T"  />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet" />
<style type="text/css">
#Header {
    position: relative;
    width: 100%;
    font-size: 16px;
    padding: 0px 33px 100px;
    background: #fff;
    border-bottom: 0px solid #fff;
 }
 #Footer {
    position: relative;
    padding: 0px 0px 120px 0;
    margin-top: 100px;
    border-top:0px solid #fff;
    background: #fff;
 }
</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div
		class="xans-element- xans-member xans-member-findidresult ec-base-box typeThin">
		<div class="titleArea">
			<h2>아이디 찾기</h2>
			<ul>
				<li>다음정보로 가입된 아이디가 총 <span class="txtEm">1</span>개 있습니다.
				</li>
			</ul>
		</div>
		<div class="ec-base-box typeMember gMessage">
			<div class="information">
				<p class="thumbnail">
					<img src="//img.echosting.cafe24.com/skin/base/member/img_member_default.gif" alt="사용자">
				</p> 
				<div class="description" style="padding-left: 30px;">
					<ul class="ec-base-desc gSmall">
						<li><strong class="term">아이디</strong><strong class="desc">
								: <span><%= request.getParameter("id") %></span>
						</strong></li>
						<li><strong class="term">이메일</strong><span class="desc">
								: <span><%= request.getParameter("email") %></span>
						</span></li>
						<li><label> 
						<span class="id"> </span> 
						<span class="gaip">( 개인회원, <%= request.getParameter("sign_date") %> 가입 )</span></label><br>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="ec-base-button gBlank20">
			<a href="login.jsp" class="btnSubmitFix sizeM" style="color:white;">로그인</a>
			<a href="find_pw.jsp" class="btnEmFix sizeM ">비밀번호 찾기</a>
		</div>
	</div>

	<%@ include file="../layout/footer.jsp"%>
</body>
</html>