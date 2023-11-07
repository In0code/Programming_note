<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="admin.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% ProductDAO pDAO = ProductDAO.getInstance();

File uploadDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload/goods");
int maxSize=1024*1024*30;
MultipartRequest mr = new MultipartRequest(request , uploadDir.getAbsolutePath(), maxSize,"UTF-8",new DefaultFileRenamePolicy());
String mainImgName=mr.getFilesystemName("mainImg");
System.out.println(mainImgName);
String img1Name=mr.getFilesystemName("img1");
String img2Name=mr.getFilesystemName("img2");
String img3Name=mr.getFilesystemName("img3");
String detailImgName=mr.getFilesystemName("detailImg");
String[] fileName={mainImgName,img1Name,img2Name,img3Name,detailImgName};
String gcode="BC0001";//mr.getParameter("gcode");//
int blockSize=1024*1024*5;
if(mainImgName!=null) {
	pDAO.updateMainImg(gcode, mainImgName);
}
if (img1Name!=null) {
	pDAO.updateImg1(gcode, img1Name);
} 
if (img2Name!=null) {
	pDAO.updateImg2(gcode, img2Name);
}
if (img3Name!=null) {
	pDAO.updateImg3(gcode, img3Name);
} 
if (detailImgName!=null) {
	pDAO.updateDetail(gcode, detailImgName);
}
//
JSONObject json = new JSONObject();
json.put("mainImgName", mainImgName);
json.put("img1Name", img1Name);
json.put("img2Name", img2Name);
json.put("img3Name", img3Name);
json.put("detailImgName", detailImgName);



out.print(json.toJSONString());
%>