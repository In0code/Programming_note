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

String field=request.getParameter("field");
String keyword=request.getParameter("keyword");

brVO.setField(field);
brVO.setKeyword(keyword);
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
						<input type="checkbox" style="border: 1px solid #929492 ; width: 15px; height: 15px"/>
					</td>
					<td style="width:100px; color: #929492;padding: 1vh;">이미지</td>
					<td style="width:350px; padding: 1vh;color: #929492; ">상품정보</td>
					<td style="width:350px; padding: 1vh;color: #929492; ">판매가</td>
					<td style="width:100px; padding: 1vh; color: #929492;text-align: center;">배송비</td>
					<td style="width:100px ;padding: 1vh;color: #929492;text-align: center;">합계</td>
					<td style="width:100px; padding: 1vh;color: #929492;text-align: center;">선택</td>
				</tr>
				<c:if test="${ empty wishList }">
					<tr>
					<td colspan="7" style="text-align: center; padding:100px">회원정보가 존재하지 않습니다</td>
					</tr>
				</c:if>
				
					<c:forEach var="wish" items="${ wishList }" varStatus="i">
					 <tr style="border-bottom: 1px solid #E5E4E4;" >
					<td style="padding: 3vh;"><input type="checkbox" class="check" name="check"  value="${ wish.wcode }" style="border: 1px solid #929492 ; width: 15px; "></td> 
					<td style="padding: 3vh;"><img src="../upload/goods/"${ wish.img }/></td>
					<td style="padding-top: 3vh;"><c:out value="${ wish.gname }"/></td>
					<td style="padding: 3vh;"><c:out value="${ wish.price }"/></td>
					<td style="padding: 3vh;"><c:out value="<%= deliveryPrice %>"/></td>
				 	<td style="padding: 3vh;"><c:out value="${ wish.price + deliveryPrice }"/></td> 
				 	<td ><input type="button" id="deleteBtn" name="deleteBtn" style="width:30px"/></td>
				 	<td><input type="button" id="deleteBtn" name="deleteBtn"/></td>
				 	<td><input type="button" id="deleteBtn" name="deleteBtn"/></td>
					</tr> 
					
					<%-- <tr>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
					</tr>
					<tr>
						<td><input type="checkbox" class="check" name="check"  value="${ wish.wcode }" style="border: 1px solid #929492 ; width: 15px;"></td>
						<td rowspan="3"  style="min-height:10px"><img src="../upload/goods/"${ wish.img }/></td>
						<td rowspan="3" style="min-height:10px"><c:out value="${ wish.gname }"/></td>
						<td rowspan="3" style="min-height:10px"><c:out value="${ wish.price }"/></td>
						<td style="min-height:10px"><c:out value="<%= deliveryPrice %>"/></td>
						<td style="min-height:10px"><c:out value="${ wish.price + deliveryPrice }"/></td>
					</tr>
					<tr>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
						<td style="min-height:10px"></td>
					</tr> --%>
				</c:forEach>
				</table>
		</div>
				<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per">
					<a href="" class="btnBlack" id="btnBlack">전체상품주문</a>
		     		<a href="" class="btnSubmit" id="btnSubmit">선택상품주문</a> 
				</div>
           <!-- 페이지 네이션 -->
            <div class="xans-element- xans-product xans-product-reviewpaging ec-base-paginate typeList">
            	<a href="#none" class="first">첫 페이지</a>
				<a href="#none">이전 페이지</a>
				<ol>
					<li class="xans-record-"><a href="?page_4=1#use_review" class="this">1</a></li>
                    <li class="xans-record-"><a href="?page_4=2#use_review" class="other">2</a></li>
                    <li class="xans-record-"><a href="?page_4=3#use_review" class="other">3</a></li>
                </ol>
				<a href="?page_4=2#use_review">다음 페이지</a>
				<a href="?page_4=228#use_review" class="last">마지막 페이지</a>
			</div> 
		</div>
		
<%@ include file="layout/footer.jsp"%>
</div>
</body>
</html>