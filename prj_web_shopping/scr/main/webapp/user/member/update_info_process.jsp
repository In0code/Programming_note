<%@page import="java.sql.SQLException"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="회원정보 수정 처리" %>
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
<jsp:useBean id="rVO" class="member.vo.RegisterVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>
<%
//전달된 정보(파라메터) 저장 -> 수정할 데이터값(비번,주소,휴대전화,이메일)
DataEncrypt de=new DataEncrypt("a12345678901234567");
rVO.setPass(DataEncrypt.messageDigest("MD5",rVO.getPass()));
MemberDAO mDAO=MemberDAO.getInstance();

try{
int cntUp=mDAO.updateInfo(rVO);
//System.out.println("결과 : " + cntUp);

if( cntUp == 1 ){
%>
<script type="text/javascript">
	alert("회원정보 수정이 완료되었습니다.")
	location.href='mypage.jsp';
</script>
<% 	
}else{
%>
<script type="text/javascript">
	alert("시스템 오류 다시 시도해주세요.")
	location.href='error.jsp';
</script>
<%	
}
	
}catch(SQLException se){
	se.printStackTrace();
}
%>
</body>
</html>






