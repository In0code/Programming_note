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
    pageEncoding="UTF-8"%>
    <%@ page info="관심상품" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
		////////////// 사용자 장바구니  - 인영 ////////////
%>
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
.pagenationDiv{
   top: 575px;
   text-align: center;
    margin-top: 10px; 
}

.pagination {
  display: inline-block;
}
pagination a{
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

a {
   text-decoration: none;
   color: #333;
}

a:hover {
   color: #333;
}
/* .ec-base-qty {
    position: relative;
    display: inline-block;
    width: 50px;
    margin: 0 1px 0 0;
    text-align: left;
}

.ec-base-qty input[type="text"] {
    width: 22px;
    height: 23px;
    padding: 0 0 0 5px;
    line-height: 25px;
    border: 1px solid #d4d8d9;
    border-radius: 3px 0 0 3px;
}

.ec-base-qty .up {
    position: absolute;
    left: 27px;
    top: 0;
}

.ec-base-qty .down {
    position: absolute;
    left: 27px;
    bottom: 0;
}

.ec-base-qty .qtyUp {
    position: absolute;
    left: 27px;
    top: 0;
}

.ec-base-qty .qtyDown {
    position: absolute;
    left: 27px;
    bottom: 0;
}

.ec-base-qty .qtyUp .up {
    position: static;
    left: auto;
    top: auto;
}

.ec-base-qty .qtyDown .down {
    position: static;
    left: auto;
    top: auto;
} */

</style>

<script type="text/javascript">
$(function() {
	  $("#btnBlack").click(function() {
	    window.location.href = "주문하기 페이지 URL";
	  });//click
	  $("#btnSubmit").click(function() {
	    window.location.href = "주문하기 페이지 URL";
	  });////click
		  
	});//ready
	
	function deleteCart(gcode) {
		    
	 	$.ajax({
		    url: "cartDelete_process.jsp",
		    type: "get",
		    data: "gcode="+gcode,
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
			
/* 	function stockCheck(pm) {
		var quantity = parseInt($("#quantity").val());
		
		if(pm == "p"){
			if(quantity >= ${ product.quantity }) {
				alert("구매 가능 수량을 초과하였습니다.");
				$("#quantity").val(${ product.quantity });
				return;
			}
			
			if(quantity < 1) {
				alert("최소 주문 수량은 1개 입니다.");
				$("#quantity").val(1);
				return;
			}
			
			$("#quantity").val(++quantity);
		}
		
		if(pm == "m") {
			if(quantity > ${ product.quantity }) {
				alert("구매 가능 수량을 초과하였습니다.");
				$("#quantity").val(${ product.quantity });
				return;
			}
			
			if(quantity <= 1) {
				alert("최소 주문 수량은 1개 입니다.");
				$("#quantity").val(1);
				return;
			}
			
			$("#quantity").val(--quantity);
		}
		
		if(pm == null){
			if(quantity > ${ product.quantity } ){
				alert("구매 가능 수량을 초과하였습니다.");
				$("#quantity").val(${ product.quantity });
				return;
			}
			
			if(quantity < 1){
				alert("최소 주문 수량은 1개 입니다.");
				$("#quantity").val(1);
				return;
			}
		}
		
		$("#bottomQuantity").html("("+quantity+"개)");
		totalPrice();
	}//stockCheck */
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

List<CartVO> list=cDAO.selectAllCartList("tuna5127", brVO);

pageContext.setAttribute("cartList", list);
pageContext.setAttribute("deliveryPrice", deliveryPrice);
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>

<div id="pageTitle" style="font-family:Pretendard Medium;">장바구니</div><br>
<div id="container" style="font-family:Pretendard Medium;">
	<div id="contents">
		<div class="table-container">
			<table class="table" id="table" style="border: 1px solid #E5E4E4;">
				<tr style="border: 1px solid #E5E4E4; border-bottom: 1px solid #919191;">
					<td  style="width:10px; color: #929492">
						<input type="hidden" style="width: 45px;"/>
					</td>
					<td style="width:100px; color: #929492; vertical-align: middle;">이미지</td>
					<td style="width:350px;color: #929492;vertical-align: middle; ">상품정보</td>
					<td style="width:250px;color: #929492; vertical-align: middle;">판매가</td>
					<td style="width:100px;color: #929492; vertical-align: middle;">수량</td>
					<td style="width:100px;color: #929492;vertical-align: middle;">배송비</td>
					<td style="width:100px ;color: #929492;vertical-align: middle;">합계</td>
					<td style="width:10px; color: #929492;vertical-align: middle;"> 선택</td>
				</tr>
				<c:if test="${ empty cartList }">
					<tr>
					<td colspan="7" style="text-align: center; padding:100px">회원정보가 존재하지 않습니다</td>
					</tr>
				</c:if>
				
					<c:forEach var="cart" items="${ cartList }" varStatus="i">
					  <tr style="border-bottom: 1px solid #E5E4E4;" >
						<td style=" vertical-align: middle;"><input type="checkbox" class="check" name="check"  value="${ wish.wcode }" style="border: 1px solid #929492 ; width: 15px; "></td> 
						<td  style=" vertical-align: middle;"><img src="../upload/goods/${ cart.img }"  style="width: 100px"/></td>
						<td style=" vertical-align: middle;"><c:out value="${ cart.gname }"/></td>
						<td style=" vertical-align: middle;"><c:out value="${ cart.price }"/></td>
						<!-- <td>
                           수량
                          <span class="quantity">
                             <input id="quantity" name="quantity_opt[]" style="" value="1" type="text"/>                                            
                               + 버튼
                               <a href="javascript:stockCheck('p');" class="up QuantityUp">수량증가</a>
                                            
                               - 버튼
                               <a href="javascript:stockCheck('m');" class="down QuantityDown">수량감소</a>
                           </span>
                        </td> -->
						<td style=" vertical-align: middle;">
							<select>
							<% %>
								<option>1</option><option>2</option><option>3</option><option>4</option>
								<option>5</option><option>6</option><option>7</option><option>8</option>
							</select>
						</td>
						<td style=" vertical-align: middle;"><c:out value="<%= deliveryPrice %>"/></td>
					 	<td style=" vertical-align: middle;"><c:out value="${ cart.price + deliveryPrice }"/></td> 
						<td>
					 		<input type="hidden" value="x삭제" name="dd" style="width:90px; height:40px ;"/><br/><br/>
					 		<input type="button" value="x삭제" class="deleteBtn" name="deleteBtn" onclick="deleteCart('${cart.gcode}')" style="width:90px; height:35px ;background-color: white; border : 1px solid  #E5E4E4;"/><br/>
					 		<input type="hidden" value="x삭제" name="dt" style="width:90px; height:30px ;"/>
					 	</td>
					 </tr>
					</c:forEach>
				</table>
		</div>
		<div class="move">
		
				<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per">
					<a href="" class="btnBlack" id="btnBlack">전체상품주문</a>
		     		<a href="" class="btnSubmit" id="btnSubmit">선택상품주문</a> 
				</div>
		
          <c:if test="${ not empty cartList }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 			<%
 			BoardUtil util=BoardUtil.getInstance();
			BoardUtilVO buVO=new BoardUtilVO("cart.jsp","","",currentPage,totalPage);
			out.println(util.pageNation(buVO));
 			%>
			</div>
		</div>
		</c:if>
</div>
</div>
<%@ include file="layout/footer.jsp"%>
</div>
</body>
</html>