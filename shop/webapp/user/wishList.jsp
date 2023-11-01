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
		////////////// 사용자 관심상품  - 인영 ////////////
%>
<style type="text/css">
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
#pageTitle {
	font-size: 25px;
	text-align: center;
	margin-top: 100px;
}
</style>

<script type="text/javascript">
$(function(){
	 $("#btn").click(function(){
		   $("#frm").submit();
	   });//click
	   
	   $("#btnSearch").click(function(){
		   chkNull();
	   });//click
	   
	   $("#keyword").keyup(function(evt){ //keyup은 값을 받을 수 있음
		   if(evt.which == 13){ //enter는 13번
			   chkNull();
		   }//end if
	   });//keyup
	   
	});//ready

	function chkNull(){
		var keyword=$("#keyword").val();
		
		if(keyword.trim() == "" ){
			alert("검색 키워드를 입력해주세요.");
			return;
		}//end if
		//글자수 제한
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

List<WishListVO> list=wlDAO.selectAllWishList("inyoung", brVO);

pageContext.setAttribute("wishList", list);
pageContext.setAttribute("deliveryPrice", deliveryPrice);
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>

<div id="pageTitle" style="font-family:Pretendard Medium;">관심상품</div><br>
<div id="container" style="font-family:Pretendard Medium;">
	<div id="contents">
		<div >
			<table class="table" id="table" style="border: 1px solid #E5E4E4;">
				<tr style="border: 1px solid #E5E4E4; border-bottom: 1px solid #919191;">
					<td  style="width:10px; color: #929492">
						<input type="hidden" style="border: 1px solid #929492 ; width: 15px; height: 15px"/>
					</td>
					<td style="width:100px; color: #929492;">이미지</td>
					<td style="width:350px;color: #929492; ">상품정보</td>
					<td style="width:350px;color: #929492; ">판매가</td>
					<td style="width:100px;color: #929492;">배송비</td>
					<td style="width:100px ;color: #929492;">합계</td>
					<td style="width:10px; color: #929492;"> 선택</td>
				</tr>
				<c:if test="${ empty wishList }">
					<tr>
					<td colspan="7" style="text-align: center; padding:100px">회원정보가 존재하지 않습니다</td>
					</tr>
				</c:if>
				
					<c:forEach var="wish" items="${ wishList }" varStatus="i">
					  <tr style="border-bottom: 1px solid #E5E4E4;" >
						<td style=" vertical-align: middle;"><input type="checkbox" class="check" name="check"  value="${ wish.wcode }" style="border: 1px solid #929492 ; width: 15px; "></td> 
						<td  style=" vertical-align: middle;"><img src="../upload/goods/${ wish.img }"  style="width: 100px"/></td>
						<td style=" vertical-align: middle;"><c:out value="${ wish.gname }"/></td>
						<td style=" vertical-align: middle;"><c:out value="${ wish.price }"/></td>
						<td style=" vertical-align: middle;"><c:out value="<%= deliveryPrice %>"/></td>
					 	<td style=" vertical-align: middle;"><c:out value="${ wish.price + deliveryPrice }"/></td> 
						<td>
							<input type="button" value="주문하기" id="orderBtn" name="orderBtn" style="width:90px; height:30px ;background-color: white;border : 1px solid #929492;"/><br/>
					 		<input type="button" value="장바구니담기" id="addCartBtn" name="addCartBtn" style="width:90px; height:30px ;background-color: white;border : 1px solid #929492;"/><br/>
					 		<input type="button" value="x삭제" id="deleteBtn" name="deleteBtn" style="width:90px; height:30px ;background-color: white; border : 1px solid #929492;"/>
					 	</td>
					 </tr>
					</c:forEach>
				</table>
		</div>
				<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per">
					<a href="" class="btnBlack" id="btnBlack">전체상품주문</a>
		     		<a href="" class="btnSubmit" id="btnSubmit">선택상품주문</a> 
				</div>
		
          <c:if test="${ not empty orderList }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv" style=" position: absolute; top: 775px; width: 1480px; text-align: center;">
			<div class="pagination" style="display: inline-block;">
 			<%
 			BoardUtil util=BoardUtil.getInstance();
			BoardUtilVO buVO=new BoardUtilVO("orderManagement_order.jsp","","",currentPage,totalPage);
			out.println(util.pageNation(buVO));
 			%>
			</div>
		</div>
		</c:if>
</div>
<%@ include file="layout/footer.jsp"%>
</div>
</body>
</html>