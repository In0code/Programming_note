<%@page import="admin.vo.RecallVO"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.dao.OrderProcessDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리-교환/반품</title>
<jsp:include page="../cdn/admin_cdn.jsp"/>
<%
		////////////// 관리자 주문관리 ( 교환/ 반품 ) - 인영 ////////////
%>
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
</style>

<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
	
});
</script>
</head>
<body>
<%
BoardDAO bDAO=BoardDAO.getInstance();
BoardRangeVO brVO=new BoardRangeVO();

String field=request.getParameter("field");
String keyword=request.getParameter("keyword");
String tableName="UORDER";

brVO.setField(field);
brVO.setKeyword(keyword);
brVO.setTableName(tableName);

String[] status={"반품","교환"};
pageContext.setAttribute("status", status);

int totalCount=bDAO.totalCount(brVO);

int pageScale=10; // 한 화면에 보여줄 게시물의 수
int totalPage=0; // 총 페이지 수

totalPage=(int)Math.ceil(totalCount/pageScale);

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
	OrderProcessDAO opDAO=OrderProcessDAO.getInstance();
List<RecallVO> list=opDAO.selectRecallAllOrder();

pageContext.setAttribute("recallList", list);
pageContext.setAttribute("deliveryPrice", deliveryPrice);
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>

<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<!-- 타이틀  -->
		<div class="text" id="mainTitle">		
			<strong>교환/반품 리스트</strong>
		</div>
		
		<!-- 검색 -->
		<form id="searchFrm" action="">
		<div class="searchDiv">
			<select id="field" class="searchList">
				<option>주문번호</option>
				<option>주문자명</option>
				<option>아이디</option>
			</select>
			<input type="text" class="textBox" id="keyword" placeholder="내용을 입력해주세요"/>
			<input type="button" class="btn" id="btnSearch" value="검색"/>
		</div>
		</form>
		
		<div id="background_box">
			<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table id="order_list" class="table tableList">
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
				<th style="width:100px"></th>
				<th style="width:150px">No</th>
					<th style="width:150px">주문번호</th>
					<th style="width:230px">주문자명</th>
					<th style="width:230px">주문일시</th>
					<th style="width:230px">교환/반품 일시</th>
					<th style="width:230px">상품명</th>
					<th style="width:200px">수량</th>
					<th style="width:200px">가격정보</th>
					<th style="width:200px">배송비</th>
					<th style="width:200px">총 주문액</th>
					<th style="width:200px">총 처리상태</th>
				</tr>
				<c:if test="${ empty recallList }">
				<tr>
				<td colspan="10" style="text-align: center;">회원정보가 존재하지 않습니다</td>
				</tr>
				</c:if>
				
				<c:forEach var="recall" items="${ recallList }" varStatus="i">
				<tr>
				 <td><input type="checkbox"></td> 
				 <td><c:out value="<%=startNum++ %>"/></td> 
				<td><c:out value="${ recall.orderNum }"/></td>
				<td><c:out value="${ recall.userName }"/></td>
				<td><c:out value="${ recall.date }"/></td>
				<td><c:out value=""/></td>
				<td><c:out value="${ recall.productName }"/></td>
				<td><c:out value="${ recall.quantity }"/></td>
				<td><c:out value="${ recall.price }"/></td>
				<td><c:out value="<%= deliveryPrice %>"/></td>
			 	<td><c:out value="${ recall.price + deliveryPrice }"/></td> 
				<td class="status">
           <%-- <c:if test="${recall.processStatus eq 'C'}">
                    <option value="C" selected="selected">교환</option>
                    <option value="R">반품</option>
                </c:if>
                <c:if test="${recall.processStatus eq 'R'}">
                    <option value="C">교환</option>
                    <option value="R" selected="selected">반품</option>
                </c:if>--%>
              <select name="statuslist">
                <option value="CF" ${ recall.processStatus eq 'CF'? " selected='selected'" : "" } >교환완료</option>
                <option value=" C0"${ recall.processStatus eq 'C0'? " selected='selected'" : "" } >교환신청 </option>
                <option value=" R0"${ recall.processStatus eq 'R0'? " selected='selected'" : "" } >반품신청 </option>
                <option value=" RF"${ recall.processStatus eq 'RF'? " selected='selected'" : "" } >반품완료</option>
            </select>  
				</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		
		<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 				<a href="#">&laquo;</a>
  				<a href="#">1</a>
  				<a href="#" class="active">2</a>
  				<a href="#">3</a>
  				<a href="#">&raquo;</a>
			</div>
		</div>
		
		<input type="button" class="btn" id="btnChange" value="변경"/>
	</div>
</div>	
</body>
</html>