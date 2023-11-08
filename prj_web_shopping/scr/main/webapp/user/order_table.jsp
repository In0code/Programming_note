<%@page import="java.util.List"%>
<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%>
<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="user.vo.ClientOrderPageVO"%>
<%@page import="user.vo.ClientOrderVO"%>
<%@page import="user.dao.ClientOrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../cdn/cdn.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:if test="${ empty sesId }">
	<c:redirect url="member/login.jsp"/>
</c:if> 
<%
String id = (String)session.getAttribute("sesId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733" />
<link rel="stylesheet" type="text/css" href="http://localhost/prj_web_shopping/user/member/mypage.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet" />
<title>주문내역</title>
</head>
<style type="text/css">

.pagenationDiv{
	position: absolute;
	top: 1030px;
	width: 95%;
	text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a{
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
.ec-base-table.typeList table {
    border-top: 1px solid #d7d5d5;
    border-bottom: 1px solid #d7d5d5;
}

.ec-base-table.typeList.gBorder tbody td {
    border-color: #d7d5d5;
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
/* 내가 만든 거 */
#fst{
margin-top: 170px;
min-height: 30px;
}
#sec{
}
#txtDiv{
padding: 20px 0px 20px 10px;
}
#thr{
}
.loc{
    position: relative;
    margin: 0 auto;
    width: 95%;
    max-width: 1200px;
    min-height: 700px;
    padding: 0 15px;
}
span{

}
th, td{
text-align: center;
}

.nav-link{
	color: #858585;
}

.nav-link.active, .nav-link:hover  {
	color: black;
}

.active {
	color: black;
}
.ahover:hover {
	background: #000000;
	color: #FFFFFF;
}
.ahover {
	border: 1px solid #000000;
	margin-top: 10px;
	padding: 5px;
	height: 15px;
}
</style>
<%
BoardDAO bDAO = BoardDAO.getInstance();
BoardRangeVO brVO = new BoardRangeVO();

brVO.setTableName("UORDER");

int totalCount = bDAO.totalCount(brVO);

int pageScale = 10;

int totalPage = (int)Math.ceil(totalCount / (double)pageScale); //페이지 수 가져오기

String tempPage = request.getParameter("currentPage"); //현재 페이지 가져오기
int currentPage = 1;
if(tempPage != null) {
	currentPage = Integer.parseInt(tempPage);
}

pageContext.setAttribute("totalPage", totalPage);
pageContext.setAttribute("currentPage", currentPage);

//5.시작 번호
int startNum = currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);

//6.끝 번호
int endNum = startNum+pageScale-1;
pageContext.setAttribute("endNum", endNum);

