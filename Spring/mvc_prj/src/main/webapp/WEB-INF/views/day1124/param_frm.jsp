<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/mvc_prj/common/main/favicon.png">
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- jQuery CDN 끝 -->
 <style type="text/css">
   
 </style>
 <script type="text/javascript">
 $(function(){
    $("#useReqBtn").click(function(){
       var frm=document.frm;
       frm.action="use_req.do";
       $("#frm").submit();
    });//click

    $("#useReqBtn2").click(function(){
       var frm=$("#frm")[0];
       frm.action="day1127/use_post_req.do";
       frm.method="post"
       alert( frm.action+" 으로 " + frm.method + "방식 요청" );
    
       $("#frm").submit();
    });//click
    
    $("#useReqBtn3").click(function(){
    	 var frm=$("#frm")[0];
    	 
       frm.action="day1127/use_single_req.do";
       frm.method="post"
    
       $("#frm").submit();
    });//click
    
    $("#useReqBtn4").click(function(){
    	 var frm=$("#frm")[0];
    	 
       frm.action="day1127/use_vo_req.do";
       frm.method="post"
    
       $("#frm").submit();
    });//click
 });//ready
 </script>
</head>
<body>
<form name="frm" id="frm">
<label>이름</label><input type="text" name="name" class="inputBox"/><br/>
<label>나이</label><input type="text" name="age" class="inputBox"/><br/>
<label>나이</label><input type="text" name="age" class="inputBox"/><br/>
<input type="button" value="전송" class="btn btn-success btn-sm" id="useReqBtn"/><br/>
<input type="button" value="POST전송" class="btn btn-success btn-sm" id="useReqBtn2"/><br/>
<input type="button" value="단일형 값 받기" class="btn btn-success btn-sm" id="useReqBtn3"/><br/>
<input type="button" value="VO 값 받기" class="btn btn-success btn-sm" id="useReqBtn4"/><br/>

</form>
</body>
</html>