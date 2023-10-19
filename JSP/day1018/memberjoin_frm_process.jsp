<%@page import="kr.co.sist.member.vo.WebMemberLangVO"%>
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
<c:catch var="se">
<%
DataEncrypt de=new DataEncrypt("a12345678901234567");

wmVO.setPassword(DataEncrypt.messageDigest("MD5", wmVO.getPassword()));
wmVO.setName(de.encryption(wmVO.getName()));
wmVO.setCell(de.encryption(wmVO.getCell()));
wmVO.setEmail(de.encryption(wmVO.getEmail1()+"@"+wmVO.getEmail2()));

// 접속자 ip주소를 받아서 VO에 설정
wmVO.setIp(request.getRemoteAddr());

MemberDAO mDAO=MemberDAO.getInstane();
//try{
mDAO.insertMember(wmVO);

// 언어를 추가
WebMemberLangVO wmlVO=null;
for(String lang : wmVO.getLang()){
	wmlVO=new WebMemberLangVO(wmVO.getId(),lang);
	mDAO.insertLang(wmlVO);
}//end for

//}catch(SQLException se){
	//se.printStackTrace();
//}
%>
<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">회원가입 성공</h5>
    <h6 class="card-subtitle mb-2 text-body-secondary">회원가입해주셔서 감사합니다</h6>
    <p class="card-text"><c:out value="${ param.name }"/>님께서 입력하신 정보는 아래와 같습니다</p>
    <p class="card-text">생년월일 : <c:out value="${ wmVO.birthday }"/></p>
    <p class="card-text">전화번호 : <c:out value="${ param.cell }"/></p>
    <a href="http://localhost/jsp_prj/" class="card-link">메인으로</a>
    <a href="http://localhost/jsp_prj/day1019/login_frm.jsp" class="card-link">로그인</a>
  </div>
</div>
</c:catch>
<c:if test="${ not empty se }">
입력하신 아이디는 [ <c:out value="${ wmVO.id }"/> ]는 이미 사용 중 입니다.<br/>
다른 id로 재가입 해주세요.<br/>
<a href="javascript:history.back();">뒤로</a>
</c:if>
</body>
</html>