<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/7182ff8.css" />

<style type="text/css">
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
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch; margin-top:20px">
		<div class="text-jnblack max-w-[700px] w-full mx-auto">
			<div class="relative">
				<div class="flex">
					<!-- 이벤트 제목 -->
					<p class="text-center flex-[1_0_auto] py-4" style="font-size:20px;">
						${ event.title }
					</p>
				</div>
					<!-- 이벤트 기간 -->
					<p style="text-align: right; margin-bottom:13px; color:#ABABAB">
						${ event.start_date } ~ ${ event.end_date }
					</p>
				<div class="[&amp;>img]:w-full [&amp;>img]:h-auto bg-transparent w-full [&amp;>p]:mb-0" id="eventContent">
					<p style="font-size: 0;">
						<img src="http://localhost/retro_prj/upload/${ event.img }" alt="" width="850">
					</p>
					<p style="margin: 10px 0px 5px 0px; font-size:18px; text-align: center">
						${ event.context }
					</p>
				</div>
			</div>
			<div data-v-7a3bdf55="" class="detail_btn_box" style="text-align: center; margin: 50px 0px 50px 0px">
				<a data-v-0a6aebaa="" data-v-7a3bdf55="" href="http://localhost/retro_prj/event.do" style="margin-bottom:100px" 
				class="btn btn_view_list outlinegrey medium"> 
				목록
				</a>
			</div>
		</div>
		<div class="Toastify"></div>
	</main>
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>