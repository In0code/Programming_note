<%@page import="java.sql.SQLException"%>
<%@page import="user.vo.SummaryVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=3, user-scalable=yes">


<title>리뷰 상세</title>
<link rel="icon"
	href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<jsp:include page="../cdn/cdn.jsp"/>



<!--  common-layout -->




<!-- 후기 외부 style -->





<style type="text/css">


</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>

<body>
<jsp:useBean id="sVO" class="user.vo.SummaryVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="sVO"/>


<%

UserReviewDAO uDAO= UserReviewDAO.getInstance();

try{
	sVO = uDAO.selectOneReview(Integer.parseInt(request.getParameter("rcode")));
	
	pageContext.setAttribute("review", sVO);
	
}catch (SQLException se) {
	se.printStackTrace();
}//end catch


%>

<div id="wrap" style="font-family:pretendard; font-size: 16px">
<div id="div" >
 <img src="../common/images/icon/check-circle.svg" style="margin-left: 5px;">&ensp;상품 만족도
 </div>

<!-- 상품 만족도 -->
<div style="border: 1px solid #333; margin-left: 5px; width:502px; height:150px;" >
<div style="text-align: center">
<div><c:out value="${review.name}" />님 상품은 어떠셨나요?</div><br>
<c:choose >
<c:when test="${review.rcode eq 1 }">
<c:set var="star" value="★☆☆☆☆"/>
<c:set var="text" value="나쁘지 않았아요."/>
</c:when>
<c:when test="${review.rcode eq 2 }">
<c:set var="star" value="★★☆☆☆"/>
<c:set var="text" value="그냥 그랬어요."/>
</c:when>
<c:when test="${review.rcode eq 3 }">
<c:set var="star" value="★★★☆☆"/>
<c:set var="text" value="보통이에요."/>
</c:when>
<c:when test="${review.rcode eq 4 }">
<c:set var="star" value="★★★★☆"/>
<c:set var="text" value="좋았어요."/>
</c:when>
<c:when test="${review.rcode eq 5 }">
<c:set var="star" value="★★★★★" />
<c:set var="text" value="최고에요"/>
</c:when>
</c:choose>
<div style="color:#FF923A"><c:out value="${star}" /></div><br><c:out value="${text}" />
</div>
</div>
<br/>
<!-- 리뷰 작성 -->
<img src="../common/images/icon/check-circle.svg" style="margin-left: 5px;">&ensp;리뷰 작성
<div style=" margin-left: 5px;" >
<textarea  style="width:502px; height:180px;"><c:out value="${review.review}" /></textarea>

</div>
<br>
<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data">
<input type="file" name="file" id="file" style="display:none"/>
</form>
<img src="../common/images/icon/check-circle.svg" style="margin-left: 5px; ">&ensp;동영상/사진 첨부
<div style="border: 1px solid #333; width:502px; height:200px; margin-left: 5px; " onclick="onclick=document.all.file.click()" >
<button type="button" style="padding: 5px 10px;  font-size: 15px; position: absolute; left:210px; top:540px;"  class="btn btn-outline-danger" ><img src="../common/images/icon/camera.svg" >&ensp;첨부하기</button>

</div>
<div id="btndiv" style="position: absolute;
    top: 660px;
    left: 400px; ">
<input type="button" style="padding: 3px 10px; font-size: 10px" value="저장" id="save" class="btn btn-danger"><input type="button" style="padding: 3px 10px; font-size: 10px" value="삭제" id="delete" class="btn btn-danger">

</div>
</div>

</body>
</html>