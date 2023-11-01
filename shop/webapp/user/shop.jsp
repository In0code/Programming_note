<%@page import="user.vo.GoodsVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="user.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../cdn/cdn.jsp"/>
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

</style>
<script type="text/javascript">
$(function() {
	
	
});//ready
</script>

</head>
<body>
<%@ include file="layout/header.jsp"%>
<%
	GoodsDAO gDAO = GoodsDAO.getInstantce();
	String category = request.getParameter("category");
	List<GoodsVO> productList = null;

	try{
		if(category == null){
			productList = null;
			productList = gDAO.selectAllProducts();
		}
		
		if(category != null){
			productList = null;
			productList = gDAO.selectCateProducts(category);
		}
		
		pageContext.setAttribute("productList", productList);
		
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
			${ empty param.category ? 'All Products' : productList.get(0).getCat_name() }		
		</h2>
	</div>
	<c:if test="${ not empty param.category }">
	<h3 class="hFamily_PD">
        <span><a href="http://localhost/prj_web_shopping/user/shop.jsp">All Products &gt;</a></span>
    </h3>
    </c:if>
<div class="clear"></div>
<p class="banner"></p>

<span class="likeButton displaynone"><button type="button"><strong></strong></button></span>
</div>

<div class="ec-base-tab typeMenu" style="display: none;">    
    <ul class="menuCategory menu" style="display: none;"></ul>
</div>

<div class="xans-element- xans-product xans-product-normalpackage ">
	<div class="xans-element- xans-product xans-product-normalmenu displaynone "></div>
	
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
<!-- product 1 끝 -->
</c:forEach>
</ul>
</div>
<!-- 더보기 버튼 -->
<!-- <div class="xans-element- xans-product xans-product-listmore more ">
	<a href="#none" onclick="try { $M.displayMore(0, 0, 48, 30, 0, false, 'S0000000', false, ''); } catch(e) { return false; }" class="btnMore">
                더보기<span id="more_current_page">1</span>/<span id="more_total_page">2</span>
                <i aria-hidden="true" class="icon icoArrowBottom"></i>
            </a>
</div> -->
</div>
</div>
</div><hr class="layout"></div>

<%@ include file="layout/footer.jsp"%>
</body>
</html>