//Dynamic Query에 의해서 구해진 시작번호와 끝번호를 VO에 넣는다.
brVO.setStartNum(startNum);
brVO.setEndNum(endNum);
// pagenation end
%>
<script type="text/javascript">
	$(function() {
		
		var pageQuery = "&startNum="+${startNum}+"&endNum="+${endNum};
		
		$.ajax({
			url:"order_list_process.jsp",
			type:"get",
			data:"flag=o"+pageQuery,
			dataType:"json",
			error: function(xhr) {
				alert(xhr.status);
			},
			success: function(jsonObj) {
				display(jsonObj);
			}
		});
		
		$("#readOrder").click(function() {
			$.ajax({
				url:"order_list_process.jsp",
				type:"get",
				data:"flag=o"+pageQuery,
				dataType:"json",
				error: function(xhr) {
					alert(xhr.status);
				},
				success: function(jsonObj) {
					display(jsonObj);
				}
			});
			
		});
		
		$("#readRecall").click(function() {
			$.ajax({
				url:"order_list_process.jsp",
				type:"get",
				data:"flag=r"+pageQuery,
				dataType:"json",
				error: function(xhr) {
					alert(xhr.status);
				},
				success: function(jsonObj) {
					display(jsonObj);
				}
			});
		});
		
	});//load end
	
	function display(json) {
		var data = json.data;
		var output = "";
		var txt = "";
		var status = "";
		var temp = "";
		var review = "";
	
		for(var i = 0; i < json.dataSize; i++) {
			review = "";
			status = data[i].onProcess;
			switch (status) {
			case "D0": txt = "배송중"; break;
			case "DF": txt = "배송완료";
				review = "<br><a href='reviewpage.jsp?gcode="+data[i].gcode+"' class='ahover'>리뷰작성</a>"
				temp = "<a class='ahover' onclick='change("+data[i].ord_dno+")'>교환신청</a><br>";
				temp += "<a class='ahover' onclick='recall("+data[i].ord_dno+","+data[i].totalPrice+")'>반품신청</a><br>";
				temp += "<a class='ahover' onclick='cancel("+data[i].ord_dno+","+data[i].totalPrice+")'>주문취소</a>";
				break;
			case "DR": txt = "배송준비"; break;
			case "C0": txt = "교환신청"; temp = "-"; break;
			case "CF": txt = "교환완료"; temp = "-"; break;
			case "R0": txt = "반품신청"; temp = "-"; break;
			case "RF": txt = "반품완료"; temp = "-"; break;
			case "PF": txt = "결제완료"; 
				temp = "<a class='ahover' onclick='change("+data[i].ord_dno+")'>교환신청</a><br>";
				temp += "<a class='ahover' onclick='recall("+data[i].ord_dno+","+data[i].totalPrice+")'>반품신청</a><br>";
				temp += "<a class='ahover' onclick='cancel("+data[i].ord_dno+","+data[i].totalPrice+")'>주문취소</a>";
				break;
			default: txt = "-"; break;
			}
			output += "<tr><td>"+data[i].orderDate+"<br>["+data[i].orderNum+"]"+review+"</td>";
			output += "<td><img src='http://192.168.10.143/prj_web_shopping/upload/goods/"+data[i].img+"' width='100'></td>";
			output += "<td class='subject left txtBreak'><a href='order_detail.jsp?ordno="+data[i].orderNum+"&price="+data[i].price+"'>"+data[i].productName+"</a></td>";
			output += "<td>"+data[i].amount+"</td>";
			output += "<td>"+data[i].totalPrice+"원</td>";
			
			output += "<td>"+txt+"</td>";
			output += "<td>"+temp+"</td></tr>";
			
		}
		$("#output").html(output);
	}
	
	function detail(ordno) {
		window.location = "order_detail.jsp?ordno="+ordno+"&price="+price;
	}
	
	function cancel(ord_dno, price) {
		$.ajax({
			url:"order_cancel_process.jsp",
			type:"get",
			data:"ord_dno="+ord_dno+"&price="+price,
			dataType:"json",
			error: function(xhr) {
				alert("다시 시도해주세요");
			},
			success: function(json) {
				if(json.flag) {
					alert("취소신청 완료");
					location.reload();
				} else {
				alert("다시 시도해주세요");
				}
			}
		});
	}
	
	function recall(ord_dno, price) {
		$.ajax({
			url:"order_recall_process.jsp",
			type:"get",
			data:"ord_dno="+ord_dno+"&price="+price,
			dataType:"json",
			error: function(xhr) {
				alert("다시 시도해주세요");
			},
			success: function(json) {
				if(json.flag) {
					alert("반품신청 완료");
					location.reload();
				} else {
				alert("다시 시도해주세요");
				}
			}
		});
	}
	
	function change(ord_dno) {
		$.ajax({
			url:"order_change_process.jsp",
			type:"get",
			data:"ord_dno="+ord_dno,
			dataType:"json",
			error: function(xhr) {
				alert("다시 시도해주세요");
			},
			success: function(json) {
				if(json.flag) {
					alert("교환신청 완료");
					location.reload();
				} else {
				alert("다시 시도해주세요");
				}
			}
		});
	}
