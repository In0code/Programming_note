<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info = "" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.134/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- bootstrap CDN-->
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQuery CDN -->
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		if($("#name").val() == ""){
			alert("이름은 필수 입력");
			$("#name").val("");
			return;
		}//end if
	
	$("#frm").submit();	
	
	});//click
})//ready
</script>


</head>
<body>
HttpSession interface를 구현한 클래스 : <%= session %><br/>
<form class="row g-3" action="why_session_b.jsp" id="frm">
  <div class="col-auto">
    <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="이름">
  </div>
  <div class="col-auto">
    <input type="text" class="form-control" id="name" name="name" placeholder="이름입력">
  </div>
  <div class="col-auto">
    <input type="button" class="btn btn-primary" id="btn" value="입력">
  </div>
</form>
</body>
</html>