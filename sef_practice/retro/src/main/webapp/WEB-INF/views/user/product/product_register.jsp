<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">
#category-depth-1, #category-depth-2, #category-depth-3,
	#category-depth-4, #category-depth-5,
	#category-depth-1-1,#category-depth-1-2,
	#category-depth-5-2,#category-depth-5-1,#category-depth-4-1,
	#category-depth-3-1, #category-depth-3-2, #category-depth-2-3,
	#category-depth-2-2, #category-depth-2-1 {
	display: none;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
/* ---------------패션 의류--------------------- */
		/* 패션의류 클릭하면 동작 */
		$("#C").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		 $("#G, #T, #P, #B, #C-1, #C1,#C2").css({
			  'background-color': '#FFFFFF'
		 });
			
			$("#category-depth-1").show();
			
			$("#category-depth-2, #category-depth-3, #category-depth-4, #category-depth-5,#category-depth-1-1,#category-depth-1-2, #category-depth-2-3,#category-depth-2-2,#category-depth-2-1,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2").hide();
		});//click
		
		/* 여성의류 클릭하면 동작 */
		$("#C1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C2, #C102,#C103,#C101").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-1-1").show();
			$("#category-depth-1-2").hide();
		});//click
		
		/* 남성의류 클릭하면 동작 */
		$("#C2").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C1, #C201,#C202,#C203").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-1-2").show();
			$("#category-depth-1-1").hide();
		});//click
		
		/* 티셔츠 , 캐쥬얼의류가 클릭되면 동작 */
		$("#C101").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#C102, #C103").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 바지, 치마가 클릭되면 동작 */
		$("#C102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#C101, #C103").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 트레이닝복이 클릭되면 동작 */
		$("#C103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#C102, #C101").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 티셔츠 , 캐쥬얼의류가 클릭되면 동작 */
		$("#C201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#C202, #C203").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 바지, 치마가 클릭되면 동작 */
		$("#C202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#C201, #C203").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 트레이닝복이 클릭되면 동작 */
		$("#C203").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#C202, #C201").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
 /* ---------------패션 잡화--------------------- */
		
		/* 패션잡화 클릭하면 동작 */
		$("#G").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #P, #B, #C-1,#G1,#G2,#G3").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-2").show();
			$("#category-depth-1, #category-depth-3, #category-depth-4, #category-depth-5,#category-depth-1-1,#category-depth-1-2,#category-depth-2-1,#category-depth-2-2,#category-depth-2-3,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2").hide();
		});//click
		
		/* 여성화 클릭하면 동작 */
		$("#G1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #P, #B, #C-1,#G2,#G3,#G101,#G102,#G103").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-2-1").show();
			$("#category-depth-2-2, #category-depth-2-3").hide();
		});//click
		
		/* 남성화 클릭하면 동작 */
		$("#G2").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #P, #B, #C-1,#G1,#G3,#G201,#G202,#G203").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-2-2").show();
			$("#category-depth-2-1, #category-depth-2-3").hide();
		});//click
		
		/* 가방 클릭하면 동작 */
		$("#G3").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #P, #B, #C-1,#G1,#G2,#G301,#G302,#G303").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-2-3").show();
			$("#category-depth-2-1, #category-depth-2-2").hide();
		});//click
		
		/* 여성화 > 단화/ 로퍼 클릭되면 동작 */
		$("#G101").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G102, #G103").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 여성화 > 워커 / 부츠가 클릭되면 동작 */
		$("#G102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G101, #G103").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 여성화 > 샌들 / 슬리퍼 클릭되면 동작 */
		$("#G103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G102, #G101").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 남성화 > 단화/ 로퍼 클릭되면 동작 */
		$("#G201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G202, #G203").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 남성화 > 워커 / 부츠가 클릭되면 동작 */
		$("#G202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G201, #G203").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 남성화 > 샌들 / 슬리퍼 클릭되면 동작 */
		$("#G203").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G202, #G201").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 가방 > 숄더백 클릭되면 동작 */
		$("#G301").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G302, #G303").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 가방 > 크로스백가 클릭되면 동작 */
		$("#G302").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G301, #G303").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 가방 > 백팩 클릭되면 동작 */
		$("#G303").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#G302, #G301").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		
