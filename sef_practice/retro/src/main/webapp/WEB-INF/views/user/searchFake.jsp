<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp"/>

<style type="text/css">
</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
<c:import url="http://localhost/retro_prj/common/cdn/header.jsp"/>
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div
			class="max-w-[1280px] mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<div class="flex justify-center text-jnblack border-b-2 border-solid">
				<div class="py-10 w-full" style="padding-top: 0px;">
					<div class="flex items-center justify-between mt-2 text-jnBlack text-xl pb-5">
						<h3 class="text-lg md:text-xl lg:text-2xl 2xl:text-3xl xl:leading-10 font-bold text-heading">
							RE:TRO 통합 사기 조회</h3>
					</div>
					<div class="pt-6 border-y-jnblack border-solid border-t text-[12px] leading-5">
						<div class="text-[20px] font-bold">
							<p class="pt-[10px]">
								<% 	
								String keyword = request.getParameter("fraudKeyword").toLowerCase();
								String field = request.getParameter("fraudField");
								String tempKey = "";
								int index = 2;
								if( keyword!= null && !"".equals(keyword)){
									if(keyword.length() > 7 && !"email".equals(field)){
										index = keyword.length()-5;
									}
									tempKey = keyword.substring(0,index);
									for(int i = index; i < keyword.length() ; i++){
										tempKey = tempKey.concat("*");
									}
								}
								%>
								<%= tempKey %>
							</p>
							<p class="pt-[10px]">피해 사례 조회</p>
						</div>
						<div class="font-medium text-right pb-[5px] text-[13px]">
							<p>검색 기간 : 최근 3개월</p>
						</div>
						
						<!-- 조회 결과 -->
						<dl class="flex flex-wrap border-t-[1px] border-[#e0e0e0] border-solid">
							<dt class="flex flex-[1_0_26%] py-7 pr-3 pl-1 text-[14px] font-bold border-b-[1px] border-[#e0e0e0] border-solid whitespace-pre-line">RE:TRO</dt>
							<dd class="flex flex-wrap flex-[1_0_74%] items-center justify-between py-7 pr-3 pl-1 border-b-[1px] border-[#e0e0e0] border-solid">
								<p class="text-[14px] text-jngreen">
									<c:choose>
										<c:when test="${ fakeCnt eq 0 }">
											신고 건수 없음
										</c:when>
										<c:otherwise>
											${ fakeCnt } 건
										</c:otherwise>
									</c:choose>
								</p>
								<p class="text-[13px] basis-full">
									(신고 내역이 없는 경우에도
									<!-- -->
									<span class="text-jnErrRed">안전한 거래라는 것을 보장할 수 없습니다.</span> <span
										class="text-[#0057b7] underline">안전거래를</span>
									<!-- -->
									이용해주세요. )
								</p>
							</dd>
						</dl>
						<div class="pt-10 flex-col flex gap-5">
							<a href="fraud.do" style="text-align:center; margin-bottom: 10px" class="w-full py-3 border-jnblack border-[1px] border-solid rounded-md font-bold text-[16px]">
							다시 조회하기
							</a>
						</div>
					</div>
					<a class="pt-4 text-[13px] font-semibold" href="https://ecrm.police.go.kr/sci/pcc_V3_send" target="_blank">
						경찰청 사이버 수사국 바로가기 &gt;
					</a>
				</div>
			</div>
		</div>
		<div class="Toastify"></div>
	</main>
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>