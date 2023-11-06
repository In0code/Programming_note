<%@page import="user.vo.AddrVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="user.dao.BuyDAO"%>
<%@page import="user.vo.BuyPaymentVO"%>
<%@page import="user.vo.BuyInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 프로젝트용 CDN -->
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");

String flag = request.getParameter("flag");
String sesFlag = (String)session.getAttribute("paymentFlag");

boolean reject = false;
try{
	reject = !flag.equals(sesFlag) ? true:false;
	
} catch(NullPointerException npe) {
	reject = true;
}

if(reject) {
	response.sendRedirect("member/login.jsp");
	return;
}
%>
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
margin-left: 13.2em;
}
.subTitle{
padding-top: 5px;
font-size: 16px;
min-width: 90px;
margin-right: 0px;
}
.cardNum{
 float: left;
 width: 70px;
 margin: 10px;
 min-height: 34px
}
.divInput{
padding-left: 33px;
height: 60px;
}
</style>
<jsp:useBean id="JspBiVO" class="user.vo.BuyInfoVO" scope="page"/>
<jsp:setProperty property="*" name="JspBiVO"/>
<%
BuyInfoVO biVO = (BuyInfoVO)pageContext.getAttribute("JspBiVO");
biVO.setId("test");
biVO.setGcode(request.getParameterValues("gcode"));

BuyDAO bDAO = BuyDAO.getInstance();

if("true".equals(request.getParameter("chkHid"))) {
	AddrVO aVO = new AddrVO(biVO.getId(), biVO.getZipcode(), biVO.getSido(), biVO.getAddr());
	bDAO.updateAddr(aVO);
}

System.out.println(biVO);

try{
	String ordno = bDAO.insertDelivery(biVO);
	pageContext.setAttribute("ordno", ordno);
	
	
} catch(SQLException se) {
	se.printStackTrace();
}


	/* String name = request.getParameter("name");
String zipcode = request.getParameter("zipcode");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");
String cell = request.getParameter("phone");
String email = request.getParameter("email");
String amount = request.getParameter("amount");
String productCode = request.getParameter("productCode");
String totalPrice = request.getParameter("price");
String msgHid = request.getParameter("msg");
String chkHid = request.getParameter("chkHid");
String flag = request.getParameter("flag"); */


/* System.out.println("name : "+name);
System.out.println("zipcode : "+zipcode);
System.out.println("addr1 : "+addr1);
System.out.println("addr2 : "+addr2);
System.out.println("cell : "+cell);
System.out.println("email : "+email);
System.out.println("amount : "+amount);
System.out.println("productCode : "+productCode);
System.out.println("totalPrice : "+totalPrice);
System.out.println("msgHid : "+msgHid);
System.out.println("chkHid : "+chkHid);
System.out.println("flag : "+flag); */
%>
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
		var validNum = /[0-9]{3}/;
		
		for(var i = 0; i < arrNum.length-1; i++) {
				document.getElementById(arrId[i]).classList.remove("is-invalid"); //재입력했을 때 중복되어서 나타지 않기 위해서 지운다.
			if(arrNum[i].length === 0 || !validNum.test(arrNum[i])) {
				document.getElementById(arrId[i]).classList.add("is-invalid");
				return;
			}
		}
		
		let cardNum = $("#c1").val()+"-"+$("#c2").val()+"-"+$("#c3").val()+"-"+$("#c4").val();
		
		var query = "cardNum="+cardNum+"&ordno=${ordno}&gcode=${param.gcode}";
		alert(query);
		$.ajax({
			url:"insert_card_process.jsp",
			type:"get",
			data:query,
			dataType:"json",
			error: function(xhr) {
				console.log(xhr.status);
				$("#hidFail").trigger('click'); 
			},
			success: function(json) {
				$("#hidSuccess")).trigger('click'); 
			}
		});
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
			<input type="text" class="form-control cardNum" id="c5" placeholder="카드 뒷면 숫자 3자리" required="required" maxlength="3" style="width: 140px;padding-left: 5px;border: 0px;border-radius:0px;border-bottom: 1px solid #E0E0E0;">
		</div>
		<div id="divPurchase" class="divInput">
			<input id="purchase" type="button" class="btn btn-outline-success cardNum" value="결제" style="width: 100px;">
			<!-- Button trigger modal(Modal button) -->
			<input id="hidSuccess" type="hidden" class="btn btn-outline-success cardNum" data-bs-toggle="modalSuccess" data-bs-target="modalSuccess">
			<input id="hidFail" type="hidden" class="btn btn-outline-success cardNum" data-bs-toggle="modalFail" data-bs-target="modalFail">
		</div>
	</form>
<!-- Form tag End -->
	</div>
</div>
<div>
<!-- Modal  -->
<div class="modal fade" id="modalSuccess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">결제 완료</h5>
        <input id="btnOrdered" type="button" class="btn-close" data-bs-dismiss="modal" value="주문내역">
      </div>
      <div class="modal-body">
        <p>결제가 완료되었습니다.<br>상품을 구매해주셔서 감사합니다.</p>
      </div>
      <div class="modal-footer">
        <input id="btnMain" type="button" class="btn btn-primary" value="메인 화면" style="width: 100px;">
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalFail" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">결제 오류</h5>
      </div>
      <div class="modal-body">
        <p>결제가 실패!<br>다시 시도 해주세요!</p>
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