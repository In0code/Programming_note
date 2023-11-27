<%@page import="admin.dao.ProductDAO"%>
<%-- <%@page import="admin.vo.ProductManageVO"%>
<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%> --%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%-- <%@page import="common.dao.BoardDAO"%> --%>
<%-- <%@page import="admin.dao.BoardManageDAO"%>
<%@page import="admin.vo.BoardManageVO"%> --%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <jsp:include page="../cdn/admin_cdn.jsp"/> --%>

<style type="text/css">
body{
 margin: 0px;
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

td {
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(function() {
	
/* 	$("#addProduct").click(function(){
		
	});// click */
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
	
	$("#btnSearch").click(function() {
		chkNull();
	});
	
	$("#keyword").keyup(function(evt) {
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keyup
});

function chkNull() {
	var keyword = $("#keyword").val();
	if(keyword.trim() == ""){
		alert("검색 키워드를 입력해주세요.");
		return;
	}//end if
	
	//글자 수 제한
	
	//모두 통과했으면 submit
	$("#frmSearch").submit();
}

function productDetail(gcode){
	$("#gcode").val(gcode);
	$("#frmDetail").submit();
}
</script>
</head>
<body>
<%
	ProductDAO pDAO = ProductDAO.getInstance();
	BoardRangeVO brVO = new BoardRangeVO();
	
	String field = request.getParameter("field");
	String keyword = request.getParameter("keyword");
	
	/* 페이지가 최초 호출 시에는 field나 keyword가 없다. 
	검색을 하지 않는 경우에도 값이 없다. */
/* 	brVO.setField(field);
	brVO.setKeyword(keyword);
	
	//1.총 레코드의 수 
	int totalCount = pDAO.totalCount(brVO); */
	
	//2.한 화면에 보여줄 게시물의 수
	int pageScale = 10;
	
	//3.총 페이지 수
	//int totalPage = totalCount/pageScale;
	
	//총 레코드 수 나누기 한 화면에 보여줄 게시물의 수를 했을 때
	//나머지가 있다면(0이 아니라면) 한 화면에 보여줄 게시물의 수를 초과한 것이므로
	//총 페이지 수를 하나 늘림
	//Math 사용 - 올림
	/* int totalPage = (int)Math.ceil(totalCount/(double)pageScale); */
	
	//4.현재 페이지 번호 구하기
	String tempPage = request.getParameter("currentPage");
	int currentPage = 1; //최초 페이지는 1번째 페이지가 보임
	if(tempPage != null){
		currentPage = Integer.parseInt(tempPage);
	}//end if
	
	//5.시작 번호
	int startNum = currentPage*pageScale-pageScale+1;
	pageContext.setAttribute("startNum", startNum);
	
	//6.끝 번호
	int endNum = startNum+pageScale-1;
	
	/*  //Dynamic Query에 의해서 구해진 시작번호와 끝번호를 VO에 넣는다.
	brVO.setStartNum(startNum);
	brVO.setEndNum(endNum);
	
	try{
		List<ProductVO> productList = pDAO.selectAllProduct(brVO);
		pageContext.setAttribute("productList", productList);
		
	}catch(SQLException se){
		se.printStackTrace();
	}// */
%> 

<%-- <%@ include file="sidebar.jsp" %> --%>
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
				<option value="1"${ param.field eq "1" ? " selected='selected'" : "" }>상품명</option>
				<option value="2"${ param.field eq "2" ? " selected='selected'" : "" }>상품코드</option>
				<option value="3"${ param.field eq "3" ? " selected='selected'" : "" }>카테고리명</option>
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
					<th style="width:50px">이미지</th>
					<th style="width:180px">상품코드</th>
					<th style="width:350px">상품명</th>
					<th style="width:200px">카테고리</th>
					<th style="width:200px">등록일</th>
					<th style="width:150px">판매가</th>
					<th style="width:150px">재고</th>
					<th style="width:100px">비고</th>
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
						<td><img src="http://localhost/prj_web_shopping/upload/goods/${ product.mainImg }" style="width:35px"/></td>
					 <td><a href="item_managing_detail.jsp?gcode=${product.goodsCode }" 
   onclick="window.open(this.href, '', 'width=1650 , height=900, top=120, left=650'); return false;"><c:out value="${ product.goodsCode }" /></a></td> 
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
 				<%-- <%
 					BoardUtil util = BoardUtil.getInstance();
 					BoardUtilVO buVO = new BoardUtilVO("admin_itemmanaging2.jsp", keyword, field, currentPage, totalPage);
 					out.println(util.pageNation(buVO));
 				%> --%>
			</div>
		</div>
		</c:if>
		
		<% if(request.getParameter("keyword") != null && !"null".equals(request.getParameter("keyword"))) 
			out.print("<a href='admin_itemmanaging2.jsp'><input type='button' id='btnList' style='left:1250px' value='목록'/></a>");
		%>  
	</div>
	<!-- <input style="position: absolute; top: 830px; left: 1700px; padding:10px"type="button" id="addProduct" name="addProduct" value="상품 새로 등록하기" class="btn btn-outline-secondary" onclick="location.href='item_add.jsp'"> -->
</div>	
</body>
</html>
</html>