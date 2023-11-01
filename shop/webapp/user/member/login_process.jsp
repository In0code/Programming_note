<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="member.vo.UserVO"%>
<%@page import="member.dao.LoginDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="로그인 처리" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    if("GET".equals(request.getMethod().toUpperCase())){  //HTTP 요청 메소드가 "GET"인지 확인
    	response.sendRedirect("mypage.jsp");						//조건이 만족되면, 이 부분은 사용자의 브라우저를 통해 "mypage.jsp" 페이지로 리다이렉션함. 
    	return;																			//GET 요청이 들어오면 사용자를 마이페이지로 보내는 역할.
    }//end if
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function() {
   
});//ready
</script>
</head>

<body>
<jsp:useBean id="lVO" class="member.vo.LoginVO" scope="page"/>
<jsp:setProperty property="*" name="lVO"/>
<%
//암호화
lVO.setPass(DataEncrypt.messageDigest("MD5", lVO.getPass()));
LoginDAO lDAO=LoginDAO.getInstance();

try{
	UserVO uVO=lDAO.selectLogin(lVO);
	
	if(uVO != null){
		session.setAttribute("sesId", lVO.getId());
		session.setAttribute("userData", uVO);
		
		response.sendRedirect("mypage.jsp");
	}else{
%>
	<script>
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			history.go(-1); // 이전 페이지로 이동
	</script>
<%
}
	
}catch(SQLException se){
	se.printStackTrace();
}
%>
</body>
</html>



