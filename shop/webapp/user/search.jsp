<%@page import="user.vo.GoodsVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="user.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../cdn/cdn.jsp"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#pageTitle {
	font-family: Playfair Display;
	font-size: 27px;
	text-align: center;
	/* border-top: 2px solid black; */
	padding: 10px;
	margin-top: 100px;
}

.xans-product-headcategory.title{
	margin-bottom: 20px;
}
.banner{
	width: 100%; position: relative;
}

.banner img {
	width: 100%; height: auto; display: block; margin: 20px auto 0;
}

.xans-product-headcategory.title h3 {
    position: absolute;
    top: 50px;
    left: 40px;
    line-height: 1.4;
    font-size: 16px;
    font-weight: normal;
    color: #212121;
}

#contents {
	position: relative;
}

a:hover {
	color: black;
}

@media all and (min-width: 1025px) {
    .xans-product-searchdata .searchField fieldset .searchInput {
        width:650px;
        padding: 0 36px 0 0;
    }
    
.xans-product-searchdata .searchField fieldset .searchInput {
    position: relative;
    display: inline-block;
    width: 100%;
    border-bottom: 1px solid #000;
    font-size: 0;
}

.xans-product-searchdata .searchField fieldset {
    position: relative;
    display: table;
    margin: 0 auto 10px;
    text-align: center;
}

.xans-product-searchdata .searchField .keyword {
    border: 0;
    width: 100%;
    height: 54px;
    outline: 0;
    font-size: 18px;
    background: #fff;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

input[type=text],input[type=password] {
    height: 40px;
    line-height: 40px;
    padding: 2px 4px 2px 15px;
    border: 1px solid #e0e0e0;
    color: var(--font-color-base);
    font-size: 13px;
    box-sizing: border-box;
    outline: 1px;
}

.xans-product-searchdata .searchField .btnSearch {
    position: absolute;
    bottom: 12px;
    right: 0;
    outline: 0;
}

.xans-product-searchdata .searchField {
    padding: 22px 0;
    margin: 0 0 42px;
}

.xans-product-searchdata .noData .desc {
    margin: 5px 0 13px;
}

.xans-product-searchdata .noData .subDesc {
    font-size: 12px;
    color: #7d7d7d;
    line-height: 22px;
}

.xans-product-searchdata .noData .icon {
    margin: 0 auto 24px;
}

.xans-product-searchdata .noData {
    padding: 60px 0;
    text-align: center;
    line-height: 1.8em;
}

.xans-product-searchdata .noData h3 {
    font-size: 13px;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

</style>
<script type="text/javascript">
$(function() {
	$("#searchBtn").click(function(){
		 var searchKeyword = $("#searchKeyword").val();
	        if (!searchKeyword || searchKeyword.trim() === "") {
	        	return;
	        }//end if
	            $("#searchForm").submit();
	        
	});//click
});//ready
</script>
</head>
<body>
<%@ include file="layout/header.jsp"%>
<%
	GoodsDAO gDAO = GoodsDAO.getInstantce();
	String searchKeyword = request.getParameter("searchKeyword");
	List<GoodsVO> productList = null;
	int cnt = 0;

	try{
		if(searchKeyword != null && !searchKeyword.trim().isEmpty()){
			
			productList = gDAO.selectKeywordProducts(searchKeyword);
			cnt = gDAO.selectKeywordCnt(searchKeyword);
			pageContext.setAttribute("keyword", searchKeyword);
			pageContext.setAttribute("productList", productList);
			pageContext.setAttribute("cnt", cnt);
		}
		
	}catch(SQLException se){
		se.printStackTrace();
	}
%>

<div id="container">
     <div id="contents" role="main">
            
<div class="xans-element- xans-product xans-product-menupackage ">
<div class="xans-element- xans-product xans-product-headcategory path "><span>현재 위치</span>
</div>
</div>

<div class="xans-element- xans-product xans-product-headcategory title ">
	<div id="pageTitle">
		<h2 class="hFamily_PD" style="margin-bottom:30px; font-size:29px">
			Search		
		</h2>
	</div>
<div class="clear"></div>
<p class="banner"></p>
</div>

<div class="ec-base-tab typeMenu" style="display: none;">    
    <ul class="menuCategory menu" style="display: none;"></ul>
</div>

<div class="xans-element- xans-product xans-product-normalpackage ">
	<div class="xans-element- xans-product xans-product-normalmenu displaynone "></div>
	
	<div class="xans-element- xans-product xans-product-searchdata xans-record-">
	<form class="searchField" id="searchForm" action="search.jsp" method="get">
    <fieldset>
		<legend>상품검색</legend>
            <div class="searchInput" style="width:650px; padding: 0 36px 0 0;"> 
            <input type="text" class="keyword" name="searchKeyword" id="ec-product-searchdata-keyword" style="font-family: Pretendard; font-size: 25px" value=${ keyword  }> 
            <input type="image" id="searchBtn" src="//img.echosting.cafe24.com/skin/skin/product/ico_search.svg" alt="검색" class="btnSearch">
                &nbsp;
                <ul class="autoDrop" id="" style="display: none;"></ul>
			</div>
    </fieldset>
    </form>
    
	<div class="searchResult">
        <p class="record" style="font-family: Pretendard; font-size: 17px; margin: 0px 0px 10px 20px">
        	상품 검색 결과
        	<strong class="txtEm">${ cnt }</strong>건
        </p>
    </div>
    
    <c:if test="${ empty productList }">
	<div class="noData" style="font-family:Pretendard Medium">
        <svg xmlns="http://www.w3.org/2000/svg" width="49" height="49" fill="none" viewBox="0 0 49 49" class="icon" role="img"><circle cx="24.5" cy="24.5" r="23.75" stroke="#D7D7D7" stroke-width="1.5"></circle><path fill="#D7D7D7" d="M23 14H26V30H23zM23 32H26V35H23z"></path></svg>
        <h3 class="title">검색결과가 없습니다.</h3>
        <p class="desc">정확한 검색어 인지 확인하시고 다시 검색해 주세요.</p>
        <p class="subDesc">
        	검색어/제외검색어의 입력이 정확한지 확인해 보세요.<br>
            두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.
        </p>
    </div>
    </c:if>
</div>
	
<div class="product_area">
        <div class="xans-element- xans-product xans-product-listnormal ec-base-product product"><!--
<!--     @@@     상품 진열     @@@       -->
<ul class="prdList grid3">
<!-- li가 하나의 상품임 -->

<!-- 상품 시작 -->
<c:forEach var="product" items="${ productList }">
<!-- product 1 시작 -->
<li id="productId_1" class="xans-record-">
    <div class="prdList__item">
    		<!-- 대표 사진 -->
            <div class="thumbnail">
            	  <!-- 사진 눌렀을 때 이동할 상품 페이지 -->
                  <a href="product_detail.jsp?gcode=${ product.gcode }">
                      <img class="hI hImg orgImg hImgover" src="http://localhost/prj_web_shopping/upload/goods/${ product.main_img }" id="img${ product.gcode }" alt="Cherie ${ product.gname }">
                      <img class="hoverImg" src="http://localhost/prj_web_shopping/upload/goods/${ product.img1 }" id="img${ product.gcode }" alt="Cherie ${ product.gname }">
                        &nbsp;<!--img class="hI hImg orgImg" src="//sw19official.com/web/product/medium/202309/4b9b535eb0e7b015b45944a86c995269.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET"><img class="hoverImg" src="//sw19official.com/web/product/tiny/202309/451ea41391969b890543f550968841d0.jpg" id="eListPrdImage104_1" alt="SW19 MINI DISCOVERY SET"-->
                        &nbsp;                            
                  </a>
            </div>
            
            <!-- 상품명/가격 -->
            <div class="description">
                <strong class="name hFamily_PD"><a href="../product/mini_discovery_set.jsp">
                <span class="title displaynone">
                	<span style="font-size:16px;color:#212121;">상품명</span> :
                </span> 
                	<span style="font-size:16px;color:#212121;">${ product.gname }</span></a>
                </strong>
                <ul class="xans-element- xans-product xans-product-listitem spec">
                	<li class=" xans-record-">
                      <strong class="title displaynone">
                      	<span style="font-size:14px;color:#414141;">판매가</span> :
                      </strong> 
                      <span style="font-size:14px;color:#414141;font-family:Pretendard">
                      	<fmt:formatNumber value="${ product.price }" pattern="#,###,###"/>원
                      </span>
                      <span id="span_product_tax_type_text" style=""> </span>                                
                    </li>
				</ul>
				<c:if test="${ product.gcode eq 'PF0007' }">
 				<div class="icon"></div>
                <div class="iconNew"><img src="/web/upload/icon_202206091627347200.png" class="icon_img" alt="New">
                	<span>NEW!</span>
				</div>
				</c:if>
         	</div>
    </div>
</li>
</c:forEach>
</ul>
</div>
</div>
</div>
</div><hr class="layout"></div>

<%@ include file="layout/footer.jsp"%>
</body>
</html>