<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/8ef8137d4e8264e4.css">
<link rel="stylesheet" href="https://web.joongna.com/_next/static/bJ7oyaYqN2wpRZw9j4F5K/_buildManifest.js">
<style type="text/css">
</style>
<script type="text/javascript">
	var comboBoxSortFlag = false;
	var comboBoxSortTxt = "최신순";
	
	$("#btn").val(comboBoxSortTxt);
	
	$(function() {
		
		$("#btn").click(function() {

			if(comboBoxSortFlag) {	
				$("#comboBoxSort").show();
				comboBoxSortFlag = !comboBoxSortFlag;
			} else {
				$("#comboBoxSort").hide();
				comboBoxSortFlag = !comboBoxSortFlag;
			}			
		});
		
		$("#all").click(function() {
			$("#liAllFrm").submit();
		});
		
		$("#onSale").click(function() {
			alert("판매중");
			$.ajax({
				url:"",
				type:"GET",
				data:param,
				dataType:"JSON",
				error:function(xhr) {
					alert(xhr.status);
				},
				success:function(jsonObj) {
					alert(jsonObj);
				}
		});
		
		$("#reservation").click(function() {
			alert("예약중");
			$.ajax({
				url:"",
				type:"GET",
				data:param,
				dataType:"JSON",
				error:function(xhr) {
					alert(xhr.status);
				},
				success:function(jsonObj) {
					alert(jsonObj);
				}
		});
		
		$("#completed").click(function() {
			alert("판매완료");
			$.ajax({
				url:"",
				type:"GET",
				data:param,
				dataType:"JSON",
				error:function(xhr) {
					alert(xhr.status);
				},
				success:function(jsonObj) {
					alert(jsonObj);
				}
		});
	});
	
function sortUp(txt) {
	comboBoxSortTxt = txt;
	$("#btn").val(comboBoxSortTxt);
	$("#comboBoxSort").hide();
	comboBoxSortFlag = !comboBoxSortFlag;
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
		
<!-- 판매한 /중인 /완료한 상품 보여주는 곳 시작 -->
<div class="px-0 max-lg:mt-10">
	<div class="items-center justify-between block mb-4 md:flex lg:mb-7">
		<div class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">1
			개의 상품</div>
		<div class="flex flex-wrap items-center justify-between">
			<div class="mr-0 lg:mr-4">
				<ul class="colors flex flex-nowrap -me-3">
				<form id="liAllFrm" action="user_mypage_frm.do" method="post">
					<li id="all" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black">전체</li>
				</form>
					<li id="onSale" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">판매중</li>
					<li id="reservation" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">예약중</li>
					<li id="completed" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">판매완료</li>
				</ul>
			</div>
			<div class="relative my-2 sm:m-0 lg:ms-0 z-10 min-w-[160px]">
				<input type="button" id="btn" value="최신순" class="border border-gray-300 text-heading text-xs md:text-sm font-semibold relative w-full py-2 ps-3 pe-10 text-start bg-white rounded-lg shadow-md focus:outline-none focus-visible:ring-2 focus-visible:ring-opacity-75 focus-visible:ring-white focus-visible:ring-offset-orange-300 focus-visible:ring-offset-2 focus-visible:border-indigo-500 sm:text-sm cursor-pointer" aria-haspopup="listbox" aria-expanded="true" data-headlessui-state="open" aria-controls="headlessui-listbox-options-:r15:">
					<!-- <span class="block truncate">최신순</span> -->
				<span class="absolute inset-y-0 end-0 flex items-center pe-2 pointer-events-none" style="margin-left: 135px;">
					<svg stroke="currentColor" fill="none" stroke-width="0" viewBox="0 0 24 24" class="w-5 h-5 text-gray-400" aria-hidden="true" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9l4-4 4 4m0 6l-4 4-4-4"></path>
					</svg>
				</span>
				<ul id="comboBoxSort" style="display: none;" class="absolute w-full py-1 mt-1 overflow-auto bg-white rounded-md shadow-lg max-h-60 ring-1 ring-black ring-opacity-5 focus:outline-none text-xs md:text-sm" aria-labelledby="headlessui-listbox-button-:rr:" aria-orientation="vertical" id="headlessui-listbox-options-:r15:" role="listbox" tabindex="0" data-headlessui-state="open">
					<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4" id="headlessui-listbox-option-:r16:" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
						onclick="sortUp('최신순')">
						<span class="font-normal block truncate">최신순</span>
					</li>
					<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4" id="headlessui-listbox-option-:r17:" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
						onclick="sortUp('낮은가격순')">
						<span class="font-normal block truncate">낮은가격순</span>
					</li>
					<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4" id="headlessui-listbox-option-:r18:" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
						onclick="sortUp('높은가격순')">
						<span class="font-normal block truncate">높은가격순</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-x-3 lg:gap-x-5 xl:gap-x-7 gap-y-3 xl:gap-y-5 2xl:gap-y-8 ">
		<div class="relative">
			<a class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white" title="예쁜 설인아" href="/product/144025736">
			<div class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
				<img alt="예쁜 설인아" referrerpolicy="no-referrer" src="http://192.168.10.143/mvc_prj/common/images/sia.jpg"
					decoding="async" data-nimg="fill" class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
					loading="lazy" style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
			</div>
			<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
				<h2 class="line-clamp-2 text-sm md:text-base text-heading">예쁜 설인아</h2>
				<div class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">가격측정 불가</div>
				<div class="my-1">
					<span class="text-sm text-gray-400">죽전1동</span>
					<span class="text-sm text-gray-400 mx-1">|</span>
					<span class="text-sm text-gray-400">19년 전</span>
				</div>
				<div class="flex items-center">
					<svg width="30" height="17" viewBox="0 0 30 17" fill="none" xmlns="http://www.w3.org/2000/svg" class="mr-1">
						<rect y="-0.00012207" width="30" height="16.2857" rx="2.25" fill="#0DCC5A"></rect>
						<path d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
							fill="white"></path>
						<path d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
							fill="white"></path>
						<path d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
							fill="white"></path>
					</svg>
				</div>
				</div>
			</a>
			<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="absolute w-6 h-6 cursor-pointer right-2 bottom-8"
				height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zm0-5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zm0-5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0z"
					clip-rule="evenodd"></path>
			</svg>
		</div>
	</div>
	<div class="py-8 text-center xl:pt-14"></div>
</div>
<!-- 판매한 /중인 /완료한 상품 보여주는 곳 끝 -->
</div>
</div>
</main>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>