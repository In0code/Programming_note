<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<link rel="stylesheet" href="http://localhost/retro_prj/common/cdn/review_write.css" />
<style type="text/css">

textarea {
	border: 1px solid #DBDFE6; 
	border-radius: 5px; 
	resize: none; 
	padding:10px; 
	margin-top:10px
}

textarea:focus {
	outline: none;
	border: 1px solid #0DCC5A;
}

</style>

<script type="text/javascript">
	$(function() {
		$("#productInfoArea").click(function(){
			/* 상품 상세로 이동하도록 설정 */
			location.href="";
		});
		
		$("#reviewBtn").click(function(){
			$("#hrdFrm").submit();
		});
		
		/* '최고에요'버튼 누르면 동작 */
		$("#bestBtn").click(function() {
		    $("circle", this).attr('fill', '#0DCC5A');
		    $("path", this).attr('stroke', 'white');
		    $("path", this).attr('fill', '#0DCC5A');
		    $("circle", "#goodBtn, #sosoBtn").attr('fill', 'white');
		    $("circle", "#goodBtn, #sosoBtn").attr('stroke', '#DADEE5');
		    $("path", "#goodBtn, #sosoBtn").attr('stroke', '#C2C6CE');
		    $("path", "#goodBtn, #sosoBtn").attr('fill', 'white');
		    $("#bestCmt").attr('style','color:black');
		    $("#sosoCmt, #goodCmt").attr('style','color:#9CA3AF');
		    
		    $("#statusP").html("제가 있는 곳까지 와서 거래했어요.");
		    $("#kindP").html("친절/매너가 좋아요.");
		    $("#timeP").html("거래 시간을 잘 지켜요.");
		    $("#speedP").html("응답이 빨라요.");
		});

		/* '좋아요'버튼 누르면 동작 */
		$("#goodBtn").click(function() {
		    $("circle", this).attr('fill', '#0DCC5A');
		    $("path", this).attr('stroke', 'white');
		    $("path", this).attr('fill', '#0DCC5A');
		    $("circle", "#bestBtn, #sosoBtn").attr('fill', 'white');
		    $("circle", "#bestBtn, #sosoBtn").attr('stroke', '#DADEE5');
		    $("path", "#bestBtn, #sosoBtn").attr('stroke', '#C2C6CE');
		    $("path", "#bestBtn, #sosoBtn").attr('fill', 'white');
		    $("#goodCmt").attr('style','color:black');
		    $("#sosoCmt, #bestCmt").attr('style','color:#9CA3AF');
		    
		    $("#statusP").html("제가 있는 곳까지 와서 거래했어요.");
		    $("#kindP").html("친절/매너가 좋아요.");
		    $("#timeP").html("거래 시간을 잘 지켜요.");
		    $("#speedP").html("응답이 빨라요.");
		});//click

		/* '아쉬워요'버튼 누르면 동작 */
		$("#sosoBtn").click(function() {
		    $("circle", this).attr('fill', '#0DCC5A');
		    $("path", this).attr('stroke', 'white');
		    $("path", this).attr('fill', '#0DCC5A');
		    $("circle", "#bestBtn, #goodBtn").attr('fill', 'white');
		    $("circle", "#bestBtn, #goodBtn").attr('stroke', '#DADEE5');
		    $("path", "#bestBtn, #goodBtn").attr('stroke', '#C2C6CE');
		    $("path", "#bestBtn, #goodBtn").attr('fill', 'white');
		    $("#sosoCmt").attr('style','color:black');
		    $("#goodCmt, #bestCmt").attr('style','color:#9CA3AF');
		    
		    $("#statusP").html("거래 거리가 아쉬워요.");
		    $("#kindP").html("친절/매너가 아쉬워요.");
		    $("#timeP").html("거래 시간을 안 지켜요.");
		    $("#speedP").html("응답이 느려요.");
		});//click
		
		/* '친절/매너가 좋아요' 체크박스 누르면 동작 */
		$("#sellerFeedback").click(function(){
			if ($(this).find("path").attr('fill') === '#0DCC5A') {
		        $(this).find("path").attr('fill', '#C2C6CE');
		    } else {
		        $(this).find("path").attr('fill', '#0DCC5A');
		    }//end else
		});//click

		/* '응답이 빨라요' 체크박스 누르면 동작 */
		$("#replySpeedFeedback").click(function(){
			 if ($(this).find("path").attr('fill') === '#0DCC5A') {
			        $(this).find("path").attr('fill', '#C2C6CE');
			    } else {
			        $(this).find("path").attr('fill', '#0DCC5A');
			    }//end else
		});//click

		/* 상품 상태가 좋아요 */
		$("#comfortFeedback").click(function(){
			if ($(this).find("path").attr('fill') === '#0DCC5A') {
		        $(this).find("path").attr('fill', '#C2C6CE');
		    } else {
		        $(this).find("path").attr('fill', '#0DCC5A');
		    }//end else
		});//click
		
		/* 거래 시간을 잘 지켜요 */
		$("#timeFeedback").click(function() {
			if ($(this).find("path").attr('fill') === '#0DCC5A') {
		        $(this).find("path").attr('fill', '#C2C6CE');
		    } else {
		        $(this).find("path").attr('fill', '#0DCC5A');
		    }//end else
		});
		
	});//ready
	
	function lengthCnt() {
		var reviewArea = $("#reviewArea").val();
		var maxLength = 300;
		
		$("#lengthCnt").html(reviewArea.length);
		
		if(reviewArea.length > maxLength){
			var subText = reviewArea.substring(0, maxLength);
			$("#reviewArea").val(subText);
			$("#lengthCnt").html(maxLength);
		}
	}
	
	function comment1(value){
		$("#comment1").val(value);
	}
	
	function comment2(value){
		$("#"+value).attr('checked','checked');
	}
	