/* ---------------모바일, 테블릿--------------------- */	

		/* 모바일, 테블릿 클릭하면 동작 */
		$("#T").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G, #C, #P, #B, #C-1,#T1,#T2").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-3").show();
			$("#category-depth-2, #category-depth-1, #category-depth-4, #category-depth-5,#category-depth-1-1,#category-depth-1-2,#category-depth-2-1,#category-depth-2-2,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2, #category-depth-2-3").hide();
		});//click
		
		/* 스마트폰 클릭하면 동작 */
		$("#T1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #P, #B, #C-1,#T2,#T101,#T102,#T103,#T104").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-3-1").show();
			$("#category-depth-3-2").hide();
		});//click
		
		/* 테블릿PC 클릭하면 동작 */
		$("#T2").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #P, #B, #C-1,#T1,#T201,#T202,#T203").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-3-2").show();
			$("#category-depth-3-1").hide();
		});//click
		
		/* 스마트폰 > 삼성 클릭되면 동작 */
		$("#T101").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#T102,#T103,#T104").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 스마트폰 > LG 클릭되면 동작 */
		$("#T102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#T101,#T103,#T104").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 스마트폰 > 애플 클릭되면 동작 */
		$("#T103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#T102 ,#T101,#T104").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 스마트폰 > 기타 클릭되면 동작 */
		$("#T104").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#T102 ,#T103,#T101").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 테블릿PC > 삼성 클릭되면 동작 */
		$("#T201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#T202,#T203").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 테블릿PC > 애플 클릭되면 동작 */
		$("#T202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#T203 ,#T201").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 테블릿PC > 기타 클릭되면 동작 */
		$("#T203").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#T202 ,#T201").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		
/* ---------------노트북, PC--------------------- */
		
		/* 노트북, PC 클릭하면 동작 */
		$("#P").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G, #T, #C, #B, #C-1,#P1,#P2,#P3").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-4").show();
			$("#category-depth-2, #category-depth-3, #category-depth-1, #category-depth-5,#category-depth-1-1,#category-depth-1-2,#category-depth-3-1,#category-depth-3-2,#category-depth-2-1,#category-depth-2-2,#category-depth-2-3,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2").hide();
		});//click
		
		/* 노트북 클릭하면 동작 */
		$("#P1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #G, #B,#P2,#P3,#P101,#P102,#P103").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-4-1").show();
			$("").hide();
		});//click
		
		/* 모니터 클릭하면 동작 */
		$("#P2").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #T, #B, #P1,#P3").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-4-1").hide();
		});//click
		
		/* 데스크탑 클릭하면 동작 */
		$("#P3").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #T, #B,#P1,#P2").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-4-1").hide();
		});//click
		
		/* 노트북 > 삼성 클릭되면 동작 */
		$("#P101").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#P102,#P103").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 노트북 > LG 클릭되면 동작 */
		$("#P102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#P103 ,#P101").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 노트북 > 애플 클릭되면 동작 */
		$("#P103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#P102 ,#P101").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		
/* ---------------도서 , 문구--------------------- */		
		
		/* 도서/ 문구 클릭하면 동작 */
		$("#B").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G, #T, #P, #C, #C-1,#B1,#B2,#B3").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-5").show();
			$("#category-depth-2, #category-depth-3, #category-depth-4, #category-depth-1,#category-depth-1-1,#category-depth-1-2,#category-depth-2-1,#category-depth-2-2,#category-depth-2-3,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2").hide();
		});//click
		
		/* 학습 / 교육 클릭하면 동작 */
		$("#B1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #G, #P,#B2,#B3,#B101,#B102,#B103").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-5-1").show();
			$("#category-depth-5-2").hide();
		});//click
		
		/* 소설 / 만화책 클릭하면 동작 */
		$("#B2").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #T, #P, #B1,#B3,#B201,#B202").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-5-2").show();
			$("#category-depth-5-1").hide();
		});//click
		
		/* 문구 / 사무용품 클릭하면 동작 */
		$("#B3").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #T, #P,#B1,#B2").css({
				  'background-color': '#FFFFFF'
			 });
			$("#category-depth-5-1,#category-depth-5-2").hide();
		});//click
		
		/* 학습/ 교육 > 학습/참고서 클릭되면 동작 */
		$("#B101").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#B102,#B103").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 학습/ 교육 > 수험서/자격증 클릭되면 동작 */
		$("#B102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#B103 ,#B101").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 학습/ 교육 > 컴퓨터/인터넷 클릭되면 동작 */
		$("#B103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#B102 ,#B101").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		

		/* 소설/만화책 > 소설책 클릭되면 동작 */
		$("#B201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#B202").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		/* 소설/만화책 > 만화책 클릭되면 동작 */
		$("#B202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
		$("#B201").css({
			  'background-color': '#FFFFFF'
		 });
		});//click
		
		
