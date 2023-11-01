<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%>
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
	
	$("#btnSearch").click(function() {
		chkNull();
	});
	
	$("#keyword").keyup(function(evt) {
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keyup
	
	$("#btnChange").click(function(){
		 var selectedOrders = [];
		    // 클래스명이 'check'인 체크박스를 모두 선택
		    $("input.check:checked").each(function(){
		        var orderNo = $(this).val();
		        var newStatus = $(this).closest("tr").find("select[name=statuslist]").val();
		        selectedOrders.push({ orderNo: orderNo, newStatus: newStatus });
		    });//end each
		    
		    if (selectedOrders.length > 0) {
	            $.ajax({
	                url: "order_process.jsp",
	                type: "POST",
	                data: JSON.stringify(selectedOrders),
	                contentType: "application/json; charset=UTF-8",
	                dataType: "text",
	                error: function(xhr) {
	                    alert("죄송합니다. 서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
	                },
	                success: function(data) {
	                        alert("변경되었습니다.");
	                        location.reload();
	                }//success
	            });//ajax
	        } else {
	            alert("변경할 주문을 선택해주세요");
	        }//end else
	    });//click
	});//ready

function chkNull() {
	var keyword = $("#keyword").val();
	if(keyword.trim() == ""){
		alert("검색 키워드를 입력해주세요.");
		return;
	}//end if
	
	//글자 수 제한
	
	//모두 통과했으면 submit
	$("#frmSearch").submit();
}//chkNull

</script>
</head>
<body>
<%
BoardDAO bDAO=BoardDAO.getInstance();
BoardRangeVO brVO=new BoardRangeVO();

String field=request.getParameter("field");
String keyword=request.getParameter("keyword");

brVO.setField(field);
brVO.setKeyword(keyword);
brVO.setTableName("UORDER");

int totalCount=bDAO.totalCount(brVO);

int pageScale=10; // 한 화면에 보여줄 게시물의 수
int totalPage=0; // 총 페이지 수

totalPage=((int)Math.ceil(totalCount/(double)pageScale)-1);

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
List<RecallVO> list=opDAO.selectRecallAllOrder(brVO);

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
		<div class="searchDiv">
		<form id="frmSearch">
			<select id="field" name="field" class="searchList">
				<option value="1"${ param.field eq "1" ?" selected='selected'":"" }>주문자명</option>
				<option value="2"${ param.field eq "2" ?" selected='selected'":"" }>주문번호</option>
				<option value="3"${ param.field eq "3" ?" selected='selected'":"" }>아이디</option>
			</select>
			<input type="text" class="textBox" id="keyword" name="keyword" placeholder="내용을 입력해주세요" 
			value="${ param.keyword ne 'null'? param.keyword:'' }"/>
			<!-- <input type="text" style="display:none;"/> -->
			<input type="button" class="btn" id="btnSearch" value="검색"/>
		</form>
		</div>
		
		<div id="background_box">
			<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table id="order_list" class="table tableList">
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
				<th style="width:70px"></th>
				<th style="width:50px">No</th>
					<th style="width:200px">주문일시</th>
					<th id="ordNo" name="ordNo" style="width:80px">주문번호</th>
					<th style="width:200px">상품명</th>
					<th style="width:50px">수량</th>
					<th style="width:100px">가격정보</th>
					<th style="width:100px">배송비</th>
					<th style="width:100px">총 처리상태</th>
					<th style="width:100px">주문자명</th>
					<th style="width:100px">총 주문액</th>
					<th style="width:200px">교환/반품 일시</th>
				</tr>
				<c:if test="${ empty recallList }">
				<tr>
				<td colspan="12" style="text-align: center;">회원정보가 존재하지 않습니다</td>
				</tr>
				</c:if>
				
				<c:forEach var="recall" items="${ recallList }" varStatus="i">
				<tr>
				 <td><input type="checkbox" class="check" name="check"  value="${ recall.orderNum }"></td> 
				 <td><c:out value="<%=startNum++ %>"/></td> 
				<td><c:out value="${ recall.date }"/></td>
				<td><c:out value="${ recall.orderNum }"/></td>
				<td><c:out value="${ recall.productName }"/></td>
				<td><c:out value="${ recall.quantity }"/></td>
				<td><c:out value="${ recall.price }"/></td>
				<td><c:out value="<%= deliveryPrice %>"/></td>
				<td>
	              <select name="statuslist" id="statuslist">
	                <option value="C0"${ recall.orderStatus eq 'C0'? " selected='selected'" : "" }  >교환신청 </option>
	                <option value="CF"${ recall.orderStatus eq 'CF'? " selected='selected'" : "" }  >교환완료</option>
	                <option value="R0"${ recall.orderStatus eq 'R0'? " selected='selected'" : "" } >반품신청 </option>
	                <option value="RF"${ recall.orderStatus eq 'RF'? " selected='selected'" : "" } >반품완료</option>
	            </select>  
				</td>
				<td><c:out value="${ recall.userName }"/></td>
			 	<td><c:out value="${ recall.price + deliveryPrice }"/></td> 
				<td><c:out value="${ recall.recallDate }"/></td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		
		<c:if test="${ not empty recallList }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 			<%
 			BoardUtil util=BoardUtil.getInstance();
			BoardUtilVO buVO=new BoardUtilVO("orderManagement_edit.jsp",keyword,field,currentPage,totalPage);
			out.println(util.pageNation(buVO));
 			%>
			</div>
		</div>
		</c:if>
		
		<input type="button" class="btn" id="btnChange" value="변경"/>
		<%
			if(request.getParameter("keyword") != null) {
			out.print("<a href='orderManagement_edit.jsp'><input type='button' id='btnList' value='목록' style='left:1060px; top:683px'/></a>");
			}
		%>
	</div>
</div>	
</body>
</html>