<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css">
<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		$("#cnlBye").click(function() {
			$("#cnlByeFrm").submit();
		});
	});
	
function bye() {
	$("#chkBye").show();
}

</script>
</head>
<body>
<!-- header -->
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp" />
	
<main class="relative flex-grow border-b-2" style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
	<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<!-- mypage sidebar -->
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
		<div class="w-full flex-grow">
		<!-- 마이페이지 header -->
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_info.jsp" />

<!-- 탈퇴 내용 동의 및 탈퇴 -->
<div class="content" data-v-ab6e088a="">
	<div class="withdrawal_wrap" data-v-ab6e088a="">
		<div data-v-ab6e088a="">
		<p style="font-size: 24px;font-weight: bold;margin-bottom: 15px;">회원 탈퇴</p>
			<h4 class="withdrawal_title" data-v-ab6e088a="">회원탈퇴에 앞서 아래 내용을 반드시 확인해 주세요.</h4>
			<div class="withdrawal_terms" data-v-ab6e088a="" style="width: 1040px;">
			<!-- 탈퇴 동의서 -->
				<span class="label_txt" data-v-4c714e9f="">
				RE:TRO를 탈퇴하면 회원 정보 및 서비스 이용 기록이 삭제됩니다.
				</span>
				<ul class="terms_list" data-v-ab6e088a="">
					<li class="terms_item" data-v-ab6e088a="">내 프로필, 거래내역(구매/판매), 관심상품, 보유상품, STYLE 게시물(게시물/댓글), 미사용 보유 포인트 등 사용자의 모든 정보가 사라지며 재가입 하더라도 복구가 불가능합니다.</li>
					<li class="terms_item" data-v-ab6e088a="">탈퇴 14일 이내 재가입할 수 없으며, 탈퇴 후 동일 이메일로 재가입할 수 없습니다</li>
				</ul>
				<span class="label_txt" data-v-4c714e9f="">
				관련 법령 및 내부 기준에 따라 별도 보관하는 경우에는 일부 정보가 보관될 수 있습니다.
				</span>
				<div class="terms_detail" data-v-ab6e088a="">
					<h6 class="terms_subtitle" data-v-ab6e088a="">1. 전자상거래 등 소비자 보호에 관한 법률</h6>
					<ul class="terms_list" data-v-ab6e088a="">
						<li class="terms_item" data-v-ab6e088a="">계약 또는 청약철회 등에 관한 기록: 5년 보관</li>
						<li class="terms_item" data-v-ab6e088a="">대금결제 및 재화 등의 공급에 관한 기록: 5년 보관</li>
						<li class="terms_item" data-v-ab6e088a="">소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관</li>
					</ul>
				</div>
				<div class="terms_detail" data-v-ab6e088a="">
					<h6 class="terms_subtitle" data-v-ab6e088a="">2. 통신비밀보호법</h6>
					<ul class="terms_list" data-v-ab6e088a="">
						<li class="terms_item" data-v-ab6e088a="">
						접속 로그 기록: 3개월 보관
						</li>
					</ul>
				</div>
				<div class="terms_detail" data-v-ab6e088a="">
					<h6 class="terms_subtitle" data-v-ab6e088a="">3. 내부 기준에 따라 별도 보관</h6>
					<ul class="terms_list" data-v-ab6e088a="">
						<li class="terms_item" data-v-ab6e088a="">
						부정이용 방지를 위해 이름, 이메일(로그인ID), 휴대전화번호, CI/DI: 3년 보관
						</li>
					</ul>
				</div>
			</div>
			<div class="withdrawal_check" data-v-ab6e088a="">
				<div class="checkbox_item" data-v-4c714e9f="" data-v-ab6e088a="">
					<input id="check1" type="checkbox" name="" disabled="disabled" class="blind" data-v-4c714e9f="">
					<label for="check1" class="check_label" data-v-4c714e9f="">
						<span class="label_txt" data-v-4c714e9f="" style="width: 1040px;">탈퇴하기 버튼을 누르시면 회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.</span>
					</label>
				</div>
			</div>
			<div class="withdrawal_btn_box" data-v-ab6e088a="" style=" width: 1040px;margin-bottom: 50px;">
				<a href="#" onclick="bye()" class="btn outlinegrey medium" data-v-0a6aebaa="" data-v-ab6e088a=""> 탈퇴하기 </a>
				<a href="#" onclick="javascript:alert('취소')" class="btn solid medium" data-v-0a6aebaa="" data-v-ab6e088a=""> 취소하기 </a>
			</div>
			
			<!-- 탈퇴 확인 후 나올 화면 -->
			<div id="chkBye" class="layer_withdrawal layer lg" style="display: none;" data-v-4be3d37a="" data-v-79f8507c="" data-v-ab6e088a="">
				<!---->
				<div class="layer_container" data-v-4be3d37a="">
					<a href="#" class="btn_layer_close" data-v-4be3d37a="" data-v-79f8507c="">
						<svg xmlns="http://www.w3.org/2000/svg" class="ico-close icon sprite-icons" data-v-4be3d37a="" data-v-79f8507c="">
						<use href="/_nuxt/e72fd9e874df2e60bd653f838dce3aab.svg#i-ico-close" xlink:href="/_nuxt/e72fd9e874df2e60bd653f838dce3aab.svg#i-ico-close" data-v-4be3d37a="" data-v-79f8507c=""></use>
						</svg>
					</a>
					<div class="layer_header" data-v-4be3d37a="">
						<h2 class="title" data-v-4be3d37a="" data-v-79f8507c="" style="width: 100%">정말 탈퇴하시겠습니까?</h2>
					</div>
					<div class="layer_content" data-v-4be3d37a="">
						<p class="withdrawal_desc" data-v-4be3d37a="" data-v-79f8507c="">
							탈퇴하기 클릭 시 바로 탈퇴 처리됩니다.
						</p>
						<!---->
						<div class="withdrawal_btn_box" data-v-4be3d37a="" data-v-79f8507c="">
							<div data-v-4c714e9f="" data-v-79f8507c="" class="checkbox_item" data-v-4be3d37a="">
								<input data-v-4c714e9f="" id="undefined" type="checkbox" name="" class="blind">
								<label data-v-4c714e9f="" for="undefined" class="check_label">
									<span data-v-4c714e9f="" class="label_txt">RE:TRO 회원을 탈퇴하겠습니다.</span>
								</label>
							</div>
							<form id="cnlByeFrm" method="post" action="user_mypage_frm.do?">
								<input id="cnlBye" type="button" class="btn solid medium" data-v-0a6aebaa="" data-v-79f8507c="" data-v-4be3d37a="" value="탈퇴 안 할래요">
							</form>
							<a href="reallyBye.do?id=asdasd" data-v-79f8507c="" data-v-4be3d37a="" class="link_withdrawal"> 탈퇴하기 </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 탈퇴 내용 동의 및 탈퇴 -->
</div>
</div>
</main>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
<!-- 탈퇴 CSS -->
<link href="https://kream.co.kr/_nuxt/css/d6e08b2.css" rel="stylesheet" type="text/css">
</body>
</html>