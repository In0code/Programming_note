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
	
	if(id != null && !"".equals(id)){
		idFlag=true;
		flag= wlDAO.getGcode(id,gcode);
		 if(flag){
			 wlDAO.deleteWishList(id, gcode);
		 }else{
		 wlDAO.intsertWishList(id, gcode);
		 }//end else
	}//end if
	jsonObj.put("flag", flag);
	jsonObj.put("idFlag", idFlag);
}catch(SQLException se){
	se.printStackTrace();
}//end catch
out.print(jsonObj.toJSONString());
%>
