<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
<div id="wrap" style="font-family:pretendard; font-size: 16px">
<div id="div" >
 <img src="../common/images/icon/check-circle.svg" style="margin-left: 5px;">&ensp;상품 만족도
 </div>

<!-- 상품 만족도 -->
<div style=" margin-left: 5px;" >
<textarea style="width:502px; height:150px;"></textarea>
</div>
<br/>
<!-- 리뷰 작성 -->
<img src="../common/images/icon/check-circle.svg" style="margin-left: 5px;">&ensp;리뷰 작성
<div style=" margin-left: 5px;" >
<textarea  style="width:502px; height:180px;"></textarea>

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