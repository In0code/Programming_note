<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/mvc_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 개발버전, 도움되는 콘솔 경고를 포함. -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<style type="text/css">
	
</style>
<script type="text/javascript">
$(function(){
   $("#reportBtn").click(function(){
	   
	   var confirmReport = confirm("정말로 신고하시겠습니까?");
	   
	   if(confirmReport){
		   var id = "${sessionScope.id}";
		   var pcode="${param.pcode}";
		   var type=$("#type").val();
		   reportAjax("report_add_success.do" ,id, type, pcode);
	   }//end if
	   
	   
	   
   })
});//ready

function reportAjax(url,userId,type,pcode){
	$.ajax({
		url:url,
		type:"POST",
		data:{id:userId,type:type,pcode:pcode},
		dataType:"JSON",
		error:function(xhr){
			alert(xhr.status);
		},
		success:function(jsonObj){
			if(jsonObj.flag){
				alert("요청한 신고가 완료되었습니다.");
			}else{
				alert("다시 시도해주세요");
			}//else
		}//success
	})//ajax
}//reportAjax
</script>

</head>
<body>
<div style="text-align: center; margin-top: 50px; font-style: pretendard">
<h3 >신고하기</h3>
</div>

<form id="btn" action="">
<div style="text-align: center; margin-top: 40px; font-style: pretendard">
<input type="radio" name="type" id="type" value="광고성 콘텐츠(상점)이에요"/>광고성 콘텐츠(상점)이에요<br><br>
<input type="radio" name="type" id="type"  value="상품정보가 부정확해요"/>상품정보가 부정확해요<br><br>
<input type="radio" name="type" id="type"  value="거래 금지 품목으로 판단돼요."/>거래 금지 품목으로 판단돼요.<br><br>
<input type="radio" name="type" id="type"  value="사기가 의심돼요"/>사기가 의심돼요<br><br>
<input type="radio" name="type" id="type"  value="전문 업자 같아요."/>전문 업자 같아요.<br><br>
<input type="button" class="btn btn-dark" id="reportBtn" value="신고하기"/>
</div>
</form>

</body>
</html>