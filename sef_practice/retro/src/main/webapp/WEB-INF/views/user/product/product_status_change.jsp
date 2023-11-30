<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고나라 홈페이지</title>
<style>
/* 상품 목록 스타일 */
.product-list {
	display: flex;
	justify-content: space-between;
	margin: 10px;
}

/* 모달 스타일 */
.modal-bg {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 반투명 회색 배경 */
	z-index: 1000;
}

 .modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 5px;
	width: 450px;
	background-color: white; /* 흰색 배경 */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	z-index: 1001; /* 모달을 모달 배경 위에 표시 */
} 

</style>
</head>
<body>
	<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
	<!-- 상품 목록 -->
	<div class="product-list">
		<div>
			<p>상품 1</p>
			<button onclick="openModal('product1')">상태 변경</button>
		</div>
		<div>
			<p>상품 2</p>
			<button onclick="openModal('product2')">상태 변경</button>
		</div>
	</div>

	<!-- 모달 배경 -->
	<div id="modalBg" class="modal-bg">
		<!-- 모달 -->
		<div id="myModal" class="modal">
			<span class="close-btn" onclick="closeModal()">&times;</span>
			<!-- 여기에 상태 변경 폼이나 내용을 추가 -->
			<div
				class="flex flex-col justify-between bg-white p-5 min-h-[220px] min-[480px]:min-w-[400px]">
				<div tabindex="0"
					class="md:text-lg font-normal text-black text-center overflow-auto flex-auto flex justify-center flex-col outline-none mb-3 items-center">
					<div
						class="flex flex-col items-center justify-center px-5 pb-5 pt-7">
						<p class="text-base font-medium text-left text-jnGray-700 mb-1">상품을
							삭제하시겠습니까?</p>
						<p class="text-base font-medium text-left text-jnGray-700">삭제된
							상품은 복구되지 않습니다.</p>
					</div>
				</div>
				<div class="flex space-x-2 w-full shrink-0 text text-base h-[52px]">
					<button data-variant="flat"
						class="md:text-sm inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center placeholder-white focus-visible:outline-none focus:outline-none rounded-md px-5 md:px-6 lg:px-8 py-4 md:py-3.5 lg:py-4 hover:shadow-cart bg-white border-gray-400 border flex-grow text-[16px] text-black focus-visible:ring hover:bg-white hover:text-black">취소</button>
					<button data-variant="flat"
						class="md:text-sm inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center border-0 border-transparent placeholder-white focus-visible:outline-none focus:outline-none rounded-md text-white px-5 md:px-6 lg:px-8 py-4 md:py-3.5 lg:py-4 hover:text-white hover:shadow-cart bg-jnblack hover:bg-jnblack/90 active:bg-jnblack/90 flex-grow text-[16px] focus-visible:ring">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		function openModal(productId) {
			var modalBg = document.getElementById('modalBg');
			modalBg.style.display = 'block';
			// TODO: productId에 따라 상태 변경 폼이나 내용을 동적으로 추가할 수 있습니다.
		}

		function closeModal() {
			var modalBg = document.getElementById('modalBg');
			modalBg.style.display = 'none';
		}
	</script>

</body>
</html>