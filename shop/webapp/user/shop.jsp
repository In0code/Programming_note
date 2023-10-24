<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#pageTitle {
	font-family: Playfair Display;
	font-size: 27px;
	text-align: center;
	/* border-top: 2px solid black; */
	padding: 10px;
	margin-top: 100px;
}

.xans-product-headcategory.title{
	margin-bottom: 20px;
}
.banner{
	width: 100%; position: relative;
}

.banner img {
	width: 100%; height: auto; display: block; margin: 20px auto 0;
}

</style>
<script type="text/javascript">
$(function() {
	
	
});//ready
</script>

</head>
<body>
<%@ include file="layout/header.jsp"%>

<div id="container">
     <div id="contents" role="main">
            
<div class="xans-element- xans-product xans-product-menupackage ">
<div class="xans-element- xans-product xans-product-headcategory path "><span>현재 위치</span>
</div>
</div>

<div class="xans-element- xans-product xans-product-headcategory title ">
	<h2 class="hFamily_PD">
		<div id="pageTitle">All Products</div>
	</h2>
	<h3 class="hFamily_PD">
        <!-- <span tit="All Products"><a href="/product/list.html?cate_no=48">All Products &gt;</a></span> -->
        <!--span class="displaynone"></span>
        <span class="displaynone"><a href=""> &gt;</a></span>
        <span class="displaynone"><a href=""> &gt;</a></span>
        <span class="displaynone"><a href=""> &gt;</a></span>
        <span class=""><a href="/category/all-products/48/">All Products &gt;</a></span>-->
    </h3>
<div class="clear"></div>
<p class="banner"></p>

<span class="likeButton displaynone"><button type="button"><strong></strong></button></span>
</div>

<div class="ec-base-tab typeMenu" style="display: none;">    
    <ul class="menuCategory menu" style="display: none;"></ul>
</div>

<div class="xans-element- xans-product xans-product-normalpackage ">
	<div class="xans-element- xans-product xans-product-normalmenu displaynone "></div>
	
<div class="product_area">
        <div class="xans-element- xans-product xans-product-listnormal ec-base-product product"><!--
                $count = 30
                    ※ 상품진열갯수를 설정하는 변수입니다. 설정하지 않을 경우, 최대 200개의 상품이 진열 됩니다.
                    ※ 진열된 상품이 많으면, 쇼핑몰에 부하가 발생할 수 있습니다.
				$moreview = yes
                $cache = no
                $basket_result = /product/add_basket.html
                $basket_option = /product/basket_option.html
            -->
            
<!--     @@@     상품 진열     @@@       -->
<ul class="prdList grid3">
<!-- li가 하나의 상품임 -->

<!-- product 1 시작 -->
<li id="productId_1" class="xans-record-">
    <div class="prdList__item">
    		<!-- 대표 사진 -->
            <div class="thumbnail">
            	  <!-- 사진 눌렀을 때 이동할 상품 페이지 -->
                  <a href="../user/product_detail.jsp?productId=perfume01">
                      <img class="hI hImg orgImg hImgover" src="//sw19official.com/web/product/medium/202309/4b9b535eb0e7b015b45944a86c995269.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET">
                      <img class="hoverImg" src="//sw19official.com/web/product/extra/big/202309/2abe48472c2f1196c0fce34106502aa5.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET">
                        &nbsp;<!--img class="hI hImg orgImg" src="//sw19official.com/web/product/medium/202309/4b9b535eb0e7b015b45944a86c995269.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET"><img class="hoverImg" src="//sw19official.com/web/product/tiny/202309/451ea41391969b890543f550968841d0.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET"-->
                        &nbsp;                            
                  </a>
            </div>
            
            <!-- 상품명/가격 -->
            <div class="description">
                <strong class="name hFamily_PD"><a href="../product/mini_discovery_set.jsp" class="">
                <span class="title displaynone">
                	<span style="font-size:16px;color:#212121;">상품명</span> :
                </span> 
                	<span style="font-size:16px;color:#212121;">Chérie MINI DISCOVERY SET</span></a>
                </strong>
                <ul class="xans-element- xans-product xans-product-listitem spec">
                	<li class=" xans-record-">
                      <strong class="title displaynone">
                      	<span style="font-size:14px;color:#414141;">판매가</span> :
                      </strong> 
                      <span style="font-size:14px;color:#414141;font-family:Pretendard">30,000원</span>
                      <span id="span_product_tax_type_text" style=""> </span>                                
                    </li>
				</ul>
				<div class="icon"></div>
                <div class="iconNew"><img src="/web/upload/icon_202206091627347200.png" class="icon_img" alt="New">
                	<span>NEW!</span>
				</div>
                <!-- <div class="cart"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif" onclick="category_add_basket('104','48', '1', 'A0000', false, '1', 'P00000EA', 'A', 'F', '0');" alt="장바구니 담기" class="ec-admin-icon cart"><p><i class="icon-basket"></i><span>Cart</span></p></div> -->
         	</div>
    </div>
