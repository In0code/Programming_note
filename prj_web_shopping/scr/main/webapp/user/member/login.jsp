<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="로그인"%>
<jsp:include page="../../cdn/cdn.jsp" />
<%
	String id = (String)session.getAttribute("sesId");
	if(id != null){
		response.sendRedirect("http://localhost/prj_web_shopping/user/main.jsp");
		return;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
#login {
	text-align: center; /* 가운데 정렬 */
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 300px;
}

#login fieldset {
	margin: 10px 0px 10px 0px;
}

.inputForm{
	 width: 100%; /* 입력 필드의 너비를 100%로 설정하여 동일하게 만듭니다. */
    box-sizing: border-box; /* 너비에 패딩과 테두리를 포함시킵니다. */	
}
.btnLogin button {
    font-size: 11px; /* 원하는 크기로 조절합니다. */
}

#footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	text-align: center;
	margin-left: 330px; /* footer를 가운데로 이동하는데 필요한 스타일 */
}

#login{
	font-family : 'Pretendard Medium';
}

.btnCss {
	background-color: black;
	border: 1px solid black;
	color: white; 
	font-size:15px; 
	width:220px; 
	margin : 10px 20px 100px 0px;
	font-family:"Pretendard Medium"
}

.btnCss:hover {
	background-color: white;
	transition: background-color 0.5s;
	border: 1px solid black;
	color: black;
}

</style>
<script type="text/javascript">
$(function(){
	$("#id").keydown(function(evt){
		if(evt.which == 13){
			checkNull();
		}//end if
	});//end keydown
	
	$("#pw").keydown(function(evt){
		if(evt.which == 13){
			checkNull();
		}//end if
	})//end keydown
	
	$("#btnLogin").click(function(){
		checkNull();
	})//end click
});//ready

function checkNull(){
	var id=$("#id").val();
	var pw=$("#pw").val();


	$("#id").focus();
	if(id.replace(/ /g,"") == ""){
	    $("#warningDiv").html("<span style='color:red'>아이디를 입력해주세요.</span>");
	    $("#id").val("");
	    return;
	}

	$("#pw").focus();
	if(pw.replace(/ /g,"")  ==""){
	    $("#warningDiv").html("<span style='color:red'>비밀번호를 입력해주세요.</span>");
	    $("#pw").val("");
	    return;
	}

  /*   $("#frm").submit(); */
    
    $.ajax({
    	url : "login_process.jsp",
    	type : "post",
    	data : "id="+id+"&pass="+pw,
    	dataType : "text",
    	error : function(xhr){
    		console.log(xhr.status);
    	},
    	success : function(flag){
    		if(flag == 'true'){
    			location.href = "mypage.jsp";
    		}else{
    		    $("#warningDiv").html("<span style='color:red'>아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.</span>");
    		    $("#pw").val("");
    		}
    	}
    });
    
}//checkNull
</script>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<div id="login">
		<h6 style="font-weight: bold">로그인</h6><br>
		<form action="login_process.jsp" method="post" name="frm" id="frm">
		<fieldset>
			<input type='text' id="id" name="id" class="inputForm" placeholder="아이디" style="height:40px"/>
		</fieldset>
		<fieldset>
			<input type='password' id="pw" name="pass" class="inputForm"  placeholder="비밀번호" style="height:40px"/>
		</fieldset>		
		<div id="warningDiv"></div>
		<!-- 로그인 버튼  -->
		<div>
			<input type="button" id="btnLogin" class="btnCss" 
			style="height:40px; width:300px; font-size: 12px; font-family:Pretendard Medium" value="로그인"/>
		</div>
		</form>
		
		<form action="mypage.jsp" method="post" id="frm2" >
		<input type="hidden" id="name" name="name">
		</form>
		
		<br>
		<!-- 아이디찾기, 비밀번호찾기, 회원가입 버튼 -->
		<div class="btn_etc">
			<a href="find_id.jsp">아이디찾기</a><span></span> |
			<a href="find_pw.jsp">비밀번호찾기</a><span></span> |
			<a href="register.jsp">회원가입</a>
		</div>
	</div>
	
	<%@ include file="../layout/footer.jsp" %>
</body>
</html>    
