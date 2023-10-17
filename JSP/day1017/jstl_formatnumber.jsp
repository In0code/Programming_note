<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day1017.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="fmt사용" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<%
List<ProductVO> list=new ArrayList<ProductVO>();
list.add(new ProductVO("item_1.png", "BEST Hoodie", "따뜻한 후디", 12223, 52000,new Date()));
list.add(new ProductVO("item_2.png", "하객 원피스", "예쁜 원피스", 31212, 594000, new Date()));

pageContext.setAttribute("prdList", list);
%>
<c:forEach var="prd" items="${ prdList }">
<div class="card" style="width: 18rem; float: left; margin-left:10px">
  <img src="images/${ prd.img }" class="card-img-top" alt="후드티">
  <div class="card-body">
    <h5 class="card-title"><c:out value="${ prd.prdName }"/></h5>
    <p class="card-text"><c:out value="${ prd.info }"/></p>
    <p class="card-text"><c:out value="${ prd.price }"/></p>
    <p class="card-text"><fmt:formatNumber value="${ prd.price }" pattern="0,000,000"/></p>
    <p class="card-text">\<fmt:formatNumber value="${ prd.price }" pattern="#,###,###"/></p> <!-- 가격보여줄때 -->
    <p class="card-text"><fmt:formatDate value="${ prd.inputDate }" pattern="yyyy-MM-dd"/></p> <!-- 가격보여줄때 -->
      <a href="buy.jsp?prdNum=${ prd.prdNum }" class="btn btn-primary">구매각</a> 
  </div>
</div>
</c:forEach>
</body>
</html>