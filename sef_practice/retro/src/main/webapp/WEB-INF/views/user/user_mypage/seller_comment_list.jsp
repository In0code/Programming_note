<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="http://192.168.10.143/mvc_prj/common/main/favicon.png">
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/8ef8137d4e8264e4.css">
<link rel="stylesheet" href="https://web.joongna.com/_next/static/bJ7oyaYqN2wpRZw9j4F5K/_buildManifest.js">
<link rel="stylesheet" href="https://web.joongna.com/_next/static/css/30a5f2053f9e9eb9.css" data-n-g="">
<style type="text/css">
#div_f > ul > li{
	margin-bottom: 12px;
}
</style>
<script type="text/javascript">
	$(function() {
		
	});

function moveTo(bcCode) {
	location.href = ""+bcCode;
}
</script>
</head>
<body>
<!-- header -->
<c:import url="/common/cdn/header.jsp" />
	
<main class="relative flex-grow border-b-2" style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
	<div class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<!-- mypage sidebar -->
		<c:import url="http://localhost/retro_prj/common/cdn/mypage_sidebar.jsp" />
		<div class="w-full flex-grow">
		
<!-- 마이페이지 header -->
<c:import url="/common/cdn/mypage_info.jsp" />

<!--  -->
<div>
<div style="font-size: 20px;color: #000;margin-bottom: 25px;">
	<strong>이런점이 좋았어요</strong>
</div>
<div id="div_f" style="width: 50%">
	<ul>
		<li>
			<div style="float: left;">친절/매너가 좋아요.</div>
			<div style="float: right;">
				<div style="min-width: 36px;max-width: 56px; display: flex;">
					<svg width="16" height="18" viewBox="0 -2 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
						<path d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z" stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
					<p style="color: rgb(120, 126, 137);margin-left: 2px;"><c:out value="${reiviewCnt.one }"/></p>
				</div>
			</div>
			<br/>
		</li>
		<li>
			<div style="float: left;">응답이 빨라요.</div>
			<div style="float: right;">
				<div style="min-width: 36px;max-width: 56px; display: flex;">
					<svg width="16" height="18" viewBox="0 -2 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
						<path d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z" stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
					<p style="color: rgb(120, 126, 137);margin-left: 2px;"><c:out value="${reiviewCnt.two }"/></p>
				</div>
			</div>
			<br/>
		</li>
		<li>
			<div style="float: left;">상품 상태가 좋아요.</div>
			<div style="float: right;">
				<div style="min-width: 36px;max-width: 56px; display: flex;">
					<svg width="16" height="18" viewBox="0 -2 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
						<path d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z" stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
					<p style="color: rgb(120, 126, 137);margin-left: 2px;"><c:out value="${reiviewCnt.three }"/></p>
				</div>
			</div>
			<br/>
		</li>
		<li>
			<div style="float: left;">거래 시간을 잘 지켜요.</div>
			<div style="float: right;">
				<div style="min-width: 36px;max-width: 56px; display: flex;">
					<svg width="16" height="18" viewBox="0 -2 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-wsqqvh">
						<path d="M2.53333 14C2.53333 11.4227 5.42266 9.33333 7.99999 9.33333C10.5773 9.33333 13.4667 11.4227 13.4667 14M10.6667 4.66667C10.6667 6.13943 9.47275 7.33333 7.99999 7.33333C6.52723 7.33333 5.33333 6.13943 5.33333 4.66667C5.33333 3.19391 6.52723 2 7.99999 2C9.47275 2 10.6667 3.19391 10.6667 4.66667Z" stroke="#9CA3AF" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path>
					</svg>
					<p style="color: rgb(120, 126, 137);margin-left: 2px;"><c:out value="${reiviewCnt.four }"/></p>
				</div>
			</div>
		</li>
	</ul>
</div>
<div>
<br><hr style="border: 2px solid;width: 100%;margin-top: 10px;margin-bottom: 10px">
<div style="font-size: 20px;color: #000;margin-bottom: 25px;">
	<strong>상세한 후기도 있어요</strong><span style="color: #0DCC5A;padding-left: 7px;"><c:out value="${reiviewCnt.total }"/></span>
</div>
<div id="div_s" style="width: 100%">
	<table style="border: none;border-collapse: separate;border-spacing: 0px 12px;">
		<c:choose>
			<c:when test="${not empty reiviews }">
			<c:forEach var="reiview" items="${reiviews }" varStatus="i">
				<tr style="border: none;cursor: pointer;" onclick="moveTo(${reiview.buycommentcode})">
					<td style="border: none;text-align: left;width: 50px;">
						<img src="https://img2.joongna.com/common/Profile/Default/profile_f.png" alt="id" width="42" height="42" referrerpolicy="no-referrer" class="css-sxxyvs" style="border-radius: 24px;">
					</td>
					<td style="border: none;text-align: left;max-width: 30px;padding-left: 20px;padding-right: 20px;padding-top: 15px;font-size: 14px;">
						<c:out value="${reiview.id }"/>
					</td>
					<td style="border: none;padding: 15px 12px;background-color: rgb(241, 244, 246);border-radius: 8px;font-size: 14px;
						line-height: 20px;color: rgb(20, 19, 19);text-align: left;word-break: break-all;min-width: 200px;max-width: 200px;">
						<c:out value="${reiview.context }"/>
					</td>
					<td style="border: none;text-align: left;padding-left: 20px;max-width: 40px;padding-top: 15px;font-size: 14px;">
						<c:out value="${reiview.input_date }"/>
					</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">작성된 후기가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<div style="margin-bottom: 150px;">
<!-- pagination start -->
<div class="pagenationDiv">
 <div class="pagination">
 	<c:if test="${pageEnd != 1 }">
		<c:choose>
			<c:when test="${empty param.page }">
				<c:forEach var="pn" begin="1" end="${pageEnd }" step="1">
					<a href="admin_inquiry_frm.do?page=${pn }">
						<c:if test="${pn == 1 }">
							<span class="active">1</span>
						</c:if>
						<c:if test="${pn != 1 }">
							${pn }
						</c:if>
					</a>
				</c:forEach>
			</c:when>
			<c:when test="${pageEnd != 1 }">
				<c:forEach var="pn" begin="${pageStart }" end="${pageEnd }" step="1">
					<a href="admin_inquiry_frm.do?page=${pn }">
						<c:choose>
							<c:when test="${param.page == pn }">
								<span class="active">${pn }</span>
							</c:when>
							<c:otherwise>
								${pn }
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</c:when>
		</c:choose>
	</c:if>
</div>
</div>
<!-- pagination end -->
</div>
</div>
<!--  -->

</div>
</div>
</main>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>