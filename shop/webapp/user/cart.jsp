<%@page import="member.vo.UserVO"%>
<%@page import="user.vo.CartVO"%>
<%@page import="user.dao.CartDAO"%>
<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="user.vo.WishListVO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.WhileStatement"%>
<%@page import="java.util.List"%>
<%@page import="user.dao.WishListDAO"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="common.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ page info="사용자 / 장바구니 / 메인 페이지 - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733" />
<link rel="stylesheet" type="text/css" href="http://localhost/prj_web_shopping/user/member/mypage.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet" />
<style type="text/css">

#pageTitle {
	font-size: 25px;
	text-align: center;
	margin-top: 100px;
}
.table-container{
position: relative;
}
#move{
position: absolute;

}
#btnBlack{
font-size: 14px;
text-align: center;
background-color:  #141414;
color:  #FFFFFF;
height: 56px; width: 500px;
padding: 16px 16px 16px 16px;
}
#btnSubmit{
font-size: 14px;
text-align: center;
background-color:  #FFFFFF;
height: 56px; width: 500px;
padding: 16px 16px 16px 16px;
}
.table {
    background-color: white;
}

.table thead {
    background-color: white; 
}

.table tbody td {
    background-color: white; 
}

</style>

<script type="text/javascript">
$(function() {
	$("#btnBlack").click(function() {
		location.href = "buy.jsp?where=cart&full=y"
	});//click
	  
	$("#btnSubmit").click(function() {
		$("#full").val("n");
		$("#buyFrm").submit();
	});////click
		  
});//ready
	
	function deleteCart(bcode) {
		    
	 	$.ajax({
		    url: "cartDelete_process.jsp",
		    type: "get",
		    data: "bcode="+bcode,
		    dataType: "text",
		    error: function(xhr) {
	        alert("죄송합니다. 서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
		         console.log(xhr.status);
	        },
	        success: function(data) {
		         alert("상품이 삭제되었습니다.");
	             location.reload();
	       }//success
       });//ajax
	}//deleteWish
			
 	function stockCheck(pm,id) {
		//var id=$("#quantity")+id
		var quantity = parseInt($("#id").val());
		
		if(pm == "p"){
			if(quantity >= 50) {
				alert("구매 가능 수량을 초과하였습니다.");
			//	$("#quantity").val(${ product.quantity });
				return;
			}//end if
			
			if(quantity < 1) {
				alert("최소 주문 수량은 1개 입니다.");
				$("#quantity").val(1);
				return;
			}//end if
			
			$("#quantity").val(++quantity);
		}//end if
		
		if(pm == "m") {
			if(quantity > 50) {
				alert("구매 가능 수량을 초과하였습니다.");
				//$("#quantity").val(${ cart.amount });
				return;
			}//end if
			
			if(quantity <= 1) {
				alert("최소 주문 수량은 1개 입니다.");
				$("#quantity").val(1);
				return;
			}//end if
			
			$("#quantity").val(--quantity);
		}//end if
		
		if(pm == null){
			if(quantity > 10 ){
				alert("구매 가능 수량을 초과하였습니다.");
				/* $("#quantity").val(${ cart.amount }); */
				return;
			}//end if
			
			if(quantity < 1){
				alert("최소 주문 수량은 1개 입니다.");
				$("#quantity").val(1);
				return;
			}//end if
		}//end if
		
	}//stockCheck   
	
	function formatNumber(number) {
	    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}//formatNumber
	
	function plus(bcode, price) {
	    var quantityField = $("#quantity" + bcode);
	    var newQuantity = parseInt(quantityField.val());

	    if (newQuantity >= 50) {
	        alert("구매 가능 수량을 초과하였습니다.");
	        return;
	    }//end if

	    if (newQuantity < 1) {
	        alert("최소 주문 수량은 1개 입니다.");
	        return;
	    }//end if

	    // 수량 증가
	    newQuantity++;
	    quantityField.val(newQuantity);

	    // 총 가격 업데이트
	    var totalField = $("#total" + bcode);
	    var total = price * newQuantity;
	    totalField.html(formatNumber(total));
	}//plus

	function minus(bcode, price) {
	    var quantityField = $("#quantity" + bcode);
	    var newQuantity = parseInt(quantityField.val());

	    if (newQuantity >= 50) {
	        alert("구매 가능 수량을 초과하였습니다.");
	        return;
	    }//end if

	    if (newQuantity <= 1) {
	        alert("최소 주문 수량은 1개 입니다.");
	        return;
	    }//end if

	    // 수량 감소
	    newQuantity--;
	    quantityField.val(newQuantity);

	    // 총 가격 업데이트
	    var totalField = $("#total" + bcode);
	    var total = price * newQuantity;
	    totalField.html(formatNumber(total));
	}//minus
</script>

</head>  
<body>
<%@ include file="layout/header.jsp"%>
<%
BoardDAO bDAO=BoardDAO.getInstance();
BoardRangeVO brVO=new BoardRangeVO();

brVO.setTableName("BUCKET_LIST");

int totalCount=bDAO.totalCount(brVO);

int pageScale=10; // 한 화면에 보여줄 게시물의 수
int totalPage=0; // 총 페이지 수

totalPage=(int)Math.ceil(totalCount/(double)pageScale);

String tempPage=request.getParameter("currentPage");
int currentPage=1;
if(tempPage != null){
	currentPage=Integer.parseInt(tempPage);
}//end if

int startNum=currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);

