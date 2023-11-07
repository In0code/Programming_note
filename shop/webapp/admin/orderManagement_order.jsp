<%@page import="common.util.BoardUtil"%>
<%@page import="common.util.BoardUtilVO"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.OrderProcessDAO"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="admin.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="관리자 / 주문관리 / 주문 리스트 - 인영"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리-주문</title>
<jsp:include page="../cdn/admin_cdn.jsp"/>


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
		        var ord_dno = $(this).val();
		        var newStatus = $(this).closest("tr").find("select[name=statuslist]").val();
		        selectedOrders.push({ ord_dno: ord_dno, newStatus: newStatus });
		    });//end each
		    
		    if (selectedOrders.length > 0) {
	            $.ajax({
	                url: "order_process.jsp",
	                type: "POST",
	                data: JSON.stringify(selectedOrders),
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
OrderProcessDAO opDAO = OrderProcessDAO.getInstance();
BoardRangeVO brVO = new BoardRangeVO();

opDAO.selectAllOrder(brVO);

String field = request.getParameter("field");
String keyword = request.getParameter("keyword");

/* 페이지가 최초 호출 시에는 field나 keyword가 없다. 
검색을 하지 않는 경우에도 값이 없다. */
brVO.setField(field);
brVO.setKeyword(keyword);
/* brVO.setTableName("uorder"); */

//1.총 레코드의 수 
int totalCount = opDAO.orderTotalCount(brVO);

System.out.print(totalCount);

//2.한 화면에 보여줄 게시물의 수
int pageScale = 10;

//3.총 페이지 수
//int totalPage = totalCount/pageScale;

//총 레코드 수 나누기 한 화면에 보여줄 게시물의 수를 했을 때
//나머지가 있다면(0이 아니라면) 한 화면에 보여줄 게시물의 수를 초과한 것이므로
//총 페이지 수를 하나 늘림
//Math 사용 - 올림
int totalPage = (int)Math.ceil(totalCount/(double)pageScale);

//4.현재 페이지 번호 구하기
String tempPage = request.getParameter("currentPage");
int currentPage = 1; //최초 페이지는 1번째 페이지가 보임
if(tempPage != null){
	currentPage = Integer.parseInt(tempPage);
}//end if

int dlvyPrice=2500;

//5.시작 번호
int startNum = currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);

//6.끝 번호
int endNum = startNum+pageScale-1;

//Dynamic Query에 의해서 구해진 시작번호와 끝번호를 VO에 넣는다.
brVO.setStartNum(startNum);
brVO.setEndNum(endNum);

try{
	List<OrderVO> orderList = opDAO.selectAllOrder(brVO);
	pageContext.setAttribute("orderList", orderList);
	pageContext.setAttribute("dlvyPrice", dlvyPrice);
	
}catch(SQLException se){
	se.printStackTrace();
}
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
			<strong>주문 리스트</strong>
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
		
		<form id="checkFrm">
		<div id="background_box">
			<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table id="order_list" class="table tableList">
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
					<th style="width:70px"></th>
					<th style="width:50px">No</th>
					<th style="width:200px">주문일시</th>
					<th id="ordNo" name="ordNo"  style="width:80px">주문번호</th>
					<th style="width:300px">상품명</th>
					<th style="width:50px">수량</th>
					<th style="width:100px">가격정보</th>
					<th style="width:100px">배송비</th>
					<th style="width:100px">주문상태</th>
					<th style="width:100px">주문자명</th>
					<th style="width:150px">총주문액</th>
				</tr>
				
				
				<c:if test="${ empty orderList }">
				<tr>
				<td colspan="11" style="text-align: center;">회원정보가 존재하지 않습니다</td>
				</tr>
				</c:if>
				
				<c:forEach var="order" items="${ orderList }" varStatus="i">
				
				<tr>
				<td><input type="checkbox" class="check" name="check" id="check" value="${ order.ord_dno }"></td> 
				 <td><c:out value="<%=startNum++ %>"/></td> 
				<td><c:out value="${ order.ord_date }"/></td>
				<td><c:out value="${ order.ordno }"/></td>
				<td><c:out value="${ order.gname }"/></td>
				<td><c:out value="${ order.amount }"/></td>
				<td><fmt:formatNumber value="${ order.price }" pattern='#,###,###'/></td>
				<td><fmt:formatNumber value="<%= dlvyPrice %>" pattern='#,###,###'/></td>
				<td>
				 <select name="statuslist" id="statuslist">
                <option value="PF"${ order.dlvy_pro eq 'PF'? " selected='selected'" : "" }  >결제완료 </option>
                <option value="D0"${ order.dlvy_pro eq 'D0'? " selected='selected'" : "" }  >배송중</option>
                <option value="DR"${ order.dlvy_pro eq 'DR'? " selected='selected'" : "" }  >배송준비</option>
                <option value="DF"${ order.dlvy_pro eq 'DF'? " selected='selected'" : "" }  >배송완료 </option>
            </select>  
				</td>
				<td><c:out value="${ order.name }"/></td>
				<c:set var="totalAmount" value="${order.price * order.amount  + dlvyPrice}" />
			 	<td><fmt:formatNumber value="${totalAmount}"  pattern='#,###,###'/></td> 
				</tr>
			
			</c:forEach>
			</table>
			</div>
		</div>
		</form>
		
		<c:if test="${ not empty orderList }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 			<%
 			BoardUtil util=BoardUtil.getInstance();
			BoardUtilVO buVO=new BoardUtilVO("orderManagement_order.jsp",keyword,field,currentPage,totalPage);
			out.println(util.pageNation(buVO));
 			%>
			</div>
		</div>
		</c:if>
		
		<input type="button" class="btn" id="btnChange"  value="변경"/>
		
		<%
			if(request.getParameter("keyword") != null) {
			out.print("<a href='orderManagement_order.jsp'><input type='button' id='btnList' value='목록' style='left:1060px; top:683px'/></a>");
			}
		%>
	</div>
</div>	
</body>
</html>