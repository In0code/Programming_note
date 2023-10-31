<%@page import="java.util.ArrayList"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="admin.vo.DashboardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.DashboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <c:if test="${ empty adminId }">
	<c:redirect url="http://localhost/prj_web_shopping/admin/login.jsp"/>
</c:if> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chérie Admin</title>
<link rel="icon" href="http://192.168.10.136/cherie_ysy_private/common/images/favicon.png">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.min.js" integrity="sha512-7U4rRB8aGAHGVad3u2jiC7GA5/1YhQcQjxKeaVms/bT66i3LVBMRcBI9KwABNWnxOSwulkuSXxZLGuyfvo7V1A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script> -->
<style type="text/css">
body{
 margin: 0px;
}
#wrap{
	
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
	font-family: Pretendard Medium;
	color: #353535;
}

#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 

.dashboardBox{
	overflow: auto;
	background-color:  #FFFFFF;
	color:  #333333;
	position: absolute;
	top: 46px;
	outline:  1px;
	box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
	border-radius: 9px;
}

.statusBox {
	height: 330px; width: 330px;
}

#saleDiv{
	left: 60px;
}

#returnDiv{
	left: 410px;
}

#productDiv{
	left: 760px;
}

#dateSummeryDiv{
	left: 1110px;
}

#siteSummeryDiv{
	left: 1110px;
	top: 464px;
}

#visitDiv {
	top: 396px;
	left: 60px;
}

#sellDiv {
	top: 396px;
	left: 584px;
}

.titleText {
	position: absolute;
	left: 22px;
	top: 18px;
	font-size: 18px;
}

.innerDiv {
	position: absolute;
	border-top: 2px solid #F0F0F0;
	width: 330px;
	top: 62px;
}

.grayBox {
	left:22px;
	top: 29px;
	position: absolute;
	background-color: #F3F3F3;
	border-radius: 9px;
	width: 85px;
	height: 95px;
}

.grayTitle {
	position: absolute;
	top: 60px;
	width: 85px;
	font-size: 14px;
	color: #464646;
	text-align: center;
}

.count {
	position: absolute;
	font-size: 26px;
	top: 14px;
	width: 85px;
	height: 65px;
	text-align: center;
}

.tableStyle {
	width: 450px; 
	height: 310px; 
	text-align: center;
}

th {
	padding: 10px 0px 10px;
	font-weight: 100;
	border-bottom: 2px solid #F0F0F0;
	color: #4A4A4A;
}

td {
	height: 46px;
	width: 57px;
}

tr {
	font-size: 14px;
}

tbody{
	font-size: 14px;
}

.total {
	border-top: 2px solid #F0F0F0;
}

