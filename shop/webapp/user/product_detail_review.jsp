<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chérie</title>
<link rel="icon" href="http://localhost/cherie_ysy_private/common/images/favicon.png"/>
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
.star-rating {
  border:solid 1px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

/* .star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
} */
</style>
<jsp:useBean id="sVO" class="user.vo.SummaryVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="sVO"/>
<%

UserReviewDAO uDAO= UserReviewDAO.getInstance();
String rcode=request.getParameter("rcode");
//System.out.println(rcode);

try{
	sVO = uDAO.selectOneReview(Integer.parseInt(rcode==null?"0":rcode));
	uDAO.updateView(Integer.parseInt(rcode));
	
	pageContext.setAttribute("review", sVO);
	
}catch (SQLException se) {
	se.printStackTrace();
}//end catch


%>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>

<body style="width:510px; height:720px">
<div id="wrap" style="font-family:pretendard; font-size: 16px;">
<div id="div" style="margin: 5px 0px 0px 13px">

<div style="border: 1px solid #AAAAAA; position:absolute; top:32px; left:5px; width: 270px; height:262px; margin-left:13px"><!-- ><img src="../upload/review/img_background.png" style=" width: 265px; height:255px; "> --></div>
<img src="../common/images/icon/check-circle.svg" style="margin-left: 13px; margin-right:5px; padding-bottom: 2px ">사진
<div style="border: 0px solid #333; width:260px; height:250px; margin-left: 13px; padding:10px" onclick="onclick=document.all.file.click()" >

<img src="../upload/review/${review.img eq null ? 'img_null.png' : review.img}" style="position:absolute; top:37px; left:10px; width:260px; height:250px; margin-left: 13px"> 
 </div>
<br>
<br>
<div style="border:0px solid #333; width:220px ; height: 260px; position: absolute; top:60px ; left:285px; margin-left: 13px" >
<div style="padding: 5px; color:#AAAAAA">
<div>상품명 : <span><%=sVO.getGname() %></span></div>
<br>
<div>카테고리 : <span><%=sVO.getCategory() %></span></div>
<br>
<div>구매자 : <span></span><%=sVO.getId() %>(<%=sVO.getName() %>님)</div>
<br>
<div>작성일 : <span></span><%=sVO.getReviewDate() %></div>
</div>
</div>
<!-- <form action="review_manage_updt_process.jsp" id="frm"  name="frm"> --><!-- get방식 일때는 evt가 발생하면 쿼리스트링이 삭제가된다. -->
<!--  <form action="" id="uploadForm"  name="uploadForm" method="post" enctype="multipart/form-data" > -->
<!-- <input type="button" id="a" value="aaa">
<input type="button" id="b" value="bbb"> -->
<input type="hidden" name="rcode" value="<%= rcode %>"/>
<!-- 상품 만족도 -->
<div style="margin-top:10px">
 <img src="../common/images/icon/check-circle.svg" style="margin-left: 5px; margin-right:5px; position: absolute; top: 313px">
 <div style="margin-left: 15px; position: absolute; top: 310px; padding-left:9px">상품 만족도</div>
<div style="border: 1px solid #333; margin-left: 5px; width:502px; height:150px; text-align: center" >
<div style=" margin-top: 10px"><strong ><c:out value="${review.name}" /></strong>님 상품은 어떠셨나요?</div><br>
<div style= "border: 0px; position:absolute; top:375px; left:210px;" class="star-rating" >

  <input type="radio" id="5-stars" name="star" value="5" ${review.star eq 5 ? "checked='checked'" : "" } onclick="return(false);"/>
  
  <label for="5-stars" class="star" >&#9733;</label>
  
  <input type="radio" id="4-stars" name="star" value="4" ${review.star eq 4 ? "checked='checked'" : "" } onclick="return(false);"/>
  <label for="4-stars" class="star">&#9733; </label>
  
 
  <input type="radio" id="3-stars" name="star" value="3" ${review.star eq 3 ? "checked='checked'" : "" } onclick="return(false);"/>
  <label for="3-stars" class="star">&#9733;</label>

  <input type="radio" id="2-stars" name="star" value="2" ${review.star eq 2 ? "checked='checked'" : "" } onclick="return(false);"/>

  <label for="2-stars" class="star">&#9733;</label>
   
  <input type="radio" id="1-star" name="star" value="1" ${review.star eq 1 ? "checked='checked'" : "" } onclick="return(false);"/>
  <label for="1-star" class="star">&#9733;</label>
 <br>
 
  <br>

<%-- <div style="text-align: center">
<div><c:out value="${review.name}" />님 상품은 어떠셨나요?</div><br>
<c:choose >
<c:when test="${review.star eq 1 }">
<c:set var="star" value="★☆☆☆☆"/>
<c:set var="text" value="별로에요."/>
</c:when>
<c:when test="${review.star eq 2 }">
<c:set var="star" value="★★☆☆☆"/>
<c:set var="text" value="그냥 그랬어요."/>
</c:when>
<c:when test="${review.star eq 3 }">
<c:set var="star" value="★★★☆☆"/>
<c:set var="text" value="보통이에요."/>
</c:when>
<c:when test="${review.star eq 4 }">
<c:set var="star" value="★★★★☆"/>
<c:set var="text" value="좋았어요."/>
</c:when>
<c:when test="${review.star eq 5 }">
<c:set var="star" value="★★★★★" />
<c:set var="text" value="최고에요"/>
</c:when>
</c:choose>
<div style="color:#FF923A"><c:out value="${star}" /></div><br><c:out value="${text}" />
</div> --%>

</div>
<br>
<c:catch var="ele">
 <c:choose >
<c:when test="${review.star eq 1  }">
<c:set var="text" value="별로에요."/>
</c:when>
<c:when test="${review.star eq 2   }">

<c:set var="text" value="그냥 그랬어요."/>
</c:when>
<c:when test="${review.star eq 3  }">

<c:set var="text" value="보통이에요."/>
</c:when>
<c:when test="${review.star eq  4 }">
<c:set var="text" value="좋았어요."/>
</c:when>
<c:when test="${review.star eq 5 }">
<c:set var="text" value="최고에요"/>

</c:when>
</c:choose>
</c:catch>
<div style="color:#FF923A; margin:0px auto"><c:out value="${text}" /></div>  
</div>
<div></div>
<br/>
</div>
<!-- 리뷰 작성 -->

<div class="form-group col-12" style="margin-left: 5px;" >
  <div class="textLengthWrap" style="margin-bottom: 5px">
<img src="../common/images/icon/check-circle.svg" style="margin: 0px 1px 3px 5px;">
	<span>리뷰 내용</span>
  </div>
  <div style="border:1px solid #333; width:502px; height:180px; padding: 5px 0px 0px 5px; resize: none;"  id="review" ><c:out value="${review.review}" /></div>
 <%--  <textarea style="width:502px; height:180px; resize: none;" maxlength="200" name="review" id="review" readonly="readonly"><c:out value="${review.review}" />
  </textarea>	 --%>
   
</div>
<%-- <div style=" margin-left: 5px;" >
<textarea  style="width:502px; height:180px;" name="review" id="review"><c:out value="${review.review}" /></textarea>

</div> --%>

<br>


</div>

	
</form> 






</div>
<span id="resultDiv" style="position: absolute;
    top: 670px;
    left: 200px;"></span>

</body>
</html>