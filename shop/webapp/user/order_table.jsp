<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../cdn/cdn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<style type="text/css">
#fst{
margin-top: 170px;
min-height: 30px;
background: red;
}
#sec{
background: green;
}
#txtDiv{
background: yellow;
}
#thr{
background: blue;
}
.loc{
margin: 0px auto;
width: 50%;
}
span{

}
</style>
<script type="text/javascript">
	$(function() {
		
	});
</script>
<body>
<!-- header -->
<%@ include file="layout/header.jsp"%>
<div id="fst" class="loc">
<span style="font-weight: bold;">아무개님</span>
<span style="margin-left: calc(1005px - 350px);"><a href="member/mypage.jsp">마이페이지</a> | <a href=""><strong>주문내역조회</strong></a> | <a href="cart.jsp">장바구니</a></span>
</div>
<div id="sec" class="loc">
탭 형식 구분
	<div id="txtDiv">
		<ul>
			<li>상품정보를 클릭하면 상세한 내용을 확인 가능합니다.</li>
			<li>취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다. </li>
		</ul>
	</div>
	<div id="thr">
	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Home</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Profile</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Contact</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false" disabled>Disabled</button>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">...</div>
</div>
	주문한 내역 나옴
	</div>
</div>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>
</body>
</html>