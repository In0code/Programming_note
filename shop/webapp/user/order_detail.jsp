<%@page import="java.sql.SQLException"%>
<%@page import="user.vo.DetailInfoVO"%>
<%@page import="user.dao.ClientOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../cdn/cdn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세</title>
</head>
<style type="text/css">
.ec-base-table.typeList table {
    border-top: 1px solid #d7d5d5;
}

.ec-base-table table {
    position: relative;
    margin: 10px 0 0;
    border: 1px solid #d7d5d5;
    border-top: 0;
}
tr, td{
  border-color: inherit;
  border-style: solid;
  border-width: 0;
}
/* mine */
#bg{
margin: 0px auto;
width: 60%;
margin-top: 60px;
margin-bottom: 60px;
}
#title{
text-align: center;
font-weight: bold;
font-size: 18px;
margin-bottom: 60px;
}
.pad{
margin-bottom: 35px;
}
.center{
margin: 0px auto;
}
tr{
background-color:#FFFFFF; color:#555555;"
}
td:nth-child(1) {
width: 150px;
}
input[type=button]{
border: 1px solid #333;
height: 40px;
width: 120px;
margin-top: 80px;
background: #FFF;
}
input:hover{
color: #FFF;
background: #333;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			alert("back");
		});
	});
</script>
<%
String ordno = request.getParameter("ordno");

ClientOrderDAO cDAO = ClientOrderDAO.getInstance();
try {
	DetailInfoVO diVO = cDAO.selectOneOrder(ordno);
	pageContext.setAttribute("diVO", diVO);
	
} catch(SQLException se) {
	se.printStackTrace();
}
%>
<body>
<!-- header -->
<div>
<%@ include file="layout/header.jsp" %>
</div>

<div id="bg">
<div id="title" class="center">
	<span>주문 상세 조회</span>
</div>
<div id="order" class="ec-base-table typeList gBorder pad">
	<span>주문 정보</span>
	<table border="1" summary="" style="font-size:13px">
		<tr>
			<td>주문 번호</td>
			<td>1234</td>
		</tr>
		<tr>
			<td>주문 일자</td>
			<td>2023-10-10 15:45:35</td>
		</tr>
		<tr>
			<td>주문자</td>
			<td>농담공탱이밤탱이</td>
		</tr>
		<tr>
			<td>주문처리상태</td>
			<td>결제완료</td>
		</tr>
	</table>
</div>
<div id="pay" class="ec-base-table typeList gBorder pad">
	<span>결제 정보</span>
	<table border="1" summary="" style="font-size:13px">
		<tr>
			<td style="border-bottom: 1px solid #333;">총 주문금액</td>
			<td style="border-bottom: 1px solid #333;">120,000원</td>
		</tr>
		<tr style="border: 1px solid #333;border-bottom: 0px;">
			<td>총 결제금액</td>
			<td>120,000원</td>
		</tr>
		<tr style="border: 1px solid #333;">
			<td style="border-bottom: 1px solid #333;">결제수단</td>
			<td style="border-bottom: 1px solid #333;">신용카드</td>
		</tr>
	</table>
</div>
<div id="goods" class="ec-base-table typeList gBorder pad">
	<span>주문 상품 정보</span>
	<table border="1" summary="" style="text-align:center; font-size:13px">
							<!-- 컬럼 사이즈 -->
           					<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
           						<col style="width:70px;"/>
								<col style="width:300px;"/>
								<col style="width:50px;"/>
								<col style="width:100px;"/>
								<col style="width:100px;"/>
								<col style="width:100px;"/>
								<col style="width:100px;"/>
							</colgroup>
							
							<!-- thead(컬럼명) -->
							<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							  <tr style=" ">
								<th scope="col">이미지</th>
                    			<th scope="col">상품정보</th>
                    			<th scope="col">수량</th>
                    			<th scope="col">판매가</th>
                    			<th scope="col">배송구분</th>
                    			<th scope="col">주문처리상태</th>
                    			<th scope="col">취소/교환/반품</th>
                			  </tr>
                			</thead>
                			
                			<!-- tbody(게시글 목록) -->
							<tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
							
							<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
								<td>image</td>
                    			<td class="subject left txtBreak">상품명</td>
                    			<td>1</td>
                    			<td>120,000원</td>
                    			<td>기본배송</td>
                    			<td>결제완료</td>
                    			<td>-</td>
                			</tr>
                			<tr>
                				<td colspan="7" style="text-align: right;padding-right: 20px;">상품구매금액 120,000 + 배송비 2,500 = 합계: 120,000원</td>
                			</tr>
							</tbody>
					</table>
</div>
<div id="dlvr" class="ec-base-table typeList gBorder pad">
	<span>배송지 정보</span>
	<table border="1" summary="" style="font-size:13px">
		<tr>
			<td>받으시는 분</td>
			<td>농담공탱이밤탱이</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>12345</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>서울시 강남구 역삼동 한독빌딩 8층 20003호</td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td>010-0000-0000</td>
		</tr>
	</table>
</div>
<div style="text-align: center;">
	<input type="button" id="btn" name="btn" value="목록">
</div>
</div>

<div>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>
</div>
</body>
</html>