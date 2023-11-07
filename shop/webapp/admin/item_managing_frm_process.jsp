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

</style>
<script type="text/javascript">
$(function(){
   
});//ready

</script>

</head>
<jsp:useBean id="pVO" class="admin.vo.ProductManageVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="pVO"/>
<%ProductDAO pDAO= ProductDAO.getInstance();
String gcode="BC0001";//Integer.parseInt(request.getParameter("gcode"));
System.out.println(gcode);
try{
	
pDAO.updateInfo(gcode, pVO);
pageContext.setAttribute("product", pVO);
}catch(SQLException se ) {
	se.printStackTrace();
} %>
<body>
상품 상세정보 수정이 완료되었습니다.
</body>
</html>