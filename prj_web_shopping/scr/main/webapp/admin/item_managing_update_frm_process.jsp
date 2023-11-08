<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
body{
 margin: 0px;
}
#wrap{
	
}
#right{
	width: calc(100vw - 240px); height: 100%;float: right;
	background: blue;
}
#left{
	min-width: 240px;height: 100%;float: left;
	padding: 0px;
	background: yellow;
}
#rightHeader{
	min-height: 55px;
	padding-top: 8px;padding-bottom: 5px;
	padding-right: 15px;
	background: #FFFFFF;
}
#rightBody{
	width: 100%; min-height: 500px;float: right;
	padding: 40px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 
#background_box{

background-color:  #FFFFFF;
color:  #333333;
height: 150%; width: 100%;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
</style>
<script type="text/javascript">
$(function(){
   //
});//ready

</script>

</head>
<jsp:useBean id="pVO" class="admin.vo.ProductManageVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="pVO"/>
<%ProductDAO pDAO= ProductDAO.getInstance();
String gcode=request.getParameter("goodsCode");//Integer.parseInt(request.getParameter("gcode"));
try{
pDAO.updateInfo(gcode, pVO);
pageContext.setAttribute("product", pVO);
}catch(SQLException se ) {
	se.printStackTrace();
}// %>
<body>
	<div id="rightBody" style="height: 1000px">
		<div class="text" id="mainTitle" style="margin-left: -30px">
			<strong>상품 상세 정보</strong>
		</div>
		<div id="background_box" style="width: 1550px; height:750px; font-family:  pretendard; margin-left: -30px"> <!-- 각자 원하는데로 사용 -->
		<div style="margin-top: 350px ;text-align: center;"><%= pVO.getGoodsName()%>의 상품 수정이 완료되었습니다. </div>
		</div>
</div>
</body>
</html>