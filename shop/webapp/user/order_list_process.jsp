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
if(!"o".equals(flag) || !"r".equals(flag)) {
	response.sendRedirect("order_table.jsp");
	return;
}

JSONObject jsonObj = new JSONObject();
jsonObj.put("dataFlag", false);

ClientOrderPageVO copVO = new ClientOrderPageVO();
copVO.setId("test");
copVO.setStartNum(Integer.parseInt(request.getParameter("startNum")));
copVO.setEndNum(Integer.parseInt(request.getParameter("endNum")));

List<ClientOrderVO> list = null;
if("o".equals(flag)) {
	list = ClientOrderDAO.getInstance().selectAllOrder(copVO);
} else {
	list = ClientOrderDAO.getInstance().selectAllRecall(copVO);
}

JSONArray jsonArr = new JSONArray();
JSONObject jsonTemp = new JSONObject();

for(ClientOrderVO cVO : list) {
	jsonTemp.put("orderNum", cVO.getOrderNum());
	jsonTemp.put("orderDate", cVO.getOrderDate());
	jsonTemp.put("img", cVO.getImg());
	jsonTemp.put("productName", cVO.getProductName());
	jsonTemp.put("amount", cVO.getAmount());
	jsonTemp.put("price", cVO.getPrice());
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