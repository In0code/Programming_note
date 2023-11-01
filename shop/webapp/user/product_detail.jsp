<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.detailTab li {
    float: left;
    width: 50%;
    border: 1px solid #212121;
    border-color: rgba(33,33,33,0.1);
    font-size: 16px;
    text-align: center;
    box-sizing: border-box;
}
    .detailArea .npay_type_A_2 {
        width: 100% !important;
    }
    .detailArea .npay_type_MA_1 {
        width: calc(100% - 30px) !important;
    }

    /* 2212 비회원 회원가입 버튼 커스텀 */
    #contents .member_check_product {
        display: none;
    }
    #contents[data-product-code="52"] .xans-layout-statelogoff .Buy_btn,
    #contents[data-product-code="52"] .xans-layout-statelogoff .ec-base-button .btn,
    #contents[data-product-code="52"] .xans-layout-statelogoff #NaverChk_Button {
        display: none !important;
    }
    #contents[data-product-code="52"] .member_check_product,
    #contents[data-product-code="52"] .xans-layout-statelogoff .ec-base-button .btn.member_check_product {
        display: block !important;
        width: 100%;
    }
    
    hr {
    	opacity: 0.7;
    }
</style>


<script type="text/javascript">
$(function() {
	$("#product-review-read").hide();
	$("#review-title").click(function() {
		$("#product-review-read").toggle();
	});
	
	$("#actionWish").click(function() {
        // 현재 이미지의 src 속성을 가져옴
        var currentSrc = $("#wish_img").attr("src");
        
        // 이미지1을 클릭한 경우 이미지2로, 이미지2를 클릭한 경우 이미지1로 변경
        if (currentSrc == "http://localhost/cherie_ysy_private/common/images/icon/heart.png") {
            $("#wish_img").attr("src", "http://localhost/cherie_ysy_private/common/images/icon/hearts.png");
        } else {
            $("#wish_img").attr("src", "http://localhost/cherie_ysy_private/common/images/icon/heart.png");
        }
	});	
});//ready


function hover(event, element) {
    $("#bigImg").attr("src", element.src);
}

</script>

</head>
<body>
<%@ include file="layout/header.jsp" %>

<div id="container" style="font-family:Pretendard Medium">
    <div id="contents" role="main" data-product="SW19 6am EAU DE PARFUM (50ml)" data-product-code="13" data-cat-code="49" class="xans-element- xans-product xans-product-detail ">
		<div class="xans-element- xans-product xans-product-headcategory path "><span>현재 위치</span>
		<ol>
			<li><a href="/">홈</a></li>
        	<li class=""><a href="/category/perfume/49/">Perfume</a></li>
        	<li class="displaynone"><a href=""></a></li>
        	<li class="displaynone"><a href=""></a></li>
        	<li class="displaynone"><strong><a href=""></a></strong></li>
   	 	</ol>
	</div>

<div class="xans-element- xans-product xans-product-detail">

