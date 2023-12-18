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
<!-- 결제 css -->
<link rel="preload" href="https://web.joongna.com/_next/static/css/82d216d82f2f74d1.css" as="style"/>
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/82d216d82f2f74d1.css" data-n-g=""/>
<link href="https://fruitsfamily.com/static/css/main.8c8a1dc3.chunk.css" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
<style type="text/css">
.Checkout-container {
    padding-left: 650px;
    padding-right: 650px;
}
.h1, h1 {
    font-size: 40px;
    text-align: center;
}
</style>
<script type="text/javascript">
$(function() {

});//ready
</script>

</head>
<body>
<jsp:include page="/common/cdn/header.jsp"/>
	<div class="Checkout-container">
		<h1 class="page-title">주문 / 결제</h1>
		<h4 class="Checkout-title">상품 정보</h4>
		<div class="CheckoutProductDetails">
			<img class="CheckoutProductDetails-image" loading="lazy"
				alt="product_image"
				src="https://image.production.fruitsfamily.com/public/product/resized%40width620/WJn3LTLO7N-9B59E628-506B-4FF6-B0D8-4C5C82289CD5.jpg">
			<div class="CheckoutProductDetails-details">
				<h6 class="CheckoutProductDetails-brand ">Needles</h6>
				<div class="CheckoutProductDetails-productTitle">Needles
					leather blouson</div>
			</div>
		</div>
		<div class="Checkout-order">
			<div class="CheckoutInvoice">
				<div class="CheckoutInvoice-safety-purchase-info">
					<a href="" rel="noopener noreferrer" target="_blank" class="SafetyPurchaseInfo">
					<div class="SafetyPurchaseInfo-button">
							<img alt="shield" src="https://fruitsfamily.com/static/media/icon_shield.ad9a7fba.svg">
							<div class="text">100% 안전한 ‘안전결제’로 거래하세요</div>
						</div></a>
				</div>
				<div class="CheckoutInvoice-price">
					<div>상품 금액</div>
					<div>182,000원</div>
				</div>
				<div class="CheckoutInvoice-price">
					<div>수수료</div>
					<div>0원</div>
				</div>
				<div class="CheckoutInvoice-price total">
					<div>총 결제 금액</div>
					<div>182,000원</div>
				</div>
			</div>
			<div class="Checkout-divider"></div>
			<div class="Checkout-divider"></div>
			<div class="CheckoutPaymentMethod">
				<div>결제 방법</div>
				<div class="CheckoutPaymentMethod-content">
					<div class="CheckoutPaymentMethod-select">
						<img alt="radio" src="https://fruitsfamily.com/static/media/icon_radio.ff11a5b5.svg">
						<div>안전 결제</div>
					</div>
					<div class="CheckoutPaymentMethod-pay">
						<img alt="naver-pay"
							src="https://fruitsfamily.com/static/media/icon_logo_npay.06f21a96.svg">
					</div>
				</div>
			</div>
			<div class="Checkout-divider"></div>
			<div class="Checkout-agree-container">
				<div class="Checkout-agree-list">
					<div class="Checkout-agree-text Checkout-select-text">
						주문할 상품의 결제,배송,주문정보를<br>확인하였으며 이에 동의합니다.
					</div>
					<div class="form-checkbox">
						<input type="checkbox" id="agree1" name="agree1">
						<label for="agree1"></label>
					</div>
				</div>
				<div>
					<button class="button default full">안전 결제하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/common/cdn/footer.jsp"/>
</html>