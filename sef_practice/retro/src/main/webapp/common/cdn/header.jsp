<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <body cz-shortcut-listen="true"> -->
	<div id="__next">
		<div><!--  class="flex flex-col min-h-screen" -->
			<header id="siteHeader" class="relative z-20 w-full h-16 sm:h-20 lg:h-36 xl:h-40 max-[480px]:mt-0 mt-[60px] headerThree is-scrolling">
				<div id="header_items_wrapper" class="fixed z-20 w-full h-16 px-4 text-gray-700 transition duration-200 ease-in-out bg-white innerSticky body-font sm:h-20 lg:h-36 xl:h-40 md:px-8 lg:px-0" style="top: 0px;">
					<div class="flex items-center mx-auto px-0 lg:px-8 2xl:px-16 max-w-[1280px] h-full lg:h-20 xl:h-24 relative before:absolute before:w-screen before:bg-[#F1F1F1] before:bottom-0 box-content justify-around">
						<div class="flex items-center 2xl:me-12 3xl:me-20 place-self-stretch max-[1023px]:flex-auto max-[1023px]:ml-[10px]">
							<a style="width: 200px; height: 30px" class="ga4_main_top_logo max-[1023px]:!w-[97px] max-[1023px]:!h-[16px] inline-flex focus:outline-none relative" href="/">
							<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: 50px; background: none; opacity: 1; border: 0; margin: 0; padding: 0; position: absolute; top: 0; left: 0; bottom: 0; right: 0">
							<img alt="RE:TRO" src="http://localhost/retro_prj/common/images/main_logo.png" decoding="async" data-nimg="fill" 
							style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; box-sizing: border-box; padding: 0; border: none; margin: 0; display: block; width: 160px;">
							</span>
						</a>
						</div>
						<div class="relative hidden w-1/2 ms-7 me-7 xl:ms-9 lg:block" style="margin-top:15px">
							<div class="relative flex items-center justify-between w-full rounded-md bg-borderBottom">
								<form class="w-full" novalidate="" role="search">
									<label for="search" class="flex items-center justify-between">
									<span class="absolute top-0 left-0 flex items-center justify-center flex-shrink-0 w-12 h-full cursor-pointer md:w-14 focus:outline-none"><svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="w-[16px] h-[16px] text-heading">
												<path d="M10.0278 19.0556C14.3233 19.0556 17.8056 15.5733 17.8056 11.2778C17.8056 6.98223 14.3233 3.5 10.0278 3.5C5.73223 3.5 2.25 6.98223 2.25 11.2778C2.25 15.5733 5.73223 19.0556 10.0278 19.0556Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="transparent"></path>
												<path d="M21 21.8999L15.5 16.8999" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
									</span>
												<input type="search" id="search-header" class="w-full h-10 text-sm placeholder-gray-400 bg-transparent rounded-md outline-none ga4_main_top_search pe-4 ps-14 text-heading lg:text-base placeholder:text-sm" 
												placeholder="어떤 상품을 찾으시나요?" aria-label="search-header" autocomplete="off" style="padding-top: 0px;"></label>
								</form>
							</div>
						</div>
						<div class="flex max-[1023px]:hidden" style="margin-top:15px">
							<ul class="flex text-sm font-normal list-none break-keep" id="headerList">
								<li class="flex items-center justify-center pr-3">
									<button class="flex items-center justify-center">
										<div class="relative cursor-pointer">
											<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
												<path d="M144 208c-17.7 0-32 14.3-32 32s14.3 32 32 32 32-14.3 32-32-14.3-32-32-32zm112 0c-17.7 0-32 14.3-32 32s14.3 32 32 32 32-14.3 32-32-14.3-32-32-32zm112 0c-17.7 0-32 14.3-32 32s14.3 32 32 32 32-14.3 32-32-14.3-32-32-32zM256 32C114.6 32 0 125.1 0 240c0 47.6 19.9 91.2 52.9 126.3C38 405.7 7 439.1 6.5 439.5c-6.6 7-8.4 17.2-4.6 26S14.4 480 24 480c61.5 0 110-25.7 139.1-46.3C192 442.8 223.2 448 256 448c141.4 0 256-93.1 256-208S397.4 32 256 32zm0 368c-26.7 0-53.1-4.1-78.4-12.1l-22.7-7.2-19.5 13.8c-14.3 10.1-33.9 21.4-57.5 29 7.3-12.1 14.4-25.7 19.9-40.2l10.6-28.1-20.6-21.8C69.7 314.1 48 282.2 48 240c0-88.2 93.3-160 208-160s208 71.8 208 160-93.3 160-208 160z"></path></svg>
										</div>
										<p class="ml-2">채팅하기</p>
									</button>
								</li>
								<li class="flex items-center justify-center px-3 border-r-2">
									<a class="flex items-center justify-center [&amp;>p]:ml-2" href="/product/form?type=regist"><svg fill="none" height="29" viewBox="0 0 24 24" width="28" xmlns="http://www.w3.org/2000/svg">
											<path d="m10 19h-3.8c-1.1201 0-1.68016 0-2.10798-.218-.37633-.1917-.68229-.4977-.87403-.874-.21799-.4278-.21799-.9879-.21799-2.108v-7.6c0-1.12011 0-1.68016.21799-2.10798.19174-.37633.4977-.68229.87403-.87403.42782-.21799.98788-.21799 2.10798-.21799h11.6c1.1201 0 1.6802 0 2.108.21799.3763.19174.6823.4977.874.87403.218.42782.218.98788.218 2.10798v.3m-12 1v-1m0 1h2.0001m-2.0001 0c-1.11721-.00002-1.99756.12616-1.9999 1.3325-.00176.9003-.00001 1.1675 1.99999 1.1675 2.00001 0 2.00001.2055 2.00001 1.1667 0 .7223-.0001 1.3333-2.0001 1.3333m0 1v-1m0 0h-1.9999m6.9999-4.5h3m-3 10 2.025-.405c.1765-.0353.2648-.053.3471-.0853.0731-.0286.1426-.0658.2069-.1107.0726-.0506.1362-.1142.2636-.2416l4.1574-4.1574c.5523-.5523.5523-1.4477 0-2s-1.4477-.5523-2 0l-4.1574 4.1574c-.1274.1274-.191.191-.2416.2636-.0449.0643-.0821.1338-.1107.2069-.0323.0823-.05.1706-.0853.3471z" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
										<p>판매하기</p>
									</a>
								</li>
								<li class="relative flex px-3">
									<button class="flex items-center justify-center [&amp;>p]:ml-2">
										<svg stroke="currentColor" fill="none" stroke-width="0" viewBox="0 0 24 24" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
											<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
										<p>로그인 </p>
									</button>
								</li>
							</ul>
						</div>
					</div>
					<div class="items-center hidden lg:flex lg:h-16 headerBottom mx-auto max-w-[1280px] md:px-8 2xl:px-16 box-content">
						<div class="flex items-center">
							<div class="relative flex-shrink-0 categoryMenu hidden lg:block">
								<div class="flex items-center justify-center gap-2 px-3.5 xl:px-4 text-sm relative before:absolute before:-bottom-2.5 before:h-2.5 before:w-full before:z-10 font-semibold text-white transition-colors rounded-md cursor-pointer h-11 bg-heading hover:bg-black">
									<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 20 20" class="text-xl" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
									카테고리
								</div>
								<div class="absolute invisible bg-white opacity-0 subMenu shadow-header start-0">
									<ul class="py-5 text-sm text-body max-h-[calc(100vh-220px)] overflow-y-scroll">
										<li class="">
										<a class="flex items-center py-2 ps-5 xl:ps-7 pe-3 xl:pe-3.5 hover:text-heading hover:bg-gray-300" href="goods_list1.do?category1=C">패션의류</a>
										<div class="absolute flex bg-white categoryMegaMenu shadow-header w-[630px] xl:w-[1000px] 2xl:w-[1200px] start-full" style="margin-left: 240px;">
												<div class="flex-shrink-0" style="margin-left: 0px;">
													<div class="absolute bg-gray-200 megaMenu shadow-header -start-28 xl:start-0">
														<div class="grid grid-cols-5">
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5">
																	<a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=C1">여성의류</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=C101">티셔츠 / 캐주얼의류</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=C102">바지 / 치마</a></li>
																<li class="border-b border-gray-300 pb-3.5 mb-3"><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=C103">트레이닝복</a></li>
															</ul>
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5">
																	<a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=C2">남성의류</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=C201">티셔츠 / 캐쥬얼의류</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=C202">바지</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=C203">트레이닝복</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div></li>
										<li class="">
										<a class="flex items-center py-2 ps-5 xl:ps-7 pe-3 xl:pe-3.5 hover:text-heading hover:bg-gray-300" href="goods_list1.do?category1=G">패션잡화</a>
										<div class="absolute flex bg-white categoryMegaMenu shadow-header w-[630px] xl:w-[1000px] 2xl:w-[1200px] start-full" style="margin-left: 240px;">
												<div class="flex-shrink-0">
													<div class="absolute bg-gray-200 megaMenu shadow-header -start-28 xl:start-0">
														<div class="grid grid-cols-5">
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5">
																	<a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=G1">여성화</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G101">단화 / 로퍼</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G102">워커 / 부츠</a></li>
																<li class="border-b border-gray-300 pb-3.5 mb-3">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G103">샌들 / 슬리퍼</a></li>
															</ul>
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5">
																	<a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=G2">남성화</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G201">단화 / 로퍼</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G202">워커 / 부츠</a></li>
																<li class="border-b border-gray-300 pb-3.5 mb-3">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G203">샌들 / 슬리퍼</a></li>
															</ul>
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5">
																	<a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=G3">가방</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G301">숄더백</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G302">크로스백</a></li>
																<li class="border-b border-gray-300 pb-3.5 mb-3">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=G303">트레이닝복</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div></li>
										<li class=""><a class="flex items-center py-2 ps-5 xl:ps-7 pe-3 xl:pe-3.5 hover:text-heading hover:bg-gray-300" href="goods_list1.do?category1=T">모바일 / 태블릿</a>
										<div class="absolute flex bg-white categoryMegaMenu shadow-header w-[630px] xl:w-[1000px] 2xl:w-[1200px] start-full" style="margin-left: 240px;">
												<div class="flex-shrink-0">
													<div class="absolute bg-gray-200 megaMenu shadow-header -start-28 xl:start-0">
														<div class="grid grid-cols-5">
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5">
																	<a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=T1">스마트폰</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=T101">삼성</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=T102">LG</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=T103">애플</a></li>
																<li class="border-b border-gray-300 pb-3.5 mb-3">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=T104">기타</a></li>
															</ul>
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5">
																	<a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=T2">태블릿PC</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=T201">삼성</a></li>
																<li class="">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=T202">애플</a></li>
																<li class="border-b border-gray-300 pb-3.5 mb-3">
																	<a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=T203">기타</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div></li>
										<li class=""><a class="flex items-center py-2 ps-5 xl:ps-7 pe-3 xl:pe-3.5 hover:text-heading hover:bg-gray-300" href="goods_list1.do?category1=P">노트북 / PC</a>
										<div class="absolute flex bg-white categoryMegaMenu shadow-header w-[630px] xl:w-[1000px] 2xl:w-[1200px] start-full" style="margin-left: 240px;">
												<div class="flex-shrink-0">
													<div class="absolute bg-gray-200 megaMenu shadow-header -start-28 xl:start-0">
														<div class="grid grid-cols-5">
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5"><a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=P1">노트북</a></li>
																<li class=""><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=P101">삼성</a></li>
																<li class=""><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=P102">LG</a></li>
																<li class="border-b border-gray-300 pb-3.5 mb-3"><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=P103">애플</a></li>
															</ul>
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5"><a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=P2">모니터</a></li>
																<li class="mb-1.5"><a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=P3">데스크탑</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div></li>
										<li class=""><a class="flex items-center py-2 ps-5 xl:ps-7 pe-3 xl:pe-3.5 hover:text-heading hover:bg-gray-300" href="goods_list1.do?category1=B">도서 / 문구</a>
										<div class="absolute flex bg-white categoryMegaMenu shadow-header w-[630px] xl:w-[1000px] 2xl:w-[1200px] start-full" style="margin-left: 240px;">
												<div class="flex-shrink-0">
													<div class="absolute bg-gray-200 megaMenu shadow-header -start-28 xl:start-0">
														<div class="grid grid-cols-5">
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5"><a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=B1">학습 / 교육</a></li>
																<li class=""><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=B101">학습 / 참고서</a></li>
																<li class=""><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=B102">수험서 / 자격증</a></li>
																<li class=""><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=B103">컴퓨터 / 인터넷</a></li>
															</ul>
															<ul class="pt-6 even:bg-gray-150 pb-7 2xl:pb-8 2xl:pt-7 max-h-[calc(100vh-220px)] overflow-y-scroll">
																<li class="mb-1.5"><a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=B2">소설 / 만화책</a></li>
																<li class=""><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=B201">소설책</a></li>
																<li class=""><a class="text-body text-sm block py-1.5 px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list3.do?category3=B202">만화책</a></li>
																<li class=""><a class="block text-sm py-1.5 text-heading font-semibold px-5 xl:px-8 2xl:px-10 hover:text-heading hover:bg-gray-300" href="goods_list2.do?category2=B3">문구 / 사무용품</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div></li>
									</ul>
								</div>
							</div>
							<nav class="headerMenu flex w-full relative hidden lg:flex ps-3.5 xl:ps-5">
								<div class="menuItem group cursor-pointer ">
									<a class="relative inline-flex items-center px-3 py-3 text-sm font-normal xl:text-base text-heading xl:px-4 group-hover:text-black" href="/event/list?searchType=ING">이벤트</a>
								</div>
								<div class="menuItem group cursor-pointer ">
									<a class="relative inline-flex items-center px-3 py-3 text-sm font-normal xl:text-base text-heading xl:px-4 group-hover:text-black" href="/fraud">사기조회</a>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</header>
			<!--$-->
			<!--/$-->
			<!--$-->
			<div>
				<div class="overlay" role="button"></div>
				<div class="drawer-search relative hidden top-0 z-30 opacity-0 invisible transition duration-300 ease-in-out left-1/2 px-4 w-full md:w-[730px] lg:w-[930px]">
					<div class="flex flex-col justify-center w-full">
						<div class="flex-shrink-0 mt-3.5 lg:mt-4 w-full">
							<div class="flex flex-col mx-auto mb-1.5 w-full ">
								<form class="relative pe-12 md:pe-14 bg-white overflow-hidden rounded-md w-full" novalidate="" role="search">
									<label for="search" class="flex items-center py-0.5"><span class="flex items-center justify-center flex-shrink-0 w-12 h-full cursor-pointer md:w-14 focus:outline-none"><svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="w-4 h-4">
												<path d="M10.0278 19.0556C14.3233 19.0556 17.8056 15.5733 17.8056 11.2778C17.8056 6.98223 14.3233 3.5 10.0278 3.5C5.73223 3.5 2.25 6.98223 2.25 11.2778C2.25 15.5733 5.73223 19.0556 10.0278 19.0556Z" stroke="text-heading" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" fill="white"></path>
												<path d="M21 21.8999L15.5 16.8999" stroke="text-heading" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg></span><input id="search-box" class="w-full h-12 text-sm placeholder-gray-400 outline-none text-heading lg:h-14 lg:text-base" placeholder="검색어를 입력해주세요." aria-label="search-box" autocomplete="off" name="search"></label>
								</form>
							</div>
							<div class="bg-white flex flex-col rounded-md h-[528px] w-full z-10 px-5 justify-around ">
								<div class="mx-auto flex flex-col items-center font-medium ">
									<svg width="48px" height="48px" viewBox="0 0 49 48" fill="none" xmlns="http://www.w3.org/2000/svg">
										<g clip-path="url(#clip0_1457_156476)">
										<path d="M3.05225 47.2382C1.9325 47.5436 0.905039 46.5161 1.21042 45.3964L5.82304 28.4835L19.9652 42.6256L3.05225 47.2382Z" fill="#DDE1E4"></path>
										<path fill-rule="evenodd" clip-rule="evenodd" d="M0.500005 24C0.500008 10.7452 11.2452 -1.37836e-06 24.5 -8.87953e-07C37.7548 -3.9755e-07 48.5 10.7452 48.5 24C48.5 37.2548 37.7548 48 24.5 48C11.2452 48 0.500002 37.2548 0.500005 24ZM17.5 23.9998C17.5 22.3438 16.156 20.9998 14.5 20.9998C12.844 20.9998 11.5 22.3438 11.5 23.9998C11.5 25.6558 12.844 26.9998 14.5 26.9998C16.156 26.9998 17.5 25.6558 17.5 23.9998ZM24.5 20.9998C26.156 20.9998 27.5 22.3438 27.5 23.9998C27.5 25.6558 26.156 26.9998 24.5 26.9998C22.844 26.9998 21.5 25.6558 21.5 23.9998C21.5 22.3438 22.844 20.9998 24.5 20.9998ZM37.5 23.9998C37.5 22.3438 36.156 20.9998 34.5 20.9998C32.844 20.9998 31.5 22.3438 31.5 23.9998C31.5 25.6558 32.844 26.9998 34.5 26.9998C36.156 26.9998 37.5 25.6558 37.5 23.9998Z" fill="#DDE1E4"></path></g>
										<defs>
										<clipPath id="clip0_1457_156476">
										<rect width="48" height="48" fill="white" transform="translate(48.5 48) rotate(-180)"></rect></clipPath></defs></svg>
									<h5 class="mt-4 text-base text-jnGray-700">검색어를 입력해 주세요.</h5>
									<p class="mt-2 text-sm text-center text-jnGray-500">검색어를
										입력하시면 다양한 상품과 가게를 검색할 수 있습니다.</p>
								</div>
								<div class="flex flex-col">
									<div class="flex items-center justify-between">
										<p class="text-base font-semibold text-jnGray-900">최근 검색어</p>
									</div>
									<ul class="flex py-3 overflow-x-auto flex-nowrap">
										<li><p class="text-sm font-normal text-jnGray-500">최근
												검색어 내역이 없습니다.</p></li>
									</ul>
								</div>
								<div class="flex flex-col">
									<div class="flex items-center justify-between">
										<p class="text-base font-semibold text-jnGray-900">최근 가게
											검색어</p>
									</div>
									<ul class="flex py-3 overflow-x-auto flex-nowrap">
										<li><p class="text-sm font-normal text-jnGray-500">최근
												가게 검색어 내역이 없습니다.</p></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/$-->
		</div>
		<!--$-->
		<!--/$-->
		<!--$-->
		<!--/$-->
	</div>
<!-- </body> -->