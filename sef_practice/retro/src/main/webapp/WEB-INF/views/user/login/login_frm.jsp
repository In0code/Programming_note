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
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
	.inputBox {
	 border:none;
	  border-bottom: 1px solid #ebebeb;
	  font-size: 15px;
	  line-height: 22px;
	  width: 450px; 
	  height:40px; 
	  outline: none;
	  margin-top: 15px;
	  font-family:pretendard;
	}
	label{font-weight: bold; font-family:Pretendard Variable}
	
	.ul {
    list-style: none;
    margin-left: 620px;
    font-family:Pretendard Variable;
    font-size:13px
    
}
.li {
	   list-style: none;
    margin-left: 200px;
    font-family:Pretendard Variable;
    font-size:13px;
    float: left;
    text-align:center;
    padding:8px;
    margin-right:-140px
}
a {
  text-decoration: none;
  color: #222222
}
a:hover { color:#222222 }


</style>
<script type="text/javascript">
$(function(){
   $("#loginBtn").click(function(){
	   alert("버튼 눌림")
	   checkNull(); 
	   /* $("#frm").submit(); */
   })
   
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
 alert("check");
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
 <c:import url="/common/cdn/cdn.jsp" /> 

 <jsp:include page="/common/cdn/header.jsp"/>
<body>
<form id="frm" action="login_process.do" method="post">
<div style="margin: 0px auto; text-align: center">
<img src="http://localhost/retro_prj/common/images/main_logo.png" style="width:160px; margin-left: 870px; margin-top: 150px "/>
<br><div id="Warn" style="margin-top: 10px"><c:out value="${requestScope.msg }"/></div><br>

</div>
<div style="text-align: center;  margin-top: 80px" id="LoginWrap">

<label style="margin-left: -410px">아이디</label><br>
<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요"  class="inputBox" /> 
<br>
<label style="margin-left: -400px; margin-top: 50px">비밀번호</label><br>
<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요"  class="inputBox" /> 
<br>
<input type="button"  style="margin-top:40px; border-radius: 12px; width:450px; height: 50px; font-family:Pretendard Variable;    color:#FFFFFF; background-color:#333333  " id="loginBtn" name="loginBtn" value="로그인" class="btn btn-dark"/>
<div style="text-align: center; margin-top: 30px" >
<ul class="ul" ><li class="li"><a href="/join" class="look_link" >가입</a></li><li class="li"> <a href="find_id_frm.do" class="look_link" >아이디 찾기</a></li><li class="li"><a href="find_pw_frm.do" class="look_link" >비밀번호 찾기</a></li></ul>
</div>
</div>


</form>
<div style="margin-top:300px"></div>
 <jsp:include page="/common/cdn/footer.jsp"/> 
</body>
</html>