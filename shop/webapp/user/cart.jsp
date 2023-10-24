<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet"/>

<style type="text/css">
#cart{
/* Font & Text */
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
font-size: 13px;
line-height: 20px;
text-decoration: none solid rgb(153, 153, 153);
text-align: center;
word-spacing: 0px;
/* Color & Background */
background-color:  #FFFFFF;
background-position: 0% 0%;
color:  #999999;
/* Box */
height: 20px;
width: 1200px;
margin: 50px 0 50px 0;
/* Positioning */
display: block;
/* Effects */
transform: none;
transition: all 0s ease 0s;
outline:1px;
}
a.btnBlack.left.sizeL{
/* Font & Text */
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
font-size: 14px;
line-height: 22px;
text-decoration: none solid rgb(255, 255, 255);
text-align: center;
vertical-align: middle;
white-space: nowrap;
word-spacing: 0px;
/* Color & Background */
background-color:  #141414;
background-position: 0% 0%;
color:  #FFFFFF;
/* Box */
height: 56px;
width: 582px;
border: 1px solid  #FFFFFF;
padding: 16px 16px 16px 16px;
min-width: 80px;
/* Positioning */
float: left;
display: block;
/* Miscellaneous */
cursor: pointer;
/* Effects */
transform: none;
transition: all 0.3s ease-in-out 0s;
outline: rgb(255, 255, 255) dashed 0px;
box-sizing: border-box;
}
a.btnSubmit.right.sizeL{
/* Font & Text */
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
font-size: 14px;
line-height: 22px;
text-decoration: none solid rgb(0, 0, 0);
text-align: center;
vertical-align: middle;
white-space: nowrap;
word-spacing: 0px;
/* Color & Background */
background-color:  #FFFFFF;
background-position: 0% 0%;
color:  #000000;
/* Box */
height: 56px;
width: 582px;
border: 1px solid  #000000;
padding: 16px 16px 16px 16px;
min-width: 80px;
/* Positioning */
float: left;
display: block;
Miscellaneous;
cursor: pointer;
/* Effects */
transform: none;
transition: all 0.3s ease-in-out 0s;
outline: rgb(0, 0, 0) dashed 0px;
box-sizing: border-box;
}

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
 <%@include file="layout/header.jsp" %>
<div id="container">
<div id="contents">

<div class="xans-element- xans-order xans-order-basketpackage "><div class="xans-element- xans-order xans-order-tabinfo ec-base-tab typeLight "><ul class="menu">
<li class="selected "><a href="/order/basket.html">국내배송상품 (0)</a></li>
        </ul>
<p id="cart" class="right displaynone">장바구니에 담긴 상품은 7일 동안 보관됩니다.</p>
</div>
<div class="xans-element- xans-order xans-order-empty "><p  id="cart">장바구니가 비어 있습니다.</p>
</div>
<div class="orderListArea ec-base-table typeList gBorder">
        
<script type="text/javascript">
var df_tagm_products=[];
</script>	

        
        </div>
<div class="orderListArea ec-base-table typeList gBorder">
        
        
        </div>
<!-- 총 주문금액 : 국내배송상품 -->
<!-- 총 주문금액 : 해외배송상품 -->
<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per"><ul class="grid2">
<a href="#none" onclick="Basket.orderAll(this)" link-order="/order/orderform.html?basket_type=all_buy" link-login="/member/login.html" class="btnBlack left sizeL  ">전체상품주문</a>
        <a href="#none" onclick="Basket.orderSelectBasket(this)" link-order="/order/orderform.html?basket_type=all_buy" link-login="/member/login.html" class="btnSubmit  right sizeL ">선택상품주문</a> 
        </ul>
</div>
<!-- 네이버 체크아웃 구매 버튼  -->
<div id="NaverChk_Button"></div>
</div>