/* --------희망지역 버튼------------- */
		
		/* '주소검색' 버튼 누르면 동작 */
		$("#addrSearchBtn").click(function(){
			
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen")
			$("#noAddrBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white")
			
		});//clcick
		
		/* '지역 설정 안 함'버튼누르면 동작*/
		$("#noAddrBtn").click(function(){
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen")
			$("#addrSearchBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white")
			
		});//clcick
		
/* --------상품 상태 버튼------------- */
		
		/* '중고' 버튼 누르면 동작 */
		$("#oldProductBtn").click(function(){
			
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen")
			$("#newProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white")
			
		});//clcick
		
		/* '새상품'버튼누르면 동작*/
		$("#newProductBtn").click(function(){
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen")
			$("#oldProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white")
			
		});//clcick
		
		$("#registerBtn").click(function(){
			location.href = "product_register_ok.do";
		});//click
		
		
	});//ready
	
	/*
	패션의류 C		>	여성의류 C1	>	티셔츠/캐주얼의류 C101 , 바치/치마 C102 , 트레이닝복 C103 
				>	남성의류 C2	>	티셔츠/캐주얼의류 C201 , 바치 C202 , 트레이닝복 C203 
				
	패션잡화 G		>	여성화 G1		>	단화/로퍼 G101 , 워커/부츠 G102 , 샌들/슬리퍼 G103
				>	남성화 G2		>	단화/로퍼 G201 , 워커/부츠 G202 , 샌들/슬리퍼 G203
				>	가방 G3		>	숄더백 G301 , 크로스백 G302 , 백백 G303
				
  모바일/태블릿 T	>	스마트폰 T1	>	삼성 T101 , LG T102 , 애플 T103 , 기타 T104
  				>	태블릿PC T2	>	삼성 T201 , 애플 T202 , 기타 T203
  				
	노트북/PC P	>	노트북 P1		>	삼성 P101 , LG P102 , 애플 P103
				>	모니터 P2
				>	데스크탑 P3
				
	도서/문구 B	>	학습/교육 B1	>	학습/참고서 B101 , 수험서/자격증 B102 , 컴퓨터/인터넷 B103
				>	소설/만화책 B2	>	소설책 B201 , 만화책 B202
				>	문구/사무용품 B3
	*/
	
</script>
 <link as="script" rel="prefetch"
	href="https://web.joongna.com/_next/static/chunks/4126-99e7ff6d28dC101d7.js">
<link as="script" rel="prefetch"
	href="https://web.joongna.com/_next/static/chunks/6869-4c157c328e76af89.js">
<link as="script" rel="prefetch"
	href="https://web.joongna.com/_next/static/chunks/7068-99e7a3a9004c76dc.js">
<link rel="stylesheet"
	href="https://web.joongna.com/_next/static/css/4faf93B101322cf67.css">
<link rel="stylesheet"
	href="https://web.joongna.com/_next/static/css/e3048584c00a0406.css"
	data-n-p=""> 
<link rel="stylesheet"
	href="https://web.joongna.com/_next/static/css/82d769b08f8a03ee.css"
	data-n-p="">
