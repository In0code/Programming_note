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
//GET방식인 경우 한글이 깨지지 않는다
//?text=텍스트text&pass=패스워드pass&hid=히든태그&gender=m&check=save&sel=4월&ta=오늘은+금요일
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
        <label>text</label>: <%= text %><br/>
        <label>password</label>: <%= pass %><br/>
        <label>hidden</label>: <%= hid %><br/>
        <label>gender</label>: <%= gender %><br/>
        <label>checkbox</label>: <%= check %><br/>
        <label>select</label>: <%= sel %><br/>
        <label>textarea</label>: <%= ta %><br/>
        <a href="javascript:history.back()">뒤로</a>
      </div>
    </div>
</body>
</html>