<!-- 상품 디테일 / 이미지 -->
<div class="detailArea">
    <div class="xans-element- xans-product xans-product-image imgArea">
      	<div class="RW ">
            <div class="prdImg">
            	  <!-- 썸네일 이미지 -->
                  <div class="thumbnail">
                        <a href="/product/image_zoom2.html?product_no=13&cate_no=49&display_group=1" alt="P000000N" 
                        onclick="window.open(this.href, 'image_zoom2', 'toolbar=no,scrollbars=auto,resizable=yes,width=450,height=693,left=0,top=0', this);return false;">
                            <img id="bigImg" src="//sw19official.com/web/product/big/202302/503ac8142330ac25c0f650eb7cf196c3.png" alt="Chérie 6am EAU DE PARFUM (50ml)" class="BigImage ">                        
                        </a>
                        <div id="zoom_wrap">
                        </div>
                  </div>
            </div>
            
            <!-- 작은 이미지 -->
            <div class="xans-element- xans-product xans-product-addimage listImg">
                <div class="inner">
                      <ul class="list">
						 <li class="xans-record-">
							<img id="imgList1" onmouseover="hover(event, this)" src="//sw19official.com/web/product/small/202302/ed6149f1194281efc9a430e1b3ed92f9.png"  class="ThumbImage" alt="" />
						 </li>
                         <li class="xans-record-">
                         	<img id="imgList2" onmouseover="hover(event, this)" src="//sw19official.com/web/product/extra/small/202208/f41071144616ae375ef54722259c530d.png"  class="ThumbImage" alt="" />
                         </li>
						<li class="xans-record-">
							<img id="imgList3" onmouseover="hover(event, this)" src="//sw19official.com/web/product/extra/small/202208/48aee1fbe453066d9eec732321603206.png"  class="ThumbImage" alt="" />
						</li>
						<li class="xans-record-">
							<img id="imgList4" onmouseover="hover(event, this)" src="//sw19official.com/web/product/extra/small/202208/569b0d54a958ab7b5a36019807f3a5a8.png"  class="ThumbImage" alt="" />
						</li>
                      </ul>
				</div>
				<button type="button" class="prev">
					<i aria-hidden="true" class="icon icoArrowLeft"></i>이전
				</button>
				<button type="button" class="next">
					<i aria-hidden="true" class="icon icoArrowRight"></i>다음
				</button>
			</div>
		</div>
		
		<!-- 모바일 -->
		<div class="RTMB ">
             <p class="prdImg">
                  <a href="#none" id="prdDetailImg" data-param="?product_no=13&cate_no=49&display_group=1" class="thumbnail">
                      <img src="//sw19official.com/web/product/big/202302/503ac8142330ac25c0f650eb7cf196c3.png" class="bigImage" alt="SW19 6am EAU DE PARFUM (50ml)">                    
                  </a>
             </p>
             <div class="xans-element- xans-product xans-product-mobileimage prdImg xans-record-">
				 <ul>
					<li data-param="?product_no=13&cate_no=49&display_group=1">
                         <p class="thumbnail">
                              <img src="//sw19official.com/web/product/big/202302/503ac8142330ac25c0f650eb7cf196c3.png" class="ThumbImage" alt="SW19 6am EAU DE PARFUM (50ml)">                            
                         </p>
                    </li>
                    <li style='display:none' data-param="?product_no=13&cate_no=49&display_group=1">
                    	<img src="//sw19official.com/web/product/extra/big/202208/f41071144616ae375ef54722259c530d.png"  class="ThumbImage" alt="" />
                    </li>
                    <li style='display:none' data-param="?product_no=13&cate_no=49&display_group=1">
                    	<img src="//sw19official.com/web/product/extra/big/202208/48aee1fbe453066d9eec732321603206.png"  class="ThumbImage" alt="" />
                    </li>
                    <li style='display:none' data-param="?product_no=13&cate_no=49&display_group=1">
                    	<img src="//sw19official.com/web/product/extra/big/202208/569b0d54a958ab7b5a36019807f3a5a8.png"  class="ThumbImage" alt="" />
                    </li>                    
                   </ul>
			 </div>
        </div>
	</div>
	<!-- 이미지 끝 -->

	<!-- 상품 디테일 / 설명 -->
    <div class="infoArea">
        <div class="infoAreaInner">
            <div class="headingArea">
                <h1 class="hFamily_PD">
                	<!-- 상품명 -->
                	Chérie 6am EAU DE PARFUM (50ml) 
                	<span class="icon">       </span>
				</h1>
                
                <!-- 상품 가격 -->
                <div class="detailPrice ">
                    <strong class="sale">
                    	<span id="span_product_price_text" class="ProductPrice ">89000</span>
                    	<input id="product_price" name="product_price" value="89000" type="hidden"/>
                    </strong>
                    <span id="span_product_price_text"></span> 
                    <!-- 
                    <span class="soldOut"></span>
                    <button type="button" class="btnRestockSms displaynone" onclick="">재입고 알림 SMS</button>
                    <button type="button" class="btnRestockMail displaynone" onclick="">재입고 알림 메일</button> 
                    -->
                </div>
            </div>
	
			<!-- 상품 설명 -->
            <div class="detailSimple">
            	<p><strong>
            		<span style="color: rgb(68, 68, 68);">
            			“The scent of enchanted grass created by spellbound forest spirits”<br>
            			Just before the sunrise, the mist of Wimbledon forest drifts along and 
            			greets you as you take a stroll. 
            			Feel the 6AM scent of the Wimbledon forest’s glistening morning dew and moist soil.
            		</span>
            		</strong>
            	</p>
				<p><br></p>
				<p>
					“숲의 정령이 만들어낸 중독적인 묘약, 신비로운 풀의 향취”<br>
					세상의 아침이 시작되기 전, 윔블던의 숲을 산책하는 당신에게 푸른 안개가 바람에 실려와 인사를 합니다. 
					이슬 머금은 잔디와 촉촉한 흙내음을 품은 윔블던의 새벽 6시를 느껴보세요.
				</p>
				<hr>
				
				<!-- 노트 / 만든사람 / 재료 -->
				<p>
					<span style="font-size: 9px;">
						<strong>
							<span style="color: rgb(153, 153, 153);">NOTES</span>
						</strong>
					</span>
					<span style="color: rgb(153, 153, 153);"><br>
						<span style="font-size: 9px;"> - Top : Bergamot, Grapefruit, Anise Seeds </span><br>
						<span style="font-size: 9px;"> - Heart : Cardamom, Clary Sage, Basil </span><br>
						<span style="font-size: 9px;"> - Base : Wormwood, Cedarwood, Musk </span><br><br>
						
						<span style="font-size: 9px;">
							<strong>PERFUMER</strong>
						</span><strong><br></strong>
						<span style="font-size: 9px;">Aliénor Massenet</span><br><br>
						
						<span style="font-size: 9px;">
							<strong>INGREDIENTS</strong></span> 
						<br>
            		</span>
            		<span style="font-size: 8px; color: rgb(153, 153, 153);">
            			Alcohol, Fragrance, Water, BHT, Denatonium benzoate,         
        				Limonene, Hydroxycitronellal, Citronellol, Butylphenyl Methylpropional, Geraniol
        			</span>
        		</p>
        		
