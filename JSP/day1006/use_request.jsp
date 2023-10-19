<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="request 내장 객체의 사용" %>
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
   $("#btnGet").click(function(){
	   $("#getFrm").submit();
   });//click
   
   $("#btnPost").click(function(){
	   $("#postFrm").submit();
   });//click
	
	
});//ready
</script>

</head>
<body>
<%
String[] blockIp={"133","139","146","136","143","149"};
String connectIp=request.getRemoteAddr();
boolean flag=false;
for(int i=0; i<blockIp.length; i++){
	if(connectIp.endsWith(blockIp[i])){
		flag=true;
		break;
	}//end if
}//end for

if(flag){
	response.sendRedirect("https://www.police.go.kr/index.do");
	return;
}//end if
%>

<h2>request 내장객체 사용</h2>
<ul class="list-group">
  <li class="list-group-item">요청 방식 : <strong><%= request.getMethod() %></strong></li>
  <li class="list-group-item">요청 URL : <strong><%= request.getRequestURL() %></strong></li>
  <li class="list-group-item">요청 protocol : <strong><%= request.getProtocol() %></strong></li>
  <li class="list-group-item">요청 서버명 : <strong><%= request.getServerName() %></strong></li>
  <li class="list-group-item">요청 서버포트 : <strong><%= request.getServerPort() %></strong></li>
  <li class="list-group-item">요청 URI : <strong><%= request.getRequestURI() %></strong></li>
  <li class="list-group-item">요청 파일 경로 : <strong><%= request.getServletPath() %></strong></li>
  <li class="list-group-item">접속자 ip : <strong><%= request.getRemoteAddr() %></strong></li>
  <li class="list-group-item">접속자 port : <strong><%= request.getRemotePort() %></strong></li>
  <li class="list-group-item">queryString 얻기 : <strong><%= request.getQueryString() %></strong></li>
  <li class="list-group-item">web parameter : 이름 유일 <strong><%= request.getParameter("name") %></strong></li>
  <li class="list-group-item">web parameter : 이름 중복 <strong><%= request.getParameter("age") %></strong></li>
  <li class="list-group-item">web parameter : 이름 중복 배열로 처리
  <%
  String[] age=request.getParameterValues("age");
  //이름이 없는 경우 NullPointerException이 발생
  if( age != null ){
	  for(int i=0; i<age.length; i++){
%>
<%= age[i] %>&nbsp;
<%		  
  	}//end for
  }//end if
  %>
  
  </li>
</ul>

<!-- 현재 페이지를 요청하고 싶다면 페이지명 또는 action 속성을 empty인 상태로 작성 -->
<form action="" method="get" id="getFrm">
	<input type="hidden" name="name" value="jiseong.hong">
	<input type="hidden" name="age" value="25">
	<input type="hidden" name="age" value="24">
	<input type="button" value="GET방식 요청"  class="btn btn-dark" id="btnGet">
</form>

<form action="use_request.jsp" method="post" id="postFrm">
	<input type="hidden" name="name" value="jiseong.hong">
	<input type="hidden" name="age" value="25">
	<input type="hidden" name="age" value="26">
	<input type="button" value="POST방식 요청"  class="btn btn-warning" id="btnPost">
</form>

<!-- a태그를 사용하여 name이 kim, 나이가 26인 값을 use_request.jsp에 요청하는
URL을 만들어보세요 -->
<a href="http://localhost/jsp_prj/day1006/use_request.jsp?name=kim&age=26">GET방식 요청</a>

</body>
</html>