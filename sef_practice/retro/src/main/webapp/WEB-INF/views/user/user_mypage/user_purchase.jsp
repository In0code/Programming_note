<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

#purLi{
	color: #333;
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
	
	function purchaseDetail(code){
		$("#code").val(code);
		
		$("#hrdFrm").submit();
	}
	
/* 	function purchaseBy(status){
		var url = "purchase.do";
		if(status == 'p'){
			url = "purchase_p.do";
		}
		if(status == 't'){
			url = "purchase_t.do";
		}
		if(status == 'c'){
			url = "purchase_c.do";
		}
		
		$.ajax({
			url: url,
			type: "post",
			dataType: "json",
			error: function(xhr){
				alert(xhr.status);
			},
			success: function(jsonObj){
				alert(jsonObj.dataSize);
			}
		});
	}; 
*/
	function purchaseCancel(code){
		if(confirm("취소 하시겠습니까?")){
			$.ajax({
				url: "purchase_cancel.do",
				type: "post",
				data: "code="+code,
				dataType: "json",
				error: function(xhr){
					console.log(xhr.status);
				},
				success: function(jsonObj){
					if(jsonObj.resultFlag){
						alert("취소 완료되었습니다.");
						location.href="http://localhost/retro_prj/my/purchase.do";
					}else{
						alert("잠시 후 다시 시도해주세요.");
					}
				}
			});
		}
	}

	function purchaseWrite(code) {
		var frm = $("#hrdFrm")[0];
		frm.action = "http://localhost/retro_prj/purchase_review_write.do";
		frm.method = "POST";
		$("#code").val(code);
		$("#hrdFrm").submit();
	}
	
	function purchaseBy(status){
		if(status == 'a'){
			$("#allLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black");
			$("#tranLi, #canLi, #payLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black");
			$("#cntDiv").html(${ dealCnt + payCnt + cancelCnt });
			
			if(${ empty pcList and empty tcList and empty ccList}){
				$("#pcDiv, #tcDiv, #ccDiv").attr("style","display:none");
				$("#noDataDiv").attr("style","display:block");
			}else{
				$("#pcDiv, #tcDiv, #ccDiv").attr("style","display:block");
				$("#noDataDiv").attr("style","display:none");
			}
		}
	
		/* 결제완료 */
		if(status == 'p'){
			$("#payLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black");
			$("#tranLi, #canLi, #allLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black");
			$("#cntDiv").html(${ payCnt });
			
			$("#tcDiv, #ccDiv").hide();
			if(${ empty pcList }){
				$("#noDataDiv").show();
				$("#pcDiv").hide();
			}else{
				$("#noDataDiv").hide();
				$("#pcDiv").show();
			}
		}
		
		/* 거래완료 */
		if(status == 't'){
			$("#tranLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black");
			$("#payLi, #canLi, #allLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black");
			$("#cntDiv").html(${ dealCnt });
			
			$("#pcDiv, #ccDiv").hide();
			if(${ empty tcList }){
				$("#noDataDiv").show();
				$("#tcDiv").hide();
			}else {
				$("#noDataDiv").hide();
				$("#tcDiv").show();
			}
		}
		/* 취소완료 */
		if(status == 'c'){
			$("#canLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black");
			$("#payLi, #tranLi, #allLi").attr("class","shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black");
			$("#cntDiv").html(${ cancelCnt });
			
			$("#pcDiv, #tcDiv").hide();
			if(${ empty ccList }){
				$("#noDataDiv").show();
				$("#ccDiv").hide();
			}else {
				$("#noDataDiv").hide();
				$("#ccDiv").show();
			}
		}
	};

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
							<span id="cntDiv">${ dealCnt + payCnt + cancelCnt }</span>개의 상품</div>
						<div class="flex flex-wrap items-center justify-between">
							<div class="mr-0 lg:mr-4">
								<ul class="colors flex flex-nowrap -me-3">
									<li onclick="purchaseBy('a')" id="allLi" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black">
										전체
									</li>
									<li onclick="purchaseBy('p')" id="payLi" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										결제완료
									</li>
									<li onclick="purchaseBy('t')" id="tranLi" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										거래완료
									</li>
									<li onclick="purchaseBy('c')" id="canLi" class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										구매취소
									</li>
								</ul>
							</div>
