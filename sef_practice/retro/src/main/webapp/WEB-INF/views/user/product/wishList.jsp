<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/9caa514.css" />
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<style type="text/css">
#orderByList {
	display : none;
}

.btnStyle {
	border-radius: 10px;
	border: 1px solid #EEEFF0;
	font-size: 14px;
	font-weight: 600;
	width: 70px;
	padding: 10px;
	margin-left: 30px;
}

.end-0 {
    right: 0;
}

</style>
<script type="text/javascript">
	$(function() {
		 $(document).on('click', function (event) {
	         var orderBy = $("#orderBy");
	         var orderByList = $("#orderByList");
	         // 클릭된 영역이 selectBox 내부에 속하면 아무 동작하지 않음
	         if (orderBy.is(event.target) || orderBy.has(event.target).length > 0) {
	             return;
	         }
	         // 클릭된 영역이 selectOption 내부에 속하면 아무 동작하지 않음
	         if (orderByList.is(event.target) || orderByList.has(event.target).length > 0) {
	             return;
	         }
	         
	         orderByList.hide();
	     });
		
		
		$("#orderBy").click(function() {
			$("#orderByList").toggle();
		});
		
	});//ready
</script>

</head>
<body style="height:auto">
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
			<div class="w-full flex-grow">
				<c:import url="http://localhost/retro_prj/common/cdn/mypage_info.jsp" />
				<div class="px-0 max-lg:mt-10">
					<div class="items-center justify-between block mb-4 md:flex lg:mb-7">
						<div class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">
							2 개의 상품</div>
					</div>

					<!-- 구매내역 리스트 -->
					<div data-v-ef57988c="" data-v-f6a73334="" class="purchase_list bidding bid">
						<div data-v-ef57988c="" class="purchase_head">
							<div data-v-ef57988c="" class="head_status" style="font-size: 13px">
							</div>
						</div>
						
						<!-- 상품 정보 -->
						<div data-v-ef57988c="">
							<div data-v-6e1f328e="" data-v-ef57988c="">
								<div data-v-6e1f328e="" class="purchase_list_display_item" style="background-color: rgb(255, 255, 255);">
									<div data-v-6e1f328e="" class="purchase_list_product">
										<input type="hidden" value=""/>
									
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
											 Cosymosy Mini Bird Keyring Marshmallow</p>
										</div>
										<!---->
									</div>

									<div data-v-6e1f328e="" class="list_item_status">
										<!-- 가격 -->
										<div data-v-6e1f328e="" class="list_item_column column_secondary">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="secondary_title display_paragraph"
												style="color: rgb(34, 34, 34); margin-right:80px;">29,500원</p>
										</div>
									</div>
									<div>
										<input type="button" value="x삭제" class="deleteBtn" name="deleteBtn" onclick="deleteWish('${wish.gcode}')"
					 			style="width:90px; height:30px ;background-color: white; border : 1px solid  #E5E4E4;"/>
									</div>
								</div>
								<!-- 상품 정보 -->
							</div>
						</div>
						<!---->
						
						<!-- 상품 정보 -->
						<div data-v-ef57988c="">
							<div data-v-6e1f328e="" data-v-ef57988c="">
								<div data-v-6e1f328e="" class="purchase_list_display_item" style="background-color: rgb(255, 255, 255);">
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
												style="color: rgb(34, 34, 34); margin-right:80px;">29,500원</p>
										</div>
										<!---->

									</div>
									<div>
										<input type="button" value="x삭제" class="deleteBtn" name="deleteBtn" onclick="deleteWish('${wish.gcode}')"
					 			style="width:90px; height:30px ;background-color: white; border : 1px solid  #E5E4E4;"/>
									</div>
								</div>
								<!-- 상품 정보 -->
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
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>