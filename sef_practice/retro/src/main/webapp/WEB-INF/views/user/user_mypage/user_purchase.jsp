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
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/6ce4bbc.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/9caa514.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/1f3c072.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/e5d2c10.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/ac4cc82.css" />
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<style type="text/css">
#orderByList {
	display: none;
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

#purLi {
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
<body style="height: auto">
	<c:import url="http://localhost/retro_prj/common/cdn/header.jsp" />
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div
			class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<c:import
				url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
			<div class="w-full flex-grow">
				<c:import
					url="http://localhost/retro_prj/common/cdn/mypage_info.jsp" />
				<div class="px-0 max-lg:mt-10">
					<div
						class="items-center justify-between block mb-4 md:flex lg:mb-7">
						<div
							class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">
							<span id="cntDiv">${ dealCnt + payCnt + cancelCnt }</span>개의 상품
						</div>
						<div class="flex flex-wrap items-center justify-between">
							<div class="mr-0 lg:mr-4">
								<ul class="colors flex flex-nowrap -me-3">
									<li onclick="purchaseBy('a')" id="allLi"
										class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black border-black">
										전체</li>
									<li onclick="purchaseBy('p')" id="payLi"
										class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										결제완료</li>
									<li onclick="purchaseBy('t')" id="tranLi"
										class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										거래완료</li>
									<li onclick="purchaseBy('c')" id="canLi"
										class="shrink-0 cursor-pointer rounded-full border border-gray-100  p-1 px-2 mr-1 sm:mr-3 flex justify-center items-center text-heading text-xs md:text-sm uppercase font-semibold transition duration-200 ease-in-out hover:border-black">
										구매취소</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- 구매내역 리스트 -->
					<div data-v-8c632d9a="" class="purchase_head">
						<div data-v-8c632d9a="" class="head_status"
							style="font-size: 13px">
							<div data-v-8c632d9a="" class="status_box">
								<span data-v-8c632d9a="" class="status_txt">가격</span>
							</div>
							<div data-v-8c632d9a="" class="status_box">
								<span data-v-8c632d9a="" class="status_txt">구매일자</span>
							</div>
							<div data-v-8c632d9a="" class="status_box">
								<span data-v-8c632d9a="" class="status_txt">상태</span>
							</div>
						</div>
					</div>

					<div id="noDataDiv" style="display: none">
						<p class="py-12 text-center" style="padding: 40px 0px 41px 0px">상품이
							없습니다.</p>
					</div>

					<form id="hrdFrm" action="purchase/detail.do">
						<input type="hidden" id="code" name="code" />
					</form>


					<div id="listDiv">
						<!-- 거래완료 -->
						<div id="tcDiv">
							<c:forEach var="prd" items="${ tcList }">
								<!-- 상품 정보 -->
								<div id="productDiv1" onclick="purchaseDetail('${ prd.code }')">
									<div data-v-8c632d9a="">
										<div data-v-29479193="" data-v-8c632d9a="">
											<div data-v-29479193="" class="purchase_list_display_item"
												style="background-color: rgb(255, 255, 255);">
												<div data-v-29479193="" class="purchase_list_product">
													<div data-v-29479193="" class="list_item_img_wrap">
														<img data-v-29479193="" alt="  "
															src="http://localhost/retro_prj/upload/${ prd.img }"
															class="list_item_img"
															style="background-color: rgb(246, 238, 237);">
														<!---->
													</div>
													<div data-v-29479193="" class="list_item_title_wrap" style="width: auto">
														<!---->
														<p data-v-29479193="" class="list_item_title">
														${ prd.pname  }</p>
													</div>
												</div>

												<div data-v-29479193="" class="list_item_status">
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">
															<fmt:formatNumber value="${ prd.price }" pattern="#,###,###"/>원
															</p>
													</div>
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">${ prd.buy_date }</p>
													</div>
													<div data-v-29479193=""
														class="list_item_column column_last">
														<c:choose>
														<c:when test="${ empty prd.commentcode }">
															<input type="button" class="btnStyle" value="후기 작성"
																onclick="purchaseWrite('${ prd.code }')"
																style="margin-left: 60px; cursor: pointer" />
														</c:when>
														<c:otherwise>
															<span style="font-size: 14px; margin-right: 8px">거래
																완료</span>
														</c:otherwise>
													</c:choose>
													</div>
												</div>
											</div>
											<!---->
										</div>
									</div>
								</div>
								<!---->
							</c:forEach>
						</div>
						
						<!-- 결제 완료 -->
						<div id="pcDiv">
							<c:forEach var="prd" items="${ pcList }">
								<!-- 상품 정보 -->
								<div id="productDiv1">
									<div data-v-8c632d9a="">
										<div data-v-29479193="" data-v-8c632d9a="">
											<div data-v-29479193="" class="purchase_list_display_item"
												style="background-color: rgb(255, 255, 255);">
												<div data-v-29479193="" class="purchase_list_product" onclick="purchaseDetail('${ prd.code }')">
													<div data-v-29479193="" class="list_item_img_wrap">
														<img data-v-29479193="" alt="  "
															src="http://localhost/retro_prj/upload/${ prd.img }"
															class="list_item_img"
															style="background-color: rgb(246, 238, 237);">
														<!---->
													</div>
													<div data-v-29479193="" class="list_item_title_wrap" style="width: auto">
														<!---->
														<p data-v-29479193="" class="list_item_title">
														${ prd.pname  }</p>
													</div>
												</div>

												<div data-v-29479193="" class="list_item_status">
													<div data-v-29479193=""
														class="list_item_column column_secondary" onclick="purchaseDetail('${ prd.code }')">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">
															<fmt:formatNumber value="${ prd.price }" pattern="#,###,###"/>원
															</p>
													</div>
													<div data-v-29479193=""
														class="list_item_column column_secondary" onclick="purchaseDetail('${ prd.code }')">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">${ prd.buy_date }</p>
													</div>
													<div data-v-29479193="" class="list_item_column column_last" >
														<input type="button" class="btnStyle" value="구매 취소"
															onclick="purchaseCancel('${ prd.code }')"
															style="margin-left: 60px; cursor: pointer" />
													</div>
												</div>
											</div>
											<!---->
										</div>
									</div>
								</div>
								<!---->
							</c:forEach>
						</div>
						
						<!-- 취소 완료 -->
						<div id="ccDiv">
							<c:forEach var="prd" items="${ ccList }">
								<!-- 상품 정보 -->
								<div id="productDiv3">
									<div data-v-8c632d9a="">
										<div data-v-29479193="" data-v-8c632d9a="">
											<div data-v-29479193="" class="purchase_list_display_item"
												style="background-color: rgb(255, 255, 255); cursor:default">
												<div data-v-29479193="" class="purchase_list_product">
													<div data-v-29479193="" class="list_item_img_wrap" style="cursor:default">
														<img data-v-29479193="" alt="  "
															src="http://localhost/retro_prj/upload/${ prd.img }"
															class="list_item_img"
															style="background-color: rgb(246, 238, 237);">
														<!---->
													</div>
													<div data-v-29479193="" class="list_item_title_wrap" style="cursor:default; width: auto">
														<!---->
														<p data-v-29479193="" class="list_item_title">
														${ prd.pname  }</p>
													</div>
												</div>

												<div data-v-29479193="" class="list_item_status" style="cursor:default">
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">
															<fmt:formatNumber value="${ prd.price }" pattern="#,###,###"/>원
															</p>
													</div>
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">${ prd.buy_date }</p>
													</div>
													
													<div data-v-29479193="" class="list_item_column column_last" >
														<span style="font-size: 14px; margin-right: 8px">
														취소 완료</span>
													</div>
												</div>
											</div>
											<!---->
										</div>
									</div>
								</div>
								<!---->
							</c:forEach>
						</div>
					<div data-v-ef57988c="" class="v-portal" style="display: none;"></div>
				</div>
				<div class="py-8 text-center xl:pt-14"></div>
			</div>
		</div>
		</div>
		<div class="Toastify"></div>
	</main>
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>