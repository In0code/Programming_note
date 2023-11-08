<%@page import="java.text.DecimalFormat"%>
<%@page import="user.vo.ClientOrderPageVO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="user.dao.ClientOrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="user.vo.ClientOrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page info="사용자 주문 내역 JSON으로 만듬"%>
<%
String flag = request.getParameter("flag");
String id = (String)session.getAttribute("sesId");

JSONObject jsonObj = new JSONObject();
jsonObj.put("dataFlag", false);

ClientOrderPageVO copVO = new ClientOrderPageVO();
copVO.setId(id);
copVO.setStartNum(Integer.parseInt(request.getParameter("startNum")));
copVO.setEndNum(Integer.parseInt(request.getParameter("endNum")));

List<ClientOrderVO> list = null;
if("o".equals(flag)) {
	list = ClientOrderDAO.getInstance().selectAllOrder(copVO);
} else {
	list = ClientOrderDAO.getInstance().selectAllRecall(copVO);
}

JSONArray jsonArr = new JSONArray();
JSONObject jsonTemp = null;

DecimalFormat df = new DecimalFormat("#,###,###,###");
int totalPrice = 0;
for(ClientOrderVO cVO : list) {
	jsonTemp = new JSONObject();
	jsonTemp.put("orderNum", cVO.getOrderNum());
	jsonTemp.put("ord_dno", cVO.getOrddno());
	jsonTemp.put("gcode", cVO.getGcode());
	jsonTemp.put("orderDate", cVO.getOrderDate());
	jsonTemp.put("img", cVO.getImg());
	jsonTemp.put("productName", cVO.getProductName());
	jsonTemp.put("amount", cVO.getAmount());
	jsonTemp.put("price", cVO.getPrice());
	
	totalPrice = cVO.getAmount() * cVO.getPrice();
	jsonTemp.put("totalPrice",df.format(totalPrice));
	
	jsonTemp.put("onProcess", cVO.getOnProcess());
	
	jsonArr.add(jsonTemp);
}

if(jsonArr.size() > 0) {
	jsonObj.put("dataFlag", true);
}

jsonObj.put("dataSize", jsonArr.size());
jsonObj.put("data", jsonArr);

out.print(jsonObj.toJSONString());
%>