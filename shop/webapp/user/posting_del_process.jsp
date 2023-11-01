<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.UserReviewDAO"%>
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
<body>
<% 

UserReviewDAO uDAO= UserReviewDAO.getInstance();
File saveDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload/review");
int maxSize=1024*1024*30;
MultipartRequest mr = new MultipartRequest( request, saveDir.getAbsolutePath() , maxSize , "UTF-8" , new DefaultFileRenamePolicy() );
String rcode= mr.getParameter("rcode");
System.out.println(rcode+"del");
try{
	 uDAO.updateCancle(Integer.parseInt(rcode));
	

	
	
}catch (SQLException se) {
	se.printStackTrace();
}//end catch%>
<div style=" margin-top: 300px; margin-left: 150px; font: pretendard; " >
리뷰 삭제가 완료 되었습니다.
</div>
</body>
</html>