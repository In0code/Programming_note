<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.vo.LoginVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../../cdn/cdn.jsp" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733"  />
<link rel="stylesheet" type="text/css" href="https://afterblow-scent.com/ind-script/optimizer_user.php?filename=tdRJbkMhDADQfei257BU9SY9gQHnYxUwwtDh9iHtVw4QYMmgZzDGECQRkDNdqSrgtVG1Ub6hdBvZmdBSBPVkPCkfGfST8zs4VUjieyRIlCxVuHL2hr2ppD22l7HhFZ6iI_5Kb2BR2f3FcZKS5JXi_8RKkdxlDOjSeYfaRGLjsoMOFLe4pY7qcFtyXPDgjI22ZBrtDtb21taW8EOWn015iFsSPHa5CfdOeWrIcQnyNqmgHbc0RUrf8onGAtXJI55d-oyRRm9mDVI-ApfC-ViqO8lfA2DJZfaRA6GfvvvZhIwSVhfu2A0&type=css&k=78f0afff0ea37d2d20206f5724686713838e28ef&t=1641537240&user=T"  />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet"/>
<style type="text/css">
#Header {
    position: relative;
    width: 100%;
    font-size: 16px;
    padding: 0px 33px 100px;
    background: #fff;
    border-bottom: 0px solid #fff;
 }
 #Footer {
    position: relative;
    padding: 0px 0px 120px 0;
    margin-top: 100px;
    border-top:0px solid #fff;
    background: #fff;
 }
</style>
<script type="text/javascript">
$(function(){
	
	$("#pass").on('input', function() {
        var id = $(this).val();
        var regex = /^[a-z0-9]*$/; // 영문자와 숫자만 허용
        if (!regex.test(id)) {
            alert("영문(소문자)과 숫자만 입력 가능합니다.");
            $(this).val(""); // 입력한 값 비움
            return;
        }
    });
	
	$("#btn").click(function(){
		
	//비밀번호 불일치했을때 알림팝업
	if (!compare_result()) {
		alert('비밀번호가 일치하지 않습니다.');
		return; 
	}
	
    // 입력값에 대한 유효성 검증을 통과했을 때, 회원가입 처리
    $("#frm").submit();
});//click

$("#pass, #pass2").on('input', function() {
	compare_result();
});

$("#btn2").click(function(){
    location.href = "http://localhost/prj_web_shopping/user/member/login.jsp";
});
		
});//ready

function compare_result() {
	var pw1 = $("#pass").val();
	var pw2 = $("#pass2").val();
	var $s_result = $("#s_result");

	if (pw1 === pw2 && pw1 !== "" && pw2 !== "") {
		$s_result.text("비밀번호가 일치합니다.");
		$s_result.css("color", "blue");
		return true;
	}

	$s_result.text("비밀번호가 일치하지 않습니다.");
	$s_result.css("color", "red"); 
	return false;
}

</script>

</head>
<body>

<%@ include file="../layout/header.jsp"%>

<form action="reset_pw_process.jsp" id="frm" name="frm" method="post">
<div class="xans-element- xans-member xans-member-findidresult ec-base-box typeThin">
		<div class="titleArea">
			<h2>비밀번호 재설정</h2>
			<ul>
				<li>
				비밀번호를 재설정 해주세요🙏
				</li>
			</ul>
		</div>
		<div class="ec-base-box typeMember gMessage">
			<div class="information">
				<div class="description" style="padding-left: 30px;">

		<ul class="ec-base-desc gSmall" style="margin-bottom:20px; margin-right:20px">
					<li>
                         <label for="pass"><strong>새 비밀번호</strong></label>
                        <input type="password" id=pass name="pass" maxlength="15">
					</li>	
                     <li>
                         <label for="pass2"><strong>새 비밀번호 확인</strong></label>
                        <input type="password" id=pass2 name="pass2" maxlength="15">
                        <br>
                        <span id="s_result" style="font-size: 8px;"></span>
                    </li> 
          </ul>

       			</div>
			</div>
		</div>
		<div class="ec-base-button gBlank20">
			<input type="button" id="btn" name="btn"  value="확인" class="btnSubmitFix sizeM " style="color:white;" />
			<input type="button" id="btn2" name="btn2" value="취소" class="btnEmFix sizeM "/>
		</div>
	</div>
	</form>

<%@ include file="../layout/footer.jsp"%>
</body>

</html>