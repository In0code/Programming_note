<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/9caa514.css" />
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<style type="text/css">
#orderByList {
	display : none;
}

.btnStyle {
	border-radius: 10px;
	border: 1px solid #EEEFF0;
	font-size: 14px;
	font-weight: 600;
	width: 70px;
	padding: 10px;
	margin-left: 30px;
}

.end-0 {
    right: 0;
}

</style>

<script type="text/javascript">
	let flag = 'A';

	$(function() {
		salesAjax(flag);
	});//ready
	
function salesAjax(val) {
	flag = val;
	alert(flag);
		
	$.ajax({
		url:"user_sales.do",
		type:"GET",
		data:{flag:flag},
		dataType:"HTML",
		error: function(xhr){
			alert(xhr.status);
		},
		success: function(jsp){
			$("#salesOutupt").html(jsp);
		}
	});
}
	
function moveTo(val){
	alert(val);
}

</script>

</head>
<body style="height:auto">
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
			<div class="w-full flex-grow">
				<c:import url="/common/cdn/mypage_info.jsp" />
				<div class="px-0 max-lg:mt-10">
					<div class="items-center justify-between block mb-4 md:flex lg:mb-7">
						<div class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">
							2 개의 상품</div>
						<div class="flex flex-wrap items-center justify-between">
							<div class="mr-0 lg:mr-4">
								<ul class="colors flex flex-nowrap -me-3">
									<li id="all" onclick="salesAjax('A')" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black">
										전체
									</li>
									<li id="on" onclick="salesAjax('O')" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										판매중
									</li>
									<li id="fin" onclick="salesAjax('F')" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										판매완료
									</li>
								</ul>
							</div>
							<!-- <div class="relative my-2 sm:m-0 lg:ms-0 z-10 min-w-[160px]">
								<button class="border border-gray-300 text-heading text-xs md:text-sm font-semibold relative w-full py-2 ps-3 pe-10 text-start bg-white rounded-lg shadow-md focus:outline-none focus-visible:ring-2 focus-visible:ring-opacity-75 focus-visible:ring-white focus-visible:ring-offset-orange-300 focus-visible:ring-offset-2 focus-visible:border-indigo-500 sm:text-sm cursor-pointer"
									id="orderBy" type="button" aria-haspopup="listbox" style="border:1px solid #E6E6E6; text-align:left">
									<span class="block truncate">최신순</span>
									<span class="absolute inset-y-0 end-0 flex items-center pe-2 pointer-events-none">
									<svg stroke="currentColor" fill="none" stroke-width="0" viewBox="0 0 24 24" class="w-5 h-5 text-gray-400"
											aria-hidden="true" height="1em" width="1em"
											xmlns="http://www.w3.org/2000/svg">
									<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9l4-4 4 4m0 6l-4 4-4-4"></path></svg>
									</span>
								</button>
								<ul class="absolute w-full py-1 mt-1 overflow-auto bg-white rounded-md shadow-lg max-h-60 ring-1 ring-black ring-opacity-5 focus:outline-none text-xs md:text-sm"
									aria-labelledby="headlessui-listbox-button-:ra:"
									aria-orientation="vertical" id="orderByList" role="listbox" tabindex="0">
									<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4"
										id="headlessui-listbox-option-:r10:" role="option"
										tabindex="-1" aria-selected="false" data-headlessui-state="">
										<span class="font-normal block truncate">최신순</span>
									</li>
									<li class="text-gray-900  cursor-default select-none relative py-2 ps-10 pe-4"
										id="headlessui-listbox-option-:r11:" role="option"
										tabindex="-1" aria-selected="false" data-headlessui-state="">
										<span class="font-normal block truncate">낮은가격순</span>
									</li>
									<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4"
										id="headlessui-listbox-option-:r12:" role="option"
										tabindex="-1" aria-selected="false" data-headlessui-state="">
										<span class="font-normal block truncate">높은가격순</span>
									</li>
								</ul>
							</div> -->
						</div>
					</div>

					<!-- 판매내역 리스트 -->
					<div id="salesOutupt"></div>
					<!-- 판매내역 리스트 -->
					
						<div data-v-ef57988c="" class="v-portal" style="display: none;"></div>
					</div>
			</div>
		</div>
		<div class="Toastify"></div>
	</main>
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>