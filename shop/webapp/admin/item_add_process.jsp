<%@page import="admin.vo.ProductManageVO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<!-- 태균이가 만든거 -->
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

/* 인영 - 주문관리 style  시작*/
#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 
#background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
height: 150%; width: 80%;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
</style>
<!-- 태균이가 만든거 끝-->

<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
});
</script>
</head>
<body>
<%-- <jsp:useBean id="pVO" class="admin.vo.ProductManageVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="pVO"/> --%>
<%
//
File uploadDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload/goods");
int maxSize=1024*1024*30;
MultipartRequest mr = new MultipartRequest( request, uploadDir.getAbsolutePath() , maxSize , "UTF-8" , new DefaultFileRenamePolicy() ) ;
ProductDAO pDAO= ProductDAO.getInstance();
ProductManageVO pVO= new ProductManageVO();
pVO.setGoodsCode(mr.getParameter("goodsCode"));
pVO.setGoodsName(mr.getParameter("goodsName"));
pVO.setMainImg(mr.getFilesystemName("mainImg"));
pVO.setImg1(mr.getFilesystemName("img1"));
pVO.setImg2(mr.getFilesystemName("img2"));
pVO.setImg3(mr.getFilesystemName("img3"));
pVO.setTmi(mr.getParameter("tmi"));
pVO.setPrice(Integer.parseInt(mr.getParameter("price")));
pVO.setQuantity(Integer.parseInt(mr.getParameter("quantity")));
pVO.setCategoryCode(mr.getParameter("goodsCode").substring(0, 2));
pVO.setEngTmi(mr.getParameter("engTmi"));
pVO.setTop(mr.getParameter("top"));
pVO.setHeart(mr.getParameter("heart"));
pVO.setBase(mr.getParameter("base"));
pVO.setIng(mr.getParameter("ing"));
pVO.setDetailImg(mr.getFilesystemName("detailImg"));

//

try{
	pDAO.insertinfo(pVO);
}catch (SQLException se) {
	se.printStackTrace();
}
%>
<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="text" id="mainTitle">
			<strong>상품등록</strong>
		</div>
		<div id="background_box"> <!-- 각자 원하는데로 사용 -->
 				 <div style="margin-top: 350px ;text-align: center;"><%= mr.getParameter("goodsName")%>의 상품 등록이 완료되었습니다. </div> 
		</div>
	</div>	
</div>
</body>
</html>