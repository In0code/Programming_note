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
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
<main class="relative flex-grow border-b-2" style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
	<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
	
<c:import url="http://localhost/retro_prj/common/cdn/user_mypage_cdn.jsp"/>

		<div class="w-full flex-grow">
			<div class="block pb-4 lg:mt-6">
				<div class="lg:min-w-[800px] relative w-full h-full mb-4 col-span-2 text-black lg:flex lg:p-5 lg:border border-gray-300 rounded-lg">
					<div class="basis-1/2 flex flex-col justify-center mb-4 lg:mb-0 lg:pr-5 lg:border-r border-gray-300 lg:w-[50%]">
						<div class="flex items-center mb-4">
							<div class="flex items-center mr-3 translate-x-3">
								<img alt="profile-image" src="https://img2.joongna.com/common/Profile/Default/profile_m.png" width="60" height="60" decoding="async" data-nimg="1" class="rounded-full w-[48px] h-[48px] lg:w-[60px] lg:h-[60px] box-content border-4 border-white -translate-x-3" loading="lazy" style="color: transparent;">
							</div>
							<h1 class="mr-2 text-xl font-semibold cursor-pointer lg:text-2xl">중고나라#8621373</h1>
							<button type="button" aria-label="공유하기" class="text-jnGray-700">
								<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
									<g>
									<path fill="none" d="M0 0h24v24H0z"></path>
									<path d="M10 3v2H5v14h14v-5h2v6a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h6zm7.586 2H13V3h8v8h-2V6.414l-7 7L10.586 12l7-7z"></path></g></svg>
							</button>
						</div>
						<div class="flex">
							<p class="w-[calc(100%-50px)] text-base text-jnGray-600 break-all">
								<span class="w-fit max-w-[calc(100%+1px)] block text-ellipsis overflow-hidden whitespace-nowrap"></span>
							</p>
						</div>
					</div>
					<div class="relative w-full basis-1/2 lg:pl-5 lg:pt-3">
						<div class="flex justify-between mb-2 text-[#0CB650] font-medium">
							<strong>신뢰지수 234</strong><span class="text-jnGray-500">1,000</span>
						</div>
						<div class="w-full h-1.5 bg-[#CCF4DC] rounded overflow-hidden">
							<div class="h-full rounded bg-[#0DCC5A]" style="width: 23.4%;"></div>
						</div>
						<ul class="flex justify-between mt-4 py-4 text-center text-jnGray-600 border border-gray-300 rounded-lg lg:border-none [&amp;_li]:w-full [&amp;_li]:border-r [&amp;_li]:border-gray-300">
							<li><dt class="justify-center mt-0">구매</dt>
								<dd class="text-xl font-semibold text-jnblack">0</dd></li>
							<li class="cursor-pointer"><dt class="justify-center mt-0">판매</dt>
								<dd class="text-xl font-semibold text-jnblack">1</dd></li>
							<li class="last:border-none"><dt class="justify-center mt-0">거래후기</dt>
								<dd class="text-xl font-semibold underline text-jnblack">0</dd></li>
							<li class="last:border-none"><dt class="justify-center mt-0">
									찜<span class="-translate-y-[1px]"><div class="inline-block border-none" data-headlessui-state="">
											
										</div></span>
								</dt>
								<dd class="text-xl font-semibold text-jnblack">0</dd></li>
						</ul>
					</div>
				</div>
				
				
			</div>
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