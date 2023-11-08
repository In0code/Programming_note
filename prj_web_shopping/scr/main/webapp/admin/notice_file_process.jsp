<%@page import="admin.dao.NoticeDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info="사진 업로드 하는 jsp"%>
<%
File saveDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload/notice");

int maxSize = 1024*1024*30; //30Mb
MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());

//input type="file"인 것
String newFile = mr.getFilesystemName("uploadImg");

boolean flag = false;
if(newFile != null) {
	File tempFile = new File(saveDir.getAbsoluteFile()+"/"+newFile);
	
	int limitSize = 1024*1024*5;
	if(tempFile.length() > limitSize) {
		flag = true;
		tempFile.delete();
	}
	
}

JSONObject jsonObj = new JSONObject();
if(!flag) { 
	jsonObj.put("uploadFlag", true);
	jsonObj.put("msg","업로드 성공하였습니다.");
	jsonObj.put("image", newFile);

} else {
	jsonObj.put("uploadFlag", false);
	jsonObj.put("msg", "originFile은 5Mbyte를 초과하였습니다.5Mbyte 이내의 파일만 업로드 가능합니다.");
}
out.print(jsonObj.toJSONString());
%>