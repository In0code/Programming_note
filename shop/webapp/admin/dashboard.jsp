<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.DashboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty adminId }">
	<c:redirect url="http://localhost/prj_web_shopping/admin/login.jsp"/>
</c:if>
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
		int[] salesCnt = dbDAO.selectSalesStatus();
		pageContext.setAttribute("salesCnt", salesCnt);

		int[] productCnt = dbDAO.selectProductStatus();
		pageContext.setAttribute("productCnt", productCnt);
		
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
						<tr style="font-size:14px; height: 46px">
							<td>2023-10-20</td>
							<td>120</td>
							<td>561,500</td>
							<td>1636</td>
							<td>10</td>
						</tr>
						<tr style="font-size:14px; height: 46px">
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr style="font-size:14px; height: 46px">
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr style="font-size:14px; height: 46px">
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr style="font-size:14px; height: 46px">
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr class="total" style="font-size:14px; height: 46px">
							<td>합계</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
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
						<tr style="font-size:14px; height: 46px">
							<td>1분기</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr style="font-size:14px; height: 46px">
							<td>2분기</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr style="font-size:14px; height: 46px">
							<td>3분기</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr style="font-size:14px; height: 46px">
							<td>4분기</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr class="total" style="font-size:14px; height: 46px">
							<td>합계</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="visitDiv" class="dashboardBox" style="height: 465px; width: 504px">
			<span class="titleText">방문자 현황</span>
			<div class="innerDiv" style="width:504px;">
				<div style="height:355px">
  					<canvas id="myChart" style="padding:5px"></canvas>
				</div>
			</div>
		</div>
		
		<div id="sellDiv" class="dashboardBox" style="height: 465px; width: 505px">
			<span class="titleText">주요 상품 판매 현황</span>
			<div class="innerDiv" style="width:504px">
				<div style="height:355px">
  					<canvas id="myChart2"></canvas>
				</div>
			</div>
		</div>
	</div> <!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 --><!-- 여기까지가 코딩하는 div 영역 -->
</div>	

<!-- 차트 -->
<script>
 /*  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
	   type: 'bar',
	   data: {
	       datasets: [{
	           label: 'Bar Dataset',
	           data: [10, 20, 30, 40],
	           // this dataset is drawn below
	           order: 2
	       }, {
	           label: 'Line Dataset',
	           data: [10, 10, 10, 10],
	           type: 'line',
	           // this dataset is drawn on top
	           order: 1
	       }],
	       labels: ['January', 'February', 'March', 'April']
	   },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  }); */
 
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
                  40,10,20,30,15 //x축 label에 대응되는 데이터 값
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

/*                    두번째 차트                    */

var context2 = document.getElementById('myChart2').getContext('2d');
var myChart2 = new Chart(context2, {
  type: 'pie', // 차트의 형태
  data: { // 차트에 들어갈 데이터
      labels: [
          //x 축
          '6am', 'Noon', '3pm', '9pm', 'Midnight'
      ],
      datasets: [
          { //데이터
              label: '판매량', //차트 제목
              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
              data: [
                  21,19,25,20,23 //x축 label에 대응되는 데이터 값
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