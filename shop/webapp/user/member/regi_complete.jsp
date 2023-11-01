<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page info="회원가입 처리" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../cdn/cdn.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
div .joinComplete {
	/* Font & Text */
	font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
	font-size: 14px;
	font-style: normal;
	font-variant: normal;
	font-weight: 400;
	letter-spacing: normal;
	line-height: 21px;
	text-align: center;

	/* Box */
	height: 322.578px;
	width: 430px;	
	margin: 0px 735.5px;

	/* Positioning */
	position: static;
	top: auto;
	bottom: auto;
	right: auto;
	left: auto;
	float: none;
	display: block;
	clear: none;
	z-index: auto;

	/* List */
	list-style-image: none;
	list-style-type: disc;
	list-style-position: outside;

	/* Table */
	border-collapse: separate;
	caption-side: top;
	empty-cells: show;
	table-layout: auto;

	/* Miscellaneous */
	overflow: visible;
	cursor: auto;
	visibility: visible;
}
h3 {
	/* Font & Text */
	font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
	font-size: 17px;
	font-style: normal;
	font-variant: normal;
	font-weight: 500;
	letter-spacing: normal;
	line-height: 20.4px;
	text-align: center;
	text-transform: none;
	vertical-align: baseline;
	white-space: normal;

	/* Box */
	height: 20.3906px;
	width: 430px;
	margin-top: 100px;
	padding: 0px;


	/* Positioning */
	position: static;
	top: auto;
	bottom: auto;
	right: auto;
	left: auto;
	float: none;
	display: block;
	clear: none;
	z-index: auto;
}
h4 {
	/* Font & Text */
	font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
	font-size: 14px;
	font-style: normal;
	font-variant: normal;
	font-weight: 500;
	letter-spacing: normal;
	line-height: 16.8px;
	text-decoration: none solid rgb(153, 153, 153);
	text-align: center;
	text-indent: 0px;
	text-transform: none;
	vertical-align: baseline;
	white-space: normal;

	/* Color & Background */
	background-attachment: scroll;
	background-repeat: repeat;
	color: rgb(153, 153, 153);

	/* Box */
	height: 54.7969px;
	width: 430px;
	border: 0px none rgb(153, 153, 153);
	border-top: 0px none rgb(153, 153, 153);
	border-right: 0px none rgb(153, 153, 153);
	border-bottom: 0px none rgb(153, 153, 153);
	border-left: 0px none rgb(153, 153, 153);
	margin: 0px;
	padding: 8px 0px 30px;
	max-height: none;
	min-height: 0px;
	max-width: none;
	min-width: 0px;

	/* Positioning */
	position: static;
	top: auto;
	bottom: auto;
	right: auto;
	left: auto;
	float: none;
	display: block;
	clear: none;
	z-index: auto;

	/* List */
	list-style-image: none;
	list-style-type: disc;
	list-style-position: outside;

	/* Table */
	border-collapse: separate;
	border-spacing: 0px 0px;
	caption-side: top;
	empty-cells: show;
	table-layout: auto;

	/* Miscellaneous */
	overflow: visible;
	cursor: auto;
	visibility: visible;
}
p {
	/* Font & Text */
	font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
	font-size: 14px;
	font-style: normal;
	font-variant: normal;
	font-weight: 400;
	letter-spacing: normal;
	line-height: 21px;
	text-decoration: none solid rgb(33, 33, 33);
	text-align: center;
	text-indent: 0px;
	text-transform: none;
	vertical-align: baseline;
	white-space: normal;
	word-spacing: 0px;

	/* Color & Background */
	background-attachment: scroll;
	background-color: rgba(0, 0, 0, 0);
	background-image: none;
	background-position: 0% 0%;
	background-repeat: repeat;
	color: rgb(33, 33, 33);

	/* Box */
	height: 21px;
	width: 430px;
	border: 0px none rgb(33, 33, 33);
	border-top: 0px none rgb(33, 33, 33);
	border-right: 0px none rgb(33, 33, 33);
	border-bottom: 0px none rgb(33, 33, 33);
	border-left: 0px none rgb(33, 33, 33);


	/* Positioning */
	position: static;
	top: auto;
	bottom: auto;
	right: auto;
	left: auto;
	float: none;
	display: block;
	clear: none;
	z-index: auto;
}

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