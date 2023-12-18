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
<!-- 판매자 후기 css -->
<link rel="preload" href="https://web.joongna.com/_next/static/css/d08446f8760abfc6.css" as="style"/>
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/d08446f8760abfc6.css" data-n-g=""/>
<link rel="preload" href="https://web.joongna.com/_next/static/css/a4ef56fda630c4e5.css" as="style"/>
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/a4ef56fda630c4e5.css" data-n-p=""/>
<link rel="preload" href="https://web.joongna.com/_next/static/css/e3048584c00a0406.css" as="style"/>
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/e3048584c00a0406.css"/>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
<style type="text/css">
.css-afxwf6 {
	padding: 32px 20px 24px;
}

section {
	display: block;
}

section {
	margin: 0px;
	border: 0px;
	font-weight: inherit;
	font-size: inherit;
	vertical-align: baseline;
	touch-action: pan-x pan-y;
}

.css-afxwf6 header {
	font-size: 18px;
	font-weight: 600;
	line-height: 25px;
	margin-bottom: 20px;
}

.css-afxwf6 .feedbackList li:not(:last-child) {
	margin-bottom: 20px;
}

.css-afxwf6 .feedbackList li {
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	-webkit-box-align: center;
	align-items: center;
	font-size: 14px;
	font-weight: 400;
	line-height: 20px;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

ul {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.css-wsqqvh {
	height: auto;
	transform: rotate(0deg);
}

*, :after, :before {
	box-sizing: border-box;
}

li {
	text-align: -webkit-match-parent;
}

li {
	margin: 0px;
	padding: 0px;
	border: 0px;
	vertical-align: baseline;
	touch-action: pan-x pan-y;
}

p {
	margin: 0px;
	padding: 0px;
	border: 0px;
	font-size: inherit;
	vertical-align: baseline;
	touch-action: pan-x pan-y;
}

.css-afxwf6 .feedbackList li .feedbackCntWrap p {
	font-weight: 500;
	color: rgb(120, 126, 137);
	margin-left: 2px;
}
.css-1mmbpdz header {
    font-size: 18px;
    font-weight: 600;
    line-height: 25px;
}
header {
    display: block;
    margin: 0px;
    padding: 0px;
    border: 0px;
    font-weight: inherit;
    font-size: inherit;
    vertical-align: baseline;
    touch-action: pan-x pan-y;
}
.css-1mmbpdz ul {
    padding: 20px 0px;
}
ul {
    list-style: none;
}
.css-4sj9kq::after {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0);
    top: 0px;
    left: 0px;
}
.css-ymvmvb .userInfoWrap {
    display: flex;
    margin-bottom: 12px;
    line-height: 20px;
    color: rgb(20, 19, 19);
}
.css-ymvmvb .userInfoWrap p {
    text-align: left;
}
p {
    margin: 0px;
    padding: 0px;
    border: 0px;
    font-weight: inherit;
    font-size: inherit;
    vertical-align: baseline;
    touch-action: pan-x pan-y;
}
.css-ymvmvb .userInfoWrap span {
    font-weight: 400;
    color: rgb(156, 163, 175);
}
span {
    margin: 0px;
    padding: 0px;
    border: 0px;
    font-size: inherit;
    vertical-align: baseline;
    touch-action: pan-x pan-y;
}
.css-8ex6zl {
    width: 100%;
    padding: 10px 12px;
    background-color: rgb(241, 244, 246);
    border-radius: 8px;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
    color: rgb(20, 19, 19);
    text-align: left;
    word-break: break-all;
    cursor: pointer;
}

.css-ymvmvb .profileImgWrap > div {
    border-radius: 100px;
}
img.css-sxxyvs {
	max-width:40px;
	border-radius: inherit;
}
</style>
<script type="text/javascript">
	$(function() {

	});//ready
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
			<section class="css-afxwf6">
				<header>이런점이 좋았어요</header>
				<ul class="feedbackList">
					<li><p>친절/매너가 좋아요.</p>
						<div class="feedbackCntWrap">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
								xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
								<path
									d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z"
									stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round"
									stroke-linejoin="round"></path></svg>
							<p>44</p>
						</div></li>
					<li><p>응답이 빨라요.</p>
						<div class="feedbackCntWrap">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
								xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
								<path
									d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z"
									stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round"
									stroke-linejoin="round"></path></svg>
							<p>39</p>
						</div></li>
					<li><p>상품 상태가 좋아요.</p>
						<div class="feedbackCntWrap">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
								xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
								<path
									d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z"
									stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round"
									stroke-linejoin="round"></path></svg>
							<p>41</p>
						</div></li>
					<li><p>택배 거래가 수월했어요.(포장, 협조적)</p>
						<div class="feedbackCntWrap">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
								xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
								<path
									d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z"
									stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round"
									stroke-linejoin="round"></path></svg>
							<p>34</p>
						</div></li>
					<li><p>거래 시간을 잘 지켜요.</p>
						<div class="feedbackCntWrap">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
								xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
								<path
									d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z"
									stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round"
									stroke-linejoin="round"></path></svg>
							<p>1</p>
						</div></li>
				</ul>
			</section>
			<div class="css-v41fzo"></div>
			<header>
				상세한 후기도 있어요<span>16</span>
			</header>
			<ul>
				<li class="css-ymvmvb"><button class="userInfoWrap">
						<div class="profileImgWrap">
							<div class="css-4sj9kq">
								<img
									src="https://img2.joongna.com/common/Profile/Default/profile_m.png"
									alt="231130000447955l_중고나라#7750392" width="1000" height="1000"
									referrerpolicy="no-referrer" class="css-sxxyvs">
							</div>
						</div>
						<div>
							<p>중고나라#7750392</p>
							<span class="infoContent">구매자</span> <span>2023-12-01</span>
						</div>
					</button>
					<button class="css-8ex6zl">
						<p>좋아용</p>
					</button></li>
				<li class="css-ymvmvb"><button class="userInfoWrap">
						<div class="profileImgWrap">
							<div class="css-4sj9kq">
								<img
									src="https://img2.joongna.com/common/Profile/Default/profile_f.png"
									alt="2310182334301575_용암동이유가" width="1000" height="1000"
									referrerpolicy="no-referrer" class="css-sxxyvs">
							</div>
						</div>
						<div>
							<p>용암동이유가</p>
							<span class="infoContent">구매자</span> <span>2023-10-18</span>
						</div>
					</button>
					<button class="css-8ex6zl">
						<p>감사해요</p>
					</button></li>
				<li class="css-ymvmvb"><button class="userInfoWrap">
						<div class="profileImgWrap">
							<div class="css-4sj9kq">
								<img
									src="https://img2.joongna.com/common/Profile/Default/profile_m.png"
									alt="230906052644572X_중고나라#7968506" width="1000" height="1000"
									referrerpolicy="no-referrer" class="css-sxxyvs">
							</div>
						</div>
						<div>
							<p>중고나라#7968506</p>
							<span class="infoContent">구매자</span><span>2023-09-08</span>
						</div>
					</button>
					<button class="css-8ex6zl">
						<p>
							의류 잘받았습니다<br>감사합니다^^
						</p>
					</button></li>
				<li class="css-ymvmvb"><button class="userInfoWrap">
						<div class="profileImgWrap">
							<div class="css-4sj9kq">
								<img
									src="https://img2.joongna.com/common/Profile/Default/profile_m.png"
									alt="230612121206984A_잘살아보자구유" width="1000" height="1000"
									referrerpolicy="no-referrer" class="css-sxxyvs">
							</div>
						</div>
						<div>
							<p>잘살아보자구유</p>
							<span class="infoContent">구매자</span><span>2023-06-14</span>
						</div>
					</button>
					<button class="css-8ex6zl">
						<p>
							좋은 옷으로 보내주셨어요~<br>감사합니다~
						</p>
					</button></li>
				<li class="css-ymvmvb"><button class="userInfoWrap">
						<div class="profileImgWrap">
							<div class="css-4sj9kq">
								<img
									src="https://img2.joongna.com/common/Profile/Default/profile_m.png"
									alt="230515204224140x_중고나라#7643623" width="1000" height="1000"
									referrerpolicy="no-referrer" class="css-sxxyvs">
							</div>
						</div>
						<div>
							<p>중고나라#7643623</p>
							<span class="infoContent">구매자</span><span>2023-05-17</span>
						</div>
					</button>
					<button class="css-8ex6zl">
						<p>포장도 이쁘게 해주시고 다음에 많이 팔아드릴게요</p>
					</button></li>
			</ul>


		</div>
	</div>
</body>
<jsp:include page="/common/cdn/footer.jsp"/>
</html>