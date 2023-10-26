<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page info="회원가입 처리" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../cdn/cdn.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733"  />
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer_user.php?filename=tdRLToQhDADg_eDWczQx3sQTlP71pwq04aHO7cVx4s4VsOSRD1pKIWhiYHK9cqmAr42Lj_oJ1n0UcqGlCPVgd3CVM0N9l_wMVCskPXpkSJw8F3hTyaTJIjd-GMuPMAuTdtN8gyfAiFftDTxWoZs-Lpl0qfg7sVJkuowBX7rsUJtqbGI76MBxi2tl1ARtybHhKRmnivb_TKPfwfre2toS_pP1a1Me4pYEj1002W0ObihxCfI0qaAfUTpT61s-0VjgsqY3389IfTSSGtRegphJPpfqpPljAKLZZh85MB7Tsd-bkKuMhcIP9g0&type=css&k=23307907216381f6dbdfe21f8a3d7dff57a1d65f&t=1641537240&user=T" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet"/>
<style type="text/css">
</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div class="xans-element- xans-member xans-member-joincomplete ">
		<div class="joinComplete">
			<h3>회원가입 완료</h3>
			<h4>회원가입이 완료 되었습니다.</h4>
			<div class="xans-element- xans-member xans-member-benefitjoin memberSpecial">
				<p>
					<strong><span><%= request.getParameter("name") %></span> 님</strong>은 [Welcome (신규회원)] 회원이십니다.
				</p>
			</div>
			<div class="ec-base-box typeMember gMessage" style="margin-top: 40px;">
				<div class="information">
					<div class="description">
						<dl class="ec-base-desc gBlank5">
							<dt>아이디</dt>
							<dd>
								<span><%= request.getParameter("id") %></span>
							</dd>
							<dt>이름</dt>
							<dd>
								<span><%= request.getParameter("name") %></span>
							</dd>
							<dt>이메일</dt>
							<dd>
								<span><%= request.getParameter("email") %></span>
							</dd>
						</dl>
					</div>
				</div>
			</div>

			<div class="ec-base-button gColumn">
				<a href="login.jsp" class="btnSubmit sizeM" style="color:white;">완료</a>
			</div>
		</div>
	</div>

	<%@ include file="../layout/footer.jsp"%>
</body>
</html>