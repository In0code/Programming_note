<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<div id="wrap">
	<%@ include file="layout/header.jsp"%>
		<div id="container" style="font-family:Pretendard Medium">
			<main id="contents" role="main">
			
				<!-- 슬라이더 -->
				<div id="carouselExampleIndicators" class="carousel slide">
      				<div class="carousel-indicators">
        				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" aria-label="Slide 1"  class="active" aria-current="true"></button>
        				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
      				</div>
      			<div class="carousel-inner">
        		<div class="carousel-item active">
          			<img src="http://192.168.10.136/cherie_ysy_private/common/images/main_slider_3.jpg" class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"/>
        		</div>
        		<div class="carousel-item">
          			<img src="http://192.168.10.136/cherie_ysy_private/common/images/main_slider_4.jpg" class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"/>
        		</div>
        		<div class="carousel-item">
          			<img src="http://192.168.10.136/cherie_ysy_private/common/images/main_slider_1.jpg" class="bd-placeholder-img bd-placeholder-img-lg d-block w-100"/>
        		</div>
      			</div>
				</div>
				
				<!-- 모바일 -->
				<div class="swiper-container mainSwiper mainSwiper_mo RTMB">
					<ul class="swiper-wrapper">
						<li class="swiper-slide">
							<a href="/product/sw19-mini-discovery-set/104/category/48/display/1/" style="background-image: url('/web/upload/event/2310/main_mo_1.jpg');"></a></li>
						<!-- <li class="swiper-slide"><a href="/category/chuseok-gift/52/" style="background-image:url('/web/upload/event/2309/main_mo_1.jpg');"></a></li> -->
						<li class="swiper-slide">
							<a href="/category/body-care/64/" style="background-image: url('/web/upload/event/2309/main_mo_2.jpg');"></a>
						</li>
						<li class="swiper-slide">
							<a href="/category/scent-pairing/78/" style="background-image: url('/web/upload/event/2309/main_mo_3.jpg');"></a>
						</li>
					</ul>
					<!-- 1페이지 일때 삭제 -->
					<div class="swiperPagination"></div>
					<div class="swiperbuttonPrev"></div>
					<div class="swiperbuttonNext"></div>
				</div>

				<div class="inside RW">
					<div class="bg_color"></div>
					<div class="bg_index">
						<h2 class="hFamily_PD">
							A transitional scent of the green forest<br> of Wimbledon,
							London Chérie<br> that changes over time
						</h2>
						<p class="hFamily_PD" style="font-family:Pretendard Medium; font-size:18px">시간에 따라 변화하는, 런던 윔블던 숲 속의 향</p>
						<ul style="font-family:Playfair Display Medium">
							<li><a href="http://192.168.10.136/prj_web_shopping/user/about.jsp">About</a></li>
							<li><a href="http://192.168.10.136/prj_web_shopping/user/shop.jsp">Shop</a></li>
						</ul>
					</div>
				</div>

				<div class="inside_MO RTMB">
					<div class="bg_color"></div>
					<div class="bg_index">
						<h2 class="hFamily_PD">
							A TRANSITIONAL SCENT OF<br> THE GREEN FOREST OF WIMBLEDON,<br>
							<span> LONDON SW19 THAT CHANGES<br> OVER TIME
							</span>
						</h2>
						<p class="hFamily_PD">시간에 따라 변화하는 런던 윔블던 숲 속의 향</p>
						<ul>
							<li><a href="http://192.168.10.136/prj_web_shopping/user/about.jsp">About</a></li>
							<li><a href="http://192.168.10.136/prj_web_shopping/user/shop.jsp">Shop</a></li>
						</ul>
					</div>
				</div>

				<!-- 메인화면 상품 리스트 -->
				<div class="productList">
					<ul class="proRight">
						<!-- 상품 이미지 -->
						<li class="proBox">
							<a href="#void">
								<img src="http://192.168.10.136/prj_web_shopping/common/images/main_img1.jpg" alt="">
							</a>
						</li>
						<li>
						<div class="text_table">
							<div class="text_align">
								<!-- 작은 로고 -->
								<div class="proLmg">
									<a href="#void">
										<img src="http://192.168.10.136/prj_web_shopping/common/images/main_sub_logo.jpg" alt="">
									</a>
								</div>
									<ul class="proText">
										<li>
											<p class="large_txt">
												WIMBLEDON FOREST AT DAWN IN THE MIST<br><br>
											</p>
										</li>
										<li>Just before the sunrise,</li>
										<li>the mist of Wimbledon forest drifts along</li>
										<li>and greets you as you take a stroll.</li>
										<li>Feel the 6AM scent of the Wimbledon forest’s</li>
										<li>glistening morning dew and moist soil.</li>
										<li class="textTop">
											<p class="large_txt">안개가 자욱한 윔블던 숲의 새벽</p>
											<br> 세상의 아침이 시작되기 전,<br> 윔블던의 숲을 산책하는 당신에게<br>
											푸른 안개가 바람에 실려와 인사를 합니다.<br> 이슬 머금은 잔디와 촉촉한 흙내음을 품은<br>
											윔블던의 새벽 6시를 느껴보세요.
										</li>
									</ul>
									<div class="proBtn">
										<a href="#void">
											Discover More
										</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<ul>
						<li class="proBox">
							<a href="#void">
								<img src="http://192.168.10.136/prj_web_shopping/common/images/main_img2.jpg" alt=""></a>
						</li>
						<li>
							<div class="text_table">
								<div class="text_align">
									<div class="proLmg">
										<a href="#void">
											<img src="http://192.168.10.136/prj_web_shopping/common/images/main_sub_logo.jpg" alt=""></a>
									</div>
									<ul class="proText">
										<li>
											<p class="large_txt">
												TOUCH OF SUNLIGHT <br>
												ON WIMBLEDON LAKE AT NOON<br> <br>
											</p>
										</li>
										<li>Midday, when the sunlight sparkles on the surface of
											the lake,
										</li>
										<li>the bouquet of a full bloom iris and cool aqua scent</li>
										<li>under the tree shade fills up the air.</li>
										<li>Feel the scent of NOON at Wimbledon Park.</li>
										<li class="textTop">
											<p class="large_txt">햇살에 반짝이는 윔블던 호수의 정오</p>
											<br> 호수에 반짝이는 햇살 찬란한 낮 12시,<br> 서늘한 나무그늘 아래 차가운 물
											향과 햇살에 만개한<br> 아이리스 꽃 향이 어우러진 윔블던 공원의 정오를 느껴보세요.
										</li>
									</ul>
									<div class="proBtn">
										<a href="#void">
											Discover More
										</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<ul class="proRight">
						<li class="proBox">
							<a href="#void">
								<img src="http://192.168.10.136/prj_web_shopping/common/images/main_img3.jpg" alt=""></a>
						</li>
						<li>
							<div class="text_table">
								<div class="text_align">
									<div class="proLmg">
										<a href="#void">
											<img src="http://192.168.10.136/prj_web_shopping/common/images/main_sub_logo.jpg" alt="">
										</a>
									</div>
									<ul class="proText">
										<li><p class="large_txt">
												GOLDEN SUN IN THE AFTERNOON <br>AT WIMBLEDON PARK<br>
												<br>
											</p></li>
										<li>While the forest’s morning dew dries away</li>
										<li>in the beaming afternoon sunlight,</li>
										<li>feel the scent of the fully blossomed</li>
										<li>flowers in the park come together with the freshness</li>
										<li>of lemon floating on a cup of black tea at 3PM in
											Wimbledon.</li>
										<li class="textTop">
											<p class="large_txt">햇살이 내리쬐는 윔블던 공원의 오후</p>
											<br> 이슬 젖은 초록숲이<br> 상큼한 햇살에 말라가는 윔블던의 오후.<br>
											공원에 만개한 꽃들의 향기와 홍차에 띄운<br> 레몬 조각 향기가 어우러진<br> 윔블던의
											오후 3시를 느껴보세요.
										</li>
									</ul>
									<div class="proBtn">
										<a href="#void">
											Discover More</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<ul>
						<li class="proBox">
							<a href="#void">
								<img src="http://192.168.10.136/prj_web_shopping/common/images/main_img4.jpg" alt=""></a>
						</li>
						<li>
							<div class="text_table">
								<div class="text_align">
									<div class="proLmg">
										<a href="#void">
											<img src="http://192.168.10.136/prj_web_shopping/common/images/main_sub_logo.jpg" alt="">
										</a>
									</div>
									<ul class="proText">
										<li>
											<p class="large_txt">
												BONFIRE SPARKS THE EVENING OF THE WIMBLEDON<br> <br>
											</p>
										</li>
										<li>The night in Wimbledon forest after dark.</li>
										<li>The whispers of love travel through the crackling
											bonfire.</li>
										<li>Feel the Wimbledon’s 9PM scent of the smokey</li>
										<li>bonfire smoothly blended with sweet vanilla.</li>
										<li class="textTop">
											<p class="large_txt">모닥불이 피어 오르는 윔블던 숲의 저녁</p>
											<br> 어둠이 내린 윔블던 숲의 저녁.<br> 모닥불 타는 소리 사이로 들려오는 연인들의
											달콤한 속삭임.<br> 바닐라의 달콤함과 숲 속 모닥불의 스모키함이<br> 어우러진 윔블던의
											저녁 9시를 느껴보세요.
										</li>
									</ul>
									<div class="proBtn">
										<a href="#void">
											Discover More</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<ul class="proRight">
						<li class="proBox">
							<a href="#void">
								<img src="http://192.168.10.136/prj_web_shopping/common/images/main_img5.jpg" alt=""></a>
						</li>
						<li>
							<div class="text_table">
								<div class="text_align">
									<div class="proLmg">
										<a href="#void">
											<img src="http://192.168.10.136/prj_web_shopping/common/images/main_sub_logo.jpg" alt="">
										</a>
									</div>
									<ul class="proText">
										<li>
											<p class="large_txt">
												MIDNIGHT, A SMALL LAMP LIGHTS UP A <br>COTTAGE IN
												WIMBLEDON PARK<br>
												<br>
											</p>
										</li>
										<li>In the still of the night,</li>
										<li>the soft moonlight surrounds the Wimbledon forest.</li>
										<li>Feel the sensual MIDNIGHT</li>
										<li>through mesmerizing touch and scent.</li>
										<li class="textTop">
											<p class="large_txt">
												인적이 드문 윔블던 공원 옆, 작은 등불 하나 <br>켜진 어느 집의 자정
											</p>
											<br> 은은한 달빛에 감싸인 윔블던 숲 속의 깊은 밤.<br> 손 끝을 스치는 살결과
											향기에 취한<br> 센슈얼한 밤12시를 느껴보세요.
										</li>
									</ul>
									<div class="proBtn">
										<a href="#void">
											Discover More</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<div class="insideBom">
					<div class="bg_color"></div>
					<div class="bg_index">
						<h2 class="hImg">
							<img src="/design/kr/3ab10e2f92b02.png">
						</h2>
						<ul>
							<li><a target="_blank"
								href="https://www.google.com/maps/@51.4390411,-0.2060724,3a,75y,177.6h,112.58t/data=!3m8!1e1!3m6!1sAF1QipNVOoAsKrqSsZsIzMvSN9i6Erg6gUBjSqRKqOCr!2e10!3e11!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNVOoAsKrqSsZsIzMvSN9i6Erg6gUBjSqRKqOCr%3Dw203-h100-k-no-pi-0-ya49.77087-ro-0-fo100!7i8704!8i4352">
								Experience Chérie</a></li>
							<li><a
								href="https://earth.google.com/static/9.3.118.1/app_min.html#search/Wimbledon+park/@51.4359333,-0.2101811,17.90890063a,628.90019534d,35y,287.91253015h,45t,0r/data=CnkaTxJJCiUweDQ4NzYwZjQ4ZmIyZTc2NTk6MHg4Yzc1NjBjODI2YTA5YzVhGWFekanMt0lAIQdgXts258q_Kg5XaW1ibGVkb24gcGFyaxgCIAEiJgokCX4y68BKLkpAEbFMe-6RLUpAGQqtfG7mlxNAIUJkXamOihNA">
								Chérie in Google Earth</a></li>
						</ul>
						<p class="RTMB">(by Google Maps Street View)</p>
					</div>
				</div>

				<section
					class="xans-element- xans-custom xans-custom-moduleedit-8 xans-custom-moduleedit xans-custom-8 snsItem displaynone ">
					<div class="mainTitle">
						<h2>Instagram</h2>
						<a href="#none" target="_blank" class="btnSns">follow us</a>
					</div>
					<ul class="snsItem-wrapper">
						<li class="snsItem-item"><a href="#none" target="_blank">
								<picture>
								<source
									srcset="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget1.webp"
									type="image/webp">
								<img
									src="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget1.jpg"
									alt="sns image" loading="lazy" width="100%" height="100%">
								</source>
								</picture>
						</a></li>
						<li class="snsItem-item"><a href="#none" target="_blank">
								<picture>
								<source
									srcset="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget2.webp"
									type="image/webp">
								<img
									src="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget2.jpg"
									alt="sns image" loading="lazy" width="100%" height="100%">
								</source>
								</picture>
						</a></li>
						<li class="snsItem-item"><a href="#none" target="_blank">
								<picture>
								<source
									srcset="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget3.webp"
									type="image/webp">
								<img
									src="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget3.jpg"
									alt="sns image" loading="lazy" width="100%" height="100%">
								</source>
								</picture>
						</a></li>
						<li class="snsItem-item"><a href="#none" target="_blank">
								<picture>
								<source
									srcset="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget4.webp"
									type="image/webp">
								<img
									src="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget4.jpg"
									alt="sns image" loading="lazy" width="100%" height="100%">
								</source>
								</picture>
						</a></li>
						<li class="snsItem-item"><a href="#none" target="_blank">
								<picture>
								<source
									srcset="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget5.webp"
									type="image/webp">
								<img
									src="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget5.jpg"
									alt="sns image" loading="lazy" width="100%" height="100%">
								</source>
								</picture>
						</a></li>
						<li class="snsItem-item"><a href="#none" target="_blank">
								<picture>
								<source
									srcset="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget6.webp"
									type="image/webp">
								<img
									src="//img.echosting.cafe24.com/skin/skin_ko_KR/main/img_sns_widget6.jpg"
									alt="sns image" loading="lazy" width="100%" height="100%">
								</source>
								</picture>
						</a></li>
					</ul>
				</section>
				<section class="collection displaynone"></section>
			</main>
			<hr class="layout">
		</div>
		<hr class="layout">
		<div id="quick" class="RW RMI">
			<div class="inner">
				<div class="xans-element- xans-layout xans-layout-orderbasketcount ">
					<a href="/order/basket.html">Cart <span class="count">0</span></a>
				</div>

				<div class="xans-element- xans-layout xans-layout-productrecent">
					<div class="title">
						<a href="/product/recent_view_product.html">RECENTLY VIEWED</a>
					</div>
					<ul>
						<li class="displaynone xans-record-"><a
							href="/product/detail.html##param##"><img src="about:blank"
								alt=""></a></li>
						<li class="displaynone xans-record-"><a
							href="/product/detail.html##param##"><img src="about:blank"
								alt=""></a></li>
					</ul>
					<div class="player">
						<button type="button" class="prev">
							<i aria-hidden="true" class="icon icoArrowLeft"></i>이전
						</button>
						<button type="button" class="next">
							<i aria-hidden="true" class="icon icoArrowRight"></i>다음
						</button>
					</div>
				</div>

				<p class="pageTop">
					<a href="#wrap" title="화면 최상단으로 이동하기"><i aria-hidden="true"
						class="icon icoArrowTop"></i> Top</a>
				</p>
			</div>
		</div>

		<%@ include file="layout/footer.jsp"%>
		
		<div id="totop" class="">
			<img src="/layout/basic/img/totop.png">
		</div>
	</div>

</body>
</html>