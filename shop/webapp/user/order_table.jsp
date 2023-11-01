<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../cdn/cdn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<style type="text/css">
.ec-base-table.typeList table {
    border-top: 1px solid #d7d5d5;
}

.ec-base-table table {
    position: relative;
    margin: 10px 0 0;
    border: 1px solid #d7d5d5;
    border-top: 0;
}
tr, td{
  border-color: inherit;
  border-style: solid;
  border-width: 0;
}
/* 내가 만든 거 */
#fst{
margin-top: 170px;
min-height: 30px;
}
#sec{
}
#txtDiv{
padding: 10px;
padding-top: 50px;
}
#thr{
}
.loc{
margin: 0px auto;
width: 60%;
}
span{

}
th, td{
text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#pills-home").click(function() {
			$.ajax({
				url:"order_list_process.jsp",
				type:"get",
				data:"flag=o",
				dataType:"json",
				error: function(xhr) {
					alert(xhr.status);
				},
				success: function(jsonObj) {
					alert(jsonObj);
				}
			});
			
		});
		
		$("#pills-profile").click(function() {
			$.ajax({
				url:"order_list_process.jsp",
				type:"get",
				data:"flag=r",
				dataType:"json",
				error: function(xhr) {
					alert(xhr.status);
				},
				success: function(jsonObj) {
					alert(jsonObj);
				}
			});
		});
		
	});//load end
	
	function display(jsonObj) {
		
	}
	
	function detail(ordno) {
		window.location = "order_detail.jsp?ordno="+ordno;
	}
</script>
<body>
<!-- header -->
<%@ include file="layout/header.jsp"%>
<div id="fst" class="loc">
<span style="font-weight: bold;padding-left: 10px;">아무개님</span>
<span style="margin-left: calc(100% - 300px);"><a href="member/mypage.jsp">마이페이지</a> | <a href=""><strong>주문내역조회</strong></a> | <a href="cart.jsp">장바구니</a></span>
</div>
<div id="sec" class="loc">
	<div id="txtDiv">
		<ul type="circle">
			<li>상품정보를 클릭하면 상세한 내용을 확인 가능합니다.</li>
			<li>취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다. </li>
		</ul>
	</div>
	<div id="thr">
	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">주문내역조회</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">교환/반품조회</button>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent" style="padding-left: 10px;padding-bottom: 10px;">
<!-- 주문내역조회 클릭 시 나오는 부분 -->
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0"><strong>주문 상품 정보</strong></div>
<!-- 교환/반품조회 클릭 시 나오는 부분 -->
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0"><strong>교환/반품 상품 정보</strong></div>
</div>
<div class="ec-base-table typeList gBorder pad">
	<table  border="1" summary="" style="text-align:center; font-size:13px">
		<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
			<col style="width:120px;"/>
			<col style="width:70px;"/>
			<col style="width:300px;"/>
			<col style="width:100px;"/>
			<col style="width:100px;"/>
			<col style="width:100px;"/>
			<col style="width:100px;"/>
		</colgroup>
		<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
			<tr>
			<th scope="col">&ensp;주문 일자<br>[주문 번호]</th>
			<th scope="col">이미지</th>
			<th scope="col">상품 정보</th>
			<th scope="col">수량</th>
			<th scope="col">상품구매금액</th>
			<th scope="col">주문처리상태</th>
			<th scope="col">교환/반품</th>
			</tr>
		</thead>
		<tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
			<tr>
				<td>2023-10-10<br>[203949-394494]</td>
				<td>image</td>
				<td class="subject left txtBreak"><a href="order_detail.jsp?ordno=">product information</a></td>
				<td>2</td>
				<td>135,000원</td>
				<td>배송완료</td>
				<td>-</td>
			</tr>
			<tr>
				<td>2023-10-10<br>[203949-394494]</td>
				<td>image</td>
				<td class="subject left txtBreak">product information</td>
				<td>2</td>
				<td>135,000원</td>
				<td>배송완료</td>
				<td>-</td>
			</tr>
		</tbody>
	</table>
</div>
	</div>
	<div class="loc" style="text-align: center;font-size: 16px;">
		<a href="#prev" style="padding-left: 10px;">PREV</a>
		<c:forEach var="num" begin="1" end="5" step="1">
		<a href="#page=${num}" style="padding-left: 10px;"><c:out value="${num}"/></a>
		</c:forEach>
		<a href="#next" style="padding-left: 10px;">NEXT</a>
	</div>
</div>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>
</body>
</html>