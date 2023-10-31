<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.apache.catalina.tribes.group.interceptors.NonBlockingCoordinator"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
File uploadDir = new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload");
int maxSize=1024*1024*30;


MultipartRequest mr= new MultipartRequest( request, uploadDir.getAbsolutePath(),
		maxSize, "UTF-8", new DefaultFileRenamePolicy());
String fileName = mr.getFilesystemName("profileImg");
File uploadFile = new File( uploadDir.getAbsoluteFile()+" / "+fileName );

boolean flag=false;
int blockSize = 1024*1024*5;
if( uploadFile.length() > blockSize ){ // 최대 파일 크기 초과
	uploadFile.delete();
	flag = true;
}//end if

String id = mr.getParameter("id");
	
JSONObject json=new JSONObject();
json.put("uploadFlag", !flag);
json.put("fileName", fileName);
json.put("id", id );

out.print( json.toJSONString() );

%>