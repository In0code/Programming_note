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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 판매자 후기 css -->
<link rel="stylesheet"
	href="https://web.joongna.com/_next/static/css/18a2ca6fa781bc2f.css"
	data-n-g="" />
<link rel="stylesheet"
	href="https://web.joongna.com/_next/static/css/a4ef56fda630c4e5.css"
	data-n-p="" />

<style type="text/css">
header {
	background: #707070;
	grid-area: header;
}

footer {
	background: #707070;
	grid-area: footer;
}

header, footer {
	padding: 70px;
	color: white;
	text-align: center;
	font-size: 40px;
}
hr{
	height:2px;
	background-color:black;
}
</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<header>header</header>
<body>
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
							<p
								class="w-[calc(100%-50px)] text-base text-jnGray-600 break-all">
								<span
									class="w-fit max-w-[calc(100%+1px)] block text-ellipsis overflow-hidden whitespace-nowrap">택배비
									3000원 반값택배 gs cu 둘다 가능</span>
							</p>
						</div>
					</div>
					<div class="relative w-full basis-1/2 lg:pl-5 lg:pt-3">
						<div class="flex justify-between mb-2 text-[#0CB650] font-medium">
							<strong>신뢰지수 651 </strong><span class="text-jnGray-500">1,000</span>
						</div>
						<div class="w-full h-1.5 bg-[#CCF4DC] rounded overflow-hidden">
							<div style="width: 65.10000000000001%"
								class="h-full rounded bg-[#0DCC5A]"></div>
						</div>
						<ul
							class="flex justify-between mt-4 py-4 text-center text-jnGray-600 border border-gray-300 rounded-lg lg:border-none [&amp;_li]:w-full [&amp;_li]:border-r [&amp;_li]:border-gray-300">
							<li><dt class="justify-center mt-0">안전거래</dt>
								<dd class="text-xl font-semibold text-jnblack">3</dd></li>
							<li class="cursor-pointer"><dt class="justify-center mt-0">거래후기</dt>
								<dd class="text-xl font-semibold underline text-jnblack">13</dd></li>
							<li class="last:border-none"><dt class="justify-center mt-0">찜</dt>
								<dd class="text-xl font-semibold text-jnblack">34</dd></li>
						</ul>
					</div>
				</div>
				<button data-variant="slim"
					class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center 
				placeholder-white focus-visible:outline-none focus:outline-none rounded-md h-11 md:h-12 px-5 py-2 transform-none normal-case hover:shadow-cart w-full xl:w-full bg-white hover:bg-white/90 
				text-jnblack hover:text-jnblack border-[1px] border-jnblack">채팅하기</button>
			</div>
		</div>
		<div>
			<section class="likeThis">
				<strong>이런점이 좋았어요</strong>
				<ul class="feedbackList">
					<li>친절/매너가 좋아요 <span class="feedbackCnt">13</span>
					</li>
					<li>응답이 빨라요 <span class="feedbackCnt">13</span>
					</li>
					<li>상품 상태가 좋아요 <span class="feedbackCnt">13</span>
					</li>
					<li>거래 시간을 잘 지켜요 <span class="feedbackCnt">13</span>
					</li>
				</ul>
			</section>
			<hr/>
			<section class="likeDetail">
				<strong>상세한 후기도 있어요 </strong><span class="feedbackDetailCnt">5</span>
				<ul class="feedbackDetail">
					
				</ul>
			</section>

		</div>
	</div>
</body>
<footer>footer</footer>
</html>