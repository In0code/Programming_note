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
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<!--  common-layout -->




<!-- 후기 외부 style -->





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

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

</style>
<jsp:useBean id="sVO" class="user.vo.SummaryVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="sVO"/>

<%

UserReviewDAO uDAO= UserReviewDAO.getInstance();
String rcode= request.getParameter("rcode");
System.out.println(rcode);

try{
	sVO = uDAO.selectOneReview(Integer.parseInt(rcode==null?"0":rcode));
	
	pageContext.setAttribute("review", sVO);

	
	
}catch (SQLException se) {
	se.printStackTrace();
}//end catch
int reviewSize=sVO.getReview().length();

%>

<script type="text/javascript">
$(function(){

	
//	$("#delete").click(function() {
		
		//$.ajax({
			//url:"review_manage_del_process.jsp",
		//	type:"post",
			//async:true,
			//data: "rcode=<%= rcode %>" ,
			//dataType:"html",
			
		//	error:function(xhr){
			//	alert("에러 발생");
	//		},
			//success:function(data){
			//	$("#resultDiv").html(data);
			//}///ajax
		//})
	//});
	
	//$("#save").click(function() {
		 
	
		//$.ajax({
			//url:"review_manage_updt_process.jsp",
			//type:"POST",
			//async: true,
			//data: "rcode=<%= rcode %>&review="+$('#review').val()+"&star=${review.star}" ,
			//dataType:"html",
			
			//error:function(xhr){
		//		alert("에러 발생");
			//},
		//	success:function(data){
			//	$("#resultDiv").html(data);
		//	}
			
		//})
		
		//$("#frm").submit();
		//$("#uploadForm").submit();
	});
   
});//ready
</script>

</head>

<body>

<script type="text/javascript">
$(function(){
	$("#save").click(function(){
		document.uploadForm.action="posting_updt_process.jsp";
		//$("#frm").submit();
		$("#uploadForm").submit();
		
	});
	
	$("#delete").click(function(){
		document.uploadForm.action="posting_del_process.jsp";
		$("#uploadForm").submit();
		
	});
	
	
	$('#review').keyup(function (e) {
		let content = $("#review").val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 200) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 200));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 200자까지 입력 가능합니다.');
	    };
	});
	
	
});
</script>





<div id="wrap" style="font-family:pretendard; font-size: 16px">
<div id="div" >
 <img src="../common/images/icon/check-circle.svg" style="margin-left: 5px;">&ensp;상품 만족도
 </div>

<!-- <form action="review_manage_updt_process.jsp" id="frm"  name="frm"> --><!-- get방식 일때는 evt가 발생하면 쿼리스트링이 삭제가된다. -->
 <form action="" id="uploadForm"  name="uploadForm" method="post" enctype="multipart/form-data" >
<!-- <input type="button" id="a" value="aaa">
<input type="button" id="b" value="bbb"> -->
<input type="hidden" name="rcode" value="<%= rcode %>"/>
<!-- 상품 만족도 -->
<div style="border: 1px solid #333; margin-left: 5px; width:502px; height:150px; text-align: center" >
<div style=" margin-top: 10px"><strong ><c:out value="${review.name}" /></strong>님 상품은 어떠셨나요?</div><br>
<div  style= "border: 0px; position:absolute; top:80px; left:200px" class="star-rating" >

  <input type="radio" id="5-stars" name="star" value="5" ${review.star eq 5 ? "checked='checked'" : "" }/>
  
  <label for="5-stars" class="star" >&#9733;</label>


  
  <input type="radio" id="4-stars" name="star" value="4" ${review.star eq 4 ? "checked='checked'" : "" }/>
  <label for="4-stars" class="star">&#9733; </label>
  
 
  <input type="radio" id="3-stars" name="star" value="3" ${review.star eq 3 ? "checked='checked'" : "" }/>
  <label for="3-stars" class="star">&#9733;</label>

  <input type="radio" id="2-stars" name="star" value="2" ${review.star eq 2 ? "checked='checked'" : "" }/>

  <label for="2-stars" class="star">&#9733;</label>
   
  <input type="radio" id="1-star" name="star" value="1" ${review.star eq 1 ? "checked='checked'" : "" }/>
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
<div style="color:#FF923A"><c:out value="${text}" /></div>  
</div>
<div></div>
<br/>
<!-- 리뷰 작성 -->
<div class="form-group col-12" style=" margin-left: 5px;" >
<img src="../common/images/icon/check-circle.svg" style="margin-left: 5px;">&ensp;리뷰 작성
  <div class="textLengthWrap">
  </div>
  <textarea style="width:502px; height:180px; resize: none;" maxlength="200" name="review" id="review"><c:out value="${review.review}" />
  </textarea>	
    <p class="textCount" style="font-size: 10px; position: absolute; top:400px; left: 445px; padding: 3px"><%=reviewSize %> 자</p><p class="textTotal" style="padding: 3px;position: absolute; top:400px; left: 470px;font-size: 10px">/200자</p>
</div>
<%-- <div style=" margin-left: 5px;" >
<textarea  style="width:502px; height:180px;" name="review" id="review"><c:out value="${review.review}" /></textarea>

</div> --%>

<br>

<input type="file" name="file" id="file" style="display:none"/>
<img src="../common/images/icon/check-circle.svg" style="margin-left: 5px; ">&ensp;동영상/사진 첨부
<div style="border: 1px solid #333; width:502px; height:180px; margin-left: 5px; " onclick="onclick=document.all.file.click()" >
<button type="button" style="padding: 5px 10px;  font-size: 15px; position: absolute; left:210px; top:520px;"  class="btn btn-outline-danger" ><img src="../common/images/icon/camera.svg" >&ensp;첨부하기</button>

</div>
<input type="submit" value="전송" style="padding: 3px 10px; font-size: 10px; position: absolute;
    top: 642px;
    left: 415px;" class="btn btn-dark" id="save"/>
	
</form> 



<div id="btndiv" style="position: absolute;
    top: 640px;
    left: 465px; ">
<!-- <input type="button" style="padding: 3px 10px; font-size: 10px" value="저장" id="save" class="btn btn-dark">
 --><input type="button" style="padding: 3px 10px; font-size: 10px" value="삭제" id="delete" class="btn btn-dark">


</div>
<span id="resultDiv" style="position: absolute;
    top: 670px;
    left: 200px;"></span>
</div>
</body>
</html>