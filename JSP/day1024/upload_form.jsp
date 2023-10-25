<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		//유효성 검증 : 확장자가 jpg, png, bmp, gif만 업로드 될 수 있게 유효성 검증.
		var fileName=$("#upFile").val();
		var blockExt=["jpg","png","bmp","gif"];
		var flag=false;
		
		var fileExt=fileName.substring(fileName.lastIndexOf(".")+1);

		for(var i=0 ; i< blockExt.length ; i++){
			if(fileExt.toLowerCase() == blockExt[i]){
				flag=true;
			}//end if
		}//end for
		
		if( !flag ){
			alert("이미지 파일만 업로드 할 수 있습니다.(jpg,png,bmp,gif)")
			return;
		}//end fir
		
		$("#frm").submit();
	});//click
});//ready
</script>

</head>
<body>
<a href="file_list.jsp" class="btn btn-success" >파일리스트</a>
<form action="upload_form_process.jsp" method="post" enctype="multipart/form-data"
 id="frm" name="frm">
 <label>업로더</label>
 <input type="text" name="uploader" class="inputBox"/><br/>
 <label>나이</label>
 <select name="age">
 <c:forEach var="i" begin="10" end="80" step="10">
 <option value="${ i }">---<c:out value="${ i }"/>대---</option>
 </c:forEach>
 </select><br/>
 
 <input type="file" name="upFile" id="upFile" class="inputBox" style="width:300px"/><br/>
 <input type="button" value="전송" class="btn btn-info" id="btn"/>
 
 </form>

</body>
</html>