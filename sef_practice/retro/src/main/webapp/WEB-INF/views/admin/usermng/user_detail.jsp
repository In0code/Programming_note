<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="http://localhost/retro_prj/common/cdn/admin_cdn.jsp"/>
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

</style>
<!-- 태균이가 만든거 끝-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	$(function() {
	
		/* 정지 */
		$("#btnChangeStatus").click(function() {
	        var confirmDelete = confirm("정말로 "+$("#uid").val()+" 정지시키겠습니까?");
	        
	        if (confirmDelete) {
	        	changeAjax("user_status_change.do", $("#uid").val());
	        }//end if
	    });//click

	    /* 삭제 */
	    $("#btnWithdraw").click(function() {
	        var confirmDelete = confirm("정말로 "+$("#uid").val()+" 삭제시키겠습니까?");
	        
	        if (confirmDelete) {
	        	changeAjax("user_withdraw.do", $("#uid").val());
	        }//end if
	    });//click
		
	});//ready
	
function changeAjax(url, userId) {
	alert("userId :: "+userId+" / url ::"+url);
		
	$.ajax({
		url:url,
		type:"POST",
		data:{userId:userId},
		dataType:"JSON",
		error:function(xhr) {
			alert(xhr.status);
		},
		success:function(jsonObj) {
			if(jsonObj.flag) {
				alert("성공적으로 변경되었습니다.");
			} else {
				alert("다시 시도해주세요");
			}
		}
	});
}
	
</script>

</head>
<body>
	<%@ include file="../sidebar.jsp"%>
	<div id="right">
		<div id="rightHeader" align="right">
			<span style="font-weight: bold; margin-right: 20px">관리자님</span> 
			<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
		</div>
		<div id="rightBody">
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
		</svg>
		<a href="user_list.do">
		회원 리스트
		</a>
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
		</svg>
		회원 상세
		</div>
		
		
		<div class="text" id="mainTitle">
			<strong>회원 상세</strong>
		</div>
				<div id="background_box" style="height:140%; width:80%">
					<label style="position: absolute; top: 10px; left: 30px; font-size: 20px; color: #929492">회원
						상세 정보</label>
					<div style="position: absolute; top: 60px; left: 50px; width: 350px; height: 350px">
						<img id="test12" src="https://img2.joongna.com/common/Profile/Default/profile_f.png" style="width: 170px;height: 170px;border-radius: 24px;margin-left: 100px;margin-top: 45px;" name="mainImg__div">
							<!-- ../upload/ -->
					</div>
					<div style="position: absolute;top: 340px;left: 155px;font-size: 20px">
						<strong><label style="color: #929492">아이디</label></strong><br>
						<input id="uid" type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px;" value="${userData.id }" readonly="readonly">
					</div>

					<!-- 회원 상태 변경 -->
					<input id="btnChangeStatus" class="btn btn-outline-warning" type="button" value="회원 정지" style="position: absolute;top: 550px;left: 300px;font-size: 20px;">
					<input id="btnWithdraw" class="btn btn-outline-danger" type="button" value="회원 삭제" style="position: absolute;top: 550px;left: 160px;font-size: 20px;">

					<div style="position: absolute;top: 120px;left: 500px;font-size: 20px;width: 500px">
						<strong><label style="color: #929492">닉네임</label></strong><br>
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="${userData.nickname }" readonly="readonly">
					</div>
					<div style="position: absolute;top: 230px;left: 500px;font-size: 20px;width: 500px">
						<strong><label style="color: #929492">전화번호</label></strong><br>
						<c:set var="TextValue" value="${userData.phone }"/>
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="${fn:substring(TextValue,0,3)}-${fn:substring(TextValue,3,7)}-${fn:substring(TextValue,7,11)}" readonly="readonly">
					</div>
					<div style="position: absolute;top: 340px;left: 500px;font-size: 20px;width: 500px">
						<strong><label style="color: #929492">이메일</label></strong><br>
						
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="${userData.email }" readonly="readonly">
					</div>
					<div style="position: absolute;top: 450px;left: 500px;font-size: 20px;width: 500px">
						<strong><label style="color: #929492">가입일</label></strong><br>
						
							
							
							
								<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="${userData.input_date }" readonly="readonly">
							
						
					</div>
					<div style="position: absolute;top: 560px;left: 500px;font-size: 20px;width: 500px">
						<strong><label style="color: #929492">회원상태</label></strong><br>
						<input type="text" style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px" value="${userData.status }" readonly="readonly">
					</div>
					<!-- 상품 등록 상태가 '등록'일때만 '상품 삭제' 버튼 보여 줌 -->
					
				</div>
		</div>
		<!-- <input style="position: absolute; top: 830px; left: 1700px; padding:10px"type="button" id="addProduct" name="addProduct" value="상품 새로 등록하기" class="btn btn-outline-secondary" onclick="location.href='item_add.jsp'"> -->
	</div>
</body>
</html>