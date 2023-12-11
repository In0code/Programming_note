<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h1 class="mr-2 text-xl font-semibold cursor-pointer lg:text-2xl">중고나라#8626590</h1>
			</div>
			<div class="flex">
				<p class="w-[calc(100%-50px)] text-base text-jnGray-600 break-all">
					<span class="w-fit max-w-[calc(100%+1px)] block text-ellipsis overflow-hidden whitespace-nowrap"></span>
				</p>
			</div>
		</div>
		<div class="relative w-full basis-1/2 lg:pl-5 lg:pt-3">
			<div class="flex justify-between mb-2 text-[#0CB650] font-medium">
				<strong id="creditScr">신뢰지수 202</strong><span class="text-jnGray-500">1,000</span>
			</div>
			<div class="w-full h-1.5 bg-[#CCF4DC] rounded overflow-hidden">
				<div id="creditBar" class="h-full rounded bg-[#0DCC5A]" style="width: 20.2%;"></div>
			</div>
			<ul class="flex justify-between mt-4 py-4 text-center text-jnGray-600 border border-gray-300 rounded-lg lg:border-none [&amp;_li]:w-full [&amp;_li]:border-r [&amp;_li]:border-gray-300">
				<li><dt class="justify-center mt-0">구매</dt>
					<dd id="buyDd" class="text-xl font-semibold text-jnblack">1</dd></li>
				<li class="cursor-pointer"><dt class="justify-center mt-0">판매</dt>
					<dd id="sellDd" class="text-xl font-semibold underline text-jnblack">1</dd></li>
				<li class="last:border-none"><dt class="justify-center mt-0">찜</dt>
					<dd id="wishDd" class="text-xl font-semibold text-jnblack">0</dd></li>
				<li class="last:border-none"><dt class="justify-center mt-0">거래후기</dt>
					<dd id="hugiDd" class="text-xl font-semibold text-jnblack">0</dd></li>
			</ul>
		</div>
	</div>
</div>