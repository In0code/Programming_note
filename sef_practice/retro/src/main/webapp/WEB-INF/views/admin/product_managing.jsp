<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 태균이가 만든거 -->
<style type="text/css">
body{
 margin: 0px;
}
#wrap{
	
}
#right{
	width: calc(100vw - 240px); height: 100%;float: right;
	background: blue;
}
#left{
	min-width: 240px;height: 100%;float: left;
	padding: 0px;
	background: yellow;
}
#rightHeader{
	min-height: 55px;
	padding-top: 8px;padding-bottom: 5px;
	padding-right: 15px;
	background: #FFFFFF;
}
#rightBody{
	width: 100%; min-height: 500px;float: right;
	padding: 20px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 
</style>
<!-- 태균이가 만든거 끝-->

<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="admin_logout_process.do";
	});//click
	
	/* $(".searchBtn").click(function() {
		chkNull();
	});//click
	
	$("#keyword").keyup(function(evt) {
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keyup */
	
	$("#allList").click(function(){
		location.href="product_managing.jsp";
	});
	
});//ready

function boardDetail(pcode){
	$("#md").val(pcode);
	$("#frmDetail").submit();
}//boardDetail

function chkNull() {
	var keyword = $("#keyword").val();
	if(keyword.trim() == ""){
		alert("검색 키워드를 입력해주세요.");
		return;
	}//end if
	
	//글자 수 제한
	
	//모두 통과했으면 submit
	$("#frmSearch").submit();
}//chkNull
</script>
</head>
<body>
<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		<a href="product_managing.do">
		상품 관리
		</a>
		</div>
		
		<div class="text" id="mainTitle">
			<strong>상품 리스트</strong>
		</div>
		
		<!-- 검색 -->
		 <div class="searchDiv">
		<div class="allBox">
		<form id="frmSearch">
			<select class="searchList" id="field" name="field">
				<option value="category"${ param.field eq "category" ? " selected='selected'" : "" }>카테고리명</option>
				<option value="id"${ param.field eq "id" ? " selected='selected'" : "" }>아이디</option>
			</select>
			<span class="textBox" style="vertical-align: middle">
			<input type="text" id="keyword" name="keyword" class="keywordBox" placeholder="내용을 입력해주세요"
			value = "${ param.keyword ne 'null' ? param.keyword : ''}"/>
			</span>
			<button class="searchBtn">
			<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#858585" class="bi bi-search" viewBox="0 0 16 16">
  			<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
			</button>
		</form>
		</div>
		</div> 
		<!---->
		
		<!-- 상품 상세보기 페이지 -->
		<form id="frmDetail" action="productDetail_managing.do">
			<input type="hidden" id="md" name="pcode" value=""/>
		</form>
		
		<!-- 테이블 -->
		<div id="background_box">
		<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table class="table tableList">
				<thead>
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
					<th style="width:100px; border-bottom: 1px solid #E5E5E5;">No</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">아이디 ( 닉네임 )</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">카테고리</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">상품명</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">상품가격</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">등록일</th>
				</tr>
				</thead>
				
				<tbody>
					<!-- list가 존재하지 않을 경우 -->
					<c:if test="${ empty productList }">
					<tr>
						<td colspan="6" style="text-align: center; color: red; font-weight: bold;"> 
							상품이 존재하지 않습니다. </td>
					</tr>
					</c:if>
				
					 <c:forEach var="product" items="${ productList }" varStatus="i">
					<tr onclick="boardDetail('${ product.pcode }')" style="cursor: pointer;">
						<td>${ i.count }</td> 
						<td><c:out value="${ product.id } ( ${ product.nickname } )"/></td>
						<td>${ product.category }</td>
						<td>${ product.pname }</td>
						<td><fmt:formatNumber pattern="#,###,###" value="${ product.price }"/></td>
						<td>${ product.input_date }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<!---->
			<div class="pagenationDiv">
    	<div class="pagination">
    		<c:if test="${pageEndNum != 1 }">
	    		<c:choose>
	    			<c:when test="${empty param.page }">
	    				<c:forEach var="pn" begin="1" end="${pageEndNum }" step="1">
		    				<a href="product_managing.do?page=${pn }">
		    				<c:if test="${pn == 1 }">
			    				<span class="active">1</span>
		    				</c:if>
		    				<c:if test="${pn != 1 }">
		    					${pn }
		    				</c:if>
		    				</a>
	    				</c:forEach>
	    			</c:when>
		    		<c:when test="${pageEndNum != 1 }">
		    			<c:forEach var="pn" begin="${pageStartNum }" end="${pageEndNum }" step="1">
			        		<a href="product_managing.do?page=${pn }">
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
		
    	<c:if test="${ not empty param.keyword }">
	    	<div class="btnDiv">
				<a href="product_managing.do">
				<input type="button" class="btnCss" value="목록" id="allList">	
		</a>
			</div>
    	</c:if>
	</div>	
</div>
</body>
</html>