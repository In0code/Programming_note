<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 태균이가 만든거 -->
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
}

/* 인영 - 주문관리 style  시작*/
#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 
#background_box1{
overflow: auto;
background-color:  #EEEEEE;
color:  #333333;
height: 150%; width: 150%;
position: absolute;
top: 100px; left: 60px;
outline:  0px;
/* box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px; */
/* box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px; */
border-radius: 5px;
}

.divsmall{background-color: #FFFFFF;
 width: 380px;
  height:80px;
   border-radius: 5px;
   box-shadow: rgb(204, 202, 202) 0px 1px 0px 0px;
   
}
.box2{
margin-left: 390px; margin-top: -80px;
}
#category_box{
margin-left: 790px; background-color: #FFFFFF; width:700px; height:395px; margin-top:-737px; border-radius: 5px; box-shadow: rgb(204, 202, 202) 0px 1px 0px 0px;
}
#visitor_trace_box{
width: 1490px; height:325px; background-color: #FFFFFF; margin-top: 15px; border-radius: 5px; box-shadow: rgb(204, 202, 202) 0px 1px 0px 0px;}

label{padding:13px 13px 6px 13px; font-weight: bold; margin-left: 5px}
</style>
<!-- 태균이가 만든거 끝-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
	$("#btnLogout2").click(function(){
		alert("1234");
	});
	$("#btnLogout").click(function(){
		
		location.href="admin_logout_process.do"; 
	});
});//ready

function getDate(num){
	var currentDate = new Date();

	currentDate.setDate(currentDate.getDate() - num);

	var year = currentDate.getFullYear();
	var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 두 자리로 포맷팅
	var day = String(currentDate.getDate()).padStart(2, '0'); // 날짜를 두 자리로 포맷팅

	var date = month + "/" + day;
	
	return date;
}
</script>



</head>
 <c:import url="/common/cdn/cdn.jsp" />
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<body>
 <%@ include file="sidebar.jsp" %> 
<div id="right">

	<div id="rightHeader" align="right">
	
		관리자<span style="font-weight: bold;margin-right: 20px"> <c:out value="${sessionScope.id}"/> 님</span>
		<input  type="button" id="btnLogout" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody" style="font-family:Pretendard Variable">
		<div class="text" id="mainTitle">
			<strong>대시보드</strong>
		</div>
		<div id="background_box1">
		<div id="evt_box" style="background-color: #FFFFFF; width: 770px; height:210px; border-radius: 5px;margin-top: 10px; box-shadow: rgb(204, 202, 202) 0px 1px 0px 0px;"><label style="font-size: 19px">이벤트</label>
		<div style="margin-left: 20px"><c:if test="${empty eventList}" ><span>진행 중인 이벤트가 없습니다.</span></c:if>
		<c:forEach var="evt" items="${eventList}" varStatus="i">
		<div style="padding:2px; font-size: 15px; font-weight: 500"><c:out value="${i.count}"/>. <c:out value="${evt.title}"/><div style="padding:3px; font-size: 12px; font-weight: 500">시작일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${evt.start_date}"/> 종료일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${evt.end_date}"/></div></div>
		
		
		 </c:forEach>
		
		</div>

		 </div>
		
		<div id="today_visitor_box" class="divsmall"  style="margin-top: 12px"><label>일일 방문자 수</label><div style="margin-left: 20px;">today: <c:out value="${requestScope.visitorCnt}"/></div></div>
		
		<div id="join_box" class="divsmall box2"  ><label>일일 가입자 수</label>
		 <div style="margin-left: 20px;">today: <c:out value="${requestScope.joinCnt}"/></div>
		</div>
		
		<div id="trade_box" class="divsmall" style="margin-top: 15px"><label>일일 신고 건 수</label>
		
		<div style="margin-left: 20px;">today: <c:out value="${requestScope.reportCnt}"/></div>
		  
		</div>
		<div id="report_box" class="divsmall box2"  ><label>일일 거래 건수</label>
		<div style="margin-left: 20px;">today: <c:out value="${requestScope.tradeCnt}"/></div>
		</div> 
		
		
		<div id="visitor_trace_box" ><label style="font-size: 19px">방문자 수 추이</label>
		<div style="height: 270px"><canvas id="myChart" style="padding:5px"></canvas></div>
		</div>
		
		
		<div id="category_box" ><label style="font-size: 19px" >상위 거래 카테고리</label>		<div style="height:300px; width:500px; margin: 0px auto">
  					<canvas id="myChart2"></canvas>
				</div></div>
		
		<div>
		</div>
		</div>
	</div>	
</div>
<script type="text/javascript">
var context = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(context, {
  type: 'bar', // 차트의 형태
  data: { // 차트에 들어갈 데이터
      labels: [
          //x 축
		  getDate(4),
		  getDate(3),
		  getDate(2),
		  getDate(1),
          getDate(0)
      ],
      datasets: [
          { //데이터
              label: '방문자', //차트 제목
              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
              data: [
                  ${visitorsList.get(4)},${visitorsList.get(3)},${visitorsList.get(2)},${visitorsList.get(1)},${visitorsList.get(0)} //x축 label에 대응되는 데이터 값
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

//-------------두번째 차트
var context2 = document.getElementById('myChart2').getContext('2d');
var myChart2 = new Chart(context2, {
  type: 'doughnut', // 차트의 형태
  data: { // 차트에 들어갈 데이터
      labels: [
          //x 축
			/* '${topName0}', '${topName1}', '${topName2}', '${topName3}', '${topName4}' */
			'${topList.get(0).category}', '${topList.get(1).category}',
			'${topList.get(2).category}', '${topList.get(3).category}',
			'${topList.get(4).category}'
      ],
      datasets: [
          { //데이터
              label: '판매량', //차트 제목
              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
              data: [
            	//x축 label에 대응되는 데이터 값
                  ${topList.get(0).total}, ${topList.get(1).total}, 
                  ${topList.get(2).total}, ${topList.get(3).total}, 
                  ${topList.get(4).total}
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