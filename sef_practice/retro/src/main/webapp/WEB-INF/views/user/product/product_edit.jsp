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
</style>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		/* ---------------패션 의류--------------------- */
		/* 패션의류 클릭하면 동작 */
		$("#C")
				.click(
						function() {
							$(this).css({
								'background-color' : '#E5E4E4'
							});
							$("#G, #T, #P, #B, #C-1, #C1,#C2").css({
								'background-color' : '#FFFFFF'
							});

							$("#category-depth-1").show();

							$(
									"#category-depth-2, #category-depth-3, #category-depth-4, #category-depth-5,#category-depth-1-1,#category-depth-1-2, #category-depth-2-3,#category-depth-2-2,#category-depth-2-1,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2")
									.hide();
						});//click

		/* 여성의류 클릭하면 동작 */
		$("#C1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C2, #C102,#C103,#C101").css({
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 바지, 치마가 클릭되면 동작 */
		$("#C102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C101, #C103").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 트레이닝복이 클릭되면 동작 */
		$("#C103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C102, #C101").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 티셔츠 , 캐쥬얼의류가 클릭되면 동작 */
		$("#C201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C202, #C203").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 바지, 치마가 클릭되면 동작 */
		$("#C202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C201, #C203").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 트레이닝복이 클릭되면 동작 */
		$("#C203").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C202, #C201").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* ---------------패션 잡화--------------------- */

		/* 패션잡화 클릭하면 동작 */
		$("#G")
				.click(
						function() {
							$(this).css({
								'background-color' : '#E5E4E4'
							});
							$("#C, #T, #P, #B, #C-1,#G1,#G2,#G3").css({
								'background-color' : '#FFFFFF'
							});
							$("#category-depth-2").show();
							$(
									"#category-depth-1, #category-depth-3, #category-depth-4, #category-depth-5,#category-depth-1-1,#category-depth-1-2,#category-depth-2-1,#category-depth-2-2,#category-depth-2-3,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2")
									.hide();
						});//click

		/* 여성화 클릭하면 동작 */
		$("#G1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #P, #B, #C-1,#G2,#G3,#G101,#G102,#G103").css({
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 여성화 > 워커 / 부츠가 클릭되면 동작 */
		$("#G102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G101, #G103").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 여성화 > 샌들 / 슬리퍼 클릭되면 동작 */
		$("#G103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G102, #G101").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 남성화 > 단화/ 로퍼 클릭되면 동작 */
		$("#G201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G202, #G203").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 남성화 > 워커 / 부츠가 클릭되면 동작 */
		$("#G202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G201, #G203").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 남성화 > 샌들 / 슬리퍼 클릭되면 동작 */
		$("#G203").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G202, #G201").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 가방 > 숄더백 클릭되면 동작 */
		$("#G301").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G302, #G303").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 가방 > 크로스백가 클릭되면 동작 */
		$("#G302").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G301, #G303").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 가방 > 백팩 클릭되면 동작 */
		$("#G303").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#G302, #G301").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* ---------------모바일, 테블릿--------------------- */

		/* 모바일, 테블릿 클릭하면 동작 */
		$("#T")
				.click(
						function() {
							$(this).css({
								'background-color' : '#E5E4E4'
							});
							$("#G, #C, #P, #B, #C-1,#T1,#T2").css({
								'background-color' : '#FFFFFF'
							});
							$("#category-depth-3").show();
							$(
									"#category-depth-2, #category-depth-1, #category-depth-4, #category-depth-5,#category-depth-1-1,#category-depth-1-2,#category-depth-2-1,#category-depth-2-2,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2, #category-depth-2-3")
									.hide();
						});//click

		/* 스마트폰 클릭하면 동작 */
		$("#T1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #P, #B, #C-1,#T2,#T101,#T102,#T103,#T104").css({
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 스마트폰 > LG 클릭되면 동작 */
		$("#T102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#T101,#T103,#T104").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 스마트폰 > 애플 클릭되면 동작 */
		$("#T103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#T102 ,#T101,#T104").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 스마트폰 > 기타 클릭되면 동작 */
		$("#T104").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#T102 ,#T103,#T101").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 테블릿PC > 삼성 클릭되면 동작 */
		$("#T201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#T202,#T203").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 테블릿PC > 애플 클릭되면 동작 */
		$("#T202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#T203 ,#T201").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 테블릿PC > 기타 클릭되면 동작 */
		$("#T203").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#T202 ,#T201").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* ---------------노트북, PC--------------------- */

		/* 노트북, PC 클릭하면 동작 */
		$("#P")
				.click(
						function() {
							$(this).css({
								'background-color' : '#E5E4E4'
							});
							$("#G, #T, #C, #B, #C-1,#P1,#P2,#P3").css({
								'background-color' : '#FFFFFF'
							});
							$("#category-depth-4").show();
							$(
									"#category-depth-2, #category-depth-3, #category-depth-1, #category-depth-5,#category-depth-1-1,#category-depth-1-2,#category-depth-3-1,#category-depth-3-2,#category-depth-2-1,#category-depth-2-2,#category-depth-2-3,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2")
									.hide();
						});//click

		/* 노트북 클릭하면 동작 */
		$("#P1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #G, #B,#P2,#P3,#P101,#P102,#P103").css({
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
			});
			$("#category-depth-4-1").hide();
		});//click

		/* 데스크탑 클릭하면 동작 */
		$("#P3").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #G, #T, #B,#P1,#P2").css({
				'background-color' : '#FFFFFF'
			});
			$("#category-depth-4-1").hide();
		});//click

		/* 노트북 > 삼성 클릭되면 동작 */
		$("#P101").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#P102,#P103").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 노트북 > LG 클릭되면 동작 */
		$("#P102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#P103 ,#P101").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 노트북 > 애플 클릭되면 동작 */
		$("#P103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#P102 ,#P101").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* ---------------도서 , 문구--------------------- */

		/* 도서/ 문구 클릭하면 동작 */
		$("#B")
				.click(
						function() {
							$(this).css({
								'background-color' : '#E5E4E4'
							});
							$("#G, #T, #P, #C, #C-1,#B1,#B2,#B3").css({
								'background-color' : '#FFFFFF'
							});
							$("#category-depth-5").show();
							$(
									"#category-depth-2, #category-depth-3, #category-depth-4, #category-depth-1,#category-depth-1-1,#category-depth-1-2,#category-depth-2-1,#category-depth-2-2,#category-depth-2-3,#category-depth-3-1,#category-depth-3-2,#category-depth-4-1,#category-depth-5-1,#category-depth-5-2")
									.hide();
						});//click

		/* 학습 / 교육 클릭하면 동작 */
		$("#B1").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#C, #T, #G, #P,#B2,#B3,#B101,#B102,#B103").css({
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
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
				'background-color' : '#FFFFFF'
			});
			$("#category-depth-5-1,#category-depth-5-2").hide();
		});//click

		/* 학습/ 교육 > 학습/참고서 클릭되면 동작 */
		$("#B101").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#B102,#B103").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 학습/ 교육 > 수험서/자격증 클릭되면 동작 */
		$("#B102").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#B103 ,#B101").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 학습/ 교육 > 컴퓨터/인터넷 클릭되면 동작 */
		$("#B103").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#B102 ,#B101").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 소설/만화책 > 소설책 클릭되면 동작 */
		$("#B201").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#B202").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* 소설/만화책 > 만화책 클릭되면 동작 */
		$("#B202").click(function() {
			$(this).css({
				'background-color' : '#E5E4E4'
			});
			$("#B201").css({
				'background-color' : '#FFFFFF'
			});
		});//click

		/* --------희망지역 버튼------------- */
		var flag = true;
		/* '주소검색' 버튼 누르면 동작 */
		$("#addrSearchBtn")
				.click(
						function() {
							$(this)
									.attr(
											'class',
											"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
							$("#noAddrBtn")
									.attr(
											'class',
											"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
							$("#locInputBox").css('display', 'block');
							flag = true;

						});//clcick

		/* '지역 설정 안 함'버튼누르면 동작*/
		$("#noAddrBtn")
				.click(
						function() {
							$(this)
									.attr(
											'class',
											"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 text-white bg-jngreen border-jngreen");
							$("#addrSearchBtn")
									.attr(
											'class',
											"h-10 w-[80px] rounded-md border border-solid font-semibold text-base mb-2 border-jnblack text-jnblack bg-white");
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
	});

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
		<input type="hidden" name="c3code" id="c3code" />  <input
			type="hidden" name="loc" id="changeLoc" />
		<main class="relative flex-grow border-b-2"
			style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
			<div
				class="mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
				<section class="mx-auto w-full max-w-[768px]">
					<div class="flex px-5 pb-1.5">

						<input type="file" name="img" class="inputBox" multiple="multiple"
							id="file-input" style="width: 300px; display: none" /><br />
						  <button class="flex items-center justify-center w-20 h-20 mr-1.5 bg-jnGray-200 rounded" onclick="document.getElementById('file-input').click()">
					        <div class="flex flex-col">
					            <svg width="32px" height="32px" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
					                <path fill-rule="evenodd" clip-rule="evenodd" d="M15.728 20.4461C13.6481 20.4461 11.9619 18.7599 11.9619 16.68C11.9619 14.6001 13.6481 12.9138 15.728 12.9138C17.8079 12.9138 19.4942 14.6001 19.4942 16.68C19.4942 18.7599 17.8079 20.4461 15.728 20.4461Z" fill="#C2C6CE"></path>
					                <path fill-rule="evenodd" clip-rule="evenodd" d="M10.4564 7.32295C10.9376 6.00587 11.5097 5.15997 12.8118 5.15997H17.9241C19.2253 5.15997 19.7975 6.00463 20.2785 7.32003H20.7897C24.7543 7.32003 27.968 10.4192 27.968 14.2417V19.119C27.968 22.9409 24.7543 26.04 20.7897 26.04H10.6669C6.7023 26.04 3.48798 22.9409 3.48798 19.119V14.2417C3.48798 10.487 6.58918 7.4303 10.4564 7.32295ZM21.3772 16.68C21.3772 19.8001 18.8481 22.3292 15.728 22.3292C12.6079 22.3292 10.0788 19.8001 10.0788 16.68C10.0788 13.5599 12.6079 11.0308 15.728 11.0308C18.8481 11.0308 21.3772 13.5599 21.3772 16.68ZM21.5988 11.88C21.5988 12.4 22.0204 12.8216 22.5403 12.8216C23.0603 12.8216 23.4819 12.4 23.4819 11.88C23.4819 11.36 23.0603 10.9385 22.5403 10.9385C22.0204 10.9385 21.5988 11.36 21.5988 11.88Z" fill="#C2C6CE"></path>
					            </svg>
					            <p class="mt-1 text-xs text-jnGray-500">0/5</p>
					        </div>
					    </button> 

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
					<br />
					<div class="flex flex-col px-5 space-y-5">
						<!-- 상품명 입력 inpuBox -->
						<div class="block">
							<input id="productTitle" name="pname" type="text"
								value="${ userProduct.pname }"
								class="py-2 px-4 md:px-5 w-full appearance-none border text-input text-xs lg:text-sm font-body placeholder-body min-h-12 transition duration-200 ease-in-out bg-white border-gray-300 focus:border-heading h-11 md:h-12 focus:outline-none rounded-md"
								autocomplete="off" spellcheck="false" aria-invalid="false">
							<p id="pnameErr"
								style="display: none; color: red; font-size: 15px;">상품명을
								입력해주세요.</p>
						</div>

						<div
							class="flex flex-row w-full overflow-hidden text-sm font-medium h-60">
							<div id="category-depth-0"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="C">
										<p>패션의류</p>
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
										<p>여성의류</p>
									</li>
									<li class="false h-10 p-3" id="C2">
										<p>남성의류</p>
									</li>
								</ul>

							</div>
							<!-- 패션잡화 > 여성화 ,남성화, 가방   -->
							<div id="category-depth-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G1">
										<p>여성화</p>
									</li>
									<li class="false h-10 p-3" id="G2">
										<p>남성화</p>
									</li>
									<li class="false h-10 p-3" id="G3">
										<p>가방</p>
									</li>

								</ul>
							</div>
							<!-- 모바일/태블릿 > 스마트폰 ,테블릿   -->
							<div id="category-depth-3"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="T1">
										<p>스마트폰</p>
									</li>
									<li class="false h-10 p-3" id="T2">
										<p>테블릿PC</p>
									</li>
								</ul>
							</div>
							<!-- 노트북/PC > 노트북, 모니터, 데스크탑  -->
							<div id="category-depth-4"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="P1">
										<p>노트북</p>
									</li>
									<li class="false h-10 p-3" id="P2">
										<p>모니터</p>
									</li>
									<li class="false h-10 p-3" id="P3">
										<p>데스크탑</p>
									</li>
								</ul>
							</div>
							<!-- 도서/문구 > 학습/교육, 소설/만화책, 문구/사무용품-->
							<div id="category-depth-5"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="B1">
										<p>학습 / 교육</p>
									</li>
									<li class="false h-10 p-3" id="B2">
										<p>소설 / 만화책</p>
									</li>
									<li class="false h-10 p-3" id="B3">
										<p>문구 / 사무용품</p>
									</li>
								</ul>
							</div>
							<!-- 패션의류 > 여성의류 > 티셔츠/캐쥬얼의류, 바지/치마, 트레이닝복 -->
							<div id="category-depth-1-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="C101">
										<p>티셔츠/캐쥬얼의류</p>
									</li>
									<li class="false h-10 p-3" id="C102">
										<p>바지/치마</p>
									</li>
									<li class="false h-10 p-3" id="C103">
										<p>트레이닝복</p>
									</li>
								</ul>
							</div>
							<!-- 패션의류 > 남성의류 > 티셔츠/캐쥬얼의류, 바지, 트레이닝복 -->
							<div id="category-depth-1-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="C201">
										<p>티셔츠/캐쥬얼의류</p>
									</li>
									<li class="false h-10 p-3" id="C202">
										<p>바지</p>
									</li>
									<li class="false h-10 p-3" id="C203">
										<p>트레이닝복</p>
									</li>
								</ul>
							</div>
							<!-- 패션잡화 > 여성화 >  단화/로퍼, 워커/부츠, 샌들/슬리퍼 -->
							<div id="category-depth-2-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G101">
										<p>단화/로퍼</p>
									</li>
									<li class="false h-10 p-3" id="G102">
										<p>워커/부츠</p>
									</li>
									<li class="false h-10 p-3" id="G103">
										<p>샌들/슬리퍼</p>
									</li>
								</ul>
							</div>
							<!-- 패션잡화 > 남성화 >  단화/로퍼, 워커/부츠, 샌들/슬리퍼 -->
							<div id="category-depth-2-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G201">
										<p>단화/로퍼</p>
									</li>
									<li class="false h-10 p-3" id="G202">
										<p>워커/부츠</p>
									</li>
									<li class="false h-10 p-3" id="G203">
										<p>샌들/슬리퍼</p>
									</li>
								</ul>
							</div>
							<!-- 패션잡화 > 가방 >  숄더백, 크로스백, 백팩 -->
							<div id="category-depth-2-3"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="G301">
										<p>숄더백</p>
									</li>
									<li class="false h-10 p-3" id="G302">
										<p>크로스백</p>
									</li>
									<li class="false h-10 p-3" id="G303">
										<p>백팩</p>
									</li>
								</ul>
							</div>
							<!-- 모바일/ 태블릿 > 스마트폰 >  삼성/LG/애플/기타 -->
							<div id="category-depth-3-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="T101">
										<p>삼성</p>
									</li>
									<li class="false h-10 p-3" id="T102">
										<p>LG</p>
									</li>
									<li class="false h-10 p-3" id="T103">
										<p>애플</p>
									</li>
									<li class="false h-10 p-3" id="T104">
										<p>기타</p>
									</li>
								</ul>
							</div>
							<!-- 모바일/ 태블릿 > 태블릿PC  > 삼성/애플/기타 -->
							<div id="category-depth-3-2"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="T201">
										<p>삼성</p>
									</li>
									<li class="false h-10 p-3" id="T202">
										<p>애플</p>
									</li>
									<li class="false h-10 p-3" id="T203">
										<p>기타</p>
									</li>
								</ul>
							</div>
							<!-- 노트북/PC > 노트북  >  삼성/LG/애플 -->
							<div id="category-depth-4-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="P101">
										<p>삼성</p>
									</li>
									<li class="false h-10 p-3" id="P102">
										<p>LG</p>
									</li>
									<li class="false h-10 p-3" id="P103">
										<p>애플</p>
									</li>
								</ul>
							</div>
							<!-- 도서/문구 > 학습/교육 >  학습/참고서, 수험서/자격증, 컴퓨터/인터넷 -->
							<div id="category-depth-5-1"
								class="w-1/3 h-full overflow-y-auto border border-solid rounded border-jnGray-300">
								<ul class="flex flex-col border-solid border-jnGray-300">
									<li class="false h-10 p-3" id="B101">
										<p>학습/참고서</p>
									</li>
									<li class="false h-10 p-3" id="B102">
										<p>수험서/자격증</p>
									</li>
									<li class="false h-10 p-3" id="B103">
										<p>컴퓨터/인터넷</p>
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
								style="width: 100%; height: 300px; border: 1px solid #E5E4E4; border-radius: 5px; resize: none; padding: 15px; margin-top: 15px; border-color: #929492">
								${ userProduct.context }</textarea>
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
								value="주소 입력" /> <input type="button" id="noAddrBtn"
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