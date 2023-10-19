<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="이름이 유일한 HTML Form Control 값받기" %>
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

 <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<%
//POST 방식인 경우 한글이 깨진다
//post방식의 한글 처리는 request객체가 사용되기 전에 한다
request.setCharacterEncoding("UTF-8");

String text=request.getParameter("text"); //input type="text"
String pass=request.getParameter("pass"); //input type="password"
String hid=request.getParameter("hid"); //input type="hidden"
String gender=request.getParameter("gender"); //input type="radio"
String check=request.getParameter("check"); //input type="checkbox"
//checkbox가 checked되지 않으면 parameter가 생성되지 않고, JSP에 받을 때 null이 입력된다
String sel=request.getParameter("sel"); //<select>
String ta=request.getParameter("ta"); //<textarea>
%>

 <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="toast-header">
        <svg class="bd-placeholder-img rounded me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#007aff"></rect></svg>
        <strong class="me-auto">이름이 유일한 Form Control들</strong>
        <small>알빠노</small>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
      <div class="toast-body">
      <span class="badge bg-danger"><%= request.getMethod() %>방식</span><br/>
      
<%--    
		getByte()는 문자열을 charset의 배열로 생성하고, 두 번재 매개변수인 charset의 문자열로 생성한다     
		<label>text</label>: <%= new String(text.getBytes("8859_1"),"UTF-8") %><br/>
        <label>password</label>: <%= URLDecoder.decode(URLEncoder.encode(pass,"8859_1"),"UTF-8") %><br/> --%>
         <label>text</label>: <%=text %><br/>	
        <label>password</label>: <%= pass %><br/>
        <label>hidden</label>: <%= hid %><br/>
        <label>gender</label>: <%= gender %><br/>
        <label>checkbox</label>: <%= check %><br/>
        <label>select</label>: <%= sel %><br/>
        <label>textarea</label>: <%= ta %><br/>
        <a href="http://192.168.10.137/jsp_prj/day1006/input_form.jsp">뒤로</a>
      </div>
    </div>
</body>
</html>