<p><br></p>
<p><br></p>

		<!-- 부가 정보 -->
		<p> <span style="font-size: 8px; color: rgb(0, 0, 0);">
        		※ 상품 구매 시, 시향 가능한 샘플 키트가 함께 제공됩니다.(품절 시 제공불가)
        		<br style="box-sizing: border-box; color: rgb(33, 33, 33); font-family: Raleway, Noto Sans KR, sans-serif;
            	font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight:
            	400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none;
            	white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color:
            	rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial;
            	text-decoration-color: initial;">
            	※ 선물용 기프트백은 SHOP-ACC 메뉴에서 구매 가능합니다.<br>
            	※ 30,000원 이상 구매 시, 무료 배송<br>
            	※ 사용기한 : 제조일로부터 36개월
        	</span>
    	</p>
<hr>

		<!-- 택배 서비스 -->
		<p><br></p><span style="font-size: 9px;"><strong>[오늘 도착 서비스]</strong></span></p>
		<p><span style="font-size: 9px;"><strong>오후 1시 이전 결제 완료 건 오늘 도착(주말, 공휴일 제외)</strong> </span></p>
		<p><br></p>
		<p><span style="font-size: 9px;"><span style="font-size: 9px;">- 30,000원 이상 구매 시 무료배송</span></span></p>
		<p><span style="font-size: 9px;">- 배송가능 지역을 꼭 확인하고 선택해 주세요</span></span></p>
		<p><span style="font-size: 9px;">- 서울 전 지역/ 경기 일부 지역</span></p>
		<p><br></p>
		<p><span style="font-size: 9px;">서울,성남,광명,안양,부천,수원 전 지역</span></p>
		<p><span style="font-size: 9px;">과천: 주암동 외 가능</span></p>
		<p><span style="font-size: 9px;">고양: 일산 서구,일산 동구,덕약구 일부(화정동, 행신동)</span></p>
		<p><span style="font-size: 9px;">인천: 동구,미추홀구,연수구,부평구,계양구,남동구 일부(운연동 외 가능), 서구 일부(아라뱃길 하단)</span></p>
		<p><span style="font-size: 9px;">의정부: 의정부동,녹양동,신곡동,호원동,가능동,장암동</span></p>
		<p><span style="font-size: 9px;">하남: 감북동,감이동,감일동,덕풍동,망월동,선동,신장동,창우동,풍산동,학암동,미사동</span></p>
	</div>
	<!-- 상품 설명 끝 -->
         
    <!-- <div class="prdInfoBodyBuy">
         <div class="xans-element- xans-layout xans-layout-statelogoff ">
         	<ul class="clearfix">
				<li class="Buy_btn cart">
					<a href="#none">
						<i class="simple icon-handbag"></i>
					</a>
				</li>
                <li class="Buy_btn naver">
                	<a href="#none">
                		<img src="/design/kr/m_btn_npay_mini.png" alt="m_btn_npay_mini">
                	</a>
               	</li>
                <li class="Buy_btn btn">
                	<a href="#none">구매하기</a>
                </li>
                <li class="btn member_check_product">
                	<a href="/member/login.html">회원만 구매 가능합니다.</a>
                </li>
            </ul>
		 </div>
	</div> -->
            
    <!-- 상품 구매 영역 / 상품명, 수량, 가격, 총 가격 -->
    <div class="prdInfoBodyBg"></div>
        <div class="prdInfoBody">
            <div class="goods_top"></div>
                <div class="goods_wrap">
                    <div class="productOption">
                        <table border="1" class="xans-element- xans-product xans-product-option xans-record-">
                         	<caption>상품 옵션</caption>
							<tbody></tbody>
							<tbody>
								<tr class="displaynone" id="">
									<td colspan="2" class="selectButton">
										<a href="#none" class="btnSubmit sizeS" onclick="">옵션선택</a>
									</td>
                            	</tr>
                        	</tbody>
						</table>
					</div>

                    <div class="guideArea">
                        <p class="info ">(최소주문수량 1개 이상<span class="displaynone"> / 최대주문수량 0개 이하</span>)</p>
                        <span class="sizeGuide displaynone">
                        	<a href="#none" class="size_guide_info" product_no="13">사이즈 가이드 
                        		<i aria-hidden="true" class="icon icoArrowRight"></i>
                        	</a>
                       </span>
                    </div>

                    <div id="totalProducts" class="">
                        <table border="1">
                        	<!-- 설명 아래 상품명 / 상품수 / 가격 영역 -->
							<caption>상품 목록</caption>
                            <colgroup>
								<col style="width:200px;">
								<col style="width:auto;">
								<col style="width:35px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품명</th>
                                    <th scope="col">상품수</th>
                                    <th scope="col">가격</th>
                                </tr>
                            </thead>
                            
							<tbody class="">
								<tr><!-- 상품명 -->
									<td>Chérie 6am EAU DE PARFUM (50ml)</td>
                                    <td>
                                    	<!-- 수량 -->
                                        <span class="quantity">
                                            <input id="quantity" name="quantity_opt[]" style="" value="1" type="text"/>                                            
                                            <a href="javascript:;" class="up QuantityUp">수량증가</a>
                                            <a href="javascript:;" class="down QuantityDown">수량감소</a>
                                        </span>
                                    </td>
                                    <!-- 총 가격 -->
                                    <td class="right">
										<span class="quantity_price">89000</span> 
										<span class="mileage displaynone">
											(<img src="" alt="">  <span class="mileage_price"></span>)
										</span>
									</td>
                                </tr>
                                <tr id="totalProductsOption" class="xans-element- xans-product xans-product-option option xans-record-">
									<td class="middle" colspan="3">
                                        <table border="1">
											<caption>옵션 정보</caption>
                                            	<colgroup>
													<col style="width:105px;">
													<col style="width:auto;">
												</colgroup>
											<tbody></tbody>
										</table>
									</td>
								</tr>
							</tbody>
							<!-- 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
							<tbody><!-- tr>
                                    <td>
                                        <p class="product">
                                            $상품명<br />
                                            <span>$옵션</span>
                                        </p>
                                    </td>
                                    <td>
                                        <span class="quantity">
                                            <input type="text" class="quantity_opt" />
                                            &nbsp;<a href="javascript:;" class="up eProductQuantityUpClass"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가" /></a>
                                            <a href="javascript:;" class="down eProductQuantityDownClass"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소" /></a>
                                        </span>
                                        <a href="#none"><img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
                                    </td>
                                    <td class="right">
                                        <span>$가격</span>
                                        <span class="mileage">(<img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/product/ico_pay_point.gif" /> &nbsp;<span class="mileage_price">$적립금</span>)</span>
                                    </td>
                                </tr -->
                           </tbody>
						<!-- // 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
						</table>
					</div>
					<!-- 상품명 / 수량 / 가격 영역 끝 -->
					
					<!-- 총 상품 금액 -->
                    <div id="totalPrice" class="totalPrice">
                        <strong class="title">총 상품금액
                        	<span class="qty total"> (0개)</span>
                        </strong>
                        <span class="total">
                        	<strong><em>0</em></strong>
                        </span>
                    </div>

                    <p class="ec-base-help displaynone EC-price-warning">할인가가 적용된 최종 결제예정금액은 주문 시 확인할 수 있습니다.</p>
                </div>
                <!-- 상품명 / 수량 / 가격 / 총 가격 끝 -->
                
                <!-- 구매하기 / 장바구니 / 관심상품 버튼-->
                <div class="xans-element- xans-layout xans-layout-statelogoff ">
                	<div id="" class="xans-element- xans-product xans-product-action productAction ">
                		<div class="ec-base-button gColumn ">
                        	<a href="buy.jsp" class="btn gFlex2 actionBuy " onclick="">
                        		<span id="actionBuy" style="font-size:16px">구매하기</span>
                        	</a>
                        	<input type="button" value="장바구니" class="btn gFlex2 actionCart " style="font-family:Pretendard Medium" onclick="" id="actionCart">
                        		장바구니
                        	<button type="button" class="btn actionCart " onclick="" id="actionWish">
                        		<img style="width:20px" id="wish_img" src="http://192.168.10.136/prj_web_shopping/common/images/icon/heart.png"/>
                        	</button>
                        	<a href="/member/login.html" class="btn gFlex2 actionBuy member_check_product">
                        		<span>회원만 구매 가능합니다.</span>
                        	</a>
                		</div>
						<div class="ec-base-button displaynone">
                            <button type="button" class="btn gFull actionSold displaynone">품절된 상품입니다.</button>
                    	</div>
					</div>
			</div>
			<!-- 구매하기 / 장바구니 / 관심상품 버튼 끝 -->
         </div>
         <!-- 상품 설명 오른쪽 영역 끝 -->
		 <!-- //prdInfoBody  -->
     </div>
	 <!-- //infoAreaInner -->
  </div>
</div>
</div>
<!-- 상품 이미지/설명 끝 -->

<!-- 상품 상세 이미지 / 리뷰 탭 -->
<div id="detailTab" class="xans-element- xans-product xans-product-detail detailTab">
	<div class="deTab">
        <ul class="clearfix">
			<li class="tab1 open selected">
				<a href="#prdDetail">Information</a>
			</li>
            <li class="tab2 ">
            	<a href="#prdReview">Reviews 
            		<!-- 리뷰 개수 -->
            		<span class="br1138">1138</span>
            	</a>
            </li>
        </ul>
	</div>
</div>

<!-- 상세 이미지 / 리뷰 -->
<div class="xans-element- xans-product xans-product-additional">
	<!-- 상품 상세 이미지 -->
	<div id="prdDetail" class="productDetail on">
        <div>
        	<!-- 상세 이미지 링크 -->
        	<img src="http://localhost/prj_web_shopping/common/images/6am_detail_img.png" 
        		style="display: block; vertical-align: top; margin: 0px auto; 
        		text-align: center;" result="success" name="copy-1660612914-5BKOR5D206AM_WEB.png"
				size="1201px/1783px" filesize="2,94 MB" error=""><br>
		</div>
    </div>
    
    <!-- 리뷰 -->
	<div id="prdReview" class="prdReview  ">
        <div class="title">
            <h2>Reviews 
            	<!-- 리뷰 개수 -->
            	<span class="br1138">1138</span>
			</h2>
        </div>
        
        <!-- 리뷰 테이블 -->
        <div class="contents">
            <div class="xans-element- xans-product xans-product-review">
            	<a name="use_review"></a>
				<p class="noAccess displaynone">글읽기 권한이 없습니다.</p>
				<div class="ec-base-table typeList ecBase">
                    <table border="1" class="">
						<caption>상품사용후기</caption>
                        	<colgroup>
								<col style="width:70px;" class="RW">
								<col style="width:auto">
								<col style="width:100px;">
								<col style="width:100px;">
								<col style="width:80px;">
								<col style="width:80px;">
							</colgroup>
						<thead style="text-align:center">
							<tr>
								<th scope="col" class="RW">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">작성일</th>
                                <th scope="col">조회</th>
                                <th scope="col">평점</th>
                            </tr>
                        </thead>
                            
                        <!-- 리뷰 상세 -->
						<tbody class="center">
							<tr class="xans-record-">
								<td class="RW"> 리뷰 번호 </td>
                                <td class="subject left txtBreak"> 
                                	<!-- 리뷰 제목 / 상세 링크 -->
                                	<span id="review-title" style="margin:0px 5px 0px 5px; color:black;">제목 영역</span>
                                	
                                	<!-- HIT 이미지 -->
                                	<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif"  alt="HIT" class="ec-common-rwd-image" />
                                </td>
                                <!-- 작성자 -->
                                <td> 작성자 영역 </td>
                                
                                <!-- 작성일 -->
                                <td> 작성일 영역 </td>
                                
                                <!-- 조회수 -->
                                <td> 조회수 영역 </td>
                                
                                <!-- 별점 -->
                                <td>
                                	<img src="//img.echosting.cafe24.com/skin/skin/board/icon-star-rating5.svg" alt="5점">
                                </td>
                            </tr>
                            
                            <!-- 리뷰 클릭시 상세보기 -->
                            <tr id="product-review-read" style="">
                            	<td colspan="6">
                            	<div class="view">
                            		<div id="ec-ucc-media-box-11247"></div>
                            			<p class="attach"></p>
                            			<p></p>
                            			<!-- 리뷰 내용 -->
                            			<div class="fr-view fr-view-article">
                            				<p>항상 쓰는제품입니다~</p>
                            				<p>너무 좋아요</p>
                            				<br>
                            			</div>
                            			<p></p>
                            		</div>
                            	</td>
                            </tr>
                            <!-- 상세보기 영역 -->
                            
						</tbody>
					</table>
				</div>
			</div>
            
            <!-- 페이지 네이션 -->
            <div class="xans-element- xans-product xans-product-reviewpaging ec-base-paginate typeList">
            	<a href="#none" class="first">첫 페이지</a>
				<a href="#none">이전 페이지</a>
				<ol>
					<li class="xans-record-"><a href="?page_4=1#use_review" class="this">1</a></li>
                    <li class="xans-record-"><a href="?page_4=2#use_review" class="other">2</a></li>
                    <li class="xans-record-"><a href="?page_4=3#use_review" class="other">3</a></li>
                    <li class="xans-record-"><a href="?page_4=4#use_review" class="other">4</a></li>
                    <li class="xans-record-"><a href="?page_4=5#use_review" class="other">5</a></li>
                </ol>
				<a href="?page_4=2#use_review">다음 페이지</a>
				<a href="?page_4=228#use_review" class="last">마지막 페이지</a>
			</div>
        </div>
        <!-- 리뷰 테이블 끝 -->
    </div>
    <!-- 리뷰 끝 -->
    
    <ul class="prdFaq clearfix grid3">
		<li>
            <h2><strong>배송 안내</strong></h2>
            <ul class="info delivery">
				<li>1. 배송기간 : 2~5일 (CJ대한통운)</li>
                <li>2. 배송비용 : 조건부 무료배송 (3만원 이상)</li>
                <li>3. 교환비용 : 무료교환</li>
                <li>4. 반품비용 : 왕복배송비 고객부담</li>
            </ul>
		</li>
        <li>
            <h2><strong>교환 및 반품이 가능한 경우</strong></h2>
            <ul class="info delivery">
				<li>1. 상품을 공급받은 날로부터 7일이내 교환 및 반품 가능</li>
                <li>(단, 제품 박스를 개봉하였거나 훼손된 경우에는 교환/반품 불가)</li>
                <li>2. 상품 하자 및 오배송 시에는 100% 교환/환불 가능</li>
            </ul>
		</li>
        <li>
            <h2><strong>교환 및 반품이 불가한 경우</strong></h2>
            <ul class="info delivery">
				<li>1. 상품을 공급받은 날로부터 7일이 지난 경우</li>
                <li>2. 제품 박스를 개봉하였거나 훼손되어 상품가치가 상실한 경우</li>
                <li>3.고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 감소한 경우</li>
            </ul>
		</li>
    </ul>
    
  </div>
  <!-- 상세이미지 / 리뷰 끝 -->
 </div>
 <!-- 전체 -->
</div>

<%@ include file="layout/footer.jsp"%>
</body>
</html>