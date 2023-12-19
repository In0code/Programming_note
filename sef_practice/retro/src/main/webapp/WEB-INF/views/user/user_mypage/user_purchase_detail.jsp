<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/1f3c072.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/7d787ff.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/c0c15c2.css" />


<style type="text/css">
dl, dt {
	margin-top: 0px;
}

h4 {
	display: block;
	margin-block-start: 1.33em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

.title {
	color: black;
}

.lg .order_info_items_wrap[data-v-c54402b6] .display_item.price .display_line.heavy_text,
	.md .order_info_items_wrap[data-v-c54402b6] .display_item.price .display_line.heavy_text
	{
	padding: 0;
	display: flex;
	line-height: 32px;
	width: 170px;
}
</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

<%
String code = String.valueOf(request.getParameter("code").charAt(0));
pageContext.setAttribute("code", code);
%>

</head>
<body>

	<c:import url="http://localhost/retro_prj/common/cdn/header.jsp" />
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div
			class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<c:import
				url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
			<div class="w-full flex-grow">

				<!-------------------->
				<div data-v-7a3bdf55="" data-v-0adb81cc=""
					class="content_area my-page-content">
					<div data-v-7a3bdf55="" class="my_order_detail finished">
						<div data-v-61e7a8a3="" data-v-7a3bdf55="" class="content_title">
							<div data-v-61e7a8a3="" class="title" style="padding-top: 25px">
								<h3 data-v-61e7a8a3="" style="font-size: 20px; font-weight: 600">
									구매내역 상세</h3>
								<!---->
							</div>
							<div data-v-7a3bdf55="" data-v-61e7a8a3="" class="btn_box">
								<div data-v-7a3bdf55="" class="vue-portal-target"
									data-v-61e7a8a3="">
									<div data-v-71603f99="" data-v-6287e8b0="">
										<ul data-v-71603f99="" class="navigation_menu inline">
											<li data-v-71603f99="" class="menu_item_parent select_item"><a
												data-v-71603f99="" href="#select_item" class="menu_item"><img
													data-v-71603f99=""
													src="https://kream-phinf.pstatic.net/MjAyMzA2MjFfNzMg/MDAxNjg3MzUxMTQxMDk5._X8ITUGTSzqIhQitbG9KEl_aNAZIvERaeBnWZ4kd4b0g.oC0IhncZ1jN15hqLP3khlX5o0ov4RhzM4sW9d3ayFCIg.PNG/a_067df32d884c4361a6674c79902d5c66.png0"
													width="20" height="20" alt="더보기"> 더보기 </a></li>
										</ul>
										<div data-v-71603f99="" class="v-portal"
											style="display: none;"></div>
									</div>
								</div>
							</div>
							<!---->
						</div>
						<div data-v-6287e8b0="" data-v-7a3bdf55="">
							<div data-v-6287e8b0="">

								<div data-v-6287e8b0="" class="order_info">
									<!---->
									<div data-v-41e7c61c="" data-v-6287e8b0="" class="order_detail_header_product">
										<div data-v-fc7cb978="" data-v-41e7c61c="" class="product_wrap tag_top">
											<div data-v-fc7cb978="" class="product_img_flex_box">
												<div data-v-fc7cb978="" class="product_img_wrap">
													<img data-v-fc7cb978="" alt="  "
														src="http://localhost/retro_prj/upload/${ purchase.img }"
														class="product_img"
														style="background-color: rgb(246, 238, 237);">
													<!---->
												</div>
											</div>
											<div data-v-fc7cb978="" class="product_info_wrap">
												<div data-v-fc7cb978="" class="product_info">
													<div data-v-fc7cb978="" class="tag_wrap">
														<!---->
													</div>
													<p data-v-fc7cb978="" class="product_description">${ purchase.pname }</p>
													<p data-v-fc7cb978="" class="product_title">
														${ purchase.nickname }</p>
												</div>
											</div>
										</div>
									</div>
									<!---->
								</div>
							</div>
						</div>
						
						<div data-v-7a3bdf55="">
							<div data-v-c54402b6="" data-v-7a3bdf55=""
								class="order_info_items_wrap empty_header">
								<div data-v-6a98cab4="" data-v-c54402b6="" class="section_title">
									<div data-v-6a98cab4="" class="title_box">
										<h4 data-v-6a98cab4="" class="title">
											<c:out value="${ code eq 'B' ? '거래 정보' : '결제 정보'}" />
										</h4>
									</div>
									<!---->
								</div>
								<div data-v-c54402b6="" class="display_section">
									<div data-v-4217af8e="" class="display_item empty_header price"
										style="background-color: rgb(250, 250, 250); padding: 20px 16px;">
										<div data-v-4217af8e="" class="title_wrap"
											style="display: none;">
											<div data-v-4217af8e="">
												<p data-v-4217af8e="" class="title" style="display: none;"></p>
												<!---->
											</div>
											<!---->
										</div>
										<div data-v-15287078="" data-v-4217af8e=""
											class="display_line line heavy_text" style="display: flex;">
											<p data-v-8016a084="" data-v-15287078=""
												class="line_title display_paragraph"
												style="color: rgb(34, 34, 34); width: 130px; font-size: 16px">구매
												금액</p>
											<div data-v-15287078="" class="description_wrap"
												style="width: 94.125px; padding-top: 0px;">
												<p data-v-8016a084="" data-v-15287078=""
													class="line_description display_paragraph"
													style="color: rgb(34, 34, 34); width: 94.125px; text-align: left">

													<!-- 가격 -->
													<em style="color: inherit;" class=""> <fmt:formatNumber
															value="${ purchase.price }" pattern="#,###,###" />원
													</em>
												</p>
												<!---->
												<!---->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div data-v-7a3bdf55="">
							<div data-v-c54402b6="" data-v-7a3bdf55=""
								class="order_info_items_wrap empty_header">
								<!---->
								<div data-v-c54402b6="" class="display_section">
									<div data-v-4217af8e=""
										class="display_item empty_header price_breakdown"
										style="background-color: rgb(255, 255, 255); padding: 0px 16px;">
										<div data-v-4217af8e="" class="title_wrap"
											style="display: none;">
											<div data-v-4217af8e="">
												<p data-v-4217af8e="" class="title" style="display: none;"></p>
												<!---->
											</div>
											<!---->
										</div>

										<c:if test="${ code eq 'B' }">
											<div data-v-00c4558b="" data-v-4217af8e=""
												class="display_line line separator"
												style="background-color: rgb(240, 240, 240);"></div>
											<div data-v-15287078="" data-v-4217af8e=""
												class="display_line line title_description">
												<p data-v-8016a084="" data-v-15287078=""
													class="line_title display_paragraph"
													style="color: rgb(34, 34, 34); width: 130px">거래 방법</p>
												<div data-v-15287078="" class="description_wrap">
													<p data-v-8016a084="" data-v-15287078=""
														class="line_description display_paragraph"
														style="color: rgb(34, 34, 34); text-align: left;">
														<c:if test="${ purchase.payment eq 'T' }">택배거래</c:if>
														<c:if test="${ purchase.payment eq 'G' }">직거래</c:if>
													</p>
												</div>
											</div>
										</c:if>

										<div data-v-00c4558b="" data-v-4217af8e=""
											class="display_line line separator"
											style="background-color: rgb(240, 240, 240);"></div>
										<div data-v-15287078="" data-v-4217af8e=""
											class="display_line line title_description">
											<p data-v-8016a084="" data-v-15287078=""
												class="line_title display_paragraph"
												style="color: rgb(34, 34, 34); width: 130px">
												<c:out value="${ code eq 'B' ? '거래 일시' : '결제 일시' }" />
											</p>
											<div data-v-15287078="" class="description_wrap">
												<p data-v-8016a084="" data-v-15287078=""
													class="line_description display_paragraph"
													style="color: rgb(34, 34, 34); text-align: left;">${ purchase.buy_date }
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div data-v-7a3bdf55="">
							<div data-v-0c19a43c="" data-v-7a3bdf55=""
								class="shipping_address_wrap">
								<div data-v-6a98cab4="" data-v-0c19a43c="" class="section_title">
									<div data-v-6a98cab4="" class="title_box">
										<h4 data-v-6a98cab4="" class="title">판매자 정보</h4>
									</div>
									<!---->
								</div>
								<div data-v-0c19a43c="" class="shipping_address">
									<dl data-v-0c19a43c="" class="address_item"
										style="padding: 20px 16px;">
										<dt data-v-0c19a43c="" class="address_title">닉네임</dt>
										<dd data-v-0c19a43c="" class="address_txt">${ purchase.nickname }(${ purchase.seller })</dd>
									</dl>
									<dl data-v-0c19a43c="" class="address_item"
										style="padding: 20px 16px;">
										<dt data-v-0c19a43c="" class="address_title">휴대폰 번호</dt>
										<dd data-v-0c19a43c="" class="address_txt">${ purchase.phone }</dd>
									</dl>
								</div>
							</div>

							<c:if test="${ code eq 'B' }">
								<div data-v-0c19a43c="" data-v-7a3bdf55=""
									class="shipping_address_wrap">
									<div data-v-6a98cab4="" data-v-0c19a43c=""
										class="section_title">
										<div data-v-6a98cab4="" class="title_box">
											<h4 data-v-6a98cab4="" class="title">후기</h4>
										</div>
									</div>
									<div data-v-0c19a43c="" class="shipping_address">
										<c:choose>
											<c:when test="${ not empty purchase.commentcode }">
												<c:forEach var="comment" items="${ purchase.cmlist }">
													<dl data-v-0c19a43c="" class="address_item"
														style="padding: 20px 16px;">
														<dt data-v-0c19a43c="" class="address_title"
															style="width: auto">· ${ comment }</dt>
													</dl>
												</c:forEach>
												<c:if test="${ not empty purchase.context }">
													<textarea
														style="width: 100%; height: 170px; border: 1px solid #DBDFE6; border-radius: 5px; resize: none; padding: 10px; margin-top: 10px; font-size: 15px;"
														disabled="disabled">${ purchase.context }</textarea>
												</c:if>
											</c:when>
											<c:otherwise>
												<dl data-v-0c19a43c="" class="address_item"
													style="padding: 20px 16px;">
													<dt data-v-0c19a43c="" class="address_title"
														style="width: 300px">받은 후기가 없습니다.</dt>
												</dl>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</c:if>
						</div>

						<div data-v-7a3bdf55="" class="detail_btn_box"
							style="margin-bottom: 100px; padding-top: 100px; text-align: center">
							<a data-v-0a6aebaa="" data-v-7a3bdf55=""
								href="http://localhost/retro_prj/my/purchase.do"
								class="btn btn_view_list outlinegrey medium"
								style="width: 100px; padding: 3px 18px 3px 18px">목록</a>
						</div>
						<div data-v-7a3bdf55="" class="v-portal" style="display: none;"></div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>