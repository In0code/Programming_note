<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon"
	href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Tailwind CSS CDN 추가 -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<!-- 판매자정보css -->
<link rel="preload" href="https://web.joongna.com/_next/static/css/d08446f8760abfc6.css" as="style"/>
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/d08446f8760abfc6.css" data-n-g=""/>
<link rel="preload" href="https://web.joongna.com/_next/static/css/a4ef56fda630c4e5.css" as="style"/>
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/a4ef56fda630c4e5.css" data-n-p=""/>
<link rel="preload" href="https://web.joongna.com/_next/static/css/e3048584c00a0406.css" as="style"/>
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/e3048584c00a0406.css"/>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
<style type="text/css">
</style>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="/common/cdn/header.jsp"/>
<div class="mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
	<div class="w-full flex-grow">
		<div class="block pb-4 lg:mt-6">
			<div
				class="lg:min-w-[800px] relative w-full h-full mb-4 col-span-2 text-black lg:flex lg:p-5 lg:border border-gray-300 rounded-lg">
				<div
					class="basis-1/2 flex flex-col justify-center mb-4 lg:mb-0 lg:pr-5 lg:border-r border-gray-300 lg:w-[50%]">
					<div class="flex items-center mb-4">
						<div class="flex items-center mr-3 translate-x-3">
							<img alt="profile-image"
								src="https://img2.joongna.com/media/original/2023/06/18/1687065226812LpT_t5lqh.jpg"
								width="60" height="60" decoding="async" data-nimg="1"
								class="rounded-full w-[48px] h-[48px] lg:w-[60px] lg:h-[60px] box-content border-4 border-white -translate-x-3"
								loading="lazy" style="color: transparent">
						</div>
						<h1 class="mr-2 text-xl font-semibold cursor-pointer lg:text-2xl">김언니</h1>
					</div>
					<div class="flex">
						<p class="w-[calc(100%-50px)] text-base text-jnGray-600 break-all">
							<span
								class="w-fit max-w-[calc(100%+1px)] block text-ellipsis overflow-hidden whitespace-nowrap">택배비
								3000원 반값택배 gs cu 둘다 가능</span>
						</p>
					</div>
				</div>
				<div class="relative w-full basis-1/2 lg:pl-5 lg:pt-3">
					<div class="flex justify-between mb-2 text-[#0CB650] font-medium">
						<strong>신뢰지수 <!-- -->0
						</strong><span class="text-jnGray-500">1,000</span>
					</div>
					<div class="w-full h-1.5 bg-[#CCF4DC] rounded overflow-hidden">
						<div style="width: 0%"
							class="h-full rounded bg-[#0DCC5A]"></div>
					</div>
					
					<ul class="flex justify-between mt-4 py-4 text-center text-jnGray-600 border border-gray-300 rounded-lg lg:border-none [&amp;_li]:w-full [&amp;_li]:border-r [&amp;_li]:border-gray-300">
						<li><dt class="justify-center mt-0">안전거래</dt>
							<dd class="text-xl font-semibold text-jnblack">3</dd></li>
						<li class="cursor-pointer"><dt class="justify-center mt-0">거래후기</dt>
							<a href="http://localhost/retro_prj/user/seller/seller_review.do">
							<dd class="text-xl font-semibold underline text-jnblack">13</dd></a></li>
						<li class="last:border-none"><dt class="justify-center mt-0">찜</dt>
							<dd class="text-xl font-semibold text-jnblack">34</dd></li>
					</ul>
					
				</div>
			</div>
			<button data-variant="slim"
				class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center placeholder-white focus-visible:outline-none focus:outline-none rounded-md h-11 md:h-12 px-5 py-2 transform-none normal-case hover:shadow-cart w-full xl:w-full bg-white hover:bg-white/90 text-jnblack hover:text-jnblack border-[1px] border-jnblack">채팅하기</button>
		</div>
		<!--$-->
		<div class="px-0">
			<div class="items-center justify-between block mb-4 md:flex lg:mb-7">
				<div
					class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">
					10
					<!-- -->
					개의 상품
				</div>
				<div class="flex flex-wrap items-center justify-between">
					<div class="mr-0 lg:mr-4">
						<ul class="colors flex flex-nowrap -me-3">
							<li id="allButton"
		                    class="shrink-0 cursor-pointer rounded-full border border-gray-100 p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
		                    전체</li>
		                	<li id="sellingButton"
		                    class="shrink-0 cursor-pointer rounded-full border border-gray-100 p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
		                    판매중</li>
		                	<li id="soldButton"
		                    class="shrink-0 cursor-pointer rounded-full border border-gray-100 p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
		                   	판매완료
		                   	</li>
						</ul>
					</div>
					
				</div>
			</div>
			<div
				class="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-x-3 lg:gap-x-5 xl:gap-x-7 gap-y-3 xl:gap-y-5 2xl:gap-y-8 ">
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="유희왕카드" href="/product/143530396"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="유희왕카드" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/28/1701155264229BXb_zbZRr.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">유희왕카드</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">10,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">46분 전</span>
							</div>
						</div></a>
				</div>
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="구김없는 오버핏 셔츠" href="/product/142239988"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="구김없는 오버핏 셔츠" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/20/1700474867185mIy_A75MZ.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">구김없는
								오버핏 셔츠</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">10,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">48분 전</span>
							</div>
						</div></a>
				</div>
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="디스커버리 마블런 엘리베이터 과학완구" href="/product/143095025"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="디스커버리 마블런 엘리베이터 과학완구" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/25/1700919154316E5d_DraAa.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">디스커버리
								마블런 엘리베이터 과학완구</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">15,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">54분 전</span>
							</div>
						</div></a>
				</div>
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="브이넥 티셔츠" href="/product/142240399"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="브이넥 티셔츠" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/20/1700474993605G4j_GieYX.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">브이넥
								티셔츠</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">10,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">54분 전</span>
							</div>
						</div></a>
				</div>
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="아디다스 빈티지 올드스쿨 바람막이 자켓 검흰 블랙 화이" href="/product/141901858"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="아디다스 빈티지 올드스쿨 바람막이 자켓 검흰 블랙 화이"
								referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/18/1700293860222PwL_8f3dQ.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">아디다스
								빈티지 올드스쿨 바람막이 자켓 검흰 블랙 화이</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">25,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">54분 전</span>
							</div>
						</div></a>
				</div>
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="MLB 청키라이너 아디다스 운동화 190 일괄" href="/product/142267220"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="MLB 청키라이너 아디다스 운동화 190 일괄" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/20/1700485814722tRF_2DKf1.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">MLB
								청키라이너 아디다스 운동화 190 일괄</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">20,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">1시간 전</span>
							</div>
						</div></a>
				</div>
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="모디무드 볼륨 브라렛 들뜸제로 팬티 세트" href="/product/143100322"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="모디무드 볼륨 브라렛 들뜸제로 팬티 세트" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/25/1700921845275Ujh_8q6VY.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">모디무드
								볼륨 브라렛 들뜸제로 팬티 세트</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">15,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">1시간 전</span>
							</div>
						</div></a>
				</div>
				<div class="relative">
					<a
						class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
						title="레오파드 미니스커트" href="/product/141902033"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="레오파드 미니스커트" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/18/1700293945825DaV_VqF4i.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">레오파드
								미니스커트</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">10,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">1시간 전</span>
							</div>
						</div></a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<jsp:include page="/common/cdn/footer.jsp"/>
</html>