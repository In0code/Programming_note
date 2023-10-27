<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.148/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   $("#age").change(function(){
      if($("#age").val()!="N/A"){
         
         var jsonParam = { age:$("#age").val()};
         
         $.ajax({
            url:"../day1025/jsonObj2.jsp",
            type:"get",
            data: jsonParam,
            dataType:"json",
            error:function(xhr){
               console.log(xhr.status)
            },
            success:function(jsonObj){
               var output="데이터 반환일 : "+jsonObj.resultDate+"<br/>";
               output+="작성자 / License: "+jsonObj.writer+" / "+jsonObj.license+"<br/>";
               output+="조회건수: "+jsonObj.dataSize;
               
               if(jsonObj.resultFlag){//조회결과 있음
                  output += "<table class='table'>";
                  
                     output += "<thead>";
                  
                     output += "<tr>";                        
                     output += "<th>번호</th><th>이름</th><th>나이</th><th>이메일</th><th>가입일</th>";                        
                     output += "</tr>";
                     
                     output += "</thead>";
                     
                     output += "<tbody>";
                  
                     if(jsonObj.dataSize==0){
                        output+="<tr><td colspan='5'>"+$("#age").val()+"살은 존재하지 않습니다.</td></tr>";
                     }//end if
                     
                     $.each(jsonObj.data, function(i, json){
                        output+="<tr><td>"+json.num+"</td><td>"+json.name+"</td><td>"+json.age+"</td><td>"+
                        json.email+"</td><td>"+json.input_date+"</td></tr>";
                     });//each
                     
                     output += "</tbody>";
                  output += "</table>";
               }//end if
               $("#output").html(output);
               
            }
         });//ajax
         
      }//end if
   });//change
});//ready
</script>

</head>
<body>
<select id="age">
   <option value="N/A">--나이선택--</option>
   <option value="24">24</option>
   <option value="25">25</option>
   <option value="26">26</option>
</select>
<div id="output">

</div>
</body>
</html>

