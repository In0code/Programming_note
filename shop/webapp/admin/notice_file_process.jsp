<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
<%
File saveDir = new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload");

int maxSize = 1024*1024*30;
try{
MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());

String uploader = mr.getParameter("uploader");
String age = mr.getParameter("age");

//input type="file"인 것
String originFile = mr.getOriginalFileName("upFile");
String newFile = mr.getFilesystemName("upFile");

boolean flag = false;
if(newFile != null) {
	File tempFile = new File(saveDir.getAbsolutePath()+"/"+newFile);
	
	int limitSize = 1024*1024*5;
	if(tempFile.length() > limitSize) {
		flag = true;
		tempFile.delete();
	}
}

if(!flag) { %>
<strong>업로드 성공!</strong><br>
업로더 : <%=uploader %><br>
나이 : <%=age %><br>
파일명 : <%=originFile %><br>
파일명 : <%=newFile %>(<%=originFile %>)<br>
	
<%} else { %>
	originFile은 5Mbyte를 초과하였습니다.<br>
	5Mbyte 이내의 파일만 업로드 가능합니다.
<%}
%>
<a href="file_list.jsp" class="btn btn-success">파일 리스트</a>
<a href="javascript:history.back()">뒤로</a>
<%
} catch (IOException ie) {
	ie.printStackTrace();
	out.println("파일 업로드 처리 중 문제 발생");
}
%>
</body>
</html>