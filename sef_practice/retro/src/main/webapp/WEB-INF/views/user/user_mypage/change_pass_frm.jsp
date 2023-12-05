<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css">
<style type="text/css">
#cancle:hover{
	background-color: black;
	color: white;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#changePw").click(function() {
			var oldPw = $("#oldPw").val();
			var newPw = $("#newPw").val();
			
			if(!check(oldPw) && !check(newPw)) {
				alert("2. oldPw :: "+oldPw+"\nnewPw :: "+newPw);
				$("#frm").submit();
				
			} else {
				alert("비밀번호를 입력해주세요!");
			}
		});
		
		$("#oldPw, #newPw").change(function(){
			var oldPw = $("#oldPw").val();
			var newPw = $("#newPw").val();
			
			if(!check(oldPw) && !check(newPw)) {
				$("#changePw").removeClass("disable");
				$(".input_box").removeClass("has_error");
				$("#changePw").prop("disabled", false);
				
			} else {
				$("#changePw").addClass("disable");
				$("#changePw").prop("disabled", true);
				$(".input_box").addClass("has_error");
			}
		});
		
		$("#cancle").click(function() {
			history.back();
		});
	});
	
function check(pass) {
	var flag = false;

    let number = pass.search(/[0-9]/g);
    let english = pass.search(/[a-z]/ig);
    let spece = pass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    if(pass == "") {
		flag = true;
	}

    var errMsg = "";
	/* "8자리 ~ 16자리 이내인지 확인." */
    if (pass.length < 8 || pass.length > 16) {
    	flag = true;
    	errMsg = "8~16자로 설정해주세요.";

	/* "비밀번호는 공백이 있는지 확인." */
    } else if (pass.search(/\s/) != -1) {
    	flag = true;
    	errMsg = "공백은 입력하실 수 없습니다.";

	/* "같은 문자를 4번 이상 있는 확인." */
    } else if (/(\w)\1\1\1/.test(pass)) {
    	flag = true;
    	errMsg = "똑같은 문자는 4번 이상 사용 불가능합니다.";

    } else {
    	flag = false;
    	errMsg = "";
    }
	
	$("#errMsg").html(errMsg);

	return flag;
}
</script>
</head>
<body>
<!-- header -->
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp" />
	
<main class="relative flex-grow border-b-2" style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
	<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<!-- mypage sidebar -->
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
		<div class="w-full flex-grow">
		<!-- 마이페이지 header -->
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_info.jsp" />
		
<!-- 코딩 시작 -->
<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify" style="text-align: center;">
<form id="frm" method="post" action="change_pw.do">
	<h5 data-v-cf6a6ef4="" data-v-8b96a82e="" class="title"><strong>비밀번호 변경</strong></h5>
	<div data-v-5ee806c3="" data-v-cf6a6ef4="" class="input_box"
		data-v-8b96a82e="">
		<h6 data-v-cf6a6ef4="" data-v-5ee806c3="" class="input_title" style="margin-right: 189px;">이전
			비밀번호</h6>
		<div data-v-5ee806c3="" class="input_item" style="max-width: 260px;margin: 0px auto;">
			<input data-v-5ee806c3="" type="password" maxlength="16" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt" id="oldPw" name="oldPw">
		</div>
	</div>
	<div data-v-5ee806c3="" data-v-cf6a6ef4="" class="input_box"
		data-v-8b96a82e="">
		<h6 data-v-cf6a6ef4="" data-v-5ee806c3="" class="input_title" style="margin-right: 200px;">새
			비밀번호</h6>
		<div data-v-5ee806c3="" class="input_item" style="max-width: 260px;margin: 0px auto;">
			<input data-v-5ee806c3="" type="password" maxlength="16" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="off" class="input_txt" id="newPw" name="newPw">
		</div>
		<p id="errMsg" data-v-cf6a6ef4="" data-v-5ee806c3="" class="input_error" style="left: 390px;"> </p>
	</div>
</form>
	<div data-v-cf6a6ef4="" data-v-8b96a82e="" class="modify_btn_box">
		<input id="cancle" value="취소" data-v-0a6aebaa="" data-v-cf6a6ef4="" type="button" class="btn outlinegrey medium" slot="button" data-v-8b96a82e="">
		<input id="changePw" value="저장" data-v-0a6aebaa="" data-v-cf6a6ef4="" disabled="disabled"  type="button" class="btn solid medium disable" slot="button" data-v-8b96a82e="">
	</div>
</div>
<!-- 코딩 끝 -->
</div>
</div>
</main>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
<!-- 내 정보 css 파일 -->
<link href="https://kream.co.kr/_nuxt/css/c9eea23.css" rel="stylesheet" type="text/css">
<link href="https://kream.co.kr/_nuxt/css/2e6b79f.css" rel="stylesheet" type="text/css">
</body>
</html>