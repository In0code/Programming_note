<%@page import="kr.co.sist.user.domain.mypage.MypagePrdDomain"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" id="totalPrd" value="${totalCnt }">
<c:choose>
	<c:when test="${empty prdList }"></c:when>
	<c:otherwise>
		<c:forEach var="prd" items="${prdList }">
		
			<div class="relative">
				<a class="group box-border overflow-hidden flex rounded-md cursor-pointer pe-0 pb-2 lg:pb-3 flex-col items-start transition duration-200 ease-in-out transform hover:-translate-y-1 md:hover:-translate-y-1.5 hover:shadow-product bg-white"
					title="${prd.pname }" href="/product/144025736${prd.pcode }">
					<div class="relative w-full rounded-md overflow-hidden pt-[100%] mb-3 md:mb-3.5">
						<img alt="${prd.pname }" referrerpolicy="no-referrer" src="http://192.168.10.143/mvc_prj/common/images/${prd.img }"
							decoding="async" data-nimg="fill" class="bg-gray-300 object-cover w-full transition duration-200 ease-in rounded-md group-hover:rounded-b-none"
							loading="lazy" style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
					</div>
					<div class="w-full overflow-hidden p-2 md:px-2.5 xl:px-4">
						<h2 class="line-clamp-2 text-sm md:text-base text-heading"><c:out value="${prd.pname }"/></h2>
						<div class="font-semibold space-s-2 mt-0.5 text-heading lg:text-lg lg:mt-1.5"><c:out value="${prd.price }"/></div>
						<div class="my-1">
							<c:if test="${f}">
								<c:if test="${not empty prd.loc }">
									<span class="text-sm text-gray-400"><c:out value="${prd.loc }"/></span>
									<span class="text-sm text-gray-400 mx-1">|</span>
								</c:if>
								<span class="text-sm text-gray-400"><c:out value="${prd.input_date }"/></span>
							</c:if>
						</div>
					</div>
				</a>
			</div>
			
		</c:forEach>
	</c:otherwise>
</c:choose>