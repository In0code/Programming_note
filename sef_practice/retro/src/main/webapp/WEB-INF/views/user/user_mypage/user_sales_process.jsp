<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table style="border: none;margin-bottom: 280px;">
	<thead>
		<tr style="border: none;padding-bottom: 15px;">
			<th style="padding: 10px;border: none;;width: 30px;max-width: 30px;"></th>
			<th style="padding: 10px;border: none;;width: 180px;"></th>
			<th style="border: none;width: 80px;max-width: 80px;font-size: 14px;color: #333;"><strong>가격</strong></th>
			<th style="border: none;width: 40px;max-width: 40px;font-size: 14px;color: #333;"><strong>등록일</strong></th>
			<th style="border: none;width: 40px;max-width: 40px;font-size: 14px;color: #333;"><strong>찜</strong></th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${empty saleList }">
			<tr style="border: none;">
				<td colspan="5" style="border: none;text-align: center;font-size: 14px;border-bottom: 1px solid #EDEDED;">조회 결과가 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="prd" items="${saleList }">
			<tr style="border: none;cursor: pointer;" onclick="moveTo('${prd.pcode }')">
				<td style="border: none;width: 70px;max-width: 70px;border-bottom: 1px solid #EDEDED;"><img alt="${prd.pname }" src="http://localhost/retro_prj/upload/${prd.img }" width="60" style="border-radius: 5px;"></td>
				<td style="border: none;width: 120px;font-size: 14px;border-bottom: 1px solid #EDEDED;"><c:out value="${prd.pname }"/></td>
				<td style="border: none;text-align: center;font-size: 14px;border-bottom: 1px solid #EDEDED;">
					<fmt:formatNumber pattern="#,###,###,###" value="${prd.price }"/>
				</td>
				<td style="border: none;text-align: center;font-size: 14px;border-bottom: 1px solid #EDEDED;">
					<c:out value="${prd.input_date }"/>
				</td>
				<td style="border: none;text-align: center;font-size: 14px;border-bottom: 1px solid #EDEDED;"><c:out value="${prd.wish }"/></td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</tbody>
</table>
<!-- pagination start -->
<div class="pagenationDiv">
<div class="pagination">
	<c:if test="${pageEnd != 1 }">
		<c:choose>
			<c:when test="${empty param.page }">
				<c:forEach var="pn" begin="1" end="${pageEnd }" step="1">
 				<a href="user_sales.do?page=${pn }">
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
	      		<a href="user_sales.do?page=${pn }">
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