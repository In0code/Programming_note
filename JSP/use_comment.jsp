<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
1~100������ �� ��� �ϴ� �ڵ� �ۼ�
<%-- JSP�ּ��� Java code�� �������� �ʴ´� 
<% 
int sum=0;
for(int i=1; i<101; i++){
	sum+= i;
}//end for 
%>
<%= sum %>
 --%>
 
 <% 
 //int i;  // Java �ּ�
int sum=0;
for(int i=1; i<101; i++){
	sum+= i;
}//end for 
%>
<!--  <%= sum %> -->
</body>
</html>