<!-- 							<div class="relative my-2 sm:m-0 lg:ms-0 z-10 min-w-[160px]">
								<button class="border border-gray-300 text-heading text-xs md:text-sm font-semibold relative w-full py-2 ps-3 pe-10 text-start bg-white rounded-lg shadow-md focus:outline-none focus-visible:ring-2 focus-visible:ring-opacity-75 focus-visible:ring-white focus-visible:ring-offset-orange-300 focus-visible:ring-offset-2 focus-visible:border-indigo-500 sm:text-sm cursor-pointer"
									id="orderBy" type="button" aria-haspopup="listbox" style="border:1px solid #E6E6E6; text-align:left">
									<span class="block truncate">최신순</span>
									<span class="absolute inset-y-0 end-0 flex items-center pe-2 pointer-events-none">
									<svg stroke="currentColor" fill="none" stroke-width="0" viewBox="0 0 24 24" class="w-5 h-5 text-gray-400"
											aria-hidden="true" height="1em" width="1em"
											xmlns="http://www.w3.org/2000/svg">
									<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9l4-4 4 4m0 6l-4 4-4-4"></path></svg>
									</span>
								</button>
								<ul class="absolute w-full py-1 mt-1 overflow-auto bg-white rounded-md shadow-lg max-h-60 ring-1 ring-black ring-opacity-5 focus:outline-none text-xs md:text-sm"
									aria-labelledby="headlessui-listbox-button-:ra:"
									aria-orientation="vertical" id="orderByList" role="listbox" tabindex="0">
									<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4"
										id="headlessui-listbox-option-:r10:" role="option"
										tabindex="-1" aria-selected="false" data-headlessui-state="">
										<span class="font-normal block truncate">최신순</span>
									</li>
									<li class="text-gray-900  cursor-default select-none relative py-2 ps-10 pe-4"
										id="headlessui-listbox-option-:r11:" role="option"
										tabindex="-1" aria-selected="false" data-headlessui-state="">
										<span class="font-normal block truncate">낮은가격순</span>
									</li>
									<li class="text-gray-900 cursor-default select-none relative py-2 ps-10 pe-4"
										id="headlessui-listbox-option-:r12:" role="option"
										tabindex="-1" aria-selected="false" data-headlessui-state="">
										<span class="font-normal block truncate">높은가격순</span>
									</li>
								</ul>
							</div> -->
						</div>
					</div>

					<!-- 구매내역 리스트 -->
					<div data-v-ef57988c="" data-v-f6a73334="" class="purchase_list bidding bid">
						<div data-v-ef57988c="" class="purchase_head">
							<div data-v-ef57988c="" class="head_status" style="font-size: 13px">
								<div data-v-ef57988c="" class="status_box field_price" style="padding-right: 5px">
									<span data-v-ef57988c="" class="status_txt">가격</span>
								</div>
								<div data-v-ef57988c="" class="status_box"
									style="padding-right: 5px">
									<span data-v-ef57988c="" class="status_txt">구매일자</span>
								</div>
								<div data-v-ef57988c="" class="status_box"
									style="padding-right: 10px;">
									<span data-v-ef57988c="" class="status_txt">상태</span>
								</div>
							</div>
						</div>
						
						<div id="noDataDiv" style="display:none">
							<p class="py-12 text-center" style="padding:40px 0px 41px 0px">상품이 없습니다.</p>
						</div>
						
						<form id="hrdFrm" action="purchase/detail.do">
							<input type="hidden" id="code" name="code"/>
						</form>
						
						<div id="listDiv">
						<div id="tcDiv">
						<c:forEach var="tc" items="${ tcList }">
						<!-- 상품 정보 -->
						<div id="productDiv1" onclick="purchaseDetail('${ tc.code }')">
						<div data-v-ef57988c="">
							<div data-v-6e1f328e="" data-v-ef57988c="">
								<div data-v-6e1f328e="" class="purchase_list_display_item" style="background-color: rgb(255, 255, 255);">
									<div data-v-6e1f328e="" class="purchase_list_product">
									
										<!-- 상품 이미지 -->
										<div data-v-6e1f328e="" class="list_item_img_wrap">
											<img data-v-6e1f328e="" alt="image"
												src="http://localhost/retro_prj/upload/${ tc.img }"
												class="list_item_img"
												style="background-color: rgb(255, 255, 255);">
										</div>
										<!---->

										<!-- 상품명 -->
										<div data-v-6e1f328e="" class="list_item_title_wrap" style="width:auto;">
											<p data-v-6e1f328e="" class="list_item_title">
											${ tc.pname }</p>
										</div>
										<!---->
									</div>

									<div data-v-6e1f328e="" class="list_item_status">
										<!-- 가격 -->
										<div data-v-6e1f328e="" class="list_item_column column_secondary">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="secondary_title display_paragraph"
												style="color: rgb(34, 34, 34);">
												<fmt:formatNumber value="${ tc.price }" pattern="#,###,###"/>원
												</p>
										</div>
										<!---->

										<!-- 구매일 -->
										<div data-v-6e1f328e="" class="list_item_column column_last">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="last_title display_paragraph"
												style="color: rgb(34, 34, 34);">
												${ tc.buy_date }
											</p>
										</div>
										<!---->

										<!-- 후기 작성 / 구매 취소 -->
										<div data-v-6e1f328e="" class="list_item_column column_last">
										<c:choose>
											<c:when test="${ empty tc.commentcode }">
												<input type="button" class="btnStyle" value="후기 작성" onclick="purchaseWrite('${ tc.code }')" style="margin-left: 60px; cursor:pointer" />
											</c:when>
											<c:otherwise>
												<span style="font-size:14px; margin-right:8px">거래 완료</span>
											</c:otherwise>
										</c:choose>
										</div>
										<!---->
									</div>
								</div>
								<!-- 상품 정보 -->
							</div>
						</div>
						</div>
						<!---->
						</c:forEach>
						 </div>
						
						<div id="pcDiv">
						<c:forEach var="pc" items="${ pcList }">
						<!-- 상품 정보 -->
						<div id="productDiv2">
						<div data-v-ef57988c="">
							<div data-v-6e1f328e="" data-v-ef57988c="">
								<div data-v-6e1f328e="" class="purchase_list_display_item" style="background-color: rgb(255, 255, 255);">
									<div data-v-6e1f328e="" class="purchase_list_product" onclick="purchaseDetail('${ pc.code }')">
									
										<!-- 상품 이미지 -->
										<div data-v-6e1f328e="" class="list_item_img_wrap">
											<img data-v-6e1f328e="" alt="image"
												src="http://localhost/retro_prj/upload/${ pc.img }"
												class="list_item_img"
												style="background-color: rgb(255, 255, 255);">
										</div>
										<!---->

										<!-- 상품명 -->
										<div data-v-6e1f328e="" class="list_item_title_wrap" style="width:auto;">
											<p data-v-6e1f328e="" class="list_item_title">
											${ pc.pname }</p>
										</div>
										<!---->
									</div>

									<div data-v-6e1f328e="" class="list_item_status">
										<!-- 가격 -->
										<div data-v-6e1f328e="" class="list_item_column column_secondary" onclick="purchaseDetail('${ pc.code }')">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="secondary_title display_paragraph"
												style="color: rgb(34, 34, 34);">
												<fmt:formatNumber value="${ pc.price }" pattern="#,###,###"/>원
												</p>
										</div>
										<!---->

										<!-- 구매일 -->
										<div data-v-6e1f328e="" class="list_item_column column_last" onclick="purchaseDetail('${ pc.code }')">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="last_title display_paragraph"
												style="color: rgb(34, 34, 34);">
												${ pc.buy_date }
											</p>
										</div>
										<!---->

										<!-- 후기 작성 / 구매 취소 -->
										<div data-v-6e1f328e="" class="list_item_column column_last">
											<input type="button" class="btnStyle" value="구매 취소" onclick="purchaseCancel('${ pc.code }')" style="margin-left: 60px; cursor:pointer" />
										</div>
										<!---->
									</div>
								</div>
								<!-- 상품 정보 -->
							</div>
						</div>
						</div>
						<!---->
						</c:forEach>
						</div>
						
						<div id="ccDiv">
						<c:forEach var="cc" items="${ ccList }">
						<!-- 상품 정보 -->
						<div id="productDiv3">
						<div data-v-ef57988c="">
							<div data-v-6e1f328e="" data-v-ef57988c="">
								<div data-v-6e1f328e="" class="purchase_list_display_item" style="background-color: rgb(255, 255, 255); cursor:none">
									<div data-v-6e1f328e="" class="purchase_list_product">
									
										<!-- 상품 이미지 -->
										<div data-v-6e1f328e="" class="list_item_img_wrap">
											<img data-v-6e1f328e="" alt="image"
												src="http://localhost/retro_prj/upload/${ cc.img }"
												class="list_item_img"
												style="background-color: rgb(255, 255, 255);">
										</div>
										<!---->

										<!-- 상품명 -->
										<div data-v-6e1f328e="" class="list_item_title_wrap" style="width:auto;">
											<p data-v-6e1f328e="" class="list_item_title">
											${ cc.pname }</p>
										</div>
										<!---->
									</div>

									<div data-v-6e1f328e="" class="list_item_status">
										<!-- 가격 -->
										<div data-v-6e1f328e="" class="list_item_column column_secondary">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="secondary_title display_paragraph"
												style="color: rgb(34, 34, 34);">
												<fmt:formatNumber value="${ cc.price }" pattern="#,###,###"/>원
												</p>
										</div>
										<!---->

										<!-- 구매일 -->
										<div data-v-6e1f328e="" class="list_item_column column_last">
											<p data-v-8016a084="" data-v-6e1f328e=""
												class="last_title display_paragraph"
												style="color: rgb(34, 34, 34);">
												${ cc.buy_date }
											</p>
										</div>
										<!---->

										<!-- 후기 작성 / 구매 취소 -->
										<div data-v-6e1f328e="" class="list_item_column column_last">
											<span style="font-size:14px; margin-right:8px">취소 완료</span>
										</div>
										<!---->
									</div>
								</div>
								<!-- 상품 정보 -->
							</div>
						</div>
						</div>
						<!---->
						</c:forEach>
						</div>
						</div>
						
						
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