<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	max-width: 264px; 
	max-height: 264px;
}

.imgDiv {
	height: 290px;
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
    padding: 8px 18px;
    color: #fff;
    vertical-align: middle;
    background-color: #333;
    cursor: pointer;
    height: 40px;
    margin: 3px 0px 0px 10px;
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

    $("#thumbnail2").click(function(){
        toggleImageSize();
    });
	
	$("#mainImg").on('change',function(){
		alert("본문");
		  var fileName = $("#mainImg").val();
		  $("#mainSrc").val(fileName);
	});

	$("#subImg").on('change',function(){
			alert("썸");
		  var fileName = $("#subImg").val();
		  $("#thumSrc").val(fileName);
	});
	
	
	/* 본문 */
	$("#mainImg").change(function(event) {
		alert("본문");
		if($("#mainImg").val() == ""){
			alert("이미지를 선택해주세요.");
			return;
		}
		
		var thumbnail = document.getElementById('thumbMain');
        thumbnail.style.maxWidth = '264px';
        thumbnail.style.maxHeight = '264px';
        
		var file = event.target.files[0];
	    var reader = new FileReader(); 
	    
	    reader.onload = function(e) {
	    	$("#thumbMain").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});

	/* 썸네일 */
	$("#subImg").change(function(event) {
		alert("썸넬");
		if($("#subImg").val() == ""){
			alert("이미지를 선택해주세요.");
			return;
		}
		
		var thumbnail = document.getElementById('thumbSub');
        thumbnail.style.maxWidth = '264px';
        thumbnail.style.maxHeight = '264px';
        
		var file = event.target.files[0];
	    var reader = new FileReader(); 
	    
	    reader.onload = function(e) {
	    	$("#thumbSub").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});

});
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
		이벤트 상세
		</div>
		
		<div class="text" id="mainTitle">
			<strong>이벤트 상세</strong>
		</div>
		
		<!-- 테이블 -->
		<div id="background_box" style="height:140%">
				<div style="margin: 0 10px 0px 10px;">
				
				<form id="evtForm">
				<input type="hidden" name="no" value="4"/>
				<table class="table tableList" style="height: auto;">
				<tr>
					<th class="top_title">기간</th>
					<td colspan="2">
					<input type="text" id="startDate" name="start_date" class="dateCss borderCss" autocomplete="off" value="${ event.start_date }">
				 	~
					<input type="text" id="endDate" name="end_date" class="dateCss borderCss" autocomplete="off" value="${ event.end_date }">
					</td>
				</tr>
				<tr>
					<th class="top_title">제목</th>
					<td colspan="2"><input type="text" id="evtTitle" name="title" class="borderCss" style="width:100%;" value="${ event.title }"></td>
				</tr>
				<tr>
					<th class="top_title">내용</th>
					<td colspan="2">
						<textarea style="width:100%; height:120px; margin: 7px 0px 5px 0px; resize: none;" class="borderCss" name="context">${ event.context }</textarea>
					</td>
				</tr>
				<tr>
					<th class="top_title">이미지 첨부</th>
					<td colspan="2">
					<div class="filebox">
					    	<input class="upload-name" placeholder="썸네일" readonly="readonly" id="thumSrc" value="${ event.img2 }">
    						<label for="subImg">파일찾기</label> 
    						<input type="file" id="subImg" name="img2">
					</div>
					<div class="filebox">
    						<input class="upload-name" placeholder="본문 이미지" readonly="readonly" id="mainSrc" value="${ event.img }">
    						<label for="mainImg">파일찾기</label> 
    						<input type="file" id="mainImg" name="img">
					</div>
					</td>
				</tr>
 				<tr>
					<th class="top_title" style="border-bottom: none; height: 301px">이미지</th>
					<td style="border-bottom: none; padding:15px 10px 0px 10px; height: 301px; width: 629.8px">
						<div class="imgDiv" style="padding:10px">
							<img src="http://localhost/retro_prj/upload/${ event.img2 }" id="thumbSub" class="imgThum" alt="thumbnail"/>
						</div>
					</td>
					<td style="border-bottom: none; padding:15px 10px 0px 10px; height: 301px; width: 629.8px">
						<div class="imgDiv" style="padding:10px">
							<img src="http://localhost/retro_prj/upload/${ event.img }" id="thumbMain" class="imgThum" alt="main"/>
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
		<input type="button" class="btnCss" value="삭제" id="delBtn">	
		</div>
	</div>	
</div>
</body>
</html>