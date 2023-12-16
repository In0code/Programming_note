<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">
#category-depth-1, #category-depth-2, #category-depth-3,
	#category-depth-4, #category-depth-5, #category-depth-1-1,
	#category-depth-1-2, #category-depth-5-2, #category-depth-5-1,
	#category-depth-4-1, #category-depth-3-1, #category-depth-3-2,
	#category-depth-2-3, #category-depth-2-2, #category-depth-2-1 {
	display: none;
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.filebox .upload-name {
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    width: 60%;
    color: #999999;
    border: 1px solid #DBDFE6; 
	border-radius: 2px; 
	height: 30px;
}

.filebox label {
    display: inline-block;
    padding: 8px 18px;
    color: #fff;
    vertical-align: middle;
    background-color: #333;
    border: 1px solid #BEBEBE;
    cursor: pointer;
    height: 40px;
    margin: 3px 0px 0px 10px;
}

.upload-name:focus {
	outline:none;
}


.filebox label:hover {
	background-color: white;
	color: #333;
	font-weight: 600;
  	transition: background-color 0.3s ease, color 0.3s ease, font-weight 0.3s ease;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		 /*  $("#imgSrc").val("${ userProduct.img }");
		  $("#img2Src").val("${ userProduct.img2 }");
		  $("#img3Src").val("${ userProduct.img3 }");
		  $("#img4Src").val("${ userProduct.img4 }");
		 */
		
		  // 기존 이미지 변수에 저장
		    var originalImg = "${userProduct.img}";
		    var originalImg2 = "${userProduct.img2}";
		    var originalImg3 = "${userProduct.img3}";
		    var originalImg4 = "${userProduct.img4}";

		    // 파일 값이 바뀌면 파일명을 보여주는 input 값이 바뀜
		    $("#mainImg").on('change', function() {
		        setFileName("#mainImg", "#imgSrc", originalImg);
		    });

		    $("#subImg").on('change', function() {
		        setFileName("#subImg", "#img2Src", originalImg2);
		    });

		    $("#mainImg2").on('change', function() {
		        setFileName("#mainImg2", "#img3Src", originalImg3);
		    });

		    $("#subImg2").on('change', function() {
		        setFileName("#subImg2", "#img4Src", originalImg4);
		    });

		    // 이미지가 비어있을 경우에만 기존 이미지를 설정
		    if ($("#imgSrc").val() === "") {
		        $("#imgSrc").val(originalImg);
		    }
		    if ($("#img2Src").val() === "") {
		        $("#img2Src").val(originalImg2);
		    }
		    if ($("#img3Src").val() === "") {
		        $("#img3Src").val(originalImg3);
		    }
		    if ($("#img4Src").val() === "") {
		        $("#img4Src").val(originalImg4);
		    }

		/* 받아온 싱픔 싱테 버튼 설정 */
		var chkStatus="${ userProduct.status }"
		if( chkStatus === 'J' ){
			$("#oldProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#newProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
		}else if( chkStatus === 'S' ){
			$("#newProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#oldProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
		}//end else
		
		/* 받아온 베송비 버튼 설정 */
		var chkDeliver="${ userProduct.deliver }"
		if( chkDeliver === 'N' ){
			$("#deliverNBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#deliverYBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
		}else if( chkDeliver === 'Y' ){
			$("#deliverYBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#deliverNBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
		}//end else
		
		/* 받아온 지역 설정 버튼 설정 */
		var chkAddr="${ userProduct.loc }"
		if (chkAddr == null || chkAddr === '') {
			$("#noAddrBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#addrSearchBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#locInputBox").css('display', 'none');
			$("#locErr").css('display', 'none');
			flag = false;
		}else{
			$("#addrSearchBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#noAddrBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#locInputBox").css('display', 'block');
			flag = true;
		}//end else
		
	
		

		/* --------희망지역 버튼------------- */
		/* var flag = true; */
		/* '주소검색' 버튼 누르면 동작 */
		$("#addrSearchBtn").click(function() {
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#noAddrBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#locInputBox").css('display', 'block');
			flag = true;

		});//clcick

		/* '지역 설정 안 함'버튼누르면 동작*/
		$("#noAddrBtn").click(function() {
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#addrSearchBtn").attr(
			'class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#locInputBox").css('display', 'none');
			$("#locErr").css('display', 'none');
			flag = false;
		});//clcick

		/* --------상품 상태 버튼------------- */

		/* '중고' 버튼 누르면 동작 */
		$("#oldProductBtn").click(function() {
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#newProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#changeStatus").val("J");
		});//clcick

		/* '새상품'버튼누르면 동작*/
		$("#newProductBtn").click(function() {
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#oldProductBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#changeStatus").val("S");
		});//clcick
		
		/* --------배송비 버튼------------- */

		/* '배송비 별도' 버튼 누르면 동작 */
		$("#deliverNBtn").click(function() {
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#deliverYBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#changeDeliver").val("N");
		});//clcick

		/* '새상품'버튼누르면 동작*/
		$("#deliverYBtn").click(function() {
			$(this).attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
			$("#deliverNBtn").attr('class',"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
			$("#changeDeliver").val("Y");
		});//clcick


		/* 에러 메시지를 보여줬다가, 다시 키가 올라오면 에러 메시지 사라지게 */
		$("#productTitle").keyup(function() {
			$("#pnameErr").css('display', 'none');
		});
		$("#productPrice").keyup(function() {
			$("#priceNErr").css('display', 'none');
		});
		$("#productDescription").keyup(function() {
			$("#contextErr").css('display', 'none');
		});
		$("#locInputBox").keyup(function() {
			$("#locErr").css('display', 'none');
		});

		/* 등록 버튼 클릭 시 동작 */
		$("#registerBtn").click(function() {

			var formData = new FormData($("#regiFrm")[0]);

			if ($("#productTitle").val() === '') {
				$("#pnameErr").css('display', 'block');
				alert("상품명을 입력해주세요");
				return; // locInput이 비어있으면 처리 중단
			} else {
				$("#pnameErr").css('display', 'none');
			}//end else			

			if ($("#productPrice").val() === '') {
				$("#priceNErr").css('display', 'block');
				alert("가격을 입력해주세요");
				return; // locInput이 비어있으면 처리 중단
			} else {
				$("#priceNErr").css('display', 'none');
			}//end else			

			/* 상품 상세 정보가 비어있을 때 */
			if ($("#productDescription").val() === '') {
				$("#contextErr").css('display', 'block');
				alert("상품 상세정보를 입력해주세요");
				return; // locInput이 비어있으면 처리 중단
			} else {
				$("#contextErr").css('display', 'none');
			}//end else			

			/* 희망지역 입력 칸이 비어있을 시 */
			if (flag) {
				if ($("#locInputBox").val() === '') {
					$("#locErr").css('display', 'block');
					alert("희망지역을 입력해주세요");
					return; // locInput이 비어있으면 처리 중단
				} else {
					$("#locErr").css('display', 'none');
				}//end else
			}//end if
			var frm = document.frm;
			frm.action = "product_register_ok.do";
			$("#regiFrm").submit();

		});
		
		/* 파일 값이 바뀌면 파일명을 보여주는 input 값이 바뀜 */
		$("#mainImg").on('change',function(){
			  var fileName = $("#mainImg").val();
			  var fileType = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			  fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				
			  if(fileType != "" && fileType != ".jpg" && fileType != ".png" && fileType != ".jpeg") {
				  alert("jpg, jpeg, png 확장자만 가능합니다.");
				  $("#mainImg").val("");
				  fileName = "";
			  }
			  
			  $("#imgSrc").val(fileName);
		});

		$("#subImg").on('change',function(){
			  var fileName = $("#subImg").val();
			  var fileType = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			  fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				
			  if(fileType != "" && fileType != ".jpg" && fileType != ".png" && fileType != ".jpeg") {
				  alert("jpg, jpeg, png 확장자만 가능합니다.");
				  $("#subImg").val("");
				  $("#img2Src").val("");
				  
				  return;
			  }
			  
			  $("#img2Src").val(fileName);
		});
		/* 파일 값이 바뀌면 파일명을 보여주는 input 값이 바뀜 */
		$("#mainImg2").on('change',function(){
			  var fileName = $("#mainImg2").val();
			  var fileType = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			  fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				
			  if(fileType != "" && fileType != ".jpg" && fileType != ".png" && fileType != ".jpeg") {
				  alert("jpg, jpeg, png 확장자만 가능합니다.");
				  $("#mainImg2").val("");
				  fileName = "";
			  }
			  
			  $("#img3Src").val(fileName);
		});

		$("#subImg2").on('change',function(){
			  var fileName = $("#subImg2").val();
			  var fileType = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			  fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
				
			  if(fileType != "" && fileType != ".jpg" && fileType != ".png" && fileType != ".jpeg") {
				  alert("jpg, jpeg, png 확장자만 가능합니다.");
				  $("#subImg2").val("");
				  $("#img4Src").val("");
				  
				  return;
			  }
			  
			  $("#img4Src").val(fileName);
		});
	});//ready

	document.addEventListener("DOMContentLoaded", function() {
		// 모든 li 요소에 대해 클릭 이벤트 리스너 등록
		var liElements = document.querySelectorAll("ul li");

		liElements.forEach(function(li) {
			li.addEventListener("click", function(event) {
				// 클릭한 li 요소의 ID를 가져와서 출력
				var clickedId = event.currentTarget.id;

				$("#category").html(clickedId);
				var productName = $("#productTitle").val();

				$("#c3code").val(clickedId);

				// 여기에서 클릭한 li 요소의 ID를 활용하면 됩니다.
				// 예를 들어, 클릭한 ID를 서버로 전송하거나 다른 작업을 수행할 수 있습니다.
			});
		});//forEach
	});//addEventListener

	/* price */
	function validatePrice(input) {
		// 숫자만 남기기
		input.value = input.value.replace(/[^0-9]/g, '');

		// 8자리를 초과하는 경우 오류 메시지 표시
		var maxLength = 8;
		var price = input.value;

		if (price.length > maxLength) {
			document.getElementById('priceError').style.display = 'block';

			// 8자리 이상일 경우 입력 취소
			input.value = input.value.slice(0, maxLength);
		} else {
			document.getElementById('priceError').style.display = 'none';
		}//end else
	}//validatePrice

	/* context */
	function lengthCnt() {
		var reviewArea = $("#productDescription").val();
		var maxLength = 1000;

		$("#lengthCnt").html(reviewArea.length);

		if (reviewArea.length > maxLength) {
			var subText = reviewArea.substring(0, maxLength);
			$("#productDescription").val(subText);
			$("#lengthCnt").html(maxLength);
		}//end if
	}//lengthCnt
	
	
	 function setFileName(inputId, targetId, originalImgPath) {
	        var fileName = $(inputId).val();
	        var fileType = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
	        fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);

	        if (fileType != "" && fileType != ".jpg" && fileType != ".png" && fileType != ".jpeg") {
	            alert("jpg, jpeg, png 확장자만 가능합니다.");
	            $(inputId).val("");
	            fileName = "";
	        } else {
	            // 파일이 선택되었을 때만 파일명 업데이트
	            $(targetId).val(fileName);
	        }
	    }
</script>

<!-- 
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
	 -->

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
	<c:import url="http://localhost/retro_prj/common/cdn/header.jsp" />


	<form id="regiFrm" name="frm" enctype="multipart/form-data"
		method="post">
		<input type="hidden" name="c3code" id="c3code" /> 
		 <input
			type="hidden" name="loc" id="changeLoc" />
		<main class="relative flex-grow border-b-2"
			style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
			<div
				class="mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
				<section class="mx-auto w-full max-w-[768px]">
					<div class="flex px-5 pb-1.5">
					<div class="filebox">
    						<input class="upload-name" placeholder="이미지를 선택해주세요." readonly="readonly" id="imgSrc" name="imgSrc">
    						<label for="mainImg">파일찾기</label> 
    						<input type="file" id="mainImg" name="img">
					</div>
					<div class="filebox">
					    	<input class="upload-name" placeholder="이미지를 선택해주세요." readonly="readonly" id="img2Src" name="img2Src">
    						<label for="subImg">파일찾기</label> 
    						<input type="file" id="subImg" name="img2">
					</div>
					</div>
					<div class="flex px-5 pb-1.5">
					<div class="filebox">
    						<input class="upload-name" placeholder="이미지를 선택해주세요." readonly="readonly" id="img3Src" name="img3Src">
    						<label for="mainImg2">파일찾기</label> 
    						<input type="file" id="mainImg2" name="img3">
					</div>
					<div class="filebox">
					    	<input class="upload-name" placeholder="이미지를 선택해주세요." readonly="readonly" id="img4Src" name="img4Src">
    						<label for="subImg2">파일찾기</label> 
    						<input type="file" id="subImg2" name="img4">
					</div>
					</div><br/>
					<br/>
					<div class="flex flex-col px-5 space-y-5">
					<div class="block">
							<input id="productTitle" name="pname" type="text"
								value="${ userProduct.pname }"
								class="py-2 px-4 md:px-5 w-full appearance-none border text-input text-xs lg:text-sm font-body placeholder-body min-h-12 transition duration-200 ease-in-out bg-white border-gray-300 focus:border-heading h-11 md:h-12 focus:outline-none rounded-md"
								autocomplete="off" spellcheck="false" aria-invalid="false">
							<p id="pnameErr"
								style="display: none; color: red; font-size: 15px;">상품명을
								입력해주세요.</p>
						</div>
						</div><br/>
						
					<div class="pb-4">
										<div class="flex items-center w-full chawkbazarBreadcrumb">
											<ol class="flex flex-wrap items-center w-full">
											<li><strong>카테고리</strong></li>
											<li class="line-break"></li>
												<li
													class="flex-shrink-0 px-0 text-sm break-all transition duration-200 ease-in text-body first:ps-0 last:pe-0 hover:text-heading"><a
													href="/">${ userProduct.cname }</a></li>
												<li
													class="text-sm mx-2.5 leading-5 text-body min-[480px]:px-1 max-[480px]:px-0">&gt;</li>
												<li
													class="flex-shrink-0 px-0 text-sm break-all transition duration-200 ease-in text-body first:ps-0 last:pe-0 hover:text-heading"><a
													class="capitalize" href="/search?category=21">${ userProduct.c2name }</a></li>
												<li
													class="text-sm mx-2.5 leading-5 text-body min-[480px]:px-1 max-[480px]:px-0">&gt;</li>
												<li
													class="flex-shrink-0 px-0 text-sm break-all transition duration-200 ease-in text-body first:ps-0 last:pe-0 hover:text-heading"><a
													class="capitalize" href="/search?category=21">${ userProduct.c3name }</a></li>
											</ol>
										</div>
									</div>


					<!-- 판매가격 / 무료나눔 체크 -->
					<div class="flex flex-col px-5 mt-5" id="err">
						<div
							class="flex items-center justify-between w-full border border-gray-300 border-solid rounded px-4  
					        text-base scale-85 origin-top-left -mb-3  w-[117.65%] p-6  h-[60px]
					
					        false">
							<label for="search" class="flex items-center py-0.5 w-2/3">
								<span>₩</span> <input name="price" type="text"
								inputmode="numeric" id="productPrice"
								class="ml-1 bg-white focus:outline-none h-11 md:h-12 placeholer-jnGray-500 w-2/3 disabled:opacity-100 placeholer-jnGray-500"
								 value="${ userProduct.price }" oninput="validatePrice(this)" value="">
							</label>
						</div>
						<p id="priceError" class="input_error"
							style="display: none; color: red; font-size: 15px">최대 1억원까지
							입력 가능합니다.</p>
						<p id="priceNErr"
							style="display: none; color: red; font-size: 15px;">판매 가격을
							입력해주세요.</p>
					</div>
					<br />
					<section class="flex flex-col px-5 space-y-5">
						<!-- 상품명, 구매시기, 착용 시간, 요염 여부, 하자여부 작성 inputBox -->
						<div style="text-align: right">
							<textarea id=productDescription name="context"
								oninput="javascript:lengthCnt()"
								style="width: 100%; height: 300px; border: 1px solid #E5E4E4; border-radius: 5px; resize: none; padding: 15px; margin-top: 15px; border-color: #929492">${ userProduct.context }</textarea>
							<p id="contextErr"
								style="display: none; color: red; font-size: 15px; text-align: left;">상품
								상제 정보를 입력해주세요</p>
							<span id="lengthCnt">0</span>/1000
						</div>
						<br />
						<!-- 상품상태 : 중고 / 새상품 버튼 -->
						<p class="font-semibold">상품상태</p>
						<div class="flex gap-3">
							<input type="button" id="oldProductBtn" name="status"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen"
								value="중고" /> <input type="hidden" name="status"
								id="changeStatus" value="J" /> <input type="button"
								id="newProductBtn"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white"
								value="새상품" />
						</div>
						<br />
						<!-- 배송비 : 새송비 별도 / 배송비 포함 러디오 버튼-->
						<p class="font-semibold">배송비</p>
						<div class="flex gap-3">
							<input type="button" id="deliverNBtn" name="deliver"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen"
								value="배송비 별도" /> 
								<input type="hidden" name="deliver" id="changeDeliver" value="N" /> 
								<input type="button" id="deliverYBtn"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white"
								value="배송비 포함" />
						</div>
						<br />


						<!-- 희망지역 : 주소검색 / 지역 설정 안함 버튼 -->
						<p class="font-semibold">희망지역</p>
						<div class="flex gap-3">
							<input type="button" id="addrSearchBtn" 
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen"
								value="주소 입력" /> 
							<input type="button" id="noAddrBtn"
								class="h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white"
								style="width: 130px" value="지역 설정 안 함">
						</div>
						<input type="text" class="inputBox" name="loc" id="locInputBox"
							placeholder="희망하는 지역의 동까지 입력   예) 자양동"
							style="font-size: 15px; border: 1px solid #929492; width: 300px; padding: 5px; display: block" />
						<p id="locErr" style="display: none; color: red; font-size: 15px;">희망하는
							지역의 주소를 입력해주세요.</p>
					</section>
					<section class="w-full px-5 text-sm font-medium mb-7">
						<div class="h-px mb-4 bg-jnGray-200"></div>
					</section>
					<!-- 등록 버튼 -->
					<div class="relative flex gap-4 px-5 py-3">
						<input type="button" id="registerBtn"
							class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center border-0 border-transparent placeholder-white focus-visible:outline-none focus:outline-none rounded-md bg-heading text-white px-5 md:px-6 lg:px-8 py-4 md:py-3.5 lg:py-4 hover:text-white hover:bg-gray-600 hover:shadow-cart w-[20%] break-keep"
							style="margin-left: 590px;" value="등록" />
					</div>
				</section>
			</div>
			<div class="Toastify"></div>
		</main>
		<!-- <input type="submit" value="Submit"/> -->
	</form>
	<!-- footer -->
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>