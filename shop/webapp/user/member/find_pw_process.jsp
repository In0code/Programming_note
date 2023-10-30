<%@page import="member.vo.UserVO"%>
<%@page import="member.vo.LoginVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% 
    request.setCharacterEncoding("UTF-8");
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
<jsp:useBean id="uVO" class="member.vo.UserVO" scope="page"/>
<jsp:setProperty property="*" name="uVO"/>
<%
	MemberDAO mDAO=MemberDAO.getInstance();
try{
	boolean flag = mDAO.selectPw(uVO);
	session.setAttribute("tempId",uVO.getId());
	if( flag != false) {
	//System.out.println(flag);
%>
	<script type="text/javascript">
		location.href='reset_pw.jsp';
	</script>
<%	
	}else{
%>
		<script>
		    // 사용자가 없을 때의 처리
		    // 예: 에러 메시지를 보여주거나 다른 페이지로 리다이렉트
		    alert("입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
		    history.go(-1);
		</script>
<%
	}//end else
		
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>
</body>
</html>