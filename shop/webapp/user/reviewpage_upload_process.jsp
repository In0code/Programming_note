<%@page import="admin.dao.UserReviewDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
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
<%
UserReviewDAO uDAO = UserReviewDAO.getInstance();
//파일업로드
File uploadDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload/review");
int maxSize=1024*1024*30;
MultipartRequest mr = new MultipartRequest(request , uploadDir.getAbsolutePath(), maxSize,"UTF-8",new DefaultFileRenamePolicy());
String fileName=mr.getFilesystemName("reviewImg");
String gcode=mr.getParameter("gcode");

File uploadFile= new File(uploadDir.getAbsoluteFile()+"/"+fileName);
boolean flag=false;
int blockSize=1024*1024*5;
if(uploadFile.length() > blockSize){
	uploadFile.delete();
	flag=true;
}//end if 


JSONObject json = new JSONObject();
json.put("fileName", fileName);

//insert 



%>
<body>

</body>
</html>