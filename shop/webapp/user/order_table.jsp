<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../cdn/cdn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733" />
<link rel="stylesheet" type="text/css" href="http://localhost/prj_web_shopping/user/member/mypage.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet" />
<title>주문내역</title>
</head>
<style type="text/css">

.pagenationDiv{
	position: absolute;
	top: 1030px;
	width: 95%;
	text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a{
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  background-color: white;
}

.pagination span{
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  background-color: white;
}

.pagination a.active {
  background-color: black;
  color: white;
  border: 1px solid #333;
}

.pagination span.active {
  background-color: black;
  color: white;
  border: 1px solid #333;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
.ec-base-table.typeList table {
    border-top: 1px solid #d7d5d5;
    border-bottom: 1px solid #d7d5d5;
}

.ec-base-table.typeList.gBorder tbody td {
    border-color: #d7d5d5;
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
padding: 20px 0px 20px 10px;
}
#thr{
}
.loc{
    position: relative;
    margin: 0 auto;
    width: 95%;
    max-width: 1200px;
    min-height: 700px;
    padding: 0 15px;
}
span{

}
th, td{
text-align: center;
}

.nav-link{
	color: #858585;
}

.nav-link.active, .nav-link:hover  {
	color: black;
}

.active {
	color: black;
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
<div id="sec" class="loc" style="margin-bottom: 200px">
		<div class="PageTop" style="margin-top:100px">
			<ul>
				<li class="xans-element- xans-layout xans-layout-statelogon left ">
					<span class="xans-member-var-name"></span>
<%-- 					<c:choose>
					<c:when test="${ empty sesId }">
					<a href="login.jsp"></a>
					</c:when>
					<c:otherwise> --%>
					<%

					%>
					<big><b><c:out value="농담곰"/></b></big><big>님</big>
<%-- 					</c:otherwise>
					</c:choose> --%>
				</li>
				<li class="right"><a href="../member/mypage.jsp">마이페이지</a>
					<span> </span> <a href="../order_table.jsp" class="select">주문내역조회</a> <span>
				</span> <a href="../cart.jsp">장바구니</a></li>
			</ul>
		</div>
	<div id="thr">

 <ul class="nav nav-tabs" id="pills-tab" role="tablist"> 
      <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" aria-current="page" href="#" role="tab" aria-controls="pills-home" aria-selected="true">
        	주문내역조회</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" href="#" aria-controls="pills-profile" aria-selected="false">
        	교환/반품조회</a>
      </li>
    </ul>

<div id="txtDiv">
		<ul type="circle">
			<li>주문정보를 클릭하시면 해당 주문에 대한 상세내역을 확인하실수 있습니다.</li>
			<li>취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다. </li>
		</ul>
</div>

<div class="tab-content" id="pills-tabContent" style="padding-left: 10px;padding-bottom: 10px;">
<!-- 주문내역조회 클릭 시 나오는 부분 -->
  <div class="tab-pane show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0"><strong>주문 상품 정보</strong></div>
<!-- 교환/반품조회 클릭 시 나오는 부분 -->
  <div class="tab-pane " id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0"><strong>교환/반품 상품 정보</strong></div>
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
						<tr>
				<td>2023-10-10<br>[203949-394494]</td>
				<td>image</td>
				<td class="subject left txtBreak">product information</td>
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
						<tr>
				<td>2023-10-10<br>[203949-394494]</td>
				<td>image</td>
				<td class="subject left txtBreak">product information</td>
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
						<tr>
				<td>2023-10-10<br>[203949-394494]</td>
				<td>image</td>
				<td class="subject left txtBreak">product information</td>
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
						<tr>
				<td>2023-10-10<br>[203949-394494]</td>
				<td>image</td>
				<td class="subject left txtBreak">product information</td>
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
	<div class="pagenationDiv">
		<div class="pagination">
		<span>&laquo;</span>
		<span class='active'>1</span>
		<a href='boardManagement.jsp?currentPage=2&category=null&keyword=null&field=null'>2</a>
		<a href='boardManagement.jsp?currentPage=3&category=null&keyword=null&field=null'>3</a>
		<a href = 'boardManagement.jsp?currentPage=4&category=null&keyword=null&field=null'>&raquo;</a>
		</div>
	</div>
</div>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>
</body>
</html>