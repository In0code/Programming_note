<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
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
	<c:choose>
		<c:when test="${ not empty requestScope.bigCate }">
			<c:forEach var="product" items="${ requestScope.bigCate }">
			<li class="">
				<a class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					 href="goods_info.do?pcode=${ product.pcode }">
					<div class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="" referrerpolicy="no-referrer"
								src="http://localhost/retro_prj/upload/${ product.img }"
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
							
						</div>
					</a>
				</li>
			</c:forEach>
		</c:when>	
		<c:when test="${ not empty requestScope.midCate }">
			<c:forEach var="product" items="${ requestScope.midCate }">
			<li class="">
				<a class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					 href="goods_info.do?pcode=${ product.pcode }">
					<div class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="" referrerpolicy="no-referrer"
								src="http://localhost/retro_prj/upload/${ product.img }"
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
							
						</div>
					</a>
				</li>
			</c:forEach>
		</c:when>
		<c:when test="${not empty requestScope.smallCate}">
			<c:forEach var="product" items="${ requestScope.smallCate }">
			<li class="">
				<a class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					 href="goods_info.do?pcode=${ product.pcode }">
					<div class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
							<img alt="" referrerpolicy="no-referrer"
								src="http://localhost/retro_prj/upload/${ product.img }"
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
							
						</div>
					</a>
				</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<div style="text-align: center; width: 1300px;">
			<img src="http://localhost/retro_prj/common/images/no.png" width="90px" style="left:46%; position: relative; margin-bottom:20px"/>
			<span>검색 결과가 없습니다.</span>
		</div>
		</c:otherwise>
	</c:choose>
		</ul>
			<div class="bottom-0 py-3 m-auto text-center bg-white">
				<ul class="flex justify-center space-x-2 space-x-reverse">
				
				<!-- 이전 페이지 링크 -->
				<c:if test="${ pageVO.prev }">
					<li class="w-4 mr-2"><a class="items-center h-full flex" 
					href="goods_search_by_text.do?searchText=${pageVO.searchText}&amp;pageNo=${ pageStart-1 }">
					<svg stroke="currentColor" fill="currentColor" stroke-width="0" 
					viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
					<path d="M15.41 16.09l-4.58-4.59 4.58-4.59L14 5.5l-6 6 6 6z"></path></svg></a>
					</li>
				</c:if>			
					
				<!-- 페이지 번호 링크 -->
				<c:forEach var="i" begin="1" end="${pageVO.totalPageNo}" step="1">     
					<li class="w-10 h-10 rounded-md shrink-0 bg-jngreen/80 text-white">
					 <a class="block leading-10" href="goods_search_by_text.do?searchText=${pageVO.searchText}&amp;pageNo=${i}">${i}</a>
					</li>
				</c:forEach>
					
				<!-- 다음 페이지 링크 -->
				<c:if test="${ pageVO.next }">
					<li class="w-4 mr-2">
					<a class="items-center h-full flex" 
					href="goods_search_by_text.do?searchText=${pageVO.searchText}&amp;pageNo=${ pageEnd + 1}">
					<svg stroke="currentColor" fill="currentColor" stroke-width="0" 
					viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
					<path d="M8.59 16.34l4.58-4.59-4.58-4.59L10 5.75l6 6-6 6z"></path></svg></a></li>
				</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/common/cdn/footer.jsp"/> 
</html>