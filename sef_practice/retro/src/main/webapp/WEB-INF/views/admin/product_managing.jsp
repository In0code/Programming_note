<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="관리자 - 상품리스트  / 인영 "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 태균이가 만든거 -->
<style type="text/css">
body{
 margin: 0px;
}
#wrap{
	
}
#right{
	width: calc(100vw - 240px); height: 100%;float: right;
	background: blue;
}
#left{
	min-width: 240px;height: 100%;float: left;
	padding: 0px;
	background: yellow;
}
#rightHeader{
	min-height: 55px;
	padding-top: 8px;padding-bottom: 5px;
	padding-right: 15px;
	background: #FFFFFF;
}
#rightBody{
	width: 100%; min-height: 500px;float: right;
	padding: 40px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

/* 인영 - 주문관리 style  시작*/
#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 
#background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
height: 150%; width: 80%;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
td {
	cursor: pointer;
}
</style>
<!-- 태균이가 만든거 끝-->
<script type="text/javascript">
$(function(){
	
	$("#btnLogouttt2").click(function(){
		alert("1234");
	})
	$("#btnLogouttt").click(function(){
		alert("123123");
	/* 	location.href="admin_logout_process.do"; */
	});
});//ready
</script>



</head>
<body>
 <%@ include file="sidebar.jsp" %> 
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<!-- 타이틀  -->
		<div class="text" id="mainTitle">		
			<strong>상품 리스트</strong>
		</div>
		
		<!-- 검색 -->
		<div class="searchDiv">
		<form id="frmSearch">
			<select class="searchList" id="field" name="field">
				<option value="1"${ param.field eq "1" ? " selected='selected'" : "" }>닉네임</option>
				<option value="2"${ param.field eq "2" ? " selected='selected'" : "" }>카테고리명</option>
			</select>
			<input type="text" class="textBox" id="keyword" name="keyword" placeholder="내용을 입력해주세요"
			value = "${ param.keyword ne 'null' ? param.keyword : ''}"/>
			<input type="button" id="btnSearch" value="검색"/>
		</form>
		</div>
		
		<!-- 상품 상세보기 페이지로 -->
		<form id="frmDetail" action="product_detail.jsp">
			<input type="hidden" id="gcode" name="gcode"/>
		</form>
		
		<div id="background_box">
			<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table class="table tableList">
				<thead>
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
					<th style="width:100px">No</th>
					<th style="width:180px">닉네임</th>
					<th style="width:200px">카테고리</th>
					<th style="width:300px">상품명</th>
					<th style="width:200px">상품가격</th>
					<th style="width:150px">등록일</th>
				</tr>
				</thead>
				
				<tbody>
					<!-- list가 존재하지 않을 경우 -->
					<c:if test="${ empty productList }">
					<tr>
						<td colspan="9" style="text-align: center;"> 
							상품이 존재하지 않습니다. </td>
					</tr>
					</c:if>
				
					<c:forEach var="product" items="${ productList }" varStatus="i">
					<tr onclick="productDetail(${ product.goodsCode })">
						<td>${ startNum + i.index }</td>
						<td><a href="item_managing_detail.jsp?gcode=${product.goodsCode }" 
   onclick="window.open(this.href, '', 'width=1650 , height=900, top=120, left=650'); return false;"><c:out value="${ product.goodsName }" /></a></td>
						<td><a href="item_managing_detail.jsp?gcode=${product.goodsCode }" 
   onclick="window.open(this.href, '', 'width=1650 , height=900, top=120, left=650'); return false;"><c:out value="${ product.categoryName }" /></a></td>
						<td><a href="item_managing_detail.jsp?gcode=${product.goodsCode }" 
   onclick="window.open(this.href, '', 'width=1650 , height=900, top=120, left=650'); return false;"><c:out value="${ product.inputDate }" /></a></td>
						<td><a href="item_managing_detail.jsp?gcode=${product.goodsCode }" 
   onclick="window.open(this.href, '', 'width=1650 , height=900, top=120, left=650'); return false;"><c:out value="${ product.price }" /></a></td>
						<td><a href="item_managing_detail.jsp?gcode=${product.goodsCode }" 
   onclick="window.open(this.href, '', 'width=1650 , height=900, top=120, left=650'); return false;"><c:out value="${ product.quantity }" /></a></td>
   						<td><a href="item_managing_detail.jsp?gcode=${product.goodsCode }" 
   onclick="window.open(this.href, '', 'width=1650 , height=900, top=120, left=650'); return false;"><c:out value="${ product.cancle }" /></a></td>
   
   
		
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		
		<c:if test="${ not empty productList }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
			</div>
		</div>
		</c:if>
		
	</div>
	<!-- <input style="position: absolute; top: 830px; left: 1700px; padding:10px"type="button" id="addProduct" name="addProduct" value="상품 새로 등록하기" class="btn btn-outline-secondary" onclick="location.href='item_add.jsp'"> -->
</div>	
</body>
</html>