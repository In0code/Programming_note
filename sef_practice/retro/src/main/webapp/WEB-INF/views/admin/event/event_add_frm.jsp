<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/admin_cdn.jsp"/>

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
	padding: 0 10px;
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
	height: 287px;
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
    border: 1px solid #BEBEBE;
    cursor: pointer;
    height: 40px;
    margin: 3px 0px 0px 10px;
}

.filebox label:hover {
	background-color: white;
	color: #333;
	font-weight: 600;
  	transition: background-color 0.3s ease, color 0.3s ease, font-weight 0.3s ease;
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
	/* 데이트피커 */
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
	
	/* 로그아웃 */
	$("#btnLogout").click(function() {
		location.href="admin_logout_process.do";
	});
	
	/* 저장 */
	$("#saveBtn").click(function(){
		
		if(chkValue()){
			//1.폼 얻기
			var frm = $("#evtForm")[0];
			
			//2.ajax로 전송할 폼 객체 생성
			var formData = new FormData(frm);
			
			$.ajax({
				url: "eventAddProcess.do",
				type : "post",
				processData : false,
				contentType : false,
				data : formData,
				async : "false",
				dataType : "JSON",
				error : function(xhr) {
					console.log(xhr.status);
				},
				success : function(jsonObj) {
					if(jsonObj.uploadFlag){
						if(jsonObj.resultFlag){
							alert("이벤트가 등록되었습니다.");
							location.href="http://localhost/retro_prj/admin/event.do";
						}else {
							alert("서버에 문제가 발생하였습니다. 잠시후 다시 시도해주세요.");
						}
					}else{
						if(jsonObj.overFileimg != null && jsonObj.overFileimg2 != null){
							alert(jsonObj.overFileimg + ", " + jsonObj.overFileimg2 + "파일이 10MByte를 초과하여 업로드에 실패하였습니다.");
							return;
						}
						if(jsonObj.overFileimg != null){
							alert(jsonObj.overFileimg + "파일이 10MByte를 초과하여 업로드에 실패하였습니다.");
							return;
						}
						if(jsonObj.overFileimg2 != null){
							alert(jsonObj.overFileimg2 + "파일이 10MByte를 초과하여 업로드에 실패하였습니다.");
							return;
						}
					}
				}
			});
		}
	});
	
	/* 파일 값이 바뀌면 파일명을 보여주는 input 값이 바뀜 */
	$("#mainImg").on('change',function(){
		  var fileName = $("#mainImg").val();
		  var fileType = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
		  fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			
		  if(fileType != "" && fileType != ".jpg" && fileType != ".png" && fileType != ".jpeg") {
			  alert("jpg, jpeg, png 확장자만 가능합니다.");
			  $("#mainImg").val("");
			  fileName = "";
		  }
		  
		  $("#mainSrc").val(fileName);
	});

	$("#subImg").on('change',function(){
		  var fileName = $("#subImg").val();
		  var fileType = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
		  fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			
		  if(fileType != "" && fileType != ".jpg" && fileType != ".png" && fileType != ".jpeg") {
			  alert("jpg, jpeg, png 확장자만 가능합니다.");
			  $("#subImg").val("");
			  $("#thumSrc").val("");
			  
			  return;
		  }
		  
		  $("#thumSrc").val(fileName);
	});
	/* ------------------------------------ */
	
	/* 이미지 미리보기 */
	$("#mainImg").change(function(event) {
		if($("#mainImg").val() == ""){
			$("#thumbMain").attr("src","");
			return;
		}
        
		var file = event.target.files[0];
	    var reader = new FileReader(); 
	    
	    reader.onload = function(e) {
	    	$("#thumbMain").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});

	$("#subImg").change(function(event) {
		if($("#subImg").val() == ""){
			$("#thumbSub").attr("src","");
			return;
		}
        
		var file = event.target.files[0];
	    var reader = new FileReader(); 
	    
	    reader.onload = function(e) {
	    	$("#thumbSub").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});
	/* ------------------------------------ */

});

function chkValue() {
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
    // 정규식을 사용하여 날짜 형식 검사
    var dateFormatRegex = /^\d{4}-\d{2}-\d{2}$/;

    if (!dateFormatRegex.test(startDate)) {
      alert('시작 날짜를 확인해주세요.');
      $("#startDate").focus();
      $("#startDate").val("");
      return false;
    }
    
    if (!dateFormatRegex.test(endDate)) {
        alert('종료 날짜를 확인해주세요.');
        $("#endDate").focus();
        $("#endDate").val("");
        return false;
    }
	
	startDate = $("#startDate").val().split('-');
	endDate = $("#endDate").val().split('-');
	var title = $("#evtTitle").val();
	var subImg = $("#subImg").val();
	var mainImg = $("#mainImg").val();
	var context = $("#context").val();
	
	startDate = parseInt(startDate[0] + startDate[1] + startDate[2]);
	endDate = parseInt(endDate[0] + endDate[1] + endDate[2]);
	
	if(startDate-endDate > 0){
		alert("시작 날짜와 종료 날짜를 확인해주세요.");
		$("#startDate").focus();
		return false;
	}
	
	if(title.replace(/ /g,"") == ""){
		alert("제목을 입력해주세요.");
		$("#evtTitle").focus();
		return false;
	}
	
	if(context.replace(/ /g,"") == ""){
		$("#context").val("");
	}
	
	if(subImg == ""){
		alert("썸네일 이미지를 선택해주세요.");
		return false;
	}
	
	if(mainImg == ""){
		alert("메인 이미지를 선택해주세요.");
		return false;
	}
	
	return true;
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
				
				<form id="evtForm" action="eventAddProcess.do" method="POST">
				<input type="hidden" name="no" value="4"/>
				<input type="hidden" name="id" value="${ sessionScope.id }"/>
				<table class="table tableList" style="height: auto;">
				<tr>
					<th class="top_title">기간</th>
					<td colspan="2">
					<input type="text" id="startDate" name="start_date" class="dateCss borderCss" placeholder="시작 날짜" autocomplete="off">
				 	~
					<input type="text" id="endDate" name="end_date" class="dateCss borderCss" placeholder="종료 날짜" autocomplete="off">
					<div id="dateErr"></div>
					</td>
				</tr>
				<tr>
					<th class="top_title">제목</th>
					<td colspan="2"><input type="text" id="evtTitle" name="title" class="borderCss" style="width:100%;" placeholder="제목"></td>
				</tr>
				<tr>
					<th class="top_title">내용</th>
					<td colspan="2">
						<textarea style="width:100%; height:100px; margin: 7px 0px 5px 0px; padding:5px 10px; resize: none;" class="borderCss" name="context" id="context" placeholder="내용(선택)"></textarea>
					</td>
				</tr>
				<tr>
					<th class="top_title">이미지 첨부</th>
					<td colspan="2">
					<div class="filebox">
					    	<input class="upload-name" placeholder="썸네일" readonly="readonly" id="thumSrc" name="thumSrc">
    						<label for="subImg">파일찾기</label> 
    						<input type="file" id="subImg" name="img2">
					</div>
					<div class="filebox">
    						<input class="upload-name" placeholder="메인 이미지" readonly="readonly" id="mainSrc" name="mainSrc">
    						<label for="mainImg">파일찾기</label> 
    						<input type="file" id="mainImg" name="img">
					</div>
					</td>
				</tr>
 				<tr>
					<th class="top_title" style="border-bottom: none; height: 299px">이미지</th>
					<td style="border-bottom: none; padding:15px 10px 0px 10px; height: 299px; width: 629.8px">
						<span>썸네일</span>
						<div class="imgDiv" style="padding:10px">
							<img src="" id="thumbSub" class="imgThum"/>
						</div>
					</td>
					<td style="border-bottom: none; padding:15px 10px 0px 10px; height: 299px; width: 629.8px">
						<span>메인 이미지</span>
						<div class="imgDiv" style="padding:10px">
							<img src="" id="thumbMain" class="imgThum"/>
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