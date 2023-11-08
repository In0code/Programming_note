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
<link rel="stylesheet" type="text/css" href="http://localhost/prj_web_shopping/user/member/mypage.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet" />
<style type="text/css">
#contents{
	font-family : 'Pretendard Medium';
}
</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div id="contents" style="margin-top: 100px">
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
					<big><b><c:out value="${ name }"/></b></big><big>님</big>
					</c:otherwise>
					</c:choose>
				</li>
				<li class="right"><a href="../member/mypage.jsp" class="select">마이페이지</a>
					<span> </span> <a href="../order_table.jsp">주문내역조회</a> <span>
				</span> <a href="../cart.jsp">장바구니</a></li>
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

					<li><a href="../order_table.jsp"">
							<p class="title">배송준비중</p> <strong><span
								id="xans_myshop_orderstate_shppied_standby_count">4</span></strong>
					</a></li>
					<li><a href="../order_table.jsp"">
							<p class="title">배송중</p> <strong><span
								id="xans_myshop_orderstate_shppied_begin_count">1</span></strong>
					</a></li>
					<li><a href="../order_table.jsp"">
							<p class="title">배송완료</p> <strong><span
								id="xans_myshop_orderstate_shppied_complate_count">5</span></strong>
					</a></li>
					<li class="right"><a
						href="../order_table.jsp"">
							<p class="title">취소</p> <span
							id="xans_myshop_orderstate_order_cancel_count">0</span>
					</a> <a href="../order_table.jsp"">
							<p class="title">교환</p> <span
							id="xans_myshop_orderstate_order_exchange_count">0</span>
					</a> <a href="../order_table.jsp"">
							<p class="title">반품</p> <span
							id="xans_myshop_orderstate_order_return_count">0</span>
					</a></li>
				</ul>
			</div>
		</div>

		<div id="myshopMain"
			class="xans-element- xans-myshop xans-myshop-main ">
			<ul>
				<li><a href="../order_table.jsp"> <span class="icon">
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
				<li><a href="../wishList.jsp"> <span class="icon">
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
        <a href="../posting.jsp">
            <span class="icon">　</span>    
            <h1>Board</h1>
            <h2>게시물 관리</h2>
            <h3>고객님께서 작성하신 게시물을<br>관리하는 공간입니다.</h3>
        </a>
    </li>
    <li>
        <a href="../cart.jsp">
            <span class="icon">　</span>    
            <h1>Cart</h1>
            <h2>장바구니</h2>
            <h3>장바구니에 담으신<br>상품의 목록을 보여드립니다.</h3>
        </a>
    </li>
   <li>
        <a href="../faq.jsp">
            <span class="icon">　</span>    
            <h1>FAQ</h1>
            <h2>자주 묻는 질문</h2>
            <h3>고객님께서 자주 묻는<br>질문의 목록을 보여드립니다.</h3>
        </a>
    </li>
</ul>
		</div>

	</div>

	<!-- footer -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>