<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
<script type="text/javascript">
	function searchLayerToggle() {
		$('body').toggleClass('search_active');
	}
</script>

<style>
/* logo size */
@media all and (min-width: 992px) {
    .xans-layout-logotop img {
        max-width: 130px;
        image-rendering: -webkit-optimize-contrast;
    }
}

#topBanner, #header, .xans-layout-logotop {
	z-index: 9;
}

.headSearch {
	position: fixed;
	top: 50%;
	transform: translateY(-50%);
	left: 0;
	width: 100%;
	z-index: 9;
	text-align: center;
	padding: 70px 20px 20px;
	box-sizing: border-box;
	display: none;
}

.headSearchBg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	height: 100vh;
	z-index: 8;
	background: transparent;
	background-color: #fff;
	display: none;
}

.headSearchBtn_close {
	display: none;
}

body.search_active .headSearch, body.search_active .headSearchBg, body.search_active .headSearchBtn_close
	{
	display: block;
}

body.search_active .headSearchBtn_magnifier {
	display: none;
}

#header .navigation__util>li.headCart.headSearchBtn {
	margin-left: 12px;
}

.headSearch .searchbar {
	max-width: 500px;
	margin: 0 auto;
	position: relative;
}

.headSearch .searchbar input[type="text"] {
	height: 60px;
	border: 0;
	border-bottom: 1px solid #111;
	color: #111;
	padding: 10px;
	background: transparent;
	width: 100%;
	font-size: 25px;
}

.headSearch #keyword {
	text-align: left;
	text-indent: 0 !important;
}

.headSearch .searchbar #keyword:focus::placeholder {
	display: none;
}

.headSearch .searchbar #keyword::-webkit-input-placeholder {
	color: var(- -aromatica-color-primary);
	font-size: 25px;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
	letter-spacing: normal;
	line-height: normal !important;
	font-family: sans-serif;
	opacity: 0.65;
}

.headSearch .searchbar #keyword::-moz-placeholder {
	color: var(- -aromatica-color-primary);
	font-size: 25px;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
	letter-spacing: normal;
	line-height: normal !important;
	font-family: sans-serif;
	opacity: 0.65;
}

.headSearch .searchbar #keyword::-ms-input-placeholder {
	color: var(- -aromatica-color-primary);
	font-size: 25px;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
	letter-spacing: normal;
	line-height: normal !important;
	font-family: sans-serif;
	opacity: 0.65;
}

.headSearch .searchbar #keyword::placeholder {
	color: var(- -aromatica-color-primary);
	font-size: 25px;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
	letter-spacing: normal;
	line-height: normal !important;
	font-family: sans-serif;
	opacity: 0.65;
}

.headSearch .search_button {
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 20px;
}
</style>
		<!--     
<div id="topBanner" role="banner" class="xans-element- xans-custom xans-custom-moduleedit "><div class="desc"><a href="/category/scent-pairing/78/">당신의 여정을 더욱 다채롭게 만들어 줄 SW19 ‘센트 페어링’ 프로모션 바로가기</a></div>
	<div class="desc"><a href="/category/chuseok-gift/52/">‘Wish your happy moments’ SW19 추석 리미티드 기프트 포장 서비스 바로가기</a></div>
	<div class="desc"><a href="https://pf.kakao.com/_wxmEeK">SW19 카카오톡 채널 추가 시, 5% 추가 할인 혜택 바로가기</a></div>
	<button type="button" class="btnClose"><i aria-hidden="true" class="icon icoClose white"></i>닫기</button>
</div>
<div id="topBanner" role="banner" class="xans-element- xans-custom xans-custom-moduleedit topBanner_add displaynone "><div class="desc"><a href="/event/event6">SW19 홈 프래그런스 디퓨저 런칭, 프로모션 바로가기</a></div>
	<div class="desc"><a href="/event/event7">SW19 홈 프래그런스 디퓨저 10% 할인 및 증정 프로모션 바로가기</a></div>
	<button type="button" class="btnClose"><i aria-hidden="true" class="icon icoClose white"></i>닫기</button>
</div> 
-->

