<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<c:if test="${not empty prd.loc }">
								<span class="text-sm text-gray-400"><c:out value="${prd.loc }"/></span>
								<span class="text-sm text-gray-400 mx-1">|</span>
							</c:if>
						<span class="text-sm text-gray-400"><c:out value="${prd.input_date }"/></span>
						</div>
						<div class="flex items-center">
							<svg width="30" height="17" viewBox="0 0 30 17" fill="none" xmlns="http://www.w3.org/2000/svg" class="mr-1">
								<rect y="-0.00012207" width="30" height="16.2857" rx="2.25" fill="#0DCC5A"></rect>
								<path d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
									fill="white"></path>
								<path d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
									fill="white"></path>
								<path d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
									fill="white"></path>
							</svg>
						</div>
					</div>
				</a>
				<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" class="absolute w-6 h-6 cursor-pointer right-2 bottom-8" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zm0-5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zm0-5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0z" clip-rule="evenodd"></path>
				</svg>
			</div>
			
		</c:forEach>
	</c:otherwise>
</c:choose>