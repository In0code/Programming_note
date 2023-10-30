<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.member.dao.BoardDAO2"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String paramNum = request.getParameter("num"); // 원글 글번호
JSONObject jsonObj = new JSONObject();
jsonObj.put("result", false);

if (paramNum != null) {
	int num = Integer.parseInt(paramNum);

	BoardDAO2 bDAO = BoardDAO2.getInstance();
	try {
		List<ReplyVO> list = bDAO.selectReplyList(num);

		JSONArray jsonArr = new JSONArray();
		JSONObject jsonTemp = null;
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for (ReplyVO rVO : list) { // 조회 결과를 사용하여 반복
	jsonTemp = new JSONObject(); // 조회결과를 JSONObject에 저장
	jsonTemp.put("num", rVO.getNum());
	jsonTemp.put("content", rVO.getContent());
	jsonTemp.put("writer", rVO.getWriter());
	jsonTemp.put("reply_num", rVO.getReply_num());
	jsonTemp.put("input_date", sdf.format( rVO.getInput_date()) );
	//JSONObject을 JSONArray에 저장
	jsonArr.add(jsonTemp);
		} //end for
		//모든 데이터를 가진 JSONArray를 JSONObject에 저장
		jsonObj.put("data", jsonArr);
		jsonObj.put("dataSize", jsonArr.size());
		jsonObj.put("dataEmpty", list.isEmpty());
		jsonObj.put("result", true );

	} catch (SQLException se) {
		se.printStackTrace();
	} //end catch
} //end if

out.print(jsonObj.toJSONString());

%>