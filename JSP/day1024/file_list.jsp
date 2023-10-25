<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
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
   
});//ready
</script>

</head>
<body>
<table class="table">
<thead>
<tr>
<td>번호</td>
<td>파일명</td>
<td>업로드일</td>
<td>크기</td>
</tr>
</thead>
<tbody>
<%
File uploadDir=new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload");
File[] list=uploadDir.listFiles();
if( list == null ){ //파일이 없다면
%>
<tr>
<td colspan="4">업로드된 파일이 존재하지 않습니다<br/>
<a href="upload_form.jsp">업로드</a>
</td>
</tr>
<% }else{ 
	File file=null;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd a HH:mm");
	for(int i=0; i<list.length; i++){
		file=list[i];
%>
<tr>
	<td><%= i+1 %></td>
	<td><a href="../upload/<%= file.getName() %>"><%= file.getName() %></a></td>
	<td><%= sdf.format(new Date(file.lastModified())) %></td>
	<td><%= file.length() %></td>
</tr>
<% 
		}//end for
	}//end else %>
</tbody>
</table>
</body>
</html>






