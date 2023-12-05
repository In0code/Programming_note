<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<style type="text/css">
</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div
			class="flex justify-center text-jnblack border-b-2 w-full max-w-[1280px] mx-auto mt-15 box-content">
			<div
				class="fixed w-full bg-white pb-5 pt-2 sm:top-[80px] lg:top-[144px] xl:top-[160px] h-[160px] z-10 mx-auto px-6 md:px-8 2xl:px-16">
				<div
					class="flex items-center justify-between mt-2 text-jnBlack text-xl py-5 border-b border-jnblack border-solid mx-auto max-w-[1280px]">
					<h3
						class="text-lg md:text-xl lg:text-2xl 2xl:text-3xl xl:leading-10 font-bold text-heading">이벤트</h3>
				</div>
				<ul class="flex gap-6 py-5 max-w-[1280px] mx-auto">
					<li class="font-bold"><a href="/event/list?searchType=ING">진행중</a></li>
					<li class=""><a href="/event/list?searchType=END">종료</a></li>
				</ul>
			</div>
			
			<!-- 이벤트 목록 -->
			<div class="pb-10 w-full max-w-[1200px] max-[1200px]:px-6 mx-auto">
				<div class="pt-[160px]">
				
					<!-- 이벤트 시작 -->
					<ul class="md:py-[17px] grid grid-cols-2 gap-5 max-[600px]:block mx-auto md:px-8">
					
						<!-- 진열 시작 -->
						<li class="w-full aspect-[2.5]">
							<div class="relative h-full">
							
								<!-- 링크 -->
								<a class="w-full h-full aspect-[2.5] absolute" href="event/detail.do?evtcode=10">
								
									<!-- 이미지 -->
									<img alt="중고나라 에코마일" src="https://img2.joongna.com/media/original/2023/11/13/1699866394928.png"
									decoding="async" data-nimg="fill" class="rounded-md overflow-hidden" loading="lazy"
									style="position: absolute; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; color: transparent">
								</a>
							</div>
							<div class="flex justify-between w-full px-1 py-3 h-12">
							
								<!-- 시작/종료 날짜 -->
								<p class="text-[#666666]">
									2023-11-13
									~
									2024-01-14
								</p>
								
								<!-- D-DAY -->
								<p class="text-jngreen">D-48</p>
							</div>
						</li>
						<!-- 진열 끝 -->
						
						<li class="w-full aspect-[2.5]">
							<div class="relative h-full">
								<a class="w-full h-full aspect-[2.5] absolute" href="/event/detail/1108">
									<img alt="11월 결제 혜택 모아보기" src="https://img2.joongna.com/media/original/2023/11/01/1698820074139.png"
									decoding="async" data-nimg="fill" class="rounded-md overflow-hidden" loading="lazy"
									style="position: absolute; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; color: transparent"></a>
							</div>
							<div class="flex justify-between w-full px-1 py-3 h-12">
								<p class="text-[#666666]">
									2023-11-01
									<!-- -->
									~
									<!-- -->
									<!-- -->
									2023-11-30
								</p>
								<p class="text-jngreen">D-3</p>
							</div>
						</li>
						
						<li class="w-full aspect-[2.5]">
							<div class="relative h-full">
								<a class="w-full h-full aspect-[2.5] absolute" href="/event/detail/1096">
									<img alt="11월 첫결제 수수료 무료"
									src="https://img2.joongna.com/media/original/2023/10/26/1698315529276.png"
									decoding="async" data-nimg="fill" class="rounded-md overflow-hidden" loading="lazy"
									style="position: absolute; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; color: transparent"></a>
							</div>
							<div class="flex justify-between w-full px-1 py-3 h-12">
								<p class="text-[#666666]">
									2023-11-01
									<!-- -->
									~
									<!-- -->
									<!-- -->
									2023-11-30
								</p>
								<!-- D-DAY -->
								<p class="text-jngreen">D-3</p>
							</div>
						</li>
						
						<li class="w-full aspect-[2.5]">
							<div class="relative h-full">
								<a class="w-full h-full aspect-[2.5] absolute" href="/event/detail/1092">
									<img alt="11월 초특가 럭키드로우 START!"
									src="https://img2.joongna.com/media/original/2023/10/30/1698670574765.png"
									decoding="async" data-nimg="fill" class="rounded-md overflow-hidden" loading="lazy"
									style="position: absolute; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; color: transparent"></a>
							</div>
							<div class="flex justify-between w-full px-1 py-3 h-12">
								<p class="text-[#666666]">
									2023-11-01
									<!-- -->
									~
									<!-- -->
									<!-- -->
									2023-11-30
								</p>
								<p class="text-jngreen">D-3</p>
							</div>
						</li>
						
						<li class="w-full aspect-[2.5]">
							<div class="relative h-full">
								<a class="w-full h-full aspect-[2.5] absolute" href="/event/detail/1083">
									<img alt="세븐일레븐 편의점 택배 무료배송"
									src="https://img2.joongna.com/media/original/2023/10/04/1696383368536.png"
									decoding="async" data-nimg="fill" class="rounded-md overflow-hidden" loading="lazy"
									style="position: absolute; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; color: transparent"></a>
							</div>
							<div class="flex justify-between w-full px-1 py-3 h-12">
								<p class="text-[#666666]">
									2023-10-05
									<!-- -->
									~
									<!-- -->
									<!-- -->
									2023-12-31
								</p>
								<p class="text-jngreen">D-34</p>
							</div>
						</li>
						
						<li class="w-full aspect-[2.5]">
							<div class="relative h-full">
								<a class="w-full h-full aspect-[2.5] absolute" href="/event/detail/1038">
									<img alt="CU 알뜰택배 500원 무제한 할인"
									src="https://img2.joongna.com/media/original/2023/11/07/1699320239162.png"
									decoding="async" data-nimg="fill" class="rounded-md overflow-hidden" loading="lazy"
									style="position: absolute; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; color: transparent"></a>
							</div>
							<div class="flex justify-between w-full px-1 py-3 h-12">
								<p class="text-[#666666]">
									2023-09-01
									<!-- -->
									~
									<!-- -->
									<!-- -->
									2023-11-30
								</p>
								<p class="text-jngreen">D-3</p>
							</div>
						</li>
					</ul>
					<!-- 이벤트 끝 -->
					
					<div></div>
				</div>
			</div>
		</div>
		<div class="Toastify"></div>
	</main>
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>