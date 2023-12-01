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
	width: 400px;
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
			<div class="containerStyle">
				<button>
					<div class="css-1glkcst">
						<div class="product-img-wrap css-4sj9kq">
							<img
								src="https://img2.joongna.com/media/original/2023/12/01/1701410762730zVl_5uXAB.png"
								alt="231201151819070t_홍대생이 그려주는 그림" width="1000" height="1000"
								referrerpolicy="no-referrer" class="css-sxxyvs">
						</div>
						<div class="product-info">
							<h2>홍대생이 그려주는 그림</h2>
							<p>zxxxdsdd</p>
						</div>
					</div>
				</button>
				<section class="css-1y8gct2">
					<div>
						<h3>
							중고나라#8626590님과의<br>거래는 어떠셨나요?
						</h3>
					</div>
					<div class="css-1vhc4hr">
						<div class="item-wrap ">
							<button type="button">
								<svg width="60" height="60" viewBox="0 0 60 60" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
									<g clip-path="url(#clip0_13404_51414)">
									<circle cx="30" cy="30" r="29.25" fill="white" stroke="#DADEE5"
										stroke-width="1.5"></circle>
									<g clip-path="url(#clip1_13404_51414)">
									<path
										d="M35.4392 24.7437V21.0637C35.4392 20.3317 35.1437 19.6297 34.6178 19.1121C34.0918 18.5945 33.3785 18.3037 32.6347 18.3037L28.8954 26.5837V36.7036H39.4403C39.8912 36.7086 40.3287 36.5531 40.6723 36.2657C41.0159 35.9783 41.2423 35.5784 41.3099 35.1396L42.6 26.8597C42.6407 26.5959 42.6226 26.3267 42.5471 26.0705C42.4715 25.8144 42.3402 25.5775 42.1624 25.3762C41.9845 25.1749 41.7644 25.0141 41.5171 24.9049C41.2698 24.7957 41.0014 24.7406 40.7304 24.7437H35.4392ZM28.8954 36.7036H26.0909C25.595 36.7036 25.1194 36.5097 24.7688 36.1647C24.4182 35.8196 24.2212 35.3516 24.2212 34.8636V28.4236C24.2212 27.9357 24.4182 27.4676 24.7688 27.1226C25.1194 26.7775 25.595 26.5837 26.0909 26.5837H28.8954"
										fill="white"></path>
									<path
										d="M28.8954 36.7036H26.0909C25.595 36.7036 25.1194 36.5097 24.7688 36.1647C24.4182 35.8196 24.2212 35.3516 24.2212 34.8636V28.4236C24.2212 27.9357 24.4182 27.4676 24.7688 27.1226C25.1194 26.7775 25.595 26.5837 26.0909 26.5837H28.8954M35.4392 24.7437V21.0637C35.4392 20.3317 35.1437 19.6297 34.6178 19.1121C34.0918 18.5945 33.3785 18.3037 32.6347 18.3037L28.8954 26.5837V36.7036H39.4403C39.8912 36.7086 40.3287 36.5531 40.6723 36.2657C41.0159 35.9783 41.2423 35.5784 41.31 35.1396L42.6 26.8597C42.6407 26.5959 42.6226 26.3267 42.5471 26.0705C42.4715 25.8144 42.3402 25.5775 42.1624 25.3762C41.9845 25.1749 41.7644 25.0141 41.5171 24.9049C41.2698 24.7957 41.0014 24.7406 40.7304 24.7437H35.4392Z"
										stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round"></path>
									<path
										d="M29.5173 28.3589V24.6789C29.5173 23.9469 29.2218 23.2449 28.6959 22.7273C28.17 22.2097 27.4566 21.9189 26.7128 21.9189L22.9735 30.1989V40.3188H33.5184C33.9693 40.3238 34.4069 40.1683 34.7504 39.8809C35.094 39.5935 35.3205 39.1936 35.3881 38.7548L36.6781 30.4749C36.7188 30.2112 36.7007 29.9419 36.6252 29.6858C36.5496 29.4296 36.4184 29.1927 36.2405 28.9914C36.0627 28.7901 35.8425 28.6293 35.5952 28.5201C35.3479 28.4109 35.0795 28.3559 34.8085 28.3589H29.5173ZM22.9735 40.3188H20.169C19.6731 40.3188 19.1976 40.125 18.8469 39.7799C18.4963 39.4348 18.2993 38.9668 18.2993 38.4788V32.0389C18.2993 31.5509 18.4963 31.0829 18.8469 30.7378C19.1976 30.3927 19.6731 30.1989 20.169 30.1989H22.9735"
										fill="white"></path>
									<path
										d="M22.9735 40.3188H20.169C19.6731 40.3188 19.1976 40.125 18.8469 39.7799C18.4963 39.4348 18.2993 38.9668 18.2993 38.4788V32.0389C18.2993 31.5509 18.4963 31.0829 18.8469 30.7378C19.1976 30.3927 19.6731 30.1989 20.169 30.1989H22.9735M29.5173 28.3589V24.6789C29.5173 23.9469 29.2218 23.2449 28.6959 22.7273C28.17 22.2097 27.4566 21.9189 26.7128 21.9189L22.9735 30.1989V40.3188H33.5184C33.9693 40.3238 34.4069 40.1683 34.7504 39.8809C35.094 39.5935 35.3205 39.1936 35.3881 38.7548L36.6781 30.4749C36.7188 30.2112 36.7007 29.9419 36.6252 29.6858C36.5496 29.4296 36.4184 29.1927 36.2405 28.9914C36.0627 28.7901 35.8425 28.6293 35.5952 28.5201C35.3479 28.4109 35.0795 28.3559 34.8085 28.3589H29.5173Z"
										stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round"></path></g></g>
									<defs>
									<clipPath id="clip0_13404_51414">
									<rect width="60" height="60" fill="white"></rect></clipPath>
									<clipPath id="clip1_13404_51414">
									<rect width="32" height="32" fill="white"
										transform="translate(14.0024 14)"></rect></clipPath></defs></svg>
							</button>
							<p class="css-k69puj">최고예요!</p>
						</div>
						<div class="item-wrap ">
							<button type="button">
								<svg width="60" height="60" viewBox="0 0 60 60" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
									<g clip-path="url(#clip0_13404_51422)">
									<circle cx="30" cy="30" r="29.25" fill="white" stroke="#DADEE5"
										stroke-width="1.5"></circle>
									<g clip-path="url(#clip1_13404_51422)">
									<path
										d="M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058ZM25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774"
										fill="white"></path>
									<path
										d="M25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058Z"
										stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round"></path></g></g>
									<defs>
									<clipPath id="clip0_13404_51422">
									<rect width="60" height="60" fill="white"></rect></clipPath>
									<clipPath id="clip1_13404_51422">
									<rect width="32" height="32" fill="white"
										transform="translate(14 14)"></rect></clipPath></defs></svg>
							</button>
							<p class="css-k69puj">좋아요</p>
						</div>
						<div class="item-wrap ">
							<button type="button">
								<svg width="60" height="60" viewBox="0 0 60 60" fill="none"
									xmlns="http://www.w3.org/2000/svg" class="css-nn7eu2">
									<g clip-path="url(#clip0_13404_51422)">
									<circle cx="30" cy="30" r="29.25" fill="white" stroke="#DADEE5"
										stroke-width="1.5"></circle>
									<g clip-path="url(#clip1_13404_51422)">
									<path
										d="M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058ZM25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774"
										fill="white"></path>
									<path
										d="M25.2774 38.3998H22.351C21.8336 38.3998 21.3373 38.1975 20.9714 37.8375C20.6056 37.4774 20.4 36.9891 20.4 36.4798V29.7599C20.4 29.2507 20.6056 28.7623 20.9714 28.4022C21.3373 28.0422 21.8336 27.8399 22.351 27.8399H25.2774M32.1058 25.9199V22.0799C32.1058 21.3161 31.7974 20.5836 31.2486 20.0435C30.6998 19.5034 29.9555 19.2 29.1793 19.2L25.2774 27.8399V38.3998H36.2808C36.7513 38.4051 37.2079 38.2428 37.5664 37.9429C37.9249 37.643 38.1612 37.2257 38.2318 36.7678L39.5779 28.1279C39.6204 27.8527 39.6015 27.5718 39.5227 27.3045C39.4438 27.0372 39.3068 26.7899 39.1213 26.5799C38.9357 26.3699 38.7059 26.2021 38.4479 26.0881C38.1899 25.9742 37.9098 25.9168 37.627 25.9199H32.1058Z"
										stroke="#C2C6CE" stroke-width="1.5" stroke-linecap="round"
										stroke-linejoin="round"></path></g></g>
									<defs>
									<clipPath id="clip0_13404_51422">
									<rect width="60" height="60" fill="white"></rect></clipPath>
									<clipPath id="clip1_13404_51422">
									<rect width="32" height="32" fill="white"
										transform="translate(14 14)"></rect></clipPath></defs></svg>
							</button>
							<p class="css-k69puj">아쉬워요</p>
						</div>
					</div>
				</section>
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