</script>
<body>
<!-- header -->
<%@ include file="layout/header.jsp"%>
<div id="sec" class="loc" style="margin-bottom: 200px">
		<div class="PageTop" style="margin-top:100px">
			<ul>
				<li class="xans-element- xans-layout xans-layout-statelogon left ">
					<span class="xans-member-var-name"></span>
<%-- 					<c:choose>
					<c:when test="${ empty sesId }">
					<a href="login.jsp"></a>
					</c:when>
					<c:otherwise> --%>
					<%

					%>
					<big><b><c:out value="${userData.name }"/></b></big><big>님</big>
<%-- 					</c:otherwise>
					</c:choose> --%>
				</li>
				<li class="right"><a href="member/mypage.jsp">마이페이지</a>
					<span> </span> <a href="order_table.jsp" class="select">주문내역조회</a> <span>
				</span> <a href="cart.jsp">장바구니</a></li>
			</ul>
		</div>
	<div id="thr">

 <ul class="nav nav-tabs" id="pills-tab" role="tablist"> 
      <li class="nav-item" role="presentation">
        <a class="nav-link active" id="readOrder" data-bs-toggle="pill" data-bs-target="#pills-home" aria-current="page" role="tab" aria-controls="pills-home" aria-selected="true">
        	주문내역조회</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="readRecall" data-bs-toggle="pill" data-bs-target="#pills-profile" aria-controls="pills-profile" aria-selected="false">
        	교환/반품조회</a>
      </li>
    </ul>

<div id="txtDiv">
		<ul type="circle">
			<li>주문정보를 클릭하시면 해당 주문에 대한 상세내역을 확인하실수 있습니다.</li>
			<li>취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다. </li>
		</ul>
</div>

<div class="tab-content" id="pills-tabContent" style="padding-left: 10px;padding-bottom: 10px;">
<!-- 주문내역조회 클릭 시 나오는 부분 -->
  <div class="tab-pane show active" id="pills-home" role="tabpanel" aria-labelledby="readOrder" tabindex="0"><strong>주문 상품 정보</strong></div>
<!-- 교환/반품조회 클릭 시 나오는 부분 -->
  <div class="tab-pane " id="pills-profile" role="tabpanel" aria-labelledby="readRecall" tabindex="0"><strong>교환/반품 상품 정보</strong></div>
</div>
<div class="ec-base-table typeList gBorder pad">
	<table  border="1" summary="" style="text-align:center; font-size:13px">
		<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
			<col style="width:120px;"/>
			<col style="width:70px;"/>
			<col style="width:300px;"/>
			<col style="width:100px;"/>
			<col style="width:100px;"/>
			<col style="width:100px;"/>
			<col style="width:100px;"/>
		</colgroup>
		<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
			<tr>
			<th scope="col">&ensp;주문 일자<br>[주문 번호]</th>
			<th scope="col">이미지</th>
			<th scope="col">상품 정보</th>
			<th scope="col">수량</th>
			<th scope="col">상품구매금액</th>
			<th scope="col">주문처리상태</th>
			<th scope="col">교환/반품/취소</th>
			</tr>
		</thead>
		<tbody id="output" class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
		<%-- <c:forEach var="" items="" varStatus=""> --%>
			
		<%-- </c:forEach> --%>
		</tbody>
	</table>
</div>
	</div>
	<div>
<!-- 페이지 이동 -->
<c:if test="${not empty noticeList}">
<!-- 페이지네이션 -->
		<div class="pagenationDiv">
			<div class="pagination">
 				<%
 					BoardUtil util = BoardUtil.getInstance();
 					BoardUtilVO buVO = new BoardUtilVO();
 					buVO.setUrl("order_table.jsp");
 					buVO.setCurrentPage(currentPage);
 					buVO.setTotalPage(totalPage);
 					
 					out.print(util.pageNation(buVO));
 				%>
			</div>
<input type="button" class="btnCss" value="등록" id="btnAdd" />
		</div>
</c:if>
</div>
</div>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>
</body>
</html>