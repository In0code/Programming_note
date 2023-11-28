<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../cdn/cdn.jsp"/>
<style type="text/css">
#selectOption {
	display: none;
}

div > ul > li:hover{
	background-color: #EEEFF0;
}
</style>

<script type="text/javascript">
$(function() {
	 $(document).on('click', function (event) {
         var selectOption = $("#selectOption");
         var selectBox = $("#selectBox");
         // 클릭된 영역이 selectBox 내부에 속하면 아무 동작하지 않음
         if (selectBox.is(event.target) || selectBox.has(event.target).length > 0) {
             return;
         }
         // 클릭된 영역이 selectOption 내부에 속하면 아무 동작하지 않음
         if (selectOption.is(event.target) || selectOption.has(event.target).length > 0) {
             return;
         }
         
         selectOption.hide();
     });
	
	$("#selectBox").click(function(){
		$("#selectOption").toggle();
	});
	
	$("#selectList li").click(function() {
		$("#selectOption").toggle();
		var selectVal = $(this).attr("id");
		var selectTxt = "아이디";
		var placeholder = "영문, 숫자만 입력";
		var type = "text";
		
		if(selectVal == "phone"){
			selectTxt = "휴대폰번호";
			placeholder = "하이픈(-)없이 숫자만 입력";
			type = "number";
		}else if(selectVal == "email") {
			selectTxt = "이메일"
			placeholder = "영문, 숫자, 특수문자만 입력";
		}
		
		$("#searchInfo").attr("type",type);
		$("#searchInfo").attr("placeholder",placeholder);
		$("#selectBox").val(selectTxt);
	});
	
	$("#searchFake").click(function(){
		
		$("#frm").submit();
	});
	
});//ready


function hideFrmValue(val) {
	$("#option").val(val);
}
</script>

</head>
<body style="font-family: Pretendard Variable">
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div
			class="max-w-[1280px] mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<h1 class="a11yHidden">RE:TRO 통합 사기 조회</h1>
			<div class="flex justify-center w-full border-b-2 text-jnblack">
				<div class="w-full py-10">
					<div class="flex items-center justify-between mt-2 pb-5 text-xl text-jnBlack">
						<h3 class="text-lg md:text-xl lg:text-2xl 2xl:text-3xl xl:leading-10 font-bold text-heading">
							RE:TRO 통합 사기 조회
						</h3>
					</div>
					<form id="frm" class="py-6 border-y-jnblack border-solid border-y h-[327px] flex flex-col justify-between" action="result.do">
						<p>
							판매자의 아이디, 휴대폰, 이메일로 피해 사례 조회를 이용해 보세요!
						</p>
						<div class="h-[133.5px]">

							<div class="relative mt-1 border border-[#DADEE5] rounded-md py-[2px]">
								<input type="button" readonly="readonly" class="relative w-full cursor-default rounded-lg bg-white px-[16px] lg:text-sm py-[12px] text-left shadow-md focus:outline-none focus-visible:border-indigo-500 focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-75 focus-visible:ring-offset-2 focus-visible:ring-offset-orange-300 sm:text-sm"
									id="selectBox" aria-haspopup="listbox" aria-expanded="false" style="font-weight:500; padding-left:22px"
									data-headlessui-state="" value="아이디"/>
								<input type="hidden" id="option" name="option" value="id"/>
									
									<span class="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
									<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" class="w-5 h-5 text-gray-400"
										aria-hidden="true" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
									<g><path fill="none" d="M0 0h24v24H0z"></path>
									<path d="M12 13.172l4.95-4.95 1.414 1.414L12 16 5.636 9.636 7.05 8.222z"></path></g>
									</svg></span>
								
								<!-- option 값 -->
								<div id="selectOption">
								<ul class="z-10 absolute mt-1 max-h-60 w-full overflow-auto rounded-md bg-white py-1 text-base shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none sm:text-sm"
									aria-labelledby="headlessui-listbox-button-:r8:" aria-orientation="vertical"
									id="selectList" role="listbox" tabindex="0" data-headlessui-state="open">
									<li class="relative cursor-default select-none py-2 pl-10 pr-4 text-gray-900"
										id="id" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
										onclick="hideFrmValue('id')">
										<span class="block truncate font-normal">아이디</span>
									</li>
									<li class="relative cursor-default select-none py-2 pl-10 pr-4 text-gray-900"
										id="phone" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
										onclick="hideFrmValue('phone')">
										<span class="block truncate font-normal">휴대폰번호</span>
									</li>
									<li class="relative cursor-default select-none py-2 pl-10 pr-4 text-gray-900"
										id="email" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
										onclick="hideFrmValue('email')">
										<span class="block truncate font-normal">이메일</span>
									</li>
								</ul>
								</div>
							</div>

							<div class="pt-2 flex gap-2 w-full justify-between align-middle">
								<div class="w-full">
									<input id="searchInfo" name="searchInfo" type="text" style="font-family:Pretendard Variable"
										placeholder="영문, 숫자만 입력"
										class="md:px-5 w-full appearance-none border text-input text-xs lg:text-sm font-body placeholder-body min-h-12 transition duration-200 ease-in-out border-gray-300 focus:shadow focus:bg-white focus:border-primary bg-white px-4 py-[13px] outline-0 rounded-md"
										autocomplete="off" spellcheck="false" aria-invalid="false">
								</div>
								<input type="button" data-variant="smoke" value="조회" id="searchFake"
									class="text-[13px] md:text-sm leading-4 inline-flex items-center transition ease-in-out duration-300 font-semibold font-body text-center justify-center border-0 border-transparent placeholder-white focus-visible:outline-none focus:outline-none rounded-md h-11 md:h-12 px-5 bg-gray-200 text-heading transform-none normal-case hover:bg-gray-300 py-3 w-20">
							</div>
						</div>
						<div>
							<p class="text-[13px]">(주)RE:TRO는 범죄 피해방지를 위해 해당 서비스를 운영하고
								있습니다. 피해 사례 결과에 대해 RE:TRO는 보증하지 않으며, 거래에 대한 법적 책임은 당사자에게 있습니다.</p>
						</div>
					</form>
					
					<div style="margin-top:10px">
					<a class="pt-4 text-[13px] font-semibold" href="https://ecrm.police.go.kr/sci/pcc_V3_send">
						경찰청 사이버 수사국 바로가기 &gt;
					</a>
					</div>
				</div>
			</div>
		</div>
		<div class="Toastify"></div>
	</main>
</body>
</html>