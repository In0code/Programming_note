<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 상품목록css -->
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
	<div class="flex pt-0 pb-16 bg-white lg:pt-8 lg:pb-20 mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<div class="w-full lg:-ms-9">
		<div class="flex">
		<h1 class="text-heading text-2xl font-bold hidden lg:inline-flex pb-1" style="padding-bottom:40px">검색 결과</h1>
		</div>
			<ul
				class="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-x-3 lg:gap-x-5 xl:gap-x-7 gap-y-3 xl:gap-y-5 2xl:gap-y-8 search-results">
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="카인다미 소프트핏 긴팔(라운드넥/브이넥) 일괄" href="/product/138794430"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="카인다미 소프트핏 긴팔(라운드넥/브이넥) 일괄" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/10/30/1698661530817dBG_q1YzK.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">카인다미 소프트핏 긴팔(라운드넥/브이넥) 일괄</h2>
							<div class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">15,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span class="text-sm text-gray-400 mx-1 hidden">|</span>
								<span class="text-sm text-gray-400">3분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="아웃도어 퍼 맨투맨 s" href="/product/143187459"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="아웃도어 퍼 맨투맨 s" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/26/1700978930073e2J_1g7Nh.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">아웃도어
								퍼 맨투맨 s</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">19,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400">신현동</span><span
									class="text-sm text-gray-400 mx-1">|</span><span
									class="text-sm text-gray-400">3분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="m&amp;m 뽀글이 맨투맨" href="/product/143191938"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="m&amp;m 뽀글이 맨투맨" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/26/1700980691847V4T_xiU2R.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">m&amp;m
								뽀글이 맨투맨</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">9,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400">신현동</span><span
									class="text-sm text-gray-400 mx-1">|</span><span
									class="text-sm text-gray-400">3분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a rel="sponsored noreferrer" target="_blank"
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col item-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product  bg-white"
					role="button" title="스트릿 체인 목걸이 티셔츠"
					href="https://adcr.naver.com/adcr?x=rLbBYXA0x6Dl5JhzmQdybf///w==kW6lTW651ngt3rq0PC9+IWuv3SV1YPTTJ8lDmv63opyvK/JV4+rD6rzg7f7DwkzpAHWUcQhwjH4hRpBKjxewqJ4B5eMIxFtdNII2en/2lRa4ItNr95gLaOxPpIChAh3rzXKMZKbRO14sh/Lx/p538MVlvv+QxMhRuGN1dBfZLQn9iIX3gn5g2xH1tR+L1//lO/IdMiXaXrFmJ7VIzUpf22vLrBq5ZixIibFzx3p22BC9gZ6uqorg+4UA4Ltx6fVQ/EBFHdFer8XbXo13bJu1fhqLOWp5/oeOnp5kpkSBvYlekPUGv7XOAh2iiAERTebeJjD8gA4I7CjHY1O0WutPg5z/QYRcQmpiQGLrPMhsQ8n3w1xaHK3vwgou3LK/0EhHWva4CzcDCI4rEGpkpbhyW41UPCkuBFMr1+Rk3e1RK1u50kO7KbDBzaUrWr7ylGYy5Fv7oph1qaRBUM4bX0582GzX3LSI2mlHovcq7rYYRGDsY1lfqfGSbGurSuXnoW7FS8NH92U5lK9A65GS6VEBlWmIrsy5SDrV8baQKRPFwEYjf0QvjXdX0ZgP6S2MmBpMmLl0k8djEhpDAcvfh9wc4VLYaDhTeceMFlwuhegtVGlKyI+5ztk2t99TF/Oh0QVBjcMlkZRLK3WDqArN6PWSky8rJY08fWEzCDfOUAfdkXrwwIxbNIPksV8SJzzMHxN5nGtXxq5T+XbtWZmF/6G/RFlWN2pnVJEiLQcdTGW4jxm3dWc8WsiK35eMNmRXj6a+uS3L3bKNX94P0z8LiaN8x9GaYgBCl7bQMYcB6xzppYbYj9JwlWoGZxVqPef2YU9RCFAna5j9TXCBDtwM3RW/9YGdWzGdzVSTCBRSxi/6AuNyi86MQAcljkjhh/tG3r9m6"><div
							class="flex relative overflow-hidden rounded-md pt-[100%] w-full mb-3 md:mb-3.5">
							<img alt="스트릿 체인 목걸이 티셔츠"
								src="https://shopping-phinf.pstatic.net/main_8697974/86979744546.jpg?type=f200"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover rounded-s-md w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-heading text-sm md:text-base">스트릿
								체인 목걸이 티셔츠</h2>
							<div
								class="font-semibold text-sm sm:text-base mt-1.5 space-s-2 lg:text-lg lg:mt-2.5
           text-heading">
								<span class="inline-block ">49,000원</span>
							</div>
							<div class="my-1">
								<span class="text-sm text-gray-400">aftercigarette</span><span
									class="text-sm text-gray-400 mx-1">|</span><span
									class="text-sm text-gray-400">광고</span>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="MSGM 티셔츠" href="/product/140807986"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="MSGM 티셔츠" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/11/1699701924317qPT_ZHDdY.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">MSGM
								티셔츠</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">35,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">4분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="LMC 엘엠씨 반팔 검정색 블랙 빨강색 레드 곰돌이" href="/product/143523168"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="LMC 엘엠씨 반팔 검정색 블랙 빨강색 레드 곰돌이"
								referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/28/1701152447318V4K_lGmyj.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">LMC
								엘엠씨 반팔 검정색 블랙 빨강색 레드 곰돌이</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">17,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400">진량읍</span><span
									class="text-sm text-gray-400 mx-1">|</span><span
									class="text-sm text-gray-400">10분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="나이키기모후드티" href="/product/141488967"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="나이키기모후드티" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/15/17000546358349fb_iB7HA.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">나이키기모후드티</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">45,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">13분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="남색 캐릭터 그려진 V넥 티셔츠" href="/product/141952638"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="남색 캐릭터 그려진 V넥 티셔츠" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/18/1700318995723B4F_R4wNS.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">남색
								캐릭터 그려진 V넥 티셔츠</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">7,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400">방화제2동</span><span
									class="text-sm text-gray-400 mx-1">|</span><span
									class="text-sm text-gray-400">14분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="마르디메크르디악티프 레이스 스웻셔츠(새상품)" href="/product/140516968"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="마르디메크르디악티프 레이스 스웻셔츠(새상품)" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/10/1699579819771k4i_8oqnm.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">마르디메크르디악티프
								레이스 스웻셔츠(새상품)</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">65,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400"></span><span
									class="text-sm text-gray-400 mx-1 hidden">|</span><span
									class="text-sm text-gray-400">18분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
				<li class=""><a
					class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="로맨틱크라운 반팔 흰색 화이트" href="/product/143521774"><div
							class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="로맨틱크라운 반팔 흰색 화이트" referrerpolicy="no-referrer"
								src="https://img2.joongna.com/media/original/2023/11/28/1701151937346vDG_HxQMq.jpg?impolicy=thumb&amp;size=150"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								loading="lazy"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">로맨틱크라운
								반팔 흰색 화이트</h2>
							<div
								class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">9,000원</div>
							<div class="my-1">
								<span class="text-sm text-gray-400">진량읍</span><span
									class="text-sm text-gray-400 mx-1">|</span><span
									class="text-sm text-gray-400">19분 전</span>
							</div>
							<div class="flex items-center">
								<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="mr-1">
									<rect y="-0.00012207" width="30" height="16.2857" rx="2.25"
										fill="#0DCC5A"></rect>
									<path
										d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
										fill="white"></path>
									<path
										d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
										fill="white"></path>
									<path
										d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
										fill="white"></path></svg>
							</div>
						</div></a></li>
			</ul>
			<div class="bottom-0 py-3 m-auto text-center bg-white">
				<ul class="flex justify-center space-x-2 space-x-reverse">
					<li class="w-4 mr-2"><a class="items-center hidden h-full"
						href="/search?category=1050&amp;page=0"><svg
								stroke="currentColor" fill="currentColor" stroke-width="0"
								viewBox="0 0 24 24" height="1em" width="1em"
								xmlns="http://www.w3.org/2000/svg">
								<path d="M15.41 16.09l-4.58-4.59 4.58-4.59L14 5.5l-6 6 6 6z"></path></svg></a></li>
					<li class="w-10 h-10 rounded-md shrink-0 bg-jngreen/80 text-white"><a
						class="block leading-10" href="/search?category=1050&amp;page=1">1</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=2">2</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=3">3</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=4">4</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=5">5</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=6">6</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=7">7</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=8">8</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=9">9</a></li>
					<li class="w-10 h-10 rounded-md shrink-0"><a
						class="block leading-10" href="/search?category=1050&amp;page=10">10</a></li>
					<li class="w-4 mr-2"><a class="items-center h-full flex"
						href="/search?category=1050&amp;page=2"><svg
								stroke="currentColor" fill="currentColor" stroke-width="0"
								viewBox="0 0 24 24" height="1em" width="1em"
								xmlns="http://www.w3.org/2000/svg">
								<path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z"></path></svg></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/common/cdn/footer.jsp"/> 
</html>