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
	$("#btnImg").click(function(){
		if($("#profileImg").val() == "" ){
			alert("이미지를 선택해 주세요.");
			return;
		}//end if

		//1. form 얻기
		var frm=$("#frm")[0];
		//2. ajax로 전송할 form 객체 생성
		var formData=new FormData( frm );
		
		$.ajax({
			url : "info_upload_process.jsp",
			type : "post",
			processData : false,
			contentType : false,
			data : formData,
			async : "false",
			dataType : "json",
			error : function( xhr ){
				$("#imgResult").html("이미지 업로드 실패");
				console.log( xhr.status );
			},
			success : function( jsonObj ){
					var msg="이미지 업로드 실패";
				if(jsonObj.uploadFlag){
				msg=jsonObj.id+"님 이미지가 업로드가 되었습니다";
				}//end if
				$("#imgResult").html(msg);
				var img="<img src='http://localhost/jsp_prj/upload/"+
				jsonObj.fileName+"' style='width:100px'/>";
				
				$("#output").html( img );
			}//success

		});//ajax
	});//click
	
	$("#profileImg").change(function( event ){
		if($("profileImg").val() == ""){
			alert("이미지 선택해주세요");
			return;
		}//end if

		    var file = event.target.files[0];

		    var reader = new FileReader(); 
		    reader.onload = function(e) {

		        $("#previewProFile").attr("src", e.target.result);
		    }

		    reader.readAsDataURL(file);
		});//change
		
	$("#btnSubmit").click(function(){
		$("#frm").submit();
	});//click
	
});//ready
</script>

</head>
<body>
<form action="info_frm_process.jsp" method="post" id="frm" name="frm">
프로필 이미지 : <input type="file" name="profileImg" id="profileImg" class="inputBox"/>
  <input type="button" id="btnImg" value="이미지 업로드" class="btn btn-success"/>
  <span id="imgResult" style="color : #FF0000"></span>
<br/>
<img id="previewProFile" src="../common/images/default.png" style="width:100px;"/>
ID : <input type="text" name="id" id="id" class="inputBox" value="kim" readonly="readonly"/><br/>
이름 : <input type="text" name="name" id="name" class="inputBox"/><br/>
<input type="button" value="전송" id="btnSubmit" class="btn btn-info"/>
</form>
</body>
</html>