<!-- @JGO/230522 - Enhanced Ecommerce Tag -->
<script>
//Npay Event
	window.addEventListener("DOMContentLoaded", function(){

		setTimeout(function() {
		console.log('네이버페이 준비');

			$('.npay_btn_pay').one('click', function(){
			console.log('네이버페이 실행');

				var productTotalPrice = 0;

				if(jgo_products.length > 0) {
					for(var i in jgo_products) {
						productTotalPrice += jgo_products[i].price * jgo_products[i].quantity
					}
				}

				if(jgo_products.length > 0 && productTotalPrice > 0) {

					var NaverPayPrice = getCookie('NAVERPAY_PRICE');

					if(NaverPayPrice != "" && !isNaN(parseInt(NaverPayPrice)) && parseInt(NaverPayPrice) == productTotalPrice) {
						console.log(productTotalPrice + " 으로 금액이 같거나, 중복으로 클릭됨");
						return false;
					}

					if(NaverPayPrice == null || NaverPayPrice == "" || (NaverPayPrice != "" && !isNaN(parseInt(NaverPayPrice)) && parseInt(NaverPayPrice) != productTotalPrice)) {
						setCookie('NAVERPAY_PRICE', productTotalPrice, 1);
					}

					var date = new Date();
					var orderId = date.getUTCFullYear();
					orderId += (parseInt(date.getMonth())+1) < 10 ? '0'+ (parseInt(date.getMonth())+1) : (parseInt(date.getMonth())+1) + '';
					orderId += date.getDate() < 10 ? '0'+ date.getDate() : date.getDate() + '';
					orderId += '-Npay-';
					orderId += Math.round(Math.random()*8888888+1111111);

					dataLayers.push({
						'event': 'nPayClick',
						'ecommerce': {
							'purchase': {
								'actionField': {
									'id': orderId,
									'revenue': productTotalPrice,
								},
								'products': jgo_products
							}
						}
					});
				}

			});

		}, 1000);

	});

	function getCookie(name) {
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value ? unescape(value[2]) : null;
	};

	function setCookie(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
		document.cookie = name + '=' + escape(value) + ';expires=' + date.toUTCString() + ';path=/';
	};

	var jgo_products = jgo_products||[];

	if(jgo_products){

		dataLayers.push({
			'event': 'viewcart',
			'ecommerce': {
				'checkout': {
					'products': jgo_products
				}
			}
		});
	}

</script>

<div class="xans-element- xans-order xans-order-basketguide ec-base-help "><h3>이용안내</h3>
<div class="inner">
        <h4>장바구니 이용안내</h4>
        <ol>
            <li class="item1">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
            <li class="item2">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
            <li class="item3">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
            <li class="item4">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
        </ol>
<h4>무이자할부 이용안내</h4>
        <ol>
<li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
            <li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
            <li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
            <li class="item4">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.<br>실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.</li>
        </ol>
</div>
</div>

<div id="ec-basketOptionModifyLayer" class="optionModify ec-base-layer" style="display:none;">
    <div class="header">
        <h3>옵션변경</h3>
    </div>
    <div class="content">
        <ul class="prdInfo"><li class="ec-basketOptionModifyLayer-productName">{$product_name}</li>
            <li class="ec-basketOptionModifyLayer-optionStr">{$layer_option_str}</li>
        </ul><div class="prdModify">
            <h4>상품옵션</h4>
            <ul><li class="ec-basketOptionModifyLayer-options" style="display:none;"><span>{$option_name}</span> {$form.option_value}</li>
                <li class="ec-basketOptionModifyLayer-addOptions" style="display:none;"><span>{$option_name}</span> {$form.option_value}</li>
            </ul></div>
    </div>
    <div class="ec-base-button">
        <a href="#none" class="btnSubmitFix sizeS ec-basketOptionModifyLayer-add">추가</a>
        <a href="#none" class="btnNormalFix sizeS ec-basketOptionModifyLayer-modify">변경</a>
    </div>
    <a href="#none" class="close" onclick="$('#ec-basketOptionModifyLayer').hide();"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기"></a>
</div>

<!-- NAVER SCRIPT -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_59479b4d5d8b";
if (!_nasa) var _nasa={};
_nasa["cnv"] = wcs.cnv("3","1"); 
wcs_do(_nasa);
</script>
<!-- NAVER SCRIPT END -->
</div>   
</div>
<%@include file="layout/footer.jsp" %>
</body>
</html>