<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<style type="text/css">
</style>

<script type="text/javascript">
	$(function() {
		var searchType = '${ param.searchType }';
		if(searchType == 'END'){
			$("#END").attr("class","font-bold");
			$("#ING").attr("class","");
		}else{
			$("#ING").attr("class","font-bold");
			$("#END").attr("class","");
		}
	});//ready
</script>

</head>
<body>
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div
			class="flex justify-center text-jnblack border-b-2 w-full max-w-[1280px] mx-auto mt-15 box-content">
			<div
				class="fixed w-full bg-white pb-5 pt-2 sm:top-[80px] lg:top-[144px] xl:top-[160px] h-[160px] z-10 mx-auto px-6 md:px-8 2xl:px-16">
				<div
					class="flex items-center justify-between mt-2 text-jnBlack text-xl py-5 border-b border-jnblack border-solid mx-auto max-w-[1280px]">
					<h3
						class="text-lg md:text-xl lg:text-2xl 2xl:text-3xl xl:leading-10 font-bold text-heading">이벤트</h3>
				</div>
				<ul class="flex gap-6 py-5 max-w-[1280px] mx-auto">
					<li class="" id="ING"><a href="event.do">진행중</a></li>
					<li class="" id="END"><a href="event.do?searchType=END">종료</a></li>
				</ul>
			</div>
			
			<!-- 이벤트 목록 -->
			<div class="pb-10 w-full max-w-[1200px] max-[1200px]:px-6 mx-auto">
				<div class="pt-[160px]">
				
					<!-- 이벤트 시작 -->
					<ul class="md:py-[17px] grid grid-cols-2 gap-5 max-[600px]:block mx-auto md:px-8">
					
						<!-- 진열 시작 -->
						<c:forEach var="event" items="${ eventList }">
						<li class="w-full aspect-[2.5]">
							<div class="relative h-full">
							
								<!-- 링크 -->
								<a class="w-full h-full aspect-[2.5] absolute" href="event/detail.do?eventcode=${ event.eventcode }">
								
									<!-- 이미지 -->
									<img alt="${ event.title }" src="http://localhost/retro_prj/upload/${ event.img2 }"
									decoding="async" data-nimg="fill" class="rounded-md overflow-hidden" loading="lazy"
									style="position: absolute; height: 100%; width: 100%; left: 0; top: 0; right: 0; bottom: 0; color: transparent">
								</a>
							</div>
							<div class="flex justify-between w-full px-1 py-3 h-12">
							
								<!-- 시작/종료 날짜 -->
								<p class="text-[#666666]">
									${ event.start_date }
									~
									${ event.end_date }
								</p>
								
								<!-- D-DAY -->
								<c:if test="${ param.searchType eq 'ING' or param.searchType eq '' or param.searchType eq null }">
									<p class="text-jngreen">
										D-${ event.dday }
									</p>
								</c:if>
								<c:if test="${ param.searchType eq 'END' }">
									<p class="text-[#666666]">
										종료
									</p>
								</c:if>
							</div>
						</li>
						</c:forEach>
						<!-- 진열 끝 -->
						
						
					</ul>
					<!-- 이벤트 끝 -->
					
					<div></div>
				</div>
			</div>
		</div>
		<div class="Toastify"></div>
	</main>
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>