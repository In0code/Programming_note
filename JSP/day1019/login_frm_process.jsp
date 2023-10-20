<%@page import="kr.co.sist.member.vo.UserDataVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.dao.LoginDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="로그인 처리" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    if("GET".equals(request.getMethod().toUpperCase())){
    	response.sendRedirect("main.jsp");
    	return;
    }//end if
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/jsp_prj/common/main/favicon.png">
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
<jsp:useBean id="lVO" class="kr.co.sist.member.vo.LoginVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>
<%
//암호화
lVO.setPass(DataEncrypt.messageDigest("MD5", lVO.getPass()));

LoginDAO lDAO=LoginDAO.getInstance();
try{
UserDataVO udVO=lDAO.selectLogin(lVO);

if(udVO!= null){
	session.setAttribute("sesId", lVO.getId());
	session.setAttribute("userData", udVO);
	
	response.sendRedirect("main.jsp");
}else{
	%>
아이디나 비밀번호를 확인해 주세요<br/>
<a href="login_frm.jsp">로그인</a>	
	<%
}//end else

}catch(SQLException se){
	se.printStackTrace();	
}
%>

</body>
</html>