</head>
<body>
<!-- header -->
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<section class="mx-auto w-full max-w-[768px]">
				<div class="flex px-5 pb-1.5">
					<div>
						<input name="media" type="file" multiple=""
							accept="image/png, image/jpeg, image/jpg, video/*" class="hidden">
						<button
							class="flex items-center justify-center w-20 h-20 mr-1.5 bg-jnGray-200 rounded">
							<div class="flex flex-col">
								<svg width="32px" height="32px" viewBox="0 0 32 32" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M15.728 20.4461C103.6481 20.4461 11.9619 18.7599 11.9619 16.68C101.9619 14.6001 13.6481 12.9138 15.728 12.9138C17.8079 12.9138 19.4942 14.6001 19.4942 16.68C19.4942 18.7599 17.8079 20.4461 15.728 20.4461Z"
										fill="#C2C6CE"></path>
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M10.4564 7.32295C10.9376 6.00587 11.5097 5.15997 12.8118 5.15997H17.9241C19.2253 5.15997 19.7975 6.00463 20.2785 7.32003H20.7897C24.7543 7.32003 27.968 10.4192 27.968 14.2417V19.119C27.968 22.9409 24.7543 26.04 20.7897 26.04H10.6669C6.7023 26.04 3.48798 22.9409 3.48798 19.119V14.2417C3.48798 10.487 6.58918 7.4303 10.4564 7.32295ZM21.3772 16.68C201.3772 19.8001 18.8481 22.3292 15.728 22.3292C102.6079 22.3292 10.0788 19.8001 10.0788 16.68C10.0788 13.5599 12.6079 11.0308 15.728 11.0308C18.8481 11.0308 21.3772 13.5599 21.3772 16.68ZM21.5988 11.88C201.5988 12.4 22.0204 12.8216 22.5403 12.8216C203.0603 12.8216 23.4819 12.4 23.4819 11.88C203.4819 11.36 23.0603 10.9385 22.5403 10.9385C202.0204 10.9385 21.5988 11.36 21.5988 11.88Z"
										fill="#C2C6CE"></path></svg>
								<p class="mt-1 text-xs text-jnGray-500">0/10</p>
							</div>
						</button>
					</div>
					<div class="overflow-hidden">
						<div
							class="os-host os-host-foreign os-theme-dark os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-scrollbar-vertical-hidden os-host-transition">
							<div class="os-resize-observer-host observed">
								<div class="os-resize-observer" style="left: 0px; right: auto;"></div>
							</div>
							<div class="os-size-auto-observer observed"
								style="height: calc(100% + 1px); float: left;">
								<div class="os-resize-observer"></div>
							</div>
							<div class="os-content-glue"
								style="width: 0px; margin: 0px; max-width: 100%; height: 0px;"></div>
							<div class="os-padding">
								<div
									class="os-viewport os-viewport-native-scrollbars-invisible os-viewport-native-scrollbars-overlaid">
									<div class="os-content"
										style="padding: 0px; height: auto; width: 100%; float: left;">
										<ul class="flex items-center"></ul>
									</div>
								</div>
							</div>
							<div
								class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
								<div class="os-scrollbar-track os-scrollbar-track-off">
									<div class="os-scrollbar-handle"
										style="transform: translate(0px, 0px);"></div>
								</div>
							</div>
							<div
								class="os-scrollbar os-scrollbar-vertical os-scrollbar-unusable os-scrollbar-auto-hidden">
								<div class="os-scrollbar-track os-scrollbar-track-off">
									<div class="os-scrollbar-handle"
										style="transform: translate(0px, 0px);"></div>
								</div>
							</div>
							<div class="os-scrollbar-corner"></div>
						</div>
					</div>
				</div>
				<form class="flex flex-col justify-center mt-6 lg:mt-8">
					<div class="flex flex-col px-5 space-y-5">
						<!-- 상품명 입력 inpuBox -->
						<div class="block">
							<input id="productTitle" name="productTitle" type="text"
								placeholder="상품명"
								class="py-2 px-4 md:px-5 w-full appearance-none border text-input text-xs lg:text-sm font-body placeholder-body min-h-12 transition duration-200 ease-in-out bg-white border-gray-300 focus:border-heading h-11 md:h-12 focus:outline-none rounded-md"
								autocomplete="off" spellcheck="false" aria-invalid="false">
						</div>
						<button class="flex items-center justify-start">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none"
								xmlns="http://www.w3.org/2000/svg">
								<g id="Icon / 16 Stroke Over Error">
								<path id="Vector"
									d="M14.375 8C14.375 11.5208 11.5208 14.375 8 14.375C4.47918 14.375 1.625 11.5208 1.625 8C1.625 4.47918 4.47918 1.625 8 1.625C101.5208 1.625 14.375 4.47918 14.375 8Z"
									stroke="#5A616B" stroke-width="1.25" stroke-linecap="round"
									stroke-linejoin="round"></path>
								<path id="!" fill-rule="evenodd" clip-rule="evenodd"
									d="M8.6908 8.85272C8.66709 9.21681 8.36486 9.5 8 9.5C7.63514 9.5 7.33291 9.21681 7.3092 8.85272L7.06757 5.14173L7.04112 4.49915C7.01869 3.95411 7.4545 3.5 8 3.5C8.5455 3.5 8.98131 3.95411 8.95888 4.49915L8.93243 5.14173L8.6908 8.85272ZM8.71038 12.2135C8.5173 12.4045 8.27869 12.5 7.99454 12.5C7.71038 12.5 7.47359 12.4045 7.28415 12.2135C7.09472 12.0226 7 11.7847 7 11.5C7 11.2153 7.09472 10.9774 7.28415 10.7865C7.47359 10.5955 7.71038 10.5 7.99454 10.5C8.27869 10.5 8.5173 10.5955 8.71038 10.7865C8.90346 10.9774 9 11.2153 9 11.5C9 11.7847 8.90346 12.0226 8.71038 12.2135Z"
									fill="#5A616B"></path></g></svg>
						</button>
						<div
							class="flex flex-row w-full overflow-hidden text-sm font-medium h-60">
							<div id="category-depth-0"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="C">
											패션의류
									</li>
									<li class="false h-10 p-3" id="G">
											<p>패션잡화</p>
										</li>
									<li class="false h-10 p-3" id="T">
											<p>모바일/태블릿</p>
										</li>
									<li class="false h-10 p-3" id="P">
											<p>노트북/PC</p>
										</li>
									<li class="false h-10 p-3" id="B">
											<p>도서/문구</p>
										</li>
								</ul>
							</div>
							<!-- 패션의류 > 여성의류 , 남성의류   -->
							<div id="category-depth-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">

								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="C1">
											<p class="truncate break-keep">여성의류</p>
										</li>
									<li class="false h-10 p-3" id="C2">
											<p class="truncate break-keep">남성의류</p>
										</li>
								</ul>

							</div>
							<!-- 패션잡화 > 여성화 ,남성화, 가방   -->
							<div id="category-depth-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G1">
											<p class="truncate break-keep">여성화</p>
										</li>
									<li class="false h-10 p-3" id="G2">
											<p class="truncate break-keep">남성화</p>
										</li>
									<li class="false h-10 p-3" id="G3">
											<p class="truncate break-keep">가방</p>
										</li>

								</ul>
							</div>
							<!-- 모바일/태블릿 > 스마트폰 ,테블릿   -->
							<div id="category-depth-3"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="T1">
											<p class="truncate break-keep">스마트폰</p>
										</li>
									<li class="false h-10 p-3" id="T2">
											<p class="truncate break-keep">테블릿PC</p>
									</li>
								</ul>
							</div>
							<!-- 노트북/PC > 노트북, 모니터, 데스크탑  -->
							<div id="category-depth-4"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="P1">
											<p class="truncate break-keep">노트북</p>
										</li>
									<li class="false h-10 p-3" id="P2">
											<p class="truncate break-keep">모니터</p>
									</li>
									<li class="false h-10 p-3" id="P3">
											<p class="truncate break-keep">데스크탑</p>
										</li>
								</ul>
							</div>
							<!-- 도서/문구 > 학습/교육, 소설/만화책, 문구/사무용품-->
							<div id="category-depth-5"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="B1">
											<p class="truncate break-keep">학습 / 교육</p>
										</li>
									<li class="false h-10 p-3" id="B2">
											<p class="truncate break-keep">소설 / 만화책</p>
										</li>
									<li class="false h-10 p-3" id="B3">
											<p class="truncate break-keep">문구 / 사무용품</p>
										</li>
								</ul>
							</div>
							<!-- 패션의류 > 여성의류 > 티셔츠/캐쥬얼의류, 바지/치마, 트레이닝복 -->
							<div id="category-depth-1-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="C101">
											<p class="truncate break-keep">티셔츠/캐쥬얼의류</p>
										</li>
									<li class="false h-10 p-3" id="C102">
											<p class="truncate break-keep">바지/치마</p>
										</li>
									<li class="false h-10 p-3" id="C103">
											<p class="truncate break-keep">트레이닝복</p>
										</li>
								</ul>
							</div>
							<!-- 패션의류 > 남성의류 > 티셔츠/캐쥬얼의류, 바지, 트레이닝복 -->
							<div id="category-depth-1-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="C201">
											<p class="truncate break-keep">티셔츠/캐쥬얼의류</p>
										</li>
									<li class="false h-10 p-3" id="C202">
											<p class="truncate break-keep">바지</p>
										</li>
									<li class="false h-10 p-3" id="C203">
											<p class="truncate break-keep">트레이닝복</p>
										</li>
								</ul>
							</div>
							<!-- 패션잡화 > 여성화 >  단화/로퍼, 워커/부츠, 샌들/슬리퍼 -->
							<div id="category-depth-2-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G101">
											<p class="truncate break-keep">단화/로퍼</p>
										</li>
									<li class="false h-10 p-3" id="G102">
											<p class="truncate break-keep">워커/부츠</p>
										</li>
									<li class="false h-10 p-3" id="G103">
											<p class="truncate break-keep">샌들/슬리퍼</p>
										</li>
								</ul>
							</div>
							<!-- 패션잡화 > 남성화 >  단화/로퍼, 워커/부츠, 샌들/슬리퍼 -->
							<div id="category-depth-2-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G201">
											<p class="truncate break-keep">단화/로퍼</p>
										</li>
									<li class="false h-10 p-3" id="G202">
											<p class="truncate break-keep">워커/부츠</p>
										</li>
									<li class="false h-10 p-3" id="G203">
											<p class="truncate break-keep">샌들/슬리퍼</p>
										</li>
								</ul>
							</div>
							<!-- 패션잡화 > 가방 >  숄더백, 크로스백, 백팩 -->
							<div id="category-depth-2-3"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G301">
											<p class="truncate break-keep">숄더백</p>
										</li>
									<li class="false h-10 p-3" id="G302">
											<p class="truncate break-keep">크로스백</p>
										</li>
									<li class="false h-10 p-3" id="G303">
											<p class="truncate break-keep">백팩</p>
										</li>
								</ul>
							</div>
							<!-- 모바일/ 태블릿 > 스마트폰 >  삼성/LG/애플/기타 -->
							<div id="category-depth-3-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="T101">
											<p class="truncate break-keep">삼성</p>
										</li>
									<li class="false h-10 p-3" id="T102">
											<p class="truncate break-keep">LG</p>
										</li>
									<li class="false h-10 p-3" id="T103">
											<p class="truncate break-keep">애플</p>
										</li>
									<li class="false h-10 p-3" id="T104">
											<p class="truncate break-keep">기타</p>
										</li>
								</ul>
							</div>
							<!-- 모바일/ 태블릿 > 태블릿PC  > 삼성/애플/기타 -->
							<div id="category-depth-3-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="T201">
											<p class="truncate break-keep">삼성</p>
										</li>
									<li class="false h-10 p-3" id="T202">
											<p class="truncate break-keep">애플</p>
										</li>
									<li class="false h-10 p-3" id="T203">
											<p class="truncate break-keep">기타</p>
										</li>
								</ul>
							</div>
							<!-- 노트북/PC > 노트북  >  삼성/LG/애플 -->
							<div id="category-depth-4-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="P101">
											<p class="truncate break-keep">삼성</p>
										</li>
									<li class="false h-10 p-3" id="P102">
											<p class="truncate break-keep">LG</p>
										</li>
									<li class="false h-10 p-3" id="P103">
											<p class="truncate break-keep">애플</p>
										</li>
								</ul>
							</div>
							<!-- 도서/문구 > 학습/교육 >  학습/참고서, 수험서/자격증, 컴퓨터/인터넷 -->
							<div id="category-depth-5-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="B101">
											<p class="truncate break-keep">학습/참고서</p>
										</li>
									<li class="false h-10 p-3" id="B102">
											<p class="truncate break-keep">수험서/자격증</p>
										</li>
									<li class="false h-10 p-3" id="B103">
											<p class="truncate break-keep">컴퓨터/인터넷</p>
										</li>
								</ul>
							</div>
							<!-- 도서/문구 > 소설/만화책 >   소설책, 만화책 -->
							<div id="category-depth-5-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="B201">
											<p class="truncate break-keep">소설책</p>
										</li>
									<li class="false h-10 p-3" id="B202">
											<p class="truncate break-keep">만화책</p>
										</li>
								</ul>
							</div>
						</div>
					</div>

					<!-- 판매가격 / 무료나눔 체크 -->
					<div class="flex flex-col px-5 mt-5 space-y-5">
						<div
							class="flex items-center justify-between w-full border border-gray-300 border-solid rounded px-4  
        text-base scale-85 origin-top-left -mb-3  w-[117.65%] p-6  h-[60px]

        false">
							<label for="search" class="flex items-center py-0.5 w-2/3"><span>₩</span>
							<input name="productPrice" type="text" inputmode="numeric" pattern="\d{1,3}(,\d{3})*"
								class="ml-1 bg-white focus:outline-none h-11 md:h-12 placeholer-jnGray-500 w-2/3 disabled:opacity-100 placeholer-jnGray-500"
								placeholder="판매가격" value=""></label>
						</div>
					</div>
					<section class="flex flex-col px-5 space-y-5">
						<!-- 상품명, 구매시기, 착용 시간, 요염 여부, 하자여부 작성 inputBox -->
						<div class="relative">
							<div>
								<textarea id="productDescription" name="productDescription"
									class="px-4 py-3 items-center w-full rounded appearance-none transition duration-300 ease-in-out text-heading text-sm focus:outline-none focus:ring-0 bg-white border border-gray-300 focus:shadow focus:outline-none focus:border-heading placeholder-body inline-block w-full px-4 py-4 mt-6 mb-2 outline-none align-middle overflow-x-scroll appearance-none resize-none border-solid border border-jnGray-300 placeholder:text-jnGray-500 h-[220px] text-sm"
									autocomplete="off" spellcheck="false" rows="4"
									placeholder="- 상품명(브랜드)																																																- 구매 시기																																																- 사용 기간																																																- 하자 여부																																																* 실제 촬영한 사진과 함께 상세 정보를 입력해주세요.																																																* 카카오톡 아이디 첨부 시 게시물 삭제 및 이용제재 처리될 수 있어요.																																																 																																																안전하고 건전한 거래환경을 위해 과학기술정보통신부, 한국인터넷진흥원, 중고나라가 함께합니다."
									maxlength="1000"></textarea>
							</div>
							<span class="absolute right-0 text-sm leading-5 text-gray-400">0
								/ 1000</span>
						</div>
						<!-- 상품상태 : 중고 / 새상품 버튼 -->
						<p class="font-semibold">상품상태</p>
						<div class="flex gap-3">
							<input type="button" id="oldProductBtn"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen" value="중고"/>
							<input type="button" id="newProductBtn"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white" value="새상품"/>
						</div>
						<!-- 배송비 : 새송비 별도 / 배송비 포함 러디오 버튼-->
						<div>
							<p class="text-jnGray-900">배송비</p>
							<ul class="flex flex-row items-start mt-3">
								<li class="flex items-center mr-4 contents-center"><label
									for="parcelFeeN" class="flex items-end"><input
										name="parcelFeeYn" type="radio" id="parcelFeeN"
										class="appearance-none rounded-full w-5 h-5 border-1.5 border-solid border-jnGray-500 transition-all duration-100 ease-linear mr-1.5 cursor-pointer checked:border-6 checked:border-jngreen"
										value="0" checked=""><span
										class="cursor-pointer text-jnGray-700">배송비 별도</span></label></li>
								<li class="flex items-center mr-4 contents-center"><label
									for="parcelFeeY" class="flex items-end"><input
										name="parcelFeeYn" type="radio" id="parcelFeeY"
										class="appearance-none rounded-full w-5 h-5 border-1.5 border-solid border-jnGray-500 transition-all duration-100 ease-linear mr-1.5 cursor-pointer checked:border-6 checked:border-jngreen"
										value="1"><span class="cursor-pointer text-jnGray-700">배송비
											포함</span></label></li>
							</ul>
						</div>

						<!-- 희망지역 : 주소검색 / 지역 설정 안함 버튼 -->
						<p class="font-semibold">희망지역</p>
						<div class="flex gap-3">
							<input type="button" id="addrSearchBtn"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen" value="주소 검색"/>
							<input type="button" id="noAddrBtn"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white"
								style="width: 130px" value="지역 설정 안 함">
						</div>
					</section>
					<section class="w-full px-5 text-sm font-medium mb-7">
						<div class="h-px mb-4 bg-jnGray-200"></div>
					</section>
					<!-- 등록 버튼 -->
					<div class="relative flex gap-4 px-5 py-3">
						<input type="button" id="registerBtn"
							class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center border-0 border-transparent placeholder-white focus-visible:outline-none focus:outline-none rounded-md bg-heading text-white px-5 md:px-6 lg:px-8 py-4 md:py-3.5 lg:py-4 hover:text-white hover:bg-gray-600 hover:shadow-cart w-[20%] break-keep"
							 style="margin-left: 590px;" value="등록"/>
					</div>
				</form>
			</section>
		</div>
		<div class="Toastify"></div>
	</main>
	<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>