<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ not empty adminId }">
	<c:redirect url="dashboard.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RE:TRO Admin</title>
<meta name="theme-color" content="#712cf9">
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQeury CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap 5.3 -->
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Pretendard -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />

<style>

html,
body {
  height: 90%;
  font-family: Pretendard Variable;
}

.form-signin {
  max-width: 330px;
  padding: 1rem;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>

<script type="text/javascript">
$(function() {
	  $("#loginBtn").click(function(){
		 
		   checkNull(); 
		   /* $("#frm").submit(); */
	   })//click
	   
	  $("#id").keydown(function( evt ){
	        if(evt.which == 13){
	            checkNull();
	        }//end if
	    });//end keydown

	    $("#pw").keydown(function( evt ){
	        if(evt.which == 13){
	            checkNull();
	        }//end if
	    });//end keydown

	   
	    function checkNull(){
	    
	    	var id=$("#id").val();
	    	var pass=$("#pw").val();

	    	$("#id").focus();
	    	if( id.replace(/ /g,"") == ""){
	    	    $("#Warn").html("<span>아이디와 비밀번호를 입력해주세요</span>");
	    	    $("#id").val("");
	    	    return;
	    	}//end if

	    	$("#pw").focus();
	    	if( pass.replace(/ /g,"")  ==""){
	    	    $("#Warn").html("<span>아이디와 비밀번호를 입력해주세요</span>");
	    	    $("#pw").val("");
	    	    return;
	    	}//end if

	    	 	$("#frm").submit();
	    	}//chkNull
});//ready


</script>

</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">

<%-- <%
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie cookie : cookies){
		if(cookie.getName().equals("adminId")){
			pageContext.setAttribute("adminIdValue", cookie.getValue());
			break;
		}
	}
}
%> --%>

<div class="form-signin w-100 m-auto">
  <form id="frm" method="post" action="admin_login_process.do">
    <img class="mb-4" src="http://localhost/retro_prj/common/images/admin_login_img.png" alt="" width="249" height="101" style="margin-left:20px">
    <h1 class="h3 mb-3 fw-normal"></h1>
   
	<div style="text-align: center"><c:out value="${requestScope.msg }"/></div>
	 <br>
    <div class="form-floating">
      <input type="text" class="form-control" name="id" id="id" placeholder="Id" value="${ adminIdValue }" >
      <label for="floatingInput" style="font-family: 'Pretendard Variable'">아이디</label>
    </div>
    
    <div class="form-floating">
      <input type="password" class="form-control" name="pw" id="pw" placeholder="Password">
      <label for="floatingPassword">비밀번호</label>
    </div>
  
    
    <div id="Warn">
    </div>
    <br>
    <input id="loginBtn" class="btn btn-primary w-100 py-2" type="button" 
    style="background-color: #FE8890; border-color: #FE8890;" value="로그인">
  </form>
</div>

</body>
</html>