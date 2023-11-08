<%@page import="java.sql.SQLException"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% 
    request.setCharacterEncoding("UTF-8");
    String method=request.getMethod();
     if("GET".equals(method)){
     	response.sendRedirect("register.jsp");
     	return;
     }//end if
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
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
<body>
<jsp:useBean id="lVO" class="member.vo.LoginVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>
<%
DataEncrypt de=new DataEncrypt("a12345678901234567");
lVO.setPass(DataEncrypt.messageDigest("MD5", lVO.getPass()));

String tempId=(String)session.getAttribute("tempId");
lVO.setId(tempId);
MemberDAO mDAO=MemberDAO.getInstance();
try{
	int cntPw=mDAO.resetPw(lVO);
	
	if( cntPw == 1 ){
%>
	<script type="text/javascript">
		alert("비밀번호가 변경되었습니다.")
		location.href='login.jsp';
	</script>
<%		
	}else{
%>
	<script type="text/javascript">
		alert("시스템 오류 다시 시도해주세요.")
		history.go(-1);
	</script>
<% 		
	}//end if
	
}catch(SQLException se){
	se.printStackTrace();
}
%>
</body>
</html>