</script>

</head>
<body>
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
			<div class="w-full flex-grow">

	<div class="basic-layout css-17tl8vo">
		<header class="css-k0sx5n">
			<div class="css-nh9e3h">
				<div class="css-1afmzpj" style="padding-top: 20px">
					<h1 class="css-1gl63ht" style="font-size:18px; font-weight: 600">후기 작성</h1>
					<div class="css-1ay3cpr"></div>
				</div>
			</div>
			<div class="css-16zjptt"></div>
		</header>
		<div id="container" class="container css-1vsyufa">
			<main class="css-1n52gqv">
				<div class="containerStyle" style="height:680px">
					<button id="productInfoArea">
						<div class="css-1glkcst">
							<div class="product-img-wrap css-4sj9kq">
								<!-- 상품 이미지 -->
								<img src="https://img2.joongna.com/media/original/2023/11/30/1701329246394HfJ_vgYmu.png"
									alt="상품명" width="1000" height="1000"
									referrerpolicy="no-referrer" class="css-sxxyvs">
								<!---->
							</div>
							<!-- 상품 정보 -->
							<div class="product-info">
								<h2>제목 영역</h2>
								<p>판매자 닉네임</p>
							</div>
							<!---->
						</div>
					</button>
					
					<!-- 기본 선택 -->
					<section class="css-1y8gct2">
						<div>
							<h3>
								닉네임님과의<br>거래는 어떠셨나요?
							</h3>
						</div>
						
						<div class="css-1vhc4hr">
							<div class="item-wrap ">
								<button type="button" id="bestBtn" onclick="comment1('best')">
									<svg width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
										<g clip-path="url(#clip0_833_149965)">
										<circle cx="30" cy="30" r="30" fill="#0DCC5A"></circle>
										<g clip-path="url(#clip1_833_149965)">
										<path d="M35.4391 24.7437V21.0637C35.4391 20.3317 35.1437 19.6297 34.6177 19.1121C34.0918 18.5945 33.3784 18.3037 32.6346 18.3037L28.8953 26.5837V36.7036H39.4402C39.8911 36.7086 40.3287 36.5531 40.6722 36.2657C41.0158 35.9783 41.2423 35.5784 41.3099 35.1396L42.6 26.8597C42.6406 26.5959 42.6226 26.3267 42.547 26.0705C42.4714 25.8144 42.3402 25.5775 42.1623 25.3762C41.9845 25.1749 41.7643 25.0141 41.517 24.9049C41.2698 24.7957 41.0013 24.7406 40.7303 24.7437H35.4391ZM28.8953 36.7036H26.0908C25.5949 36.7036 25.1194 36.5097 24.7687 36.1647C24.4181 35.8196 24.2211 35.3516 24.2211 34.8636V28.4236C24.2211 27.9357 24.4181 27.4676 24.7687 27.1226C25.1194 26.7775 25.5949 26.5837 26.0908 26.5837H28.8953"
											fill="#0DCC5A"></path>
										<path d="M28.8953 36.7036H26.0908C25.5949 36.7036 25.1194 36.5097 24.7687 36.1647C24.4181 35.8196 24.2211 35.3516 24.2211 34.8636V28.4236C24.2211 27.9357 24.4181 27.4676 24.7687 27.1226C25.1194 26.7775 25.5949 26.5837 26.0908 26.5837H28.8953M35.4391 24.7437V21.0637C35.4391 20.3317 35.1437 19.6297 34.6177 19.1121C34.0918 18.5945 33.3784 18.3037 32.6346 18.3037L28.8953 26.5837V36.7036H39.4402C39.8911 36.7086 40.3287 36.5531 40.6722 36.2657C41.0158 35.9783 41.2423 35.5784 41.3099 35.1396L42.6 26.8597C42.6406 26.5959 42.6226 26.3267 42.547 26.0705C42.4714 25.8144 42.3402 25.5775 42.1623 25.3762C41.9845 25.1749 41.7643 25.0141 41.517 24.9049C41.2698 24.7957 41.0013 24.7406 40.7303 24.7437H35.4391Z"
											stroke="white" stroke-width="1.5" stroke-linecap="round"
											stroke-linejoin="round"></path>
										<path d="M29.5173 28.3589V24.6789C29.5173 23.9469 29.2218 23.2449 28.6958 22.7273C28.1699 22.2097 27.4566 21.9189 26.7128 21.9189L22.9734 30.1989V40.3188H33.5183C33.9692 40.3238 34.4068 40.1683 34.7504 39.8809C35.0939 39.5935 35.3204 39.1936 35.388 38.7548L36.6781 30.4749C36.7188 30.2112 36.7007 29.9419 36.6251 29.6858C36.5495 29.4296 36.4183 29.1927 36.2404 28.9914C36.0626 28.7901 35.8424 28.6293 35.5951 28.5201C35.3479 28.4109 35.0794 28.3559 34.8084 28.3589H29.5173ZM22.9734 40.3188H20.1689C19.6731 40.3188 19.1975 40.125 18.8469 39.7799C18.4962 39.4348 18.2993 38.9668 18.2993 38.4788V32.0389C18.2993 31.5509 18.4962 31.0829 18.8469 30.7378C19.1975 30.3927 19.6731 30.1989 20.1689 30.1989H22.9734"
											fill="#0DCC5A"></path>
										<path d="M22.9734 40.3188H20.1689C19.6731 40.3188 19.1975 40.125 18.8469 39.7799C18.4962 39.4348 18.2993 38.9668 18.2993 38.4788V32.0389C18.2993 31.5509 18.4962 31.0829 18.8469 30.7378C19.1975 30.3927 19.6731 30.1989 20.1689 30.1989H22.9734M29.5173 28.3589V24.6789C29.5173 23.9469 29.2218 23.2449 28.6958 22.7273C28.1699 22.2097 27.4566 21.9189 26.7128 21.9189L22.9734 30.1989V40.3188H33.5183C33.9692 40.3238 34.4068 40.1683 34.7504 39.8809C35.0939 39.5935 35.3204 39.1936 35.388 38.7548L36.6781 30.4749C36.7188 30.2112 36.7007 29.9419 36.6251 29.6858C36.5495 29.4296 36.4183 29.1927 36.2404 28.9914C36.0626 28.7901 35.8424 28.6293 35.5951 28.5201C35.3479 28.4109 35.0794 28.3559 34.8084 28.3589H29.5173Z"
											stroke="white" stroke-width="1.5" stroke-linecap="round"
											stroke-linejoin="round"></path></g></g>
										<defs>
										<clipPath id="clip0_833_149965">
										<rect width="60" height="60" fill="white"></rect></clipPath>
										<clipPath id="clip1_833_149965">
										<rect width="32" height="32" fill="white"
											transform="translate(14.0024 14)"></rect></clipPath></defs></svg>
								</button>
								<p class="css-1ejdrt9" id="bestCmt">최고예요!</p>
							</div>
							
							<div class="item-wrap ">
								<button type="button" id="goodBtn" onclick="comment1('good')">
									<svg width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
										<g clip-path="url(#clip0_13404_51422)">
										<circle cx="30" cy="30" r="29.25" fill="white"
											stroke="#DADEE5" stroke-width="1.5"></circle>
										<g clip-path="url(#clip1_13404_51422)">
										<path d="M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058ZM25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774"
											fill="white"></path>
										<path d="M25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058Z"
											stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round"
											stroke-linejoin="round"></path></g></g>
										<defs>
										<clipPath id="clip0_13404_51422">
										<rect width="60" height="60" fill="white"></rect></clipPath>
										<clipPath id="clip1_13404_51422">
										<rect width="32" height="32" fill="white"
											transform="translate(14 14)"></rect></clipPath></defs></svg>
								</button>
								<p class="css-k69puj" id="goodCmt">좋아요</p>
							</div>
							
							<div class="item-wrap ">
								<button type="button" id="sosoBtn" onclick="comment1('soso')">
									<svg width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-nn7eu2">
										<g clip-path="url(#clip0_13404_51422)">
										<circle cx="30" cy="30" r="29.25" fill="white"
											stroke="#DADEE5" stroke-width="1.5"></circle>
										<g clip-path="url(#clip1_13404_51422)">
										<path d="M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058ZM25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774"
											fill="white"></path>
										<path d="M25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058Z"
											stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round"
											stroke-linejoin="round"></path></g></g>
										<defs>
										<clipPath id="clip0_13404_51422">
										<rect width="60" height="60" fill="white"></rect></clipPath>
										<clipPath id="clip1_13404_51422">
										<rect width="32" height="32" fill="white" transform="translate(14 14)"></rect></clipPath></defs></svg>
								</button>
								<p class="css-k69puj" id="sosoCmt">아쉬워요</p>
							</div>
						</div>
					</section>
					<!---->
					
					<form id="hrdFrm">
					<input type="hidden" id="comment1" name="comment1">
					<!-- 상세 선택 -->
					<section>
						<ul class="css-1ovzr4f">
						
							<li>
							<label for="sellerFeedback" id="sellerFeedback" onclick="comment2('checkKind')">
							<input type="checkbox" id="checkKind" name="review_item" value="1">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg" class="css-1t3in5p">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12ZM16.5303 9.53033C16.8232 9.23744 16.8232 8.76256 16.5303 8.46967C16.2374 8.17678 15.7626 8.17678 15.4697 8.46967L10.5 13.4393L8.53033 11.4697C8.23744 11.1768 7.76256 11.1768 7.46967 11.4697C7.17678 11.7626 7.17678 12.2374 7.46967 12.5303L9.96967 15.0303C10.2626 15.3232 10.7374 15.3232 11.0303 15.0303L16.5303 9.53033Z"
											fill="#C2C6CE"></path></svg>
									<p id="kindP">친절/매너가 좋아요.</p>
							</label>
							</li>
							
							<li>
							<label for="replySpeedFeedback" id="replySpeedFeedback" onclick="comment2('checkSpeed')">
							<input type="checkbox" id="checkSpeed" name="review_item" value="2">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg" class="css-1t3in5p">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12ZM16.5303 9.53033C16.8232 9.23744 16.8232 8.76256 16.5303 8.46967C16.2374 8.17678 15.7626 8.17678 15.4697 8.46967L10.5 13.4393L8.53033 11.4697C8.23744 11.1768 7.76256 11.1768 7.46967 11.4697C7.17678 11.7626 7.17678 12.2374 7.46967 12.5303L9.96967 15.0303C10.2626 15.3232 10.7374 15.3232 11.0303 15.0303L16.5303 9.53033Z"
											fill="#C2C6CE"></path></svg>
									<p id="speedP">응답이 빨라요.</p>
							</label>
							</li>
							
							<li>
							<label for="descriptionMatchFeedback" id="comfortFeedback" onclick="comment2('checkComfort')">
							<input type="checkbox" id="checkComfort" name="review_item" value="3">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg" class="css-1t3in5p">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12ZM16.5303 9.53033C16.8232 9.23744 16.8232 8.76256 16.5303 8.46967C16.2374 8.17678 15.7626 8.17678 15.4697 8.46967L10.5 13.4393L8.53033 11.4697C8.23744 11.1768 7.76256 11.1768 7.46967 11.4697C7.17678 11.7626 7.17678 12.2374 7.46967 12.5303L9.96967 15.0303C10.2626 15.3232 10.7374 15.3232 11.0303 15.0303L16.5303 9.53033Z"
											fill="#C2C6CE"></path></svg>
									<p id="statusP">제가 있는 곳까지 와서 거래했어요.</p>
							</label>
							</li>

							<li>
							<label for="descriptionMatchFeedback" id="timeFeedback" onclick="comment2('checkTime')">
							<input type="checkbox" id="checkTime" name="review_item" value="4">
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg" class="css-1t3in5p">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12ZM16.5303 9.53033C16.8232 9.23744 16.8232 8.76256 16.5303 8.46967C16.2374 8.17678 15.7626 8.17678 15.4697 8.46967L10.5 13.4393L8.53033 11.4697C8.23744 11.1768 7.76256 11.1768 7.46967 11.4697C7.17678 11.7626 7.17678 12.2374 7.46967 12.5303L9.96967 15.0303C10.2626 15.3232 10.7374 15.3232 11.0303 15.0303L16.5303 9.53033Z"
											fill="#C2C6CE"></path></svg>
									<p id="timeP">거래 시간을 잘 지켜요.</p>
							</label>
							</li>
						</ul>
					</section>
					<!---->
					
					<div style="text-align: right">
					<textarea id="reviewArea" name="reviewArea" oninput="lengthCnt()" placeholder="상세한 리뷰를 작성해주세요.(선택)"
					style="width:100%; height: 170px;" ></textarea>
					<span id="lengthCnt">0</span>/300
					</div>
					</form>
				</div>
				
				<div class="css-1nenfkg">
					<input type="button" class="css-12uwwjm" id="reviewBtn" value="후기 등록"/>
				</div>
				
			</main>
		</div>
	</div>
	</div>
	</div>
	</main>
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>

</body>
</html>