//끝페이지 번호 구하기
int endNum=startNum+pageScale-1;

brVO.setStartNum(startNum);
brVO.setEndNum(endNum); 

int deliveryPrice=2500;

try{
CartDAO cDAO=CartDAO.getInstance();
String id=(String)session.getAttribute("sesId");

List<CartVO> list=cDAO.selectAllCartList(id, brVO);

pageContext.setAttribute("cartList", list);
pageContext.setAttribute("deliveryPrice", deliveryPrice);
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>
<div id="container" style="font-family:Pretendard Medium;">

	<div id="contents">
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.5.1.min.js"></script>

		<div class="PageTop" style="margin-top: 100px">
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
				<li class="right"><a href="member/mypage.jsp" >마이페이지</a>
					<span> </span> <a href="order_table.jsp">주문내역조회</a> <span>
				</span> <a href="cart.jsp" class="select" style="font-size: 14px;height: 22px">장바구니</a></li>
			</ul>
		</div>
		<div class="table-container" >
			 <div id="totalProducts">
			 <form id="buyFrm" name="buyFrm" method="get" action="buy.jsp">
			<table class="table" id="table" style="border: 1px solid #E5E4E4; background-color: #FFFFFF; text-align: center;">
				<tr style="border: 1px solid #E5E4E4; border-bottom: 1px solid #919191;">
					<td  style="width:30px; color: #929492">
						<input type="hidden" style="width: 45px;"/>
					</td>
					<td style="width:100px; font : #929492; vertical-align: middle;">이미지</td>
					<td style="width:350px;color: #929492;vertical-align: middle; ">상품정보</td>
					<td style="width:250px;color: #929492; vertical-align: middle;">판매가</td>
					<td style="width:100px;color: #929492; vertical-align: middle;">수량</td>
					<td style="width:100px ;color: #929492;vertical-align: middle;">합계</td>
					<td style="width:40px; color: #929492;vertical-align: middle;"> 선택</td>
				</tr>
				<c:if test="${ empty cartList }">
					<tr>
					<td colspan="7" style="text-align: center; padding:100px">회원정보가 존재하지 않습니다</td>
					</tr>
				</c:if>
				
						
					<c:forEach var="cart" items="${ cartList }" varStatus="i">
					  <tr style="border-bottom: 1px solid #E5E4E4;" >
						<td style=" vertical-align: middle;"><input type="checkbox" class="check" name="check"  value="${ cart.bcode }" style="border: 1px solid #929492 ; width: 15px; pa "></td> 
						<td  style=" vertical-align: middle;"><img src="../upload/goods/${ cart.img }"  style="width: 100px"/></td>
						<td style=" vertical-align: middle;"><a href="product_detail.jsp?gcode=${ cart.gcode }"><c:out value="${ cart.gname }"/></a></td>
						<td style=" vertical-align: middle;"><fmt:formatNumber value="${ cart.price }" pattern="#,###,###"/></td>
						 <td style="width:20px">
                          <!--  수량 -->
                           <span id="amountSet"  class="quantity">
                          <input type="text" id="quantity${ cart.bcode }" name="quantity_opt[]" value="${ cart.amount }" type="text" readonly="readonly"/>
							 <!--   + 버튼 -->
							<a href="#void" onclick="plus('${ cart.bcode }', ${ cart.price })" class="up QuantityUp">수량증가</a>
							<!--   - 버튼 -->
							<a href="#void" onclick="minus('${ cart.bcode }', ${ cart.price })" class="down QuantityDown">수량감소</a>
							</span>
                        </td> 
                        <!-- 총 가격 -->
					 	<td style=" vertical-align: middle;" id="total${ cart.bcode }">
					 	<fmt:formatNumber value="${cart.price * cart.amount}" pattern='#,###,###'/>
					 	</td> 
						<td> 
							<!-- 삭제 버튼 -->
					 		<input type="button" value="x삭제" class="deleteBtn" name="deleteBtn" onclick="deleteCart('${cart.bcode}')" style="width:90px; height:35px ;background-color: white; border : 1px solid  #E5E4E4;"/><br/>
					 		<input type="hidden"  style="width:90px; height:30px ;"/>
					 	</td>
					 </tr>
					</c:forEach>
				</table>
				<input type="hidden" name="where" value="cart">
				<input type="hidden" id="full" name="full" value="">
				</form>
					</div>
				
		</div>
		<div class="move">
		
				<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per">
					<a class="btnBlack" id="btnBlack">전체상품주문</a>
		     		<a class="btnSubmit" id="btnSubmit">선택상품주문</a> 
				</div>
		
</div>
</div>
<%@ include file="layout/footer.jsp"%>
</div>
</body>
</html>