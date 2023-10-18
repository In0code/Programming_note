<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.dao.MemberDAO"%>
<%@page import="kr.co.sist.util.cipher.DataEncrypt"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="회원가입 처리" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    request.setCharacterEncoding("UTF-8");
    //get방식의 요청이라면 memberjoin_frm.jsp로 이동
    String method=request.getMethod();
    if("GET".equals(method)){
    	response.sendRedirect("memberjoin_frm.jsp");
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
<jsp:useBean id="wmVO" class="kr.co.sist.member.vo.WebMemberVO" scope="page"/>
<jsp:setProperty property="*" name="wmVO"/>
<%
DataEncrypt de=new DataEncrypt("a12345678901234567");

wmVO.setPassword(DataEncrypt.messageDigest("MD5", wmVO.getPassword()));
wmVO.setName(de.encryption(wmVO.getName()));
wmVO.setCell(de.encryption(wmVO.getCell()));
wmVO.setEmail(de.encryption(wmVO.getEmail1()+"@"+wmVO.getEmail2()));

MemberDAO mDAO=MemberDAO.getInstane();
try{
mDAO.insertMember(wmVO);
out.println("가입성공");
}catch(SQLException se){
	se.printStackTrace();
}
%>

${ wmVO }
</body>
</html>