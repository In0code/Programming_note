<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<ul class="grid grid-cols-2 sm:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-x-3 lg:gap-x-5 xl:gap-x-7 gap-y-3 xl:gap-y-5 2xl:gap-y-8 search-results">
			
			<!-- 상품시작 -->
			<c:forEach var="product" items="${ requestScope.bigCate }">
			<li class="">
				<a class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					 href="goods/goods_info.do?pcode=${ product.pcode }">
					<div class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="" referrerpolicy="no-referrer"
								src="http://localhost/retro_prj/goods/images/${ product.img }"
								decoding="async" data-nimg="fill"
								class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
								style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
						</div>
						<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
							<h2 class="line-clamp-2 text-sm md:text-base text-heading">${ product.pname }</h2>
							<div class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5">﻿<fmt:formatNumber value="${product.price}" pattern="#,###,###"/>원</div>
							<div class="my-1">
						    <c:choose>
						        <c:when test="${not empty product.loc}">
						            <span class="text-sm text-gray-400">${ product.loc } |</span>
						        </c:when>
						        <c:otherwise>
						            <span class="text-sm text-gray-400">지역 정보 없음 |</span>
						        </c:otherwise>
						    </c:choose>
						    <span class="text-sm text-gray-400">5일 전</span>
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
						</div>
					</a>
				</li>
			</c:forEach>
		</ul>
		
			<div class="bottom-0 py-3 m-auto text-center bg-white">
				<ul class="flex justify-center space-x-2 space-x-reverse">
					<li class="w-4 mr-2"><a class="items-center hidden h-full"
						href="/search?category=1050&amp;page=0"><svg
								stroke="currentColor" fill="currentColor" stroke-width="0"
								viewBox="0 0 24 24" height="1em" width="1em"
								xmlns="http://www.w3.org/2000/svg">
								<path d="M15.41 16.09l-4.58-4.59 4.58-4.59L14 5.5l-6 6 6 6z"></path></svg></a></li>
					<li class="w-10 h-10 rounded-md shrink-0 bg-jngreen/80 text-white">
					 <a class="block leading-10" href="/search?category=1050&amp;page=1">1</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=2">2</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=3">3</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=4">4</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=5">5</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=6">6</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=7">7</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=8">8</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=9">9</a>
					</li>
					<li class="w-10 h-10 rounded-md shrink-0">
					 <a class="block leading-10" href="/search?category=1050&amp;page=10">10</a>
					</li>
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