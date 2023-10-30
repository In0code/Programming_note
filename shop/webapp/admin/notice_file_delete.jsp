<%@page import="admin.dao.NoticeDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="javax.swing.DefaultBoundedRangeModel"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
File saveDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload/notice");
String fileName = request.getParameter("image");
String ncode = request.getParameter("ncode");

//input type="file"인 것

System.out.println("fileName : "+fileName);

boolean flag = false;
boolean dbflag = false;
if(fileName != null) {
	File tempFile = new File(saveDir.getAbsoluteFile()+"/"+fileName);
	tempFile.delete();
	
	if("".equals(ncode) || ncode == null) {
		return;
	}
	
	int result = NoticeDAO.getInstance().updateFileName(Integer.parseInt(ncode));
	if(result == 1) {
		dbflag = true;
	}
		flag = true;
}
	
JSONObject json = new JSONObject();
json.put("imgFlag", flag);
json.put("dbFlag", dbflag);
json.put("fileName", fileName);

out.print(json.toJSONString());
%>