.smallTh{
	width: 50px;
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
<%@ include file="sidebar.jsp" %>

<%
	DashboardDAO dbDAO = DashboardDAO.getInstance();
	try{
		//판매 현황
		// 결제완료 - PF / 배송준비 - DR / 배송중 - D0 / 배송완료 - DF
		// 교환신청 - C0 / 반품신청 - R0
		int[] salesCntArr = { dbDAO.selectSaleStatus("PF"), 
							  dbDAO.selectSaleStatus("DR"), 
							  dbDAO.selectSaleStatus("D0"),
							  dbDAO.selectSaleStatus("DF"), 
							  dbDAO.selectSaleStatus("C0"), 
							  dbDAO.selectSaleStatus("R0")};
		pageContext.setAttribute("salesCnt", salesCntArr);
		
		//상품 현황
		int[] productCntArr = { dbDAO.selectOnSale(), 
								dbDAO.selectSoldOut(), 
								dbDAO.selectUnderStock()};
		pageContext.setAttribute("productCnt", productCntArr);
		
		//방문자
		int[] visitCnt = { dbDAO.selectVisitCount(0),
				   		   dbDAO.selectVisitCount(1),
				   	  	   dbDAO.selectVisitCount(2),
				   		   dbDAO.selectVisitCount(3),
				   		   dbDAO.selectVisitCount(4)};
		pageContext.setAttribute("visitCnt", visitCnt);
		
		//방문자 대비 판매건수
		int[] visitSaleCnt = { dbDAO.selectVisitSale(0),
							   dbDAO.selectVisitSale(1),
							   dbDAO.selectVisitSale(2),
							   dbDAO.selectVisitSale(3),
							   dbDAO.selectVisitSale(4)};
		pageContext.setAttribute("visitSaleCnt", visitSaleCnt);
		
		//상품 판매 top5
		List<DashboardVO> topList = dbDAO.selectTopProducts();
		pageContext.setAttribute("topList", topList);
		
		//일일 요약
		List<DashboardVO> dailySummary = new ArrayList<DashboardVO>(); 
		DashboardVO dbVO = null;
		LocalDate date = LocalDate.now();
		
		int[] dailyTotal = {0, 0, 0, 0};

		for(int i=0; i<5; i++){
			//int sales, int signCnt, int visitCnt, int ordCnt
			dbVO = new DashboardVO(
					date.minus(i, ChronoUnit.DAYS).toString(),
					dbDAO.selectSummaryOrder(i),
					dbDAO.selectSummarySale(i),
					dbDAO.selectVisitCount(i),
					dbDAO.selectSummarySign(i));
			dailyTotal[0] += dbDAO.selectSummaryOrder(i);
			dailyTotal[1] += dbDAO.selectSummarySale(i);
			dailyTotal[2] += dbDAO.selectVisitCount(i);
			dailyTotal[3] += dbDAO.selectSummarySign(i);
			dailySummary.add(dbVO);
		}
		pageContext.setAttribute("dailySummary", dailySummary);
		pageContext.setAttribute("dailyTotal", dailyTotal);
		
		//분기별
		List<DashboardVO> quarterSummary = new ArrayList<DashboardVO>(); 
		int[] quarterTotal = {0, 0, 0, 0};
		for(int i=1; i<5; i++){
			
			//String date, int ordCnt, int sales, int visitCnt, int signCnt
			dbVO = new DashboardVO(
					i+"분기",
					dbDAO.selectQuarterOrder(i),
					dbDAO.selectQuarterSale(i),
					dbDAO.selectQuarterVisit(i),
					dbDAO.selectQuarterSign(i));
			quarterTotal[0] += dbDAO.selectQuarterOrder(i);
			quarterTotal[1] += dbDAO.selectQuarterSale(i);
			quarterTotal[2] += dbDAO.selectQuarterVisit(i);
			quarterTotal[3] += dbDAO.selectQuarterSign(i);
			quarterSummary.add(dbVO);
		}
		pageContext.setAttribute("quarterSummary", quarterSummary);
		pageContext.setAttribute("quarterTotal", quarterTotal);
		
		
	}catch(SQLException se){
		se.printStackTrace();
	}
%>


<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
			<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody"> <!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 --><!-- 여기부터가 코딩하는 div 영역 -->
		<div id="saleDiv" class="dashboardBox statusBox">
			<span class="titleText">판매 현황</span>
			<div class="innerDiv">
					<div class="grayBox">
						<span class="count">${ salesCnt[0] }</span>
						<span class="grayTitle">결제 완료</span>
					</div>
					
					<div class="grayBox" style="left: 123px">
						<span class="count">${ salesCnt[1] }</span>
						<span class="grayTitle">배송 준비</span>
					</div>
					
					<div class="grayBox" style="left: 224px">
						<span class="count">${ salesCnt[2] }</span>
						<span class="grayTitle">배송 중</span>
					</div>
					
					<div class="grayBox" style="top: 140px">
						<span class="count">${ salesCnt[3] }</span>
						<span class="grayTitle">배송 완료</span>
					</div>
			</div>
		</div>
		
		<div id="returnDiv" class="dashboardBox statusBox">
			<span class="titleText">교환/반품 현황</span>
			<div class="innerDiv">
				<div class="grayBox">
					<span class="count">${ salesCnt[4] }</span>
						<span class="grayTitle">교환</span>
					</div>
					
					<div class="grayBox" style="left: 123px">
						<span class="count">${ salesCnt[5] }</span>
						<span class="grayTitle">반품</span>
					</div>
			</div>
		</div>

		<div id="productDiv" class="dashboardBox statusBox">
			<span class="titleText">상품 현황</span>
			<div class="innerDiv">
				<div class="grayBox">
					<span class="count"> ${ productCnt[0] } </span>
						<span class="grayTitle">판매 중</span>
					</div>
					
					<div class="grayBox" style="left: 123px">
						<span class="count">${ productCnt[1] }</span>
						<span class="grayTitle">품절</span>
					</div>
					
					<div class="grayBox" style="left: 224px">
						<span class="count">${ productCnt[2] }</span>
						<span class="grayTitle">재고 10개↓</span>
					</div>
			</div>
		</div>
		
		<div id="dateSummeryDiv" class="dashboardBox" style="height: 396px; width: 450px">
			<span class="titleText">일자별 요약</span>
			<div class="innerDiv" style="width:450px">
				<table class="table-light tableStyle">
					<thead>
						<tr>
							<th style="width: 68px">일자</th>
							<th>주문 수</th>
							<th>매출액</th>
							<th class="smallTh">방문</th>
							<th class="smallTh">가입</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="summary" items="${ dailySummary }">
						<tr style="font-size:14px; height: 46px">
							<td>${ summary.date }</td> <!-- 일자 -->
							<td><fmt:formatNumber value="${ summary.ordCnt }" pattern="#,###,###"/></td>		<!-- 주문수 -->
							<td><fmt:formatNumber value="${ summary.sales }" pattern="#,###,###"/></td>	<!-- 매출액 -->
							<td><fmt:formatNumber value="${ summary.visitCnt }" pattern="#,###,###"/></td>		<!-- 방문 -->
							<td><fmt:formatNumber value="${ summary.signCnt }" pattern="#,###,###"/></td>			<!-- 가입 -->
						</tr>
						</c:forEach>
						<tr class="total" style="font-size:14px; height: 46px">
							<td>합계</td>
							<td><fmt:formatNumber value="${ dailyTotal[0] }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ dailyTotal[1] }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ dailyTotal[2] }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ dailyTotal[3] }" pattern="#,###,###"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="siteSummeryDiv" class="dashboardBox" style="height: 396px; width: 450px">
			<span class="titleText">분기별 통계</span>
			<div class="innerDiv" style="width:450px">
				<table class="table-light tableStyle">
					<thead>
						<tr>
							<th>분기</th>
							<th>주문 수</th>
							<th>매출액</th>
							<th class="smallTh">방문</th>
							<th class="smallTh">가입</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="summary" items="${ quarterSummary }">
						<tr style="font-size:14px; height: 46px">
							<td>${ summary.date }</td>
							<td><fmt:formatNumber value="${ summary.ordCnt }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ summary.sales }" pattern="#,###,###"/></td>	
							<td><fmt:formatNumber value="${ summary.visitCnt }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ summary.signCnt }" pattern="#,###,###"/></td>
						</tr>
						</c:forEach>
						<tr class="total" style="font-size:14px; height: 46px">
							<td>합계</td>
							<td><fmt:formatNumber value="${ quarterTotal[0] }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ quarterTotal[1] }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ quarterTotal[2] }" pattern="#,###,###"/></td>
							<td><fmt:formatNumber value="${ quarterTotal[3] }" pattern="#,###,###"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="visitDiv" class="dashboardBox" style="height: 465px; width: 504px">
			<span class="titleText">방문자 대비 판매 현황</span>
			<div class="innerDiv" style="width:504px;">
				<div style="height:355px">
  					<canvas id="myChart" style="padding:5px"></canvas>
				</div>
			</div>
		</div>
		
		<div id="sellDiv" class="dashboardBox" style="height: 465px; width: 505px">
			<span class="titleText">상품 판매 TOP 5</span>
			<div class="innerDiv" style="width:504px">
				<div style="height:355px">
  					<canvas id="myChart2"></canvas>
				</div>
			</div>
		</div>
	</div> <!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 -->
</div>	

<!-- 차트 -->
<script type="text/javascript">
var date = new Date();
var month = date.getMonth() + 1;
var day = date.getDate();
var nowDate = month+"/"+day;

var context = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(context, {
  type: 'bar', // 차트의 형태
  data: { // 차트에 들어갈 데이터
      labels: [
          //x 축
          month+"/"+(day-4),
          month+"/"+(day-3),
          month+"/"+(day-2),
          month+"/"+(day-1), 
          nowDate
      ],
      datasets: [
          { //데이터
              label: '방문자', //차트 제목
              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
              data: [
                  ${visitCnt[4]},${visitCnt[3]},${visitCnt[2]},${visitCnt[1]},${visitCnt[0]} //x축 label에 대응되는 데이터 값
              ],
              backgroundColor: [
                  //색상
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  //경계선 색상
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1 //경계선 굵기
          }, 
           {
              label: '판매건 수',
              fill: false,
              data: [
            	  ${visitSaleCnt[4]}, ${visitSaleCnt[3]}, ${visitSaleCnt[2]},
            	  ${visitSaleCnt[1]}, ${visitSaleCnt[0]}
              ],
              type: 'line',
              borderColor: 'rgb(255,192,203)'
          } 
      ]
  },
  options: {
	  responsive: true,
	  maintainAspectRatio: false,
      scales: {
          yAxes: [
              {
                  ticks: {
                      beginAtZero: true
                  }
              }
          ]
      }
  }
});


/*                    두번째 차트                    */
var context2 = document.getElementById('myChart2').getContext('2d');
var myChart2 = new Chart(context2, {
  type: 'doughnut', // 차트의 형태
  data: { // 차트에 들어갈 데이터
      labels: [
          //x 축
			/* '${topName0}', '${topName1}', '${topName2}', '${topName3}', '${topName4}' */
			'${topList.get(0).gname}', '${topList.get(1).gname}',
			'${topList.get(2).gname}', '${topList.get(3).gname}',
			'${topList.get(4).gname}'
      ],
      datasets: [
          { //데이터
              label: '판매량', //차트 제목
              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
              data: [
            	//x축 label에 대응되는 데이터 값
                  ${topList.get(0).amount}, ${topList.get(1).amount}, 
                  ${topList.get(2).amount}, ${topList.get(3).amount}, 
                  ${topList.get(4).amount}
              ],
              backgroundColor: [
                  //색상
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  //경계선 색상
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1 //경계선 굵기
          },/* 
          {
              label: 'test2',
              fill: false,
              data: [
                  8, 20, 12, 24, 30
              ],
              type: 'line',
              backgroundColor: 'rgb(157, 109, 12)',
              borderColor: 'rgb(157, 109, 12)'
          } */
      ]
  },
  options: {
	  responsive: true,
	  maintainAspectRatio: false,
      scales: {
          yAxes: [
              {
                  ticks: {
                      beginAtZero: true
                  }
              }
          ]
      }
  }
});
</script>

</body>
</html>