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
    //queryString을 생성하여 parameter 전달
    var name=$("#name").val();
    var age=$("#age").val();

    var queryString="name="+name+"&a="+age+"&addr=서울시";

    $.ajax({
        url : "ajax_param_process.jsp",
        type : "GET",
        data : queryString,
        dataType : "text",
        error : function(xhr){
            console.log( xhr.status );
        },
        success : function( textData ){
            var data=textData.split(",");
            $("#outName").html( data[0] );
            $("#outAge").html( data[1] );
            $("#outAddr").html( data[2] );
        }
    });//ajax
   });//click

   $("#btn2").click(function(){
    //JSONObject 으로 queryString 생성
    var jsonObj={ name : $("#name").val(),
                  a : $("#age").val(),
                  addr : "서울시 자양동"
                  };
    $.ajax({
        url : "ajax_param_process.jsp",
        type : "POST",
        data : jsonObj,
        dataType : "text",
        error : function(xhr){
            console.log( xhr.status );
        },
        success : function( csvData ){
        	  var data=csvData.split(",");
              $("#outName").html( data[0] +"님");
              $("#outAge").html( data[1] +"살");
              $("#outAddr").html( data[2] );
        }

    });//ajax
    
   })//click

});//ready
</script>

</head>
<body>
<form action="">
<label>이름</label><input type="text" name="name" id="name" class="inputBox"/></br>
<label>나이</label><input type="text" name="age" id="age" class="inputBox"/></br>
<input type="button" value="queryString 파라메터 요청" class="btn btn-info" id="btn"/>
<input type="button" value="JSONObject 파라메터 요청" class="btn btn-info" id="btn2"/>

</form>
<div>
이름 : <span id="outName"></span><br/>
나이 : <span id="outAge"></span><br/>
주소 : <span id="outAddr"></span><br/>
</div>
</body>
</html>