<!-- 검색 상세  -->
		<div class="headSearchBg"></div>
		<div class="headSearch">
			<form id="searchBarForm" name="" action="/product/search.html"
				method="get" target="_self" enctype="multipart/form-data">
				<input id="banner_action" name="banner_action" value="" type="hidden" />
				<div class="xans-element- xans-layout xans-layout-searchheader headSearchBox ">
					<div class="searchbar">
						<fieldset>
							<input id="keyword" name="keyword" fw-filter="" fw-label="검색어"
								fw-msg="" class="inputTypeText" placeholder=""
								onmousedown="SEARCH_BANNER.clickSearchForm(this)" value=""
								type="text" />
								<span class="search_button" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
									<img src="http://192.168.10.136/prj_web_shopping/common/images/icon/search.png" width="30px"/>
								</span>
						</fieldset>
					</div>
					<div class="xans-element- xans-search xans-search-hotkeyword displaynone">
						<ul class="hotkeyword-list">
							<li class="hotkeyword xans-record-">
								<a href="/product/search.html?keyword=" class=""></a>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>

		<header id="header">
			<div class="inner" style="font-family:'MADE Voyager PERSONAL_USE'">
				<ul class="headLeft">
					<li class="xans-element- xans-layout xans-layout-multishoplist">
						<a href="../user/main.jsp" class="toggle">HOME</a>
					</li>
					<li class="headCategory">
						<!-- 이동 링크 설정 -->
						<a href="../user/shop.jsp">SHOP</a>
						<div class="xans-element- xans-layout xans-layout-category navigation__category menu">
							<ul>
								<li class="xans-record-">
									<a href="../user/shop.jsp">All Products</a>
								</li>
								<li class="xans-record-">
									<a href="../user/shop.jsp">Perfume</a>
								</li>
								<li class="xans-record-">
									<a href="../user/shop.jsp">Home Fragrance</a>
								</li>
								<li class="xans-record-">
									<a href="../user/shop.jsp">Body Care</a>
								</li>
								<li class="xans-record-">
									<a href="../user/shop.jsp">Hand Care</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="headAbout"><a href="../user/about.jsp">ABOUT</a></li>
					<li class="headStores"><a href="../user/stores.jsp">STORES</a>
					
					</li>
					<li class="headInfo"><a href="../user/notice.jsp">INFO</a>
					<div class="xans-element- xans-layout xans-layout-category navigation__category menu">
							<ul>
								<li class="xans-record-">
									<a href="../user/notice.jsp">Notice</a>
								</li>
								<li class="xans-record-">
									<a href="../user/faq.jsp">FAQ</a>
								</li>
							</ul>
						</div>
					</li>
				</ul>
				<button type="button" class="btnNav eNavFold">
					<i aria-hidden="true" class="icon icon-menu"></i>네비게이션
				</button>

				<!-- 검색 -->
				<div class="topArea__statelogon">
					<ul class="xans-element- xans-layout xans-layout-statelogoff ">
						<li class="headSearchBtn">
							<!-- <a href="javascript:void(0)" onclick="searchLayerToggle()">
								<img src="../common/images/icon/search.png" id="searchBtn" width="20px" onclick="searchIcon()"/>
								<img src="../common/images/icon/x-circle.svg"/>
							</a> -->
							<a href="javascript:void(0)" onclick="searchLayerToggle()">
								<img src="http://192.168.10.136/prj_web_shopping/common/images/icon/search.png" width="20px" class="icon-magnifier headSearchBtn_magnifier"/>
								<img src="http://192.168.10.136/prj_web_shopping/common/images/icon/remove.png" width="20px" class="icon-close headSearchBtn_close"/>
								<!-- <i class="icon-magnifier headSearchBtn_magnifier"></i>
								<i class="icon-close headSearchBtn_close"></i> -->
							</a>
						</li>
						<li>
							<a href="../user/login.jsp">Login</a>
						</li>
						<li>
							<a href="../user/join.jsp">Join</a>
							<!-- 
							<div id="tooltip">
								<div class="tooltipArrow"></div>
								<div class="tooltipInner">회원 가입 시 3,000P 지급</div>
							</div> 
							-->
						</li>
						<li>
							<a href="../user/cart.jsp">Cart
								<span class="count displaynone EC-Layout_Basket-count-display">
									<span class="EC-Layout-Basket-count"></span>
								</span>
							</a>
						</li>
					</ul>
				</div>

				<ul class="navigation__util">
					<li>
						<a href="../user/shop.jsp">SHOP</a>
					</li>
					<li class="headCart headSearchBtn">
						<a href="javascript:void(0)" onclick="searchLayerToggle()">
							<i class="icon-magnifier headSearchBtn_magnifier"></i>
							<i class="icon-close headSearchBtn_close"></i>
						</a>
					</li>
					<li class="xans-element- xans-layout xans-layout-statelogoff headCart ">
						<a href="../user/cart.jsp">
							<i class="icon-bag"></i>
							<span class="count displaynone EC-Layout_Basket-count-display">
								<span class="EC-Layout-Basket-count"></span>
							</span>
						</a>
					</li>
				</ul>
				<!-- logo img -->
				<h1 class="xans-element- xans-layout xans-layout-logotop topArea__logo " >
					<a href="../user/main.jsp">
						<img src="http://192.168.10.136/prj_web_shopping/common/images/logo.png" alt="Cherie">
					</a>
				</h1>
			</div>
		</header>
		
		<!-- <hr class="layout">
		<aside id="aside" class="xans-element- xans-layout xans-layout-slidepackage ">
			<nav class="navigation-menu" role="navigation">
				<div class="navigation-menu__member">
					<div class="xans-element- xans-layout xans-layout-statelogoff ">
						<a href="../login.jsp"> 
							<span>회원가입 시 3,000포인트 증정</span>
							<button type="button">로그인</button>
						</a>
					</div>
				</div>

				<div id="multiList" class="xans-element- xans-layout xans-layout-multishoplist multishopList ">
					<h2 class="toggle">
						<a href="../main.jsp">HOME</a>
						<span class="_toggle_btn toggle-btn"></span>
					</h2>
					
					<ul style="display: none;" class="xans-element- xans-layout xans-layout-multishoplistitem menu">
						<li class="selected xans-record-">
							<a href="//sw19official.com/">Korean한국어</a>
						</li>
						<li class=" xans-record-"><a href="//en.sw19official.com/">EnglishEnglish</a>
						</li>
					</ul>
					
				</div>

				<div id="slideCateList" class="navigation-menu__category">
					<h2>
						SHOP<span class="_toggle_btn toggle-btn"></span>
					</h2>
					<ul style="display: none;" class="xans-element- xans-layout xans-layout-category categoryList">
						<li id="cate48" class="menu xans-record-">
							<a href="/category/all-products/48/" class="view">All Products</a> a href="#none" class="cate" cate="?cate_no=48">상품보기</a
						</li>
						<li id="cate49" class="menu xans-record-">
							<a href="/category/perfume/49/" class="view">Perfume</a> a href="#none" class="cate" cate="?cate_no=49">상품보기</a
						</li>
						<li id="cate71" class="menu xans-record-">
							<a href="/category/home-fragrance/71/" class="view">Home Fragrance</a> 
								a href="#none" class="cate" cate="?cate_no=71">상품보기</a
						</li>
						<li id="cate64" class="menu xans-record-">
							<a href="/category/body-care/64/" class="view">Body Care</a> a href="#none" class="cate" cate="?cate_no=64">상품보기</a
						</li>
						<li id="cate50" class="menu xans-record-">
							<a href="/category/hand-care/50/" class="view">Hand Care</a> a href="#none" class="cate" cate="?cate_no=50">상품보기</a
						</li>
					</ul>
					<div class="displaynone"></div>
					<ol class="categorySto">
						<li class="asAbout"><a href="about.jsp">ABOUT</a></li>
						<li class="asStores"><a href="stores.jsp">STORES</a></li>
						<li class="asInfo"><a href="/info.html">INFO</a></li>
					</ol>
				</div>
			</nav>
			<button type="button" class="btnClose displaynone">
				<i aria-hidden="true" class="icon icoClose"></i>닫기
			</button>
		</aside>
		<button type="button" class="asideBtnClose">
			<i class="btm bt-times"></i>
		</button> -->
