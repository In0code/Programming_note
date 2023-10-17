<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="JSTL 사용 - 변수" %>
<!-- 1. 지시자 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<!-- 변수 선언 -->
<c:set var="year" value="2023"/>
<!-- 출력 : 입력된 값이 그대로 출력된다-->
<c:out value="year"/><br/>
<!-- EL은 set으로 선언된 변수에 접근 가능하다 -->
<c:out value="${ year }"/>  / ${ year }<br/>

<!-- c:out 은 브라우저에 출력할 때 사용 -->
<input type="text" name="birth" value="<c:out value="${year }"/>"/>
<!-- EL은 속성 값으로 출력할 때 사용 -->
<input type="text" name="birth" value="${year }"/><br/>

<c:set var="name" value="임태균"/><br/>
<c:set var="age" value="25"/><br/>
이름 : <c:out value=" ${ name }"/>님<br/>
나이 : <c:out value=" ${ age }"/>살<br/>
<!-- 변수 삭제 -->
<c:remove var="name"/>
삭제 이후 :<br/>
이름 : <c:out value=" ${ name }"/>님<br/>
나이 : <c:out value=" ${ age }"/>살<br/>

<%! //method만들 때는 보통 이걸 씀
public String link(String url, String title){
	StringBuilder sbLink=new StringBuilder();
	
	sbLink.append("<a href='http://localhost/jsp_prj/")
	.append(url).append("' title='").append(title).append("로 이동'")
	.append(">").append(title).append("</a>");
	
	return sbLink.toString();
}//link
%>
<%
String link=link("day1016/el_param.jsp","파라메터연습");
//1. scope객체에 변수 할당
pageContext.setAttribute("link", link);
%>
<!--escapeXml속성을 사용하면 출력값이 tag일 때 해당 태그를 문자열 형식이 아닌 
HTML형식으로 변경하여 출력해준다  -->
<c:out value="${ link }" escapeXml="false"/>
</body>
</html>