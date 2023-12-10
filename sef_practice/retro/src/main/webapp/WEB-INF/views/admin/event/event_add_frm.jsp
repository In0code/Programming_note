<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 100%; 
	min-height: 500px;
	float: right;
	padding: 20px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 

.dateCss {
	font-family: Pretendard Variable;
	margin-right: 5px;
	width: 180px;
}

.borderCss{
	border: 1px solid #DBDFE6; 
	border-radius: 5px; 
	height: 30px;
}

.borderCss:focus {
	border: 1px solid #4D799B;
}

.tableList td {
	border-bottom: 1px solid #DEE2E6;
}

.tableList th {
	border-bottom: 1px solid #DEE2E6;
	padding: 10px;
	height: 60px;
}

.imgThum {
	max-width: 291px; 
	max-height: 291px;
}

.imgDiv {
	width: 100%;
	height: auto;
	border: 1px solid #DBDFE6; 
	border-radius: 5px; 
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.filebox .upload-name {
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    width: 60%;
    color: #999999;
    border: 1px solid #DBDFE6; 
	border-radius: 2px; 
	height: 30px;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #333;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

.upload-name:focus {
	outline:none;
}

textarea:focus{
	outline:none;
}
</style>
<!-- 태균이가 만든거 끝-->

<script type="text/javascript" src="http://localhost/retro_prj/common/datepicker/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost/retro_prj/common/datepicker/jquery-ui.css"/>

</head>
<body>
<%@ include file="../sidebar.jsp" %>
<script type="text/javascript">

$(function() {
	toggleImageSize();
	
	$("#thumnail").click(function(){
		toggleImageSize();
	});
	
	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
		});
	
	$(".dateCss").datepicker({ //JSON 형태 -> 이름:값, 이름:값,,,
		  dateFormat: 'yy-mm-dd',
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  yearSuffix: '년',
	      showOn: "both", // Display the datepicker when clicking the input field and the button
	      buttonImage: "http://localhost/retro_prj/common/images/icons/calendar.png",
	      buttonImageOnly: true,
	      buttonText: "Select date"
	});
	
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
	
	$("#saveBtn").click(function(){
		$("#evtForm").submit();
	});
	
	$("#file").change(function(event) {
		if($("#file").val() == ""){
			alert("이미지를 선택해주세요.");
			return;
		}
		
		var thumbnail = document.getElementById('thumnail');
        thumbnail.style.maxWidth = '291px';
        thumbnail.style.maxHeight = '291px';
        
		var file = event.target.files[0];
	    var reader = new FileReader(); 
	    
	    reader.onload = function(e) {
	    	$("#thumnail").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});

});

function toggleImageSize() {
    var thumbnail = document.getElementById('thumnail');

    if (thumbnail.style.maxWidth === '291px') {
        // 현재 이미지가 원본 크기라면 최대 크기 제한을 없애고, 테두리 스타일 변경
        thumbnail.style.maxWidth = '400px';
        thumbnail.style.maxHeight = '2000px';
    } else {
        // 현재 이미지가 최대 크기 제한이 없는 경우, 다시 최대 크기 제한을 설정하고, 테두리 스타일 초기화
        thumbnail.style.maxWidth = '291px';
        thumbnail.style.maxHeight = '291px';
    }
}
</script>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		<a href="http://localhost/retro_prj/admin/event.do">
		이벤트 관리
		</a>
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		이벤트 등록
		</div>
		
		<div class="text" id="mainTitle">
			<strong>이벤트 등록</strong>
		</div>
		
		<!-- 테이블 -->
		<div id="background_box" style="height:140%">
				<div style="margin: 0 10px 0px 10px;">
				
				<form id="evtForm">
				<input type="hidden" name="no" value="4"/>
				<table class="table tableList" style="height: auto; width: ">
				<tr>
					<th class="top_title">기간</th>
					<td>
					<input type="text" id="startDate" name="start_date" class="dateCss borderCss" autocomplete="off">
				 	~
					<input type="text" id="endDate" name="end_date" class="dateCss borderCss" autocomplete="off">
					</td>
				</tr>
				<tr>
					<th class="top_title">제목</th>
					<td><input type="text" id="evtTitle" name="title" class="borderCss" style="width:100%;"></td>
				</tr>
				<tr>
					<th class="top_title">내용</th>
					<td>
						<textarea style="width:100%; height:130px; margin: 7px 0px 5px 0px; resize: none;" class="borderCss" name="context"></textarea>
					</td>
				</tr>
				<tr>
					<th class="top_title">이미지 첨부</th>
					<td>
					<div class="filebox">
    						<input class="upload-name" placeholder="첨부파일" readonly="readonly">
    						<label for="file">파일찾기</label> 
    						<input type="file" id="file" name="img">
					</div>
					</td>
				</tr>
 				<tr>
					<th class="top_title" style="border-bottom: none; height: 305px">이미지</th>
					<td style="border-bottom: none; padding:15px 10px 0px 10px; height: 305px">
						<div class="imgDiv" style="padding:10px">
							<img src="http://localhost/retro_prj/upload/notice.png" id="thumnail" class="imgThum"/>
						</div>
					</td>
				</tr>
				</table>	
				</form>
			</div>
		</div>
		<!---->
		<div class="btnDiv">
		<input type="button" class="btnCss" value="저장" id="saveBtn">	
		</div>
	</div>	
</div>
</body>
</html>