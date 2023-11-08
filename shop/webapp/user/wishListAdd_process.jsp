<%@page import="org.json.simple.JSONObject"%>
<%@page import="user.dao.WishListDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%@ page info="사용자 / 장바구니 / 장바구니 리스트에 상품 추가(insert) - 인영" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

WishListDAO wlDAO=WishListDAO.getInstance();
boolean flag = false;
boolean idFlag = false;
JSONObject jsonObj=new JSONObject();

try{
	String gcode=request.getParameter("gcode");
	String id=(String)session.getAttribute("sesId");
	
	if(id != null && !"".equals(id)){ //로그인을 했을때
		idFlag=true; 
		flag= wlDAO.getGcode(id,gcode); //조회결과가 있으면 true, 없으면 false
		 if(flag){ // 이미 관심상품에 상품이 있으면
			 wlDAO.deleteWishList(id, gcode); //상품 삭제
		 }else{ // 관심상품에 추가된 상품이 없으면
		 wlDAO.intsertWishList(id, gcode); // 상품 추가
		 }//end else
	}//end if
	jsonObj.put("flag", flag); // true면 이미 관심상품에 상품이 있음. false면 관심상품에 추가된 상품이 없음
	jsonObj.put("idFlag", idFlag); // true면 로그인 했음, false면 로그인 안했음
}catch(SQLException se){
	se.printStackTrace();
}//end catch
out.print(jsonObj.toJSONString());
%>
