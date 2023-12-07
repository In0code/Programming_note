<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="관리자 - 상품리스트  / 인영 "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 태균이가 만든거 -->
<style type="text/css">
body {
	margin: 0px;
}


#right {
	width: calc(100vw - 240px);
	height: 100%;
	float: right;
	background: blue;
}

#left {
	min-width: 240px;
	height: 100%;
	float: left;
	padding: 0px;
	background: yellow;
}

#rightHeader {
	min-height: 55px;
	padding-top: 8px;
	padding-bottom: 5px;
	padding-right: 15px;
	background: #FFFFFF;
}

#rightBody {
	width: 100%;
	min-height: 500px;
	float: right;
	padding: 40px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

/* 인영 - 주문관리 style  시작*/
#mainTitle {
	font-size: 25px;
	color: #333;
	position: absolute;
	left: 60px;
}

#background_box {
	overflow: auto;
	background-color: #FFFFFF;
	color: #333333;
	height: 150%;
	width: 80%;
	position: absolute;
	top: 100px;
	left: 60px;
	outline: 1px;
	box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
	border-radius: 9px;
}

td {
	cursor: pointer;
}
a{
color : #333;
text-decoration: none;
}
</style>
<!-- 태균이가 만든거 끝-->
<script type="text/javascript">
	$(function() {

	});//ready
</script>



</head>
<body>
	<%@ include file="sidebar.jsp"%>
	<div id="right">
		<div id="rightHeader" align="right">
			<span style="font-weight: bold; margin-right: 20px">관리자님</span> <input
				id="btnLogout" type="button" class="btn btn-outline-dark"
				value="로그아웃" style="margin-right: 20px">
		</div>
		<div id="rightBody" style="height: 895px">
			<div class="text" id="mainTitle"
				style="margin-left: 40px; font-family: Pretendard Medium">
				<strong><a href="product_managing.do" style="color : #333;text-decoration: none;">&lt; 상품 리스트</a></strong>
			</div>
			<form action="" id="frm" name="frm" method="post" style="left: 30px">
				<input type="hidden" id="gcode" name="gcode" value="">
				<div id="background_box"
					style="width: 1200px; height: 700px; font-family: pretendard; position: relative; top: 55px">
					<!-- 각자 원하는데로 사용 -->
					<label style="position: absolute; top: 10px; left: 30px; font-size: 20px; color:#929492">상품 상세 정보</label>
					<div
						style="position: absolute; top: 60px; left: 50px; width: 350px; height: 350px">
						<img id="previewMainImg" src="../upload/goods/img_null.png"
							style="width: 350px; height: 350px;" name="mainImg__div">
					</div>
					<div
						style="position: absolute; top: 460px; left: 60px; font-size: 20px">
						<strong><label style="color:#929492">상품명</label></strong><br/> 
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px;"
							value="${ productOne.pname }" readonly="readonly">
					</div>

					<div style="position: absolute; top: 550px; left: 60px; font-size: 20px">
				    <strong><label style="color:#929492">상품등록상태</label></strong><br/> 
				    <c:choose>
				        <c:when test="${productOne.pcancel eq 'D'}">
				            <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px" value="삭제 ( 사용자 )" readonly="readonly">
				        </c:when>
				        <c:when test="${productOne.pcancel eq 'C'}">
				            <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px" value="삭제 ( 관리자 )" readonly="readonly">
				        </c:when>
				        <c:when test="${productOne.pcancel eq 'H'}">
				            <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px" value="판매 보류 ( 사용자 )" readonly="readonly">
				        </c:when>
				        <c:otherwise>
				            <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px" value="등록" readonly="readonly">
				        </c:otherwise>
				    </c:choose>
</div>


					<div
						style="position: absolute; top: 80px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color:#929492">아이디</label></strong><br/> 
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
							value="${ productOne.id }" readonly="readonly">
					</div>
					<div
						style="position: absolute; top: 170px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color:#929492">카테고리</label></strong><br/> 
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
							value="${ productOne.category }" readonly="readonly">
					</div>
					<div
						style="position: absolute; top: 260px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color:#929492">삼품가격</label></strong><br/> 
						 <fmt:formatNumber pattern="#,###,###" var="formattedPrice" value="${productOne.price}"/>
  					  <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
        			   value="${formattedPrice}" readonly="readonly">
					</div>
					<div
						style="position: absolute; top: 350px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color:#929492">상품상태</label></strong><br/> 
						<c:choose>
				        <c:when test="${productOne.status eq 'J'}">
				           <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="중고" readonly="readonly">
				        </c:when>
				        <c:when test="${productOne.status eq 'S'}">
				            <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="새상품" readonly="readonly">
				        </c:when>
				        <c:otherwise>
				             <input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="(미등록)" readonly="readonly">
				        </c:otherwise>
				    </c:choose>
					</div>
					<div
						style="position: absolute; top: 450px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color:#929492">등록일</label></strong><br/> 
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
							value="${ productOne.input_date }" readonly="readonly">
					</div>





					<input type="button" class="btn" id="btnChange" value="상품 삭제"
						style="position: absolute; top: 620px; left: 1030px; font-size: 20px;" />
				</div>
			</form>
		</div>
		<!-- <input style="position: absolute; top: 830px; left: 1700px; padding:10px"type="button" id="addProduct" name="addProduct" value="상품 새로 등록하기" class="btn btn-outline-secondary" onclick="location.href='item_add.jsp'"> -->
	</div>
</body>
</html>