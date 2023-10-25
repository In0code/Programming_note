<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="업로드 처리" %>
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
<%--
enctype="multipart/form-data"이므로 request 내장 객체로 web parameter를 받을 수 없다
 <%= request.getParameter("uploader") %> --%>
<%
//1. 업로드될 파일이 저장된 폴더의 경로를 얻기
File saveDir=new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload");
//2. 파일의 최대 크기 설정 ( 5Mbyte )
int maxSize=1024*1024*30;

try{
//3. 파일 업로드 컴포넌트를 생성한다 ( 파일 업로드가 진행된다 )
MultipartRequest mr=new MultipartRequest(request, saveDir.getAbsolutePath(),
		maxSize, "UTF-8", new DefaultFileRenamePolicy());

//4. 파라메터 받기 ( MultipartRequest 객체를 사용하여 파일업로드를 받는다)
String uploader=mr.getParameter("uploader");
String age=mr.getParameter("age");

//5. 업로드 파일명 받이 ( <input type="file")
String originFile=mr.getOriginalFileName("upFile");
String newFile=mr.getFilesystemName("upFile");

boolean flag=false;
if(newFile != null){
	File tempFile=new File( saveDir.getAbsolutePath()+" / "+newFile);
	int limitSize=1024*1024*5;
	if( tempFile.length() > limitSize ){
		flag=true;
		tempFile.delete(); //업로드된 파일을 지운다
	}//end if
}//end if

if( ! flag ){
%>
<strong>업로드 성공</strong>
업로더 : <%= uploader %><br/>
나이 : <%= age %><br/>
파일명 : <%= newFile %> (<%= originFile %>)<br/>
<%} else{ %>
<%= originFile %>은 5Mbyte를 초과하였습니다 <br/>
5Mbyte 이내의 파일만 업로드 가능합니다
<%}//end else %>
<a href="file_list.jsp" class="btn btn-success" >파일리스트</a>
<a href="javascript:history.back()">뒤로</a>

<%
}catch(IOException ie){
	ie.printStackTrace();
	out.println("파일업로드 처리 중 문제 발생");
}//end catch
%>

</body>
</html>











