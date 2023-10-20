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
#loginWrap{ width: 500px;height: 400px; margin: 200px auto; text-align: center;}
#id ,#pass{ width: 400px;height: 60px;margin-top: 20px; font-size: 30px;}
#btnLogin{ width: 400px;height: 60px; font-size: 30px;background-color: #005FB8;margin-top: 20px; color: #EFFFF4;}

span{ font-size: 20px; color: #B01011}
</style>
<script type="text/javascript">
$(function(){
    $("#id").keydown(function( evt ){
        if(evt.which == 13){
            checkNull();
        }//end if
    });//end keydown

    $("#pass").keydown(function( evt ){
        if(evt.which == 13){
            checkNull();
        }//end if
    });//end keydown

    $("#btnLogin").click(function(  ){
        checkNull();
    });//end click
});//ready

function checkNull(){

   var id=$("#id").val();
   var pass=$("#pass").val();
   
   $("#id").focus();
   if( id.replace(/ /g,"") == ""){
       $("#idWarn").html("<span>아이디 없음</span>");
       $("#id").val("");
       return;
   }//end if
   
   $("#pass").focus();
   if( pass.replace(/ /g,"")  ==""){
       $("#passWarn").html("<span>비번 없음</span>");
       $("#pass").val("");
       return;
   }//end if
   $("#frm").submit();
   /* location.href="http://sist.co.kr"; */
}//chkNull
</script>
</head>
<body>
<div id="loginWrap">
<div>
<img src="../common/images/sist_logo.png"/>    
</div>
<form action="login_frm_process.jsp" method="post" name="frm"id="frm">
<div>
    <input type="text" name="id" id="id" class="inputBox" autofocus="autofocus"/>
    <div id="idWarn"></div>
</div>
<div>
    <input type="password" name="pass" id="pass" class="inputBox"/>
    <div id="passWarn"></div>
</div>
<div>
    <input type="button" value="로그인" id="btnLogin" class="btn btnLogin"/>
</div>
</form>
</div>
</body>
</html>