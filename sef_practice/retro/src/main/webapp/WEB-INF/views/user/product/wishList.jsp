<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<section class="mx-auto w-full max-w-[768px]">
<div id="pageTitle" style="font-family:Pretendard Medium;">관심상품</div><br>
<div id="container" style="font-family:Pretendard Medium;">
	<div id="contents">
		<div class="table-container" >
				<form id="tableFrm" name="tableFrm" method="get" action="buy.jsp?where=wish&full=n">
			<table class="table" id="table" style="border: 1px solid #E5E4E4; text-align: center;">
				<tr style="border: 1px solid #E5E4E4; border-bottom: 1px solid #919191;">
					<td  style="width:10px; color: #929492; height: 36px">
						<input type="hidden" style="border: 1px solid #929492 ; width: 15px; height: 15px"/>
					</td>
					<td style="width:100px; color: #929492; vertical-align: middle; padding:15px">이미지</td>
					<td style="width:350px;color: #929492;vertical-align: middle; ">상품정보</td>
					<td style="width:200px;color: #929492; vertical-align: middle;">판매가</td>
					<td style="width:100px;color: #929492;vertical-align: middle;">배송비</td>
					<td style="width:100px ;color: #929492;vertical-align: middle;">합계</td>
					<td style="width:100px; color: #929492;vertical-align: middle;"> 선택</td>
				</tr>
				<c:if test="${ empty wishList }">
					<tr>
					<td colspan="7" style="text-align: center; padding:100px">관심상품 내역이 없습니다.</td>
					</tr>
				</c:if>
					<c:forEach var="wish" items="${ wishList }" varStatus="i">
					  <tr style="border-bottom: 1px solid #E5E4E4;" >
						<td style=" vertical-align: middle;"><input type="checkbox" class="check" name="check"  value="${ wish.gcode }" 
							style="border: 1px solid #929492 ; width: 15px; "></td>
						<!-- 상품사진 --> 
						<td  style=" vertical-align: middle;"><img src="../upload/goods/${ wish.img }"  style="width: 100px"/></td>
						<!-- 상품 이름 -->
						<td style=" vertical-align: middle;"><a href="product_detail.jsp?gcode=${ wish.gcode }"><c:out value="${ wish.gname }"/></a></td>
						<!-- 상품가격 -->
						<td style=" vertical-align: middle;"><fmt:formatNumber value="${ wish.price }" pattern="#,###,###"/></td>
						<!-- 배송비 -->
						<%-- <td style=" vertical-align: middle;"><fmt:formatNumber value="<%= deliveryPrice %>" pattern="#,###,###"/></td> --%>
						<!-- 총 금액 -->
					 	<td style=" vertical-align: middle;"><fmt:formatNumber value="${ wish.price + deliveryPrice }" pattern="#,###,###"/></td>
					 	<!-- 장바구니 담기 / 삭제하기 버튼 --> 
						<td>
							<input type="hidden" style="width:90px; height:50px ;"/><br/>
					 		<input type="button" value="장바구니담기"  class="addCartBtn" name="addCartBtn"  onclick="addCart('${wish.gcode}')" 
					 			style="width:90px; height:30px ;background-color: white;border : 1px solid  #E5E4E4;"/><br/>
					 		<input type="button" value="x삭제" class="deleteBtn" name="deleteBtn" onclick="deleteWish('${wish.gcode}')"
					 			style="width:90px; height:30px ;background-color: white; border : 1px solid  #E5E4E4;"/>
					 	</td>
					 </tr>
					</c:forEach>
				</table>
				<input type="hidden" name="where" value="wish">
				<input type="hidden" id="full" name="full" value="">
				</form>
		</div>
		<div class="move">
		
				<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per">
					<a class="btnBlack" id="btnBlack">전체상품주문</a>
		     		<a class="btnSubmit" id="btnSubmit">선택상품주문</a> 
				</div>
		
</div>
</div>
</div>
</section>
		</div>
		<div class="Toastify"></div>
	</main>
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>