</li>
<!-- product 1 끝 -->

<li id="productId_2" class="xans-record-">
    <div class="prdList__item">
    		<!-- 대표 사진 -->
            <div class="thumbnail">
                  <a href="../user/product_detail.jsp?productId=perfume02">
                      <img class="hI hImg orgImg hImgover" src="//sw19official.com/web/product/medium/202302/fc4eb08576b7572250259b7bc052d29f.png" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET">
                      <img class="hoverImg" src="//sw19official.com/web/product/extra/big/202208/f41071144616ae375ef54722259c530d.png" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET">
                        &nbsp;<!--img class="hI hImg orgImg" src="//sw19official.com/web/product/medium/202309/4b9b535eb0e7b015b45944a86c995269.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET"><img class="hoverImg" src="//sw19official.com/web/product/tiny/202309/451ea41391969b890543f550968841d0.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET"-->
                        &nbsp;                            
                  </a>
                  <div class="icon__box">
                       <span class="wish"></span>
                  </div>
                  <span class="benefit"></span>
            </div>
            
            <!-- 상품명/가격 -->
            <div class="description">
                <strong class="name hFamily_PD"><a href="../product/6am_perfume.jsp" class="">
                <span class="title displaynone">
                	<span style="font-size:16px;color:#212121;">상품명</span> :
                </span> 
                	<span style="font-size:16px;color:#212121;">Chérie 6am EAU DE PARFUM (50ml)</span></a>
                </strong>
                <ul class="xans-element- xans-product xans-product-listitem spec">
                	<li class=" xans-record-">
                      <strong class="title displaynone">
                      	<span style="font-size:14px;color:#414141;">판매가</span> :
                      </strong> 
                      <span style="font-size:14px;color:#414141;">89,000원</span>
                      <span id="span_product_tax_type_text" style=""> </span>                                
                    </li>
				</ul>
				<div class="icon"></div>
                <!-- <div class="iconNew"><img src="/web/upload/icon_202206091627347200.png" class="icon_img" alt="New">
                	<span>NEW!</span></div> -->
                <!-- <div class="cart"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif" onclick="category_add_basket('104','48', '1', 'A0000', false, '1', 'P00000EA', 'A', 'F', '0');" alt="장바구니 담기" class="ec-admin-icon cart"><p><i class="icon-basket"></i><span>Cart</span></p></div> -->
         </div>
    </div>
</li>
</ul>
</div>



<!-- 더보기 버튼 -->
<!-- <div class="xans-element- xans-product xans-product-listmore more ">
	<a href="#none" onclick="try { $M.displayMore(0, 0, 48, 30, 0, false, 'S0000000', false, ''); } catch(e) { return false; }" class="btnMore">
                더보기<span id="more_current_page">1</span>/<span id="more_total_page">2</span>
                <i aria-hidden="true" class="icon icoArrowBottom"></i>
            </a>
</div> -->
</div>
</div>
</div><hr class="layout"></div>

<%@ include file="layout/footer.jsp"%>
</body>
</html>