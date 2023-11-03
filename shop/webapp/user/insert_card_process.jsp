<%@page import="org.json.simple.JSONObject"%>
<%@page import="user.dao.BuyDAO"%>
<%@page import="user.vo.BuyPaymentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info=""%>
<jsp:useBean id="VO" class="user.vo.BuyPaymentVO" scope="page"/>
<jsp:setProperty property="*" name="VO"/>
<%
JSONObject json = new JSONObject();
json.put("flag", false);

BuyPaymentVO bpVO = (BuyPaymentVO)pageContext.getAttribute("VO");

BuyDAO bDAO = BuyDAO.getInstance();
int temp = bDAO.insertPriceInfo(bpVO);

if(temp != 0) {
	json.put("flag", true);
}
out.println(json.toJSONString());
%>