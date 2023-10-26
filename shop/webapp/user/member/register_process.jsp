<%@page import="member.dao.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="회원가입 처리" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    request.setCharacterEncoding("UTF-8");
    //GET방식의 요청이라면 register.jsp로 이동
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
<c:catch var="se">
<%
DataEncrypt de=new DataEncrypt("a12345678901234567");

rVO.setPass(DataEncrypt.messageDigest("MD5", rVO.getPass()));

MemberDAO mDAO=MemberDAO.getInstance();
mDAO.insertMember(rVO);

//회원가입 성공 시 데이터를 저장하고 regi_complete.jsp로 이동
String id = rVO.getId();
String name = rVO.getName();
String email = rVO.getEmail();

//값들을 URL 인코딩
id = URLEncoder.encode(id, "UTF-8");
name = URLEncoder.encode(name, "UTF-8");
email = URLEncoder.encode(email, "UTF-8");

response.sendRedirect("regi_complete.jsp?id=" + id + "&name=" + name + "&email=" + email);
%>
</c:catch>

</body>
</html>









