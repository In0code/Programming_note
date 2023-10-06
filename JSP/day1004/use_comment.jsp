<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
});//ready
</script>

</head>
<body>
1~100까지의 합 출력 하는 코드 작성
<%-- JSP주석은 Java code로 생성되지 않는다 
<% 
int sum=0;
for(int i=1; i<101; i++){
	sum+= i;
}//end for 
%>
<%= sum %>
 --%>
 
 <% 
 //int i;  // Java 주석
int sum=0;
for(int i=1; i<101; i++){
	sum+= i;
}//end for 
%>
<!--  <%= sum %> -->
</body>
</html>