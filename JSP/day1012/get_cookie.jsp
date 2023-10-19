<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이지 지시자 설정 --%>
<%@ page info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.144/jsp_prj/common/images/favicon.ico">
<!-- bootstrap CDN시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Jquery CDN시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<%
//쿠키는 여러개 심어질 수 있기 때문에 Cookie의 배열로 얻어짐
Cookie[] cookies = request.getCookies(); //여러 쿠키의 배열
boolean flag = false; //flag 선언 (false/true니까 boolean 형태)
if(cookies != null) { //더 읽어들일 쿠키가 있다면, 
	String cookieName="",cookieValue="";

	for(Cookie cookie : cookies){
		cookieName=cookie.getName();
		cookieValue=cookie.getValue();
		if("JSESSIONID".equals(cookieName)) { //JSESSIONID의 ID를 가져올 필요없이 이렇게 물어보면 됨
		out.println("쿠키명: " + cookieName + "/쿠키값:" + cookieValue + "<br/>");
		flag=true;
		}
	} //end for
} //end if

if(flag) { //쿠키 있음
%>
<a href= "remove_cookie.jsp">쿠키삭제</a>	
<%
} else {
	//쿠키 없음
%>
<a href="add_cookie.jsp">쿠키 추가</a>
<%
}
%>
</body>
</html>