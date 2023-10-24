<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 프로젝트용 CDN -->
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.body{
width: 570px;
height: 460px;
padding-left: 5px;
padding-right: 5px;
margin: 0px auto;
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
border: 3px solid #EBEDF0;
}
#title{
font-size: 16px;
font-weight: bold;
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
text-align: center;
margin: 0px auto;
font-size: 28px;
padding: 30px;
margin-bottom: 30px;
}
#divPurchase{

text-align: center;
margin-top: 100px;
margin-left: 12em;
}
.subTitle{
padding-top: 11px;
font-size: 16px;
min-width: 90px;
}
.cardNum{
 float: left;
 width: 70px;
 margin: 10px;
}
.divInput{
padding-left: 50px;
height: 60px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#purchase").click(function() {
			check();
	    });
		
		$("#btn").click(function() {
			alert("주문관리로 이동");
	    });
	});
	
	function check() {
		let arrId = [ "c1", "c2", "c3", "c4", "c5" ];
		let arrNum = [ $("#c1").val(), $("#c2").val(), $("#c3").val(), $("#c4").val(), $("#c5").val() ];
		
		for(var i = 0; i < arrNum.length; i++) {
				document.getElementById(arrId[i]).classList.remove("is-invalid"); //재입력했을 때 중복되어서 나타지 않기 위해서 지운다.
			if(arrNum[i].length === 0) {
				document.getElementById(arrId[i]).classList.add("is-invalid");
				return;
			}
		}
			alert("DB 저장 작업");

			$("#hid").click();
	}
</script>
<body>
<!-- header -->
<div>
<%@ include file="layout/header.jsp" %>
</div>
<div style="margin-top: 70px;margin-bottom: 300px;">
	<div class="body shadow p-3 mb-5 bg-body rounded">
<!-- Form tag Start -->
	<form action="" id="frm" name="frm" method="post">
		<div id="title">
			카드 결제
		</div>
		<div class="divInput">
			<span class="cardNum subTitle">카드 번호</span>
			<input type="text" class="form-control cardNum" id="c1" required="required" maxlength="4" style="padding-left: 5px;">
			<input type="text" class="form-control cardNum" id="c2" required="required" maxlength="4" style="padding-left: 5px;">
			<input type="password" class="form-control cardNum" id="c3" required="required" maxlength="4" style="padding-left: 5px;">
			<input type="text" class="form-control cardNum" id="c4" required="required" maxlength="4" style="padding-left: 5px;">
		</div>
		<div class="divInput">
			<span class="cardNum subTitle">CVC 번호</span>
			<input type="text" class="form-control cardNum" id="c5" placeholder="카드 뒷면 숫자 3자리" required="required" maxlength="3" style="width: 130px;padding-left: 5px;border: 0px;border-radius:0px;border-bottom: 1px solid #E0E0E0;">
		</div>
		<div id="divPurchase" class="divInput">
			<input id="purchase" type="button" class="btn btn-outline-success cardNum" value="결제" style="width: 100px;">
			<!-- Button trigger modal(Modal button) -->
			<input id="hid" type="hidden" class="btn btn-outline-success cardNum" data-bs-toggle="modal" data-bs-target="#modal" value="결제" style="width: 100px;">
		</div>
	</form>
<!-- Form tag End -->
	</div>
</div>
<div>
<!-- Modal  -->
<div class="modal fade" id="modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">결제 완료</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>결제가 완료되었습니다.<br>상품을 구매해주셔서 감사합니다.</p>
      </div>
      <div class="modal-footer">
        <input id="btn" type="button" class="btn btn-primary" value="확인" style="width: 100px;">
      </div>
    </div>
  </div>
</div>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>
</div>
</body>
</html>