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
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리-주문</title>
<jsp:include page="../cdn/admin_cdn.jsp"/>
<%
		////////////// 관리자 주문관리 ( 주문 ) - 인영 ////////////
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
		 if($(".check").prop("checked")){
			var ordno = $("#ordNo").val();
			var statusList = $("#statuslist").val();
			
			$("#list").submit();
		}else{
			alert("선택된 체크박스가 없습니다");
		} 
		 
		/*주문상태를 변경하고 변경 버튼을 누르면,
		체크박스가 checked된 행의 주문번호와 변경된 주문상태를 가져온다.
		불러온 주문번호와 주문상태를 form의 submit을 통해서 DAO에서 사용할 수 
		있게끔 order_process.jsp로 보낸다
		checked된 행은 여러 개 일수있으므로 하나씩 처리할 수 있게 for문으로 처리한다
		값을 넘기는 방법에는 ajax, queryString 등등이 있다
		
		*/
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



/* //JavaScript 함수로 checkbox의 선택 여부 확인
function isCheckboxChecked(checkboxId) {
    var checkbox = document.getElementById(checkboxId);
    if (checkbox) {
        return checkbox.checked;
    }
    return false;
}

// 예시: 주문번호가 123인 checkbox의 선택 여부 확인
var orderNo = 123;
var isChecked = isCheckboxChecked(orderNo);
console.log(isChecked); // 선택된 경우 true, 선택되지 않은 경우 false를 출력 */

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
	OrderProcessDAO opDAO=OrderProcessDAO.getInstance();
List<OrderVO> list=opDAO.selectAllOrder(brVO);

pageContext.setAttribute("orderList", list);
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
		
				<form id="list" action="order_process.jsp">
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
					<th style="width:200px">상품명</th>
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
				<td><input type="checkbox" class="check" name="order${ order.orderNo }"  value="${ order.orderNo }"></td> 
				 <td><c:out value="<%=startNum++ %>"/></td> 
				<td><c:out value="${ order.date }"/></td>
				<td><c:out value="${ order.orderNo }"/></td>
				<td><c:out value="${ order.productName }"/></td>
				<td><c:out value="${ order.amount }"/></td>
				<td><c:out value="${ order.price }"/></td>
				<td><c:out value="<%= deliveryPrice %>"/></td>
				<td>
				 <select name="statuslist" id="statuslist">
                <option value="PF"${ order.orderStatus eq 'PF'? " selected='selected'" : "" }  >결제완료 </option>
                <option value="D0"${ order.orderStatus eq 'D0'? " selected='selected'" : "" }  >배송중</option>
                <option value="DR"${ order.orderStatus eq 'DR'? " selected='selected'" : "" }  >배송준비</option>
                <option value="DF"${ order.orderStatus eq 'DF'? " selected='selected'" : "" }  >배송완료 </option>
            </select>  
				</td>
				<td><c:out value="${ order.userName }"/></td>
			 	<td><c:out value="${ order.price + deliveryPrice }"/></td> 
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
			<input type="button" class="btn" id="btnChange" value="변경"/>
		</form>
	<c:if test="${ not empty orderList }">
		<!-- 페이지네이션 -->
		<div class="pagenationDiv" style="width : 100px">
			<div class="pagination" >
 			<%
 			BoardUtil util=BoardUtil.getInstance();
			BoardUtilVO buVO=new BoardUtilVO("orderManagement_order.jsp",keyword,field,currentPage,totalPage);
			out.println(util.pageNation(buVO));
 			%>
			</div>
		</div>
		</c:if>
		
		<%
			if(request.getParameter("keyword") != null) {
			out.print("<a href='orderManagement_order.jsp'><input type='button' id='btnList' value='목록' style='left:1060px; top:683px'/></a>");
			}
		%>
	</div>
</div>	
</body>
</html>