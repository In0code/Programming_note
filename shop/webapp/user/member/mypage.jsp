<%@page import="member.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="마이페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../cdn/cdn.jsp" />
<c:if test="${ empty sesId }">
<c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733" />
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer_user.php?filename=tZRbTkQhDIbfB19dRxPjQkzGDRROPTQHKOGizu7tXHQBAm9cP8oP-cBLJCBneqVSAT8aFRvkC3K3gZ3xLQaoG5mNKu8J6sHpFVyt8IY7vUt-0vYz_JsSZeuBIF6qlwwW02FFjkFoltyziRStbvQ8UmPAi_SmhVV2N7aTGCXNJN4HZhLJnbRDp84rqE0ktLmh_qI9hSXcXPSbuSUZZ9w5YaMlSaNdgbW9tblf-I8s34tyCEsC1lVu0DUbNeQwBfIySEGrtzQ3-a0ISyeozNH944zYVSRX8Z9V0pnTPpXuJH0qgCXl0Uf2hNvw3R8SMpWwOH-F_QA&type=css&k=6d772c65d1f33705cdd1d1e541979b835f286a4d&t=1641537240&user=T" />

<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div id="contents">
		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.5.1.min.js"></script>

		<div class="PageTop">
			<ul>
				<li class="xans-element- xans-layout xans-layout-statelogon left ">
					<span class="xans-member-var-name"></span>
					<c:choose>
					<c:when test="${ empty sesId }">
					<a href="login.jsp"></a>
					</c:when>
					<c:otherwise>
					<%
					UserVO uVO=(UserVO)session.getAttribute("userData");
					//DataDecrypt dd=new DataDecrypt("a12345678901234567");
					//String name=dd.decryption(uVO.getName());
					String name=uVO.getName();
					pageContext.setAttribute("name", name);
					%>
					<c:out value="${ name }"/>님
					</c:otherwise>
					</c:choose>
				</li>
				<li class="right"><a href="/myshop/index.html" class="select">마이페이지</a>
					<span> </span> <a href="/myshop/order/list.html">주문내역조회</a> <span>
				</span> <a href="/order/basket.html">장바구니</a></li>
			</ul>
		</div>

		<div class="xans-element- xans-myshop xans-myshop-bankbook membership_info ">
			<ul>
				<li>
					<p class="title">회원등급</p>
					 <p class="xans-element- xans-myshop xans-myshop-asyncbenefit inner ">
						<span class="displaynone"><img src="" alt=""
							class="myshop_benefit_group_icon_tag"></span> <span
							class="xans-member-var-group_name">Welcome (신규회원)</span><span
							class="myshop_benefit_ship_free_message"></span>
					</p> 
				</li>
			</ul>
		</div>


		<div class="xans-element- xans-myshop xans-myshop-orderstate ">
			<h3>나의 주문처리 현황</h3>
			<div class="state">
				<ul class="order">

					<li><a href="/myshop/order/list.html?order_status=shipped_standby">
							<p class="title">배송준비중</p> <strong><span
								id="xans_myshop_orderstate_shppied_standby_count">0</span></strong>
					</a></li>
					<li><a href="/myshop/order/list.html?order_status=shipped_begin">
							<p class="title">배송중</p> <strong><span
								id="xans_myshop_orderstate_shppied_begin_count">0</span></strong>
					</a></li>
					<li><a href="/myshop/order/list.html?order_status=shipped_complate">
							<p class="title">배송완료</p> <strong><span
								id="xans_myshop_orderstate_shppied_complate_count">0</span></strong>
					</a></li>
					<li class="right"><a
						href="/myshop/order/list.html?order_status=order_cancel">
							<p class="title">취소</p> <span
							id="xans_myshop_orderstate_order_cancel_count">0</span>
					</a> <a href="/myshop/order/list.html?order_status=order_exchange">
							<p class="title">교환</p> <span
							id="xans_myshop_orderstate_order_exchange_count">0</span>
					</a> <a href="/myshop/order/list.html?order_status=order_return">
							<p class="title">반품</p> <span
							id="xans_myshop_orderstate_order_return_count">0</span>
					</a></li>
				</ul>
			</div>
		</div>

		<div id="myshopMain"
			class="xans-element- xans-myshop xans-myshop-main ">
			<ul>
				<li><a href="/myshop/order/list.html"> <span class="icon">
					</span>
						<h1>Order</h1>
						<h2>주문내역 조회</h2>
						<h3>
							고객님께서 주문하신 상품의<br>주문내역을 확인하실 수 있습니다.
						</h3>
				</a></li>
				<li><a href="update_info.jsp"> <span class="icon">
					</span>
						<h1>Profile</h1>
						<h2>회원 정보</h2>
						<h3>
							고객님의 개인정보를<br>관리하는 공간입니다.
						</h3>
				</a></li>
				<li><a href="/myshop/wish_list.html"> <span class="icon">
					</span>
						<h1>Wishlist</h1>
						<h2>관심 상품</h2>
						<h3>
							관심상품으로 등록하신<br>상품의 목록을 보여드립니다.
						</h3>
				</a></li>
			</ul>
			<ul>
    <li>
        <a href="/myshop/board_list.html">
            <span class="icon">　</span>    
            <h1>Board</h1>
            <h2>게시물 관리</h2>
            <h3>고객님께서 작성하신 게시물을<br>관리하는 공간입니다.</h3>
        </a>
    </li>
    <li>
        <a href="/order/basket.html">
            <span class="icon">　</span>    
            <h1>Cart</h1>
            <h2>장바구니</h2>
            <h3>장바구니에 담으신<br>상품의 목록을 보여드립니다.</h3>
        </a>
    </li>
</ul>
		</div>

	</div>

	<!-- footer -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>