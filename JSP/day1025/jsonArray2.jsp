
.<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.StudentVO"%>
<%@page import="kr.co.sist.member.dao.StuDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//StuDAO를 사용하여 검색된 결과로 JSONObject를 생성하여 JSONArray에 추가하고,
//출력하는 코드를 작성해보세요

//JSONObject 이름 : num, name, age, email, 
JSONArray jsonArr=new JSONArray();


StuDAO sDAO=StuDAO.getInstance();
try{
	List<StudentVO> list=sDAO.selectAllStudent();
	JSONObject jsonObj = null;
	
	for(StudentVO sVO : list){
		jsonObj=new JSONObject();
		jsonObj.put("num", sVO.getNum());
		jsonObj.put("name", sVO.getName());
		jsonObj.put("age", sVO.getAge());
		jsonObj.put("email", sVO.getEmail());
		jsonObj.put("input_date", sVO.getInput_date());
		
		jsonArr.add( jsonObj );
	}//end for
	pageContext.setAttribute("jsonArr", jsonArr);
	
}catch(SQLException se){
	se.printStackTrace();
}//end catch

%>
${ jsonArr }