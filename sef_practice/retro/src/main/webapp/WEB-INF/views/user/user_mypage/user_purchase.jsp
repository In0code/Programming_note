<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/9caa514.css" />
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<style type="text/css">
.btnStyle {
	border: 1px solid black;
	font-size: 14px;
	font-weight: 600;
	width: 70px;
	padding: 10px;
	border-radius: 5px;

}
</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
	<main class="relative flex-grow border-b-2" style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
			<div class="w-full flex-grow">
			<c:import url="http://localhost/retro_prj/common/cdn/mypage_info.jsp" />
				<div class="px-0 max-lg:mt-10">
					<div class="items-center justify-between block mb-4 md:flex lg:mb-7">
						<div class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">
							2 개의 상품</div>
						<div class="flex flex-wrap items-center justify-between">
							<div class="mr-0 lg:mr-4">
								<ul class="colors flex flex-nowrap -me-3">
									<li class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black">
										전체</li>
									<li class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										결제완료</li>
									<li class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										거래완료</li>
									<li class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										구매취소</li>
								</ul>
							</div>
							<div class="relative my-2 sm:m-0 lg:ms-0 z-10 min-w-[160px]">
								<button class="border border-gray-300 text-heading text-xs md:text-sm font-semibold relative w-full py-2 ps-3 pe-10 text-start bg-white rounded-lg shadow-md focus:outline-none focus-visible:ring-2 focus-visible:ring-opacity-75 focus-visible:ring-white focus-visible:ring-offset-orange-300 focus-visible:ring-offset-2 focus-visible:border-indigo-500 sm:text-sm cursor-pointer"
									id="headlessui-listbox-button-:ra:" type="button"
									aria-haspopup="listbox" aria-expanded="false"
									data-headlessui-state="">
									<span class="block truncate">최신순</span> 
									<span class="absolute inset-y-0 end-0 flex items-center pe-2 pointer-events-none">
										<svg stroke="currentColor" fill="none" stroke-width="0"
											viewBox="0 0 24 24" class="w-5 h-5 text-gray-400"
											aria-hidden="true" height="1em" width="1em"
											xmlns="http://www.w3.org/2000/svg">
											<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9l4-4 4 4m0 6l-4 4-4-4"></path>
										</svg>
									</span>
								</button>
							</div>
						</div>
					</div>

					<!-- 구매내역 리스트 -->
					<div data-v-ef57988c="" data-v-f6a73334=""
						class="purchase_list bidding bid">
						<div data-v-ef57988c="" class="purchase_head">
							<div data-v-ef57988c="" class="head_status" style="font-size:13px">
								<div data-v-ef57988c="" class="status_box field_price">
									<span data-v-ef57988c="" class="status_txt">가격</span>
								</div>
								<div data-v-ef57988c="" class="status_box">
									<span data-v-ef57988c="" class="status_txt">구매일</span>
								</div>
								<div data-v-ef57988c="" class="status_box">
									<span data-v-ef57988c="" class="status_txt"></span>
								</div>
							</div>
						</div>
						<div data-v-ef57988c="">
							<div data-v-6e1f328e="" data-v-ef57988c="">
								<div data-v-6e1f328e="" class="purchase_list_display_item"
									style="background-color: rgb(255, 255, 255);">
									<div data-v-6e1f328e="" class="purchase_list_product">
									
										<!-- 상품 이미지 -->
										<div data-v-6e1f328e="" class="list_item_img_wrap">
											<img data-v-6e1f328e="" alt="product_image"
												src="https://kream-phinf.pstatic.net/MjAyMzExMTVfMzYg/MDAxNzAwMDM3NTE4ODY4.FsqG6bk6HOgtB6isNowU1Dokh5Uk6FXjgzoyBQ2OshUg.9nh_39MLoypIGYBJdKibaEiDgAq_hG_V5NyAyn10DJAg.JPEG/a_8ab9b5882971402eb1d7b30f7f19546b.jpg?type=m"
												class="list_item_img"
												style="background-color: rgb(255, 255, 255);">
										</div>
										<!---->
										
										<!-- 상품명 -->
										<div data-v-6e1f328e="" class="list_item_title_wrap">
											<p data-v-6e1f328e="" class="list_item_title">
												[KREAM Exclusive] Cosymosy Mini Bird Keyring Marshmallow</p>
										</div>
										<!---->
									</div>
									
									<div data-v-6e1f328e="" class="list_item_status">
										<!-- 가격 -->
										<div data-v-6e1f328e="" class="list_item_column column_secondary">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="secondary_title display_paragraph"
												style="color: rgb(34, 34, 34);">29,500원</p>
										</div>
										<!---->
										
										<!-- 구매일 -->
										<div data-v-6e1f328e="" class="list_item_column column_last">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="last_title display_paragraph"
												style="color: rgb(34, 34, 34);">2023-11-03</p>
										</div>
										<!---->
										
										<div data-v-6e1f328e="" class="list_item_column column_last">
											<input type="button" class="btnStyle"
											 value="후기작성"/>
										</div>
									</div>
								</div>
								<!---->
							</div>
						</div>
						<!---->
						<div data-v-ef57988c="" class="v-portal" style="display: none;"></div>
					</div>
					<div class="py-8 text-center xl:pt-14"></div>
				</div>
			</div>
		</div>
		<div class="Toastify"></div>
	</main>

</body>
</html>