<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
UserReviewDAO uDAO = UserReviewDAO.getInstance();
//파일업로드
File uploadDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload/review");
int maxSize=1024*1024*30;
MultipartRequest mr = new MultipartRequest(request , uploadDir.getAbsolutePath(), maxSize,"UTF-8",new DefaultFileRenamePolicy());
String fileName=mr.getFilesystemName("reviewImg");
String gcode=mr.getParameter("gcode");
String id=(String)session.getAttribute("sesId"); //session.getId();
int SeqRcode=0; 
File uploadFile= new File(uploadDir.getAbsoluteFile()+"/"+fileName);
boolean flag=false;
int blockSize=1024*1024*5;

if(fileName==null || uploadFile.length() > blockSize){
	uploadFile.delete();
	flag=true;
}//end if

if(!flag){
	if(fileName!=null){
		

	try{
		SeqRcode=uDAO.selectSeqRcode();
		uDAO.insertImg(fileName, gcode, SeqRcode, id);
		}catch(SQLException se){
			se.printStackTrace();
		}
	}

}
	
JSONObject json = new JSONObject();
json.put("fileName", fileName);
json.put("id",id);
json.put("uploadFlag", !flag);
json.put("SeqRcode", SeqRcode);
//insert 


out.print(json.toJSONString());
%>
