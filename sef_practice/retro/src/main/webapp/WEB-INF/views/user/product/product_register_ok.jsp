<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>

<link rel="icon"
	href="http://192.168.10.137/mvc_prj/common/main/favicon.png">
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
<!-- header -->
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
	<div class="mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<section
			class="flex flex-col items-center justify-center flex-auto py-36">
			<div class="flex flex-col justify-center flex-grow w-full h-auto">
				<div class="w-20 h-20 mx-auto mb-2">
					<div aria-hidden="true">
						<svg xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512"
							width="512" height="512" preserveAspectRatio="xMidYMid meet"
							style="width: 100%; height: 100%; transform: translate3d(0px, 0px, 0px); content-visibility: visible;">
							<defs>
							<clipPath id="__lottie_element_114">
							<rect width="512" height="512" x="0" y="0"></rect></clipPath></defs>
							<g clip-path="url(#__lottie_element_114)">
							<g style="display: none;">
							<g>
							<path></path></g></g>
							<g
								transform="matrix(2.0630836486816406,0,0,2.0630836486816406,256,257.8599853515625)"
								opacity="0.018007111295155483" style="display: none;">
							<g opacity="1" transform="matrix(1,0,0,1,0,-3)">
							<path fill="rgb(194,241,213)" fill-opacity="1"
								d=" M0,-118 C65.12419891357422,-118 118,-65.12419891357422 118,0 C118,65.12419891357422 65.12419891357422,118 0,118 C-65.12419891357422,118 -118,65.12419891357422 -118,0 C-118,-65.12419891357422 -65.12419891357422,-118 0,-118z"></path>
							<path stroke-linecap="butt" stroke-linejoin="miter"
								fill-opacity="0" stroke-miterlimit="4" stroke="rgb(194,241,213)"
								stroke-opacity="1" stroke-width="2"
								d=" M0,-118 C65.12419891357422,-118 118,-65.12419891357422 118,0 C118,65.12419891357422 65.12419891357422,118 0,118 C-65.12419891357422,118 -118,65.12419891357422 -118,0 C-118,-65.12419891357422 -65.12419891357422,-118 0,-118z"></path></g></g>
							<g
								transform="matrix(1.4999990463256836,0,0,1.4999990463256836,256,257.8599853515625)"
								opacity="1" style="display: block;">
							<g opacity="1" transform="matrix(1,0,0,1,0,-3)">
							<path fill="rgb(13,204,89)" fill-opacity="1"
								d=" M0,-118 C65.12419891357422,-118 118,-65.12419891357422 118,0 C118,65.12419891357422 65.12419891357422,118 0,118 C-65.12419891357422,118 -118,65.12419891357422 -118,0 C-118,-65.12419891357422 -65.12419891357422,-118 0,-118z"></path></g></g>
							<g transform="matrix(1,0,0,1,256,256)" opacity="1"
								style="display: block;">
							<g opacity="1" transform="matrix(1,0,0,1,0,0)">
							<path stroke-linecap="round" stroke-linejoin="round"
								fill-opacity="0" stroke="rgb(255,255,255)" stroke-opacity="1"
								stroke-width="30"
								d=" M-82.5,4.5 C-82.5,4.5 -31,55 -31,55 C-31,55 73,-52.5 73,-52.5"></path></g></g></g></svg>
					</div>
				</div>
				<div class="w-full text-center">
					<p class="text-2xl font-semibold text-black">상품 등록 완료!</p>
				</div>
			</div>
			<div class="flex flex-col w-full px-5 mt-16 text-center">
				<a
					class="items-center justify-center py-4 mb-5 text-base font-semibold text-center transition duration-300 ease-in-out bg-white border border-solid rounded-md cursor-pointer text-jnGray-900 border-jnGray-400 hover:bg-jngreen hover:text-white"
					href="product_register.do">상품 추가 등록</a>
					<a
					class="items-center justify-center py-4 mb-5 text-base font-semibold text-center transition duration-300 ease-in-out bg-white border border-solid rounded-md cursor-pointer text-jnGray-900 border-jnGray-400 hover:bg-jngreen hover:text-white"
					href="product_detail.do">상품 등록 확인</a>
			</div>
		</section>
	</div>
		<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>