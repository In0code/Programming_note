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
    <%@ page info="사용자 / 관심상품 / 메인 페이지 - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
		////////////// 사용자 관심상품  - 인영 ////////////
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

</style>

<script type="text/javascript">
$(function(){
	 $("#btn").click(function(){
		   $("#frm").submit();
	   });//click

		$("#btnBlack").click(function() {
			location.hrref = "buy.jsp?where=wish&full=y"
		});////click
		  
		$("#btnSubmit").click(function() {
			$("#tableFrm").submit();
		});//click
			  
	});//ready
	
	 function addCart(gcode) {
        $.ajax({
            url: "wishAddCart_process.jsp",
            type: "get",
            data: "gcode="+gcode,
            dataType: "text",
            error: function(xhr) {
                alert("죄송합니다. 서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
                console.log(xhr.status);
            },
            success: function(data) {
                    alert("장바구니에 상품이 추가되었습니다.");
                    location.reload();
            }//success
        });//ajax
	}//addCart 
	
	function deleteWish(wcode) {
    
        $.ajax({
            url: "wishDelete_process.jsp",
            type: "get",
            data: "wcode="+wcode,
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

	function chkNull(){
		//
		$("#frmSearch").submit();
	}//chkNull

	function memberDetail( id ){
		$("#id").val(id);
		$("#hidFrm").submit();
	};
	
</script>

</head>
<body>
<%@ include file="layout/header.jsp"%>
<%
BoardDAO bDAO=BoardDAO.getInstance();
BoardRangeVO brVO=new BoardRangeVO();

//String field=request.getParameter("field");
//String keyword=request.getParameter("keyword");

//brVO.setField(field);
//brVO.setKeyword(keyword);
brVO.setTableName("WISHLIST");

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
WishListDAO wlDAO=WishListDAO.getInstance();
String id=(String)session.getAttribute("sesId");

List<WishListVO> list=wlDAO.selectAllWishList("tuna5127", brVO);

pageContext.setAttribute("wishList", list);
pageContext.setAttribute("deliveryPrice", deliveryPrice);
pageContext.setAttribute("deliveryPrice", deliveryPrice);
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>

<div id="pageTitle" style="font-family:Pretendard Medium;">관심상품</div><br>
<div id="container" style="font-family:Pretendard Medium;">
	<div id="contents">
		<div class="table-container" >
				<form id="tableFrm" name="tableFrm" method="get" action="buy.jsp?where=wish&full=n">
			<table class="table" id="table" style="border: 1px solid #E5E4E4; text-align: center;">
				<tr style="border: 1px solid #E5E4E4; border-bottom: 1px solid #919191;">
					<td  style="width:10px; color: #929492">
						<input type="hidden" style="border: 1px solid #929492 ; width: 15px; height: 15px"/>
					</td>
					<td style="width:100px; color: #929492; vertical-align: middle;">이미지</td>
					<td style="width:350px;color: #929492;vertical-align: middle; ">상품정보</td>
					<td style="width:200px;color: #929492; vertical-align: middle;">판매가</td>
					<td style="width:100px;color: #929492;vertical-align: middle;">배송비</td>
					<td style="width:100px ;color: #929492;vertical-align: middle;">합계</td>
					<td style="width:100px; color: #929492;vertical-align: middle;"> 선택</td>
				</tr>
				<c:if test="${ empty wishList }">
					<tr>
					<td colspan="7" style="text-align: center; padding:100px">회원정보가 존재하지 않습니다</td>
					</tr>
				</c:if>
					<c:forEach var="wish" items="${ wishList }" varStatus="i">
					  <tr style="border-bottom: 1px solid #E5E4E4;" >
						<td style=" vertical-align: middle;"><input type="checkbox" class="check" name="check"  value="${ wish.gcode }" style="border: 1px solid #929492 ; width: 15px; "></td> 
						<td  style=" vertical-align: middle;"><img src="../upload/goods/${ wish.img }"  style="width: 100px"/></td>
						<td style=" vertical-align: middle;"><a href="product_detail.jsp?gcode=${ wish.gcode }"><c:out value="${ wish.gname }"/></a></td>
						<td style=" vertical-align: middle;"><c:out value="${ wish.price }"/></td>
						<td style=" vertical-align: middle;"><c:out value="<%= deliveryPrice %>"/></td>
					 	<td style=" vertical-align: middle;"><c:out value="${ wish.price + deliveryPrice }"/></td> 
						<td>
							<input type="hidden" value="x삭제" name="dd" style="width:90px; height:50px ;"/><br/>
					 		<input type="button" value="장바구니담기"  class="addCartBtn" name="addCartBtn"  onclick="addCart('${wish.gcode}')" style="width:90px; height:30px ;background-color: white;border : 1px solid  #E5E4E4;"/><br/>
					 		<input type="button" value="x삭제" class="deleteBtn" name="deleteBtn" onclick="deleteWish('${wish.wcode}')"style="width:90px; height:30px ;background-color: white; border : 1px solid  #E5E4E4;"/>
					 	</td>
					 </tr>
					</c:forEach>
				</table>
				</form>
		</div>
		<div class="move">
		
				<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per">
					<a class="btnBlack" id="btnBlack">전체상품주문</a>
		     		<a class="btnSubmit" id="btnSubmit">선택상품주문</a> 
				</div>
		
          <c:if test="${ not empty wishList }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 			<%
 			BoardUtil util=BoardUtil.getInstance();
			BoardUtilVO buVO=new BoardUtilVO("wishList.jsp","","",currentPage,totalPage);
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