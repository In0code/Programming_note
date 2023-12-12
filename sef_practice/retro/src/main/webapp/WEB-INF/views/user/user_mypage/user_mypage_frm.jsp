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
	
	$(document).ready(function() {
		all();
		
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
			changeCss(this);
			all();
		});
		
		$("#onSale").click(function() {
			changeCss(this);
			
			$.ajax({
				url:"mypage_prd_onsale.do",
				type:"POST",
				dataType:"HTML",
				error:function(xhr) {
					alert(xhr.status);
				},
				success:function(data) {
					var cnt = $("#totalPrd").val();
					$("#cntDiv").html(cnt+"개의 상품");
					$("#prdInfo").html(data);
				}
			});
		});
		
		$("#completed").click(function() {
			changeCss(this);
			
			$.ajax({
				url:"mypage_prd_completed.do",
				type:"POST",
				dataType:"HTML",
				error:function(xhr) {
					alert(xhr.status);
				},
				success:function(data) {
					var cnt = $("#totalPrd").val();
					$("#cntDiv").html(cnt+"개의 상품");
					$("#prdInfo").html(data);
				}
			});
		});
	});
	
function all() {
	$.ajax({
		url:"mypage_prd_all.do?",
		type:"POST",
		dataType:"HTML",
		error:function(xhr) {
			alert(xhr.status);
		},
		success:function(data) {
			var cnt = $("#totalPrd").val();
			$("#cntDiv").html(cnt+"개의 상품");
			$("#prdInfo").html(data);
		}
	});
}

function changeCss(obj) {
	var idName = $(obj).attr("id");
	
	if(idName == "all") {
		$("#all").addClass("border-black");
		$("#onSale").removeClass("border-black");
		$('#completed').removeClass("border-black");
	}
	if(idName == "onSale") {
		$("#onSale").addClass("border-black");
		$("#all").removeClass("border-black");
		$('#completed').removeClass("border-black");
	}
	if(idName == "completed") {
		$('#completed').addClass("border-black");
		$("#all").removeClass("border-black");
		$("#onSale").removeClass("border-black");
	}
	
}		
		
function outputPrd(data) {
	$("#prdInfo").html(data);
}

function sortUp(txt, flag) {
	$("#btn").val(txt);
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
<div class="block pb-4 lg:mt-6">
	<div class="lg:min-w-[800px] relative w-full h-full mb-4 col-span-2 text-black lg:flex lg:p-5 lg:border border-gray-300 rounded-lg">
		<div class="basis-1/2 flex flex-col justify-center mb-4 lg:mb-0 lg:pr-5 lg:border-r border-gray-300 lg:w-[50%]">
			<div class="flex items-center mb-4">
				<div class="flex items-center mr-3 translate-x-3">
					<img alt="profile-image"
						src="https://img2.joongna.com/common/Profile/Default/profile_f.png"
						width="60" height="60" decoding="async" data-nimg="1"
						class="rounded-full w-[48px] h-[48px] lg:w-[60px] lg:h-[60px] box-content border-4 border-white -translate-x-3"
						style="border: 4px solid #FFFFFF"
						loading="lazy" style="color: transparent;">
				</div>
				<h1 class="mr-2 text-xl font-semibold cursor-pointer lg:text-2xl">${sesId }</h1>
			</div>
			<div class="flex">
				<p class="w-[calc(100%-50px)] text-base text-jnGray-600 break-all">
					<span class="w-fit max-w-[calc(100%+1px)] block text-ellipsis overflow-hidden whitespace-nowrap"></span>
				</p>
			</div>
		</div>
		<div class="relative w-full basis-1/2 lg:pl-5 lg:pt-3">
			<div class="flex justify-between mb-2 text-[#0CB650] font-medium">
				<strong id="creditScr">신뢰지수 ${userInfo.credit_level }</strong><span class="text-jnGray-500">1,000</span>
			</div>
			<div class="w-full h-1.5 bg-[#CCF4DC] rounded overflow-hidden">
				<div id="creditBar" class="h-full rounded bg-[#0DCC5A]" style="width: ${userInfo.credit_level / 1000 * 100}%;"></div>
			</div>
			<ul class="flex justify-between mt-4 py-4 text-center text-jnGray-600 border border-gray-300 rounded-lg lg:border-none [&amp;_li]:w-full [&amp;_li]:border-r [&amp;_li]:border-gray-300">
				<li><dt class="justify-center mt-0">구매</dt>
					<dd id="buyDd" class="text-xl font-semibold text-jnblack">${userInfo.total_buyreceipt }</dd></li>
				<li class="cursor-pointer"><dt class="justify-center mt-0">판매</dt>
					<dd id="sellDd" class="text-xl font-semibold underline text-jnblack">${userInfo.total_product }</dd></li>
				<li class="last:border-none"><dt class="justify-center mt-0">찜</dt>
					<dd id="wishDd" class="text-xl font-semibold text-jnblack">${userInfo.total_wish }</dd></li>
				<li class="last:border-none"><dt class="justify-center mt-0">거래후기</dt>
					<dd id="hugiDd" class="text-xl font-semibold text-jnblack">${userInfo.total_buycomment }</dd></li>
			</ul>
		</div>
	</div>
</div>
		
<!-- 판매한 /중인 /완료한 상품 보여주는 곳 시작 -->
<div class="px-0 max-lg:mt-10">
	<div class="items-center justify-between block mb-4 md:flex lg:mb-7">
		<div id="cntDiv" class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">
		<!-- 개의 상품 정보 -->
		</div>
		<div class="flex flex-wrap items-center justify-between">
			<div class="mr-0 lg:mr-4">
				<ul class="colors flex flex-nowrap -me-3">
					<li id="all" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black">
						전체
					</li>
					<li id="onSale" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
						판매중
					</li>
					<li id="completed" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
						판매완료
					</li>
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
						onclick="sortUp('최신순', 'A')">
						<span class="font-normal block truncate">최신순</span>
					</li>
					<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4" id="headlessui-listbox-option-:r17:" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
						onclick="sortUp('낮은가격순', 'B')">
						<span class="font-normal block truncate">낮은가격순</span>
					</li>
					<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4" id="headlessui-listbox-option-:r18:" role="option" tabindex="-1" aria-selected="false" data-headlessui-state=""
						onclick="sortUp('높은가격순', 'C')">
						<span class="font-normal block truncate">높은가격순</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 보여지는 상품의 전체 틀 -->
	<div id="prdInfo" class="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-x-3 lg:gap-x-5 xl:gap-x-7 gap-y-3 xl:gap-y-5 2xl:gap-y-8 ">
		<!-- 보여지는 상품 하나의 영역 -->
		<!-- 보여지는 상품 하나의 영역 -->		
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