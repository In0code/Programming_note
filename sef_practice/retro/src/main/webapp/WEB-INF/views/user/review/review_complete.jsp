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

.css-1j88tzl .container {
    flex: 1 1 0%;
    width: 100%;
    background: rgb(255, 255, 255);
    padding-top: 0px;
    height: 100%;
    overflow-y: scroll;
}

.css-1m87zeo .orderInfoWrap {
    display: flex;
    flex-direction: column;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    text-align: center;
    margin-bottom: 24px;
}

svg:not(:root) {
    overflow: hidden;
}

.css-wsqqvh {
    height: auto;
    transform: rotate(0deg);
}

.btn_view_list[data-v-7a3bdf55] {
    min-width: 120px;
}

.outlinegrey[data-v-0a6aebaa] {
    border: 1px solid #d3d3d3;
    color: rgba(34,34,34,.8);
}

.medium[data-v-0a6aebaa] {
    border-radius: 12px;
    font-size: 14px;
    height: 42px;
    letter-spacing: -.14px;
    padding: 0 18px;
}

.btn[data-v-0a6aebaa] {
    align-items: center;
    background-color: #fff;
    color: rgba(34,34,34,.8);
    cursor: pointer;
    display: inline-flex;
    justify-content: center;
    text-align: center;
    vertical-align: middle;
}

</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>

	<c:import url="http://localhost/retro_prj/common/cdn/header.jsp" />
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">

			<div id="container" class="container css-0">
				<article class="css-1m87zeo">
					<div class="orderInfoWrap" style="margin: 150px 0px 150px 0px">
						<svg width="92" height="92" viewBox="0 0 92 92" fill="none" style="margin-bottom: 20px"
							xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
							<g clip-path="url(#clip0_833_154178)">
							<path
								d="M72.3235 59.3009V88.399H19.5V59.3009C19.5 58.4948 19.9318 57.7182 20.6845 57.2342L20.7044 57.2214L20.7231 57.2067L43.7365 39.1169C44.7893 38.4564 46.1824 38.4571 47.2344 39.1192L71.1074 57.2121L71.1228 57.2238L71.139 57.2342C71.8921 57.7184 72.3235 58.4906 72.3235 59.3009Z"
								fill="#141313" stroke="#141313"></path>
							<path
								d="M26.7656 42.8535C26.7656 39.954 29.1161 37.6035 32.0156 37.6035H59.7909C62.6904 37.6035 65.0409 39.954 65.0409 42.8535V69.7825C65.0409 72.682 62.6904 75.0325 59.7909 75.0325H32.0156C29.1161 75.0325 26.7656 72.682 26.7656 69.7825V42.8535Z"
								fill="white" stroke="black" stroke-width="1.5"></path>
							<path
								d="M32.0875 56.3185C32.0875 55.4666 32.7781 54.776 33.6301 54.776H56.4797C57.3316 54.776 58.0222 55.4666 58.0222 56.3185C58.0222 57.1705 57.3316 57.8611 56.4797 57.8611H33.6301C32.7781 57.8611 32.0875 57.1705 32.0875 56.3185Z"
								fill="#0DCC5A" stroke="white" stroke-width="0.3"></path>
							<path
								d="M32.0875 47.8556C32.0875 47.0037 32.7781 46.3131 33.6301 46.3131H48.8631C49.7151 46.3131 50.4057 47.0037 50.4057 47.8556C50.4057 48.7076 49.7151 49.3982 48.8631 49.3982H33.6301C32.7781 49.3982 32.0875 48.7076 32.0875 47.8556Z"
								fill="#0DCC5A" stroke="white" stroke-width="0.3"></path>
							<path
								d="M41.9639 72.4275C42.7855 72.8913 42.8167 74.0634 42.021 74.5703L19.7496 88.7581L19.7496 59.8872L41.9639 72.4275Z"
								fill="#0DCC5A" stroke="black" stroke-width="1.5"></path>
							<path
								d="M49.8597 72.4212C49.0365 72.8859 49.0072 74.061 49.8062 74.5663L72.0629 88.6394L72.0629 59.8872L49.8597 72.4212Z"
								fill="#0DCC5A" stroke="black" stroke-width="1.5"></path>
							<path
								d="M42.875 72.1377C44.6867 70.8252 47.1369 70.8252 48.9486 72.1377L71.9267 88.7849C72.2014 88.9839 72.061 89.4185 71.721 89.4185H20.1025C19.7625 89.4185 19.6222 88.9839 19.8968 88.7849L42.875 72.1377Z"
								fill="#0DCC5A" stroke="black" stroke-width="1.5"></path>
							<path
								d="M79.0074 18L76 21.75L80.5112 24L83.5186 20.25L79.0074 18Z"
								fill="#C5FA2F"></path>
							<path
								d="M18.5044 9.15367L13.6277 7.5L13 12.8463L17.8767 14.5L18.5044 9.15367Z"
								fill="#C5FA2F"></path>
							<path
								d="M67.7543 14C68.7232 14 69.5087 13.2165 69.5087 12.25C69.5087 11.2835 68.7232 10.5 67.7543 10.5C66.7854 10.5 66 11.2835 66 12.25C66 13.2165 66.7854 14 67.7543 14Z"
								fill="#C5FA2F"></path>
							<path
								d="M57 28.5C58.1046 28.5 59 27.6046 59 26.5C59 25.3954 58.1046 24.5 57 24.5C55.8954 24.5 55 25.3954 55 26.5C55 27.6046 55.8954 28.5 57 28.5Z"
								fill="#C5FA2F"></path>
							<path
								d="M5.25 44.5C6.49264 44.5 7.5 43.4926 7.5 42.25C7.5 41.0074 6.49264 40 5.25 40C4.00736 40 3 41.0074 3 42.25C3 43.4926 4.00736 44.5 5.25 44.5Z"
								fill="#C5FA2F"></path>
							<path
								d="M85.5037 36.5C86.3342 36.5 87.0074 35.8284 87.0074 35C87.0074 34.1716 86.3342 33.5 85.5037 33.5C84.6732 33.5 84 34.1716 84 35C84 35.8284 84.6732 36.5 85.5037 36.5Z"
								fill="#C5FA2F"></path>
							<path
								d="M27.5037 24.5C28.3342 24.5 29.0074 23.8284 29.0074 23C29.0074 22.1716 28.3342 21.5 27.5037 21.5C26.6732 21.5 26 22.1716 26 23C26 23.8284 26.6732 24.5 27.5037 24.5Z"
								fill="#C5FA2F"></path></g>
							<defs>
							<clipPath id="clip0_833_154178">
							<rect width="92" height="92" fill="white"></rect></clipPath></defs>
						</svg>
						<c:choose>
							<c:when test="${ addFlag }">
								<p>후기 작성이 완료되었습니다.</p>
								<div data-v-7a3bdf55="" class="detail_btn_box" style="margin: 30px 0px 50px 0px">
								<a data-v-0a6aebaa="" data-v-7a3bdf55="" href="http://localhost/retro_prj/my/purchase.do"
									class="btn btn_view_list outlinegrey medium">목록</a>
								</div>
							</c:when>
							<c:otherwise>
								<script type="text/javascript">
									alert("잠시 후 다시 시도해주세요.");
									history.back();
								</script>
							</c:otherwise>
						</c:choose>
					</div>
				</article>
			</div>
		</div